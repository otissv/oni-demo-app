package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"

@(private)
color_picker_demo_value: o.RGBA = {59, 130, 246, 255}

@(private)
color_picker_demo_previous: o.RGBA = {59, 130, 246, 255}

@(private)
color_picker_demo_channel: o.Color_Picker_Channel = .H

@(private)
COLOR_PICKER_DOCS_USAGE_IMPORT :: `import o "oni"
import w "oni/widgets"
import set "oni/set"`

@(private)
COLOR_PICKER_DOCS_USAGE_CALL :: `w.Color_Picker({
	config = {id = "accent", width = set.Width(f32(480))},
	value = value,
	channel = channel,
	previous = previous,
	on_value_change = proc(v: o.RGBA) { value = v },
	on_value_commit = proc(v: o.RGBA) { previous = v },
	on_channel_change = proc(c: o.Color_Picker_Channel) { channel = c },
	child = proc(_: w.Color_Picker_State) {
		w.Color_Picker_Field({config = {id = "accent_field"}})
		w.Color_Picker_Slider({config = {id = "accent_slider"}})
	},
})`

@(private)
COLOR_PICKER_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Color_Picker_Config (= Widget_Config)", "{}"},
	{"value", "RGBA", "{0,0,0,255}"},
	{"channel", "Color_Picker_Channel", ".H"},
	{"previous", "RGBA", "{0,0,0,255}"},
	{"disabled", "bool", "false"},
	{"style", "Color_Picker_Style", "{}"},
	{"child", "proc(Color_Picker_State)", "nil"},
	{"on_value_change", "proc(value: RGBA)", "nil"},
	{"on_value_commit", "proc(value: RGBA)", "nil"},
	{"on_channel_change", "proc(channel: Color_Picker_Channel)", "nil"},
	{"on_mount", "proc(Color_Picker_State) -> Mount", "nil"},
	{"on_unmount", "proc(Color_Picker_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"scroll_bar", "Scroll_Bar_Style", "{}"},
	{"on_focus", "proc(Color_Picker_Event)", "nil"},
	{"on_blur", "proc(Color_Picker_Event)", "nil"},
	{"on_mouse_enter", "proc(Color_Picker_Event)", "nil"},
	{"on_mouse_leave", "proc(Color_Picker_Event)", "nil"},
	{"on_mouse_pressed", "proc(Color_Picker_Event)", "nil"},
	{"on_mouse_down", "proc(Color_Picker_Event)", "nil"},
	{"on_mouse_released", "proc(Color_Picker_Event)", "nil"},
	{"on_mouse_move", "proc(Color_Picker_Event)", "nil"},
	{"on_click", "proc(Color_Picker_Event)", "nil"},
	{"on_contextmenu", "proc(Color_Picker_Event)", "nil"},
	{"on_key_pressed", "proc(Color_Picker_Event)", "nil"},
	{"on_key_down", "proc(Color_Picker_Event)", "nil"},
	{"on_key_released", "proc(Color_Picker_Event)", "nil"},
}

@(private)
COLOR_PICKER_DOCS_CONFIG := [?]Doc_Prop_Row {
	{"id", "string", `""`},
	{"width", "Width", "unset"},
	{"height", "Height", "unset"},
	{"padding", "Cfg(Padding)", "unset"},
	{"radius", "Cfg(Radius)", "unset"},
	{"border", "Cfg(Border)", "unset"},
	{"border_color", "Cfg(Colors)", "unset"},
	{"background", "Cfg(Colors)", "unset"},
	{"disabled", "Cfg(Style_Bool)", "unset (prefer props.disabled)"},
	{"tabbable", "Cfg(Style_Bool)", "unset"},
	{"opacity", "Cfg(Style_F32)", "unset"},
	{"direction", "Cfg(Widget_Direction)", "unset"},
	{"gap_x", "Cfg(Gap_X)", "unset"},
	{"gap_y", "Cfg(Gap_Y)", "unset"},
	{"justify", "Cfg(Justify)", "unset"},
	{"overflow_x", "Cfg(Overflow)", "unset"},
	{"overflow_y", "Cfg(Overflow)", "unset"},
	{"min_w", "Cfg(Style_F32)", "unset"},
	{"min_h", "Cfg(Style_F32)", "unset"},
	{"max_w", "Cfg(Style_F32)", "unset"},
	{"max_h", "Cfg(Style_F32)", "unset"},
	{"visibility", "Cfg(Visibility)", "unset"},
	{"pointer_events", "Cfg(Pointer_Events)", "unset"},
}

