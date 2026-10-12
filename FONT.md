# Font Rendering

Phase A — fix the easy blur ✅

Ensure true HiDPI: native Wayland if possible, or force correct dpi scale
Snap glyph quads to device pixels (same idea as batch_snap_rect_to_pixels, but for text)
Prefer NEAREST (or carefully padded LINEAR) when scale is integer and quads are 1:1
Size paint dst from atlas bitmap (region.w/h), not outline metrics

Phase B — match Chrome contrast ✅

Gamma-correct / linear-light alpha for text (or Skia-style coverage adjust for light-on-dark)
Optional FT_LOAD_TARGET_LIGHT + slight hinting for UI sizes

Phase C — real Chrome sharpness

Goal: Skia/Chrome-style LCD text (FreeType LCD → RGB coverage atlas → dual-source per-channel blend). No legacy gray-atlas/API shims. Gray AA is only the runtime fallback when LCD is illegal (same as Chrome). Do steps in order; each step’s exit is required before the next.

1. Land SDL_GPU dual-source (blocker) ✅
   - Add SRC1_COLOR, ONE_MINUS_SRC1_COLOR, SRC1_ALPHA, ONE_MINUS_SRC1_ALPHA
   - Allow fragment shaders a second color output (location = 1)
   - Wire SRC1 blend factors through Vulkan / Metal / D3D12 pipeline create
   - Expose a device capability query; LCD will require it
   - Prove `dst = src0 + dst * (1 - src1)` per channel with an SDL sample/test
   - Bump Oni’s SDL + Odin `vendor:sdl3` bindings
   - Exit: colored dual-source blend works on ship backends (at least Linux Vulkan) and no gaps in the this phase of the implementation.

2. Add Oni’s LCD GPU path ✅
   - Second pipeline, same vertex layout: UI keeps SRC_ALPHA; LCD uses ONE / ONE_MINUS_SRC1_COLOR (alpha: ONE / ONE_MINUS_SRC1_ALPHA or match Skia)
   - `gpu_init` / hot-reload creates both; missing dual-source → fail init
   - Shader: gray text = single out + UI pipeline + coverage in `.a`; LCD text = `out0 = tint * cov`, `out1 = cov` with per-channel fake-gamma (no approximate LCD on the UI pipeline)
   - Additional Exit: can bind LCD pipeline and draw a dual-source quad (even with a test texture) and no gaps in the this phase of the implementation.

3. Wire batch to switch pipelines ✅
   - Segment key includes `lcd` (or pipeline id); flush and rebind when it changes
   - LCD segments bind the LCD pipeline; everything else keeps the UI pipeline
   - Additional Exit: mixed gray + LCD segments in one frame bind the correct pipeline each time and no gaps in the this phase of the implementation.

4. Add FreeType LCD raster + RGB atlas packing ✅
   - Bind FT_RENDER_MODE_LCD, FT_PIXEL_MODE_LCD, FT_Library_SetLcdFilter(DEFAULT); set filter once at font init
   - When LCD: FT_LOAD_TARGET_LCD (or LCD + light); else keep light/normal gray
   - `font_copy_glyph_bitmap`: LCD → RGB coverage (bitmap width / 3); pack into existing R8G8B8A8 atlas (A unused or 1)
   - Glyph cache key includes render mode (Gray | LCD); reset clears both; no migration
   - Paint quads from bitmap w/h + FreeType bearings (Phase A)
   - Additional Exit: LCD glyphs pack and gray glyphs never share a cache entry and no gaps in the this phase of the implementation.

5. Query display subpixel order ✅
   - On DPI/display sync, read RGB vs BGR (Wayland/X11/settings); unknown → treat as no LCD
   - Re-query on display/DPI change; invalidate LCD glyph cache if order changes
   - Additional Exit: engine state knows subpixel order (or unknown) before draw and no gaps in the this phase of the implementation.

6. Gate LCD and draw through one decision ✅
   - `should_use_lcd(draw state)` used at raster and draw (same answer both places)
   - LCD only if: dual-source (init), axis-aligned, 1:1 or integer scale + snap + nearest, opaque tint and parents, known RGB/BGR; no LCD_V unless shipped later
   - Else gray on the UI pipeline; translucent text/overlays always gray
   - Push RGB/BGR into LCD draws (uniform or vertex param); keep device-pixel snap + nearest
   - Additional Exit: opaque 1:1 UI text is LCD; rotation / fractional scale / α<1 is gray and no gaps in the this phase of the implementation.

7. Prove it and stop ✅
   - SDL: dual-source on ship backends
   - FreeType: LCD dims, filter on, RGB copy
   - Atlas: LCD pack + cache key isolation
   - GPU: colored text shows distinct R/G/B edge coverage; gray fallback still works
   - Gate: rotation / fractional scale / α<1 → gray
   - `./oni/scripts/test_all.sh` (+ asan); no atlas/cache leaks
   - Done when: opaque 1:1 UI text uses LCD + dual-source; illegal cases use gray; no old text blend/atlas format left; init refuses devices without dual-source; All 7 phases have been fully implemented without backwards compatibility, legacy or temporary code, and no gaps in the this full the implementation.