@(private)
COLOR_PICKER_DOCS_STYLE := [?]Doc_Prop_Row {
	{"field_size", "Cfg(Style_F32)", "200"},
	{"slider_width", "Cfg(Style_F32)", "20"},
	{"alpha_height", "Cfg(Style_F32)", "16"},
	{"swatch_height", "Cfg(Style_F32)", "28"},
	{"radius", "Cfg(Radius)", "theme default"},
	{"marker", "Cfg(Colors)", "theme marker"},
	{"border", "Cfg(Colors)", "theme border"},
}

@(private)
COLOR_PICKER_DOCS_PARTS := [?]Doc_Prop_Row {
	{"Color_Picker_Field.config", "Widget_Config", "{}"},
	{"Color_Picker_Slider.config", "Widget_Config", "{}"},
	{"Color_Picker_Alpha.config", "Widget_Config", "{}"},
	{"Color_Picker_Swatch.config", "Widget_Config", "{}"},
	{"Color_Picker_Swatch.role", "Color_Picker_Swatch_Role", ".CURRENT"},
	{"Color_Picker_Channels.config", "Widget_Config", "{}"},
	{"Color_Picker_Hex.config", "Widget_Config", "{}"},
	{"Color_Picker_Hex.include_alpha", "bool", "false"},
	{"Color_Picker_Type.config", "Widget_Config", "{}"},
	{"Color_Picker_Type.color_type", "Color_Picker_Color_Type", ".RGB"},
	{"Color_Picker_Web_Only.config", "Widget_Config", "{}"},
}

@(private)
color_picker_docs_compact_child :: proc(_: w.Color_Picker_State) {
	gutter := u16(int(o.COLOR_PICKER_SLIDER_GUTTER))

	w.Rectangle({
		config = {
			id = "color_picker_docs_compact_row",
			direction = set.Direction(.HORIZONTAL),
			gap_x = set.Gap_X(gutter),
			justify = set.Justify(o.Justify_Pos{y = .CENTER}),
		},
		child = proc(_: w.Rectangle_State) {
			w.Color_Picker_Field({config = {id = "color_picker_docs_compact_field"}})
			w.Color_Picker_Slider({config = {id = "color_picker_docs_compact_slider"}})
			w.Rectangle({
				config = {
					id = "color_picker_docs_compact_side",
					direction = set.Direction(.VERTICAL),
					gap_y = set.Gap_Y(u16(8)),
				},
				child = proc(_: w.Rectangle_State) {
					w.Color_Picker_Swatch({
						config = {id = "color_picker_docs_compact_swatch"},
						role = .CURRENT,
					})
					w.Color_Picker_Channels({config = {id = "color_picker_docs_compact_channels"}})
				},
			})
		},
	})
}

@(private)
color_picker_docs_full_child :: proc(_: w.Color_Picker_State) {
	gutter := u16(int(o.COLOR_PICKER_SLIDER_GUTTER))

	w.Rectangle({
		config = {
			id = "color_picker_docs_top",
			direction = set.Direction(.HORIZONTAL),
			gap_x = set.Gap_X(gutter),
			justify = set.Justify(o.Justify_Pos{y = .CENTER}),
		},
		child = proc(_: w.Rectangle_State) {
			w.Rectangle({
				config = {
					id = "color_picker_docs_top_stack",
					direction = set.Direction(.VERTICAL),
					gap_y = set.Gap_Y(u16(8)),
					justify = set.Justify(o.Justify_Pos{y = .CENTER}),
				},
				child = proc(_: w.Rectangle_State) {
					w.Color_Picker_Field({config = {id = "color_picker_docs_field"}})
					w.Color_Picker_Alpha({config = {id = "color_picker_docs_alpha"}})
					w.Color_Picker_Web_Only({config = {id = "color_picker_docs_web_only"}})
				},
			})
			w.Color_Picker_Slider({config = {id = "color_picker_docs_slider"}})
			w.Rectangle({
				config = {
					id = "color_picker_docs_side",
					direction = set.Direction(.VERTICAL),
					gap_y = set.Gap_Y(u16(8)),
				},
				child = proc(_: w.Rectangle_State) {
					w.Color_Picker_Swatch({
						config = {id = "color_picker_docs_swatch_new"},
						role = .CURRENT,
					})
					w.Color_Picker_Swatch({
						config = {id = "color_picker_docs_swatch_prev"},
						role = .PREVIOUS,
					})
					w.Color_Picker_Channels({config = {id = "color_picker_docs_channels"}})
				},
			})
		},
	})

	w.Rectangle({
		config = {
			id = "color_picker_docs_types",
			direction = set.Direction(.VERTICAL),
			gap_y = set.Gap_Y(u16(6)),
			justify = set.Justify(o.Justify_Pos{y = .CENTER}),
		},
		child = proc(_: w.Rectangle_State) {
			w.Color_Picker_Hex({
				config = {id = "color_picker_docs_hex"},
				include_alpha = true,
			})
			w.Color_Picker_Type({config = {id = "color_picker_docs_rgb"}, color_type = .RGB})
			w.Color_Picker_Type({config = {id = "color_picker_docs_hsb"}, color_type = .HSB})
			w.Color_Picker_Type({config = {id = "color_picker_docs_hsl"}, color_type = .HSL})
			w.Color_Picker_Type({config = {id = "color_picker_docs_lab"}, color_type = .LAB})
			w.Color_Picker_Type({config = {id = "color_picker_docs_cmyk"}, color_type = .CMYK})
			w.Color_Picker_Type({config = {id = "color_picker_docs_web"}, color_type = .WEB})
			w.Text({
				config = {
					id = "color_picker_docs_status",
					text = fmt.tprintf("Channel %v", color_picker_demo_channel),
					font_size = set.F32(13),
					color = set.Colors(o.Color.MUTED_FOREGROUND),
				},
			})
		},
	})
}

@(private)
color_picker_docs_disabled_child :: proc(_: w.Color_Picker_State) {
	w.Rectangle({
		config = {
			id = "color_picker_docs_disabled_row",
			direction = set.Direction(.HORIZONTAL),
			gap_x = set.Gap_X(u16(16)),
		},
		child = proc(_: w.Rectangle_State) {
			w.Color_Picker_Field({config = {id = "color_picker_docs_disabled_field"}})
			w.Color_Picker_Slider({config = {id = "color_picker_docs_disabled_slider"}})
		},
	})
}

@(private)
color_picker_docs_hero :: proc(_: w.Rectangle_State) {
	w.Color_Picker({
		config = {id = "color_picker_docs_hero", width = set.Width(f32(420))},
		value = color_picker_demo_value,
		channel = color_picker_demo_channel,
		previous = color_picker_demo_previous,
		on_value_change = proc(value: o.RGBA) {
			color_picker_demo_value = value
		},
		on_value_commit = proc(value: o.RGBA) {
			color_picker_demo_previous = value
		},
		on_channel_change = proc(channel: o.Color_Picker_Channel) {
			color_picker_demo_channel = channel
		},
		child = color_picker_docs_compact_child,
	})
}

@(private)
color_picker_docs_full_preview :: proc(_: w.Rectangle_State) {
	w.Color_Picker({
		config = {id = "color_picker_docs_full", width = set.Width(f32(480))},
		value = color_picker_demo_value,
		channel = color_picker_demo_channel,
		previous = color_picker_demo_previous,
		on_value_change = proc(value: o.RGBA) {
			color_picker_demo_value = value
		},
		on_value_commit = proc(value: o.RGBA) {
			color_picker_demo_previous = value
		},
		on_channel_change = proc(channel: o.Color_Picker_Channel) {
			color_picker_demo_channel = channel
		},
		child = color_picker_docs_full_child,
	})
}

@(private)
color_picker_docs_disabled_preview :: proc(_: w.Rectangle_State) {
	w.Color_Picker({
		config = {id = "color_picker_docs_disabled"},
		value = {239, 68, 68, 255},
		channel = .H,
		previous = {239, 68, 68, 255},
		disabled = true,
		child = color_picker_docs_disabled_child,
	})
}

@(private)
color_picker_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("color_picker_docs_title", "Color Picker")
	doc_lede(
		"color_picker_docs_lede",
		"A composable color picker with spectrum field, channel slider, swatches, and typed numeric rows.",
	)

	doc_preview("color_picker_docs_hero_preview", color_picker_docs_hero)

	doc_section(
		"color_picker_docs_installation",
		"Installation",
		"Color_Picker and its parts live in oni/widgets. Parts must be descendants of a Color_Picker root.",
		proc(_: w.Rectangle_State) {
			doc_code("color_picker_docs_installation_code", COLOR_PICKER_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"color_picker_docs_usage",
		"Usage",
		"value, channel, and previous are caller-owned. Pass them every frame. Drag updates fire on_value_change; release commits through on_value_commit.",
		proc(_: w.Rectangle_State) {
			doc_code("color_picker_docs_usage_call", COLOR_PICKER_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"color_picker_docs_composition",
		"Composition",
		"Build the layout you need from Field, Slider, Alpha, Swatch, Channels, Hex, Type, and Web_Only parts inside child.",
		proc(_: w.Rectangle_State) {
			doc_preview("color_picker_docs_full_preview", color_picker_docs_full_preview)
			doc_code(
				"color_picker_docs_composition_code",
				`w.Color_Picker({
	config = {id = "picker"},
	value = value,
	channel = channel,
	previous = previous,
	on_value_change = ...,
	on_value_commit = ...,
	on_channel_change = ...,
	child = proc(_: w.Color_Picker_State) {
		w.Color_Picker_Field({config = {id = "picker_field"}})
		w.Color_Picker_Slider({config = {id = "picker_slider"}})
		w.Color_Picker_Alpha({config = {id = "picker_alpha"}})
		w.Color_Picker_Swatch({config = {id = "picker_swatch"}, role = .CURRENT})
		w.Color_Picker_Channels({config = {id = "picker_channels"}})
		w.Color_Picker_Hex({config = {id = "picker_hex"}, include_alpha = true})
		w.Color_Picker_Type({config = {id = "picker_rgb"}, color_type = .RGB})
	},
})`,
			)
		},
	)

	doc_section(
		"color_picker_docs_channels",
		"Channels",
		"channel selects which component the vertical slider edits: H, S, V, R, G, or B. Color_Picker_Channels lists them for quick switching.",
		proc(_: w.Rectangle_State) {
			doc_muted(
				"color_picker_docs_channels_note",
				fmt.tprintf("Current channel: %v", color_picker_demo_channel),
			)
			doc_code(
				"color_picker_docs_channels_code",
				`w.Color_Picker({
	config = {id = "picker"},
	channel = .H,
	on_channel_change = proc(channel: o.Color_Picker_Channel) {
		active_channel = channel
	},
	child = proc(_: w.Color_Picker_State) {
		w.Color_Picker_Channels({config = {id = "picker_channels"}})
		w.Color_Picker_Slider({config = {id = "picker_slider"}})
	},
})`,
			)
		},
	)

	doc_section(
		"color_picker_docs_types",
		"Color types",
		"Color_Picker_Type renders a numeric row for RGB, HSB, HSL, LAB, CMYK, or WEB. Hex accepts optional alpha via include_alpha.",
		proc(_: w.Rectangle_State) {
			doc_code(
				"color_picker_docs_types_code",
				`w.Color_Picker_Hex({config = {id = "hex"}, include_alpha = true})
w.Color_Picker_Type({config = {id = "rgb"}, color_type = .RGB})
w.Color_Picker_Type({config = {id = "hsl"}, color_type = .HSL})`,
			)
		},
	)

	doc_section(
		"color_picker_docs_swatches",
		"Swatches",
		"Color_Picker_Swatch paints the current or previous color. role is CURRENT or PREVIOUS. Commit previous from on_value_commit.",
		proc(_: w.Rectangle_State) {
			doc_code(
				"color_picker_docs_swatches_code",
				`w.Color_Picker_Swatch({config = {id = "current"}, role = .CURRENT})
w.Color_Picker_Swatch({config = {id = "previous"}, role = .PREVIOUS})`,
			)
		},
	)

	doc_section(
		"color_picker_docs_disabled",
		"Disabled",
		"Set disabled on the root to block field and slider interaction while still showing the color.",
		proc(_: w.Rectangle_State) {
			doc_preview("color_picker_docs_disabled_preview", color_picker_docs_disabled_preview)
			doc_code(
				"color_picker_docs_disabled_code",
				`w.Color_Picker({
	config = {id = "locked"},
	value = {239, 68, 68, 255},
	channel = .H,
	previous = {239, 68, 68, 255},
	disabled = true,
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"color_picker_docs_api",
		"API Reference",
		"w.Color_Picker in oni/widgets/color_picker.odin. Parts are in color_picker_parts.odin and must nest under the root.",
		proc(_: w.Rectangle_State) {
			doc_h3("color_picker_docs_api_props_h3", "Props")
			doc_muted(
				"color_picker_docs_api_props_note",
				"Color_Picker_Channel: H | S | V | R | G | B. Color_Picker_Color_Type: RGB | HSB | HSL | LAB | CMYK | WEB.",
			)
			doc_table("color_picker_docs_props_table", COLOR_PICKER_DOCS_PROPS[:])

			doc_h3("color_picker_docs_api_config_h3", "Config")
			doc_muted(
				"color_picker_docs_api_config_note",
				"Color_Picker_Config is Widget_Config. Field / slider sizing uses the style prop.",
			)
			doc_table("color_picker_docs_config_table", COLOR_PICKER_DOCS_CONFIG[:])

			doc_h3("color_picker_docs_api_style_h3", "Style")
			doc_table("color_picker_docs_style_table", COLOR_PICKER_DOCS_STYLE[:])

			doc_h3("color_picker_docs_api_parts_h3", "Parts")
			doc_table("color_picker_docs_parts_table", COLOR_PICKER_DOCS_PARTS[:])
		},
	)
}

Widget_Color_Picker :: proc() {
	doc_page("color_picker_docs", color_picker_docs_body)
}
