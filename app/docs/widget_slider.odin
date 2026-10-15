package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"

@(private)
slider_demo_volume: [1]f32 = {48}

@(private)
slider_demo_range: [2]f32 = {25, 75}

@(private)
slider_demo_vertical: [1]f32 = {60}

@(private)
slider_demo_disabled: [1]f32 = {35}

@(private)
slider_demo_step: [1]f32 = {40}

@(private)
slider_demo_custom: [1]f32 = {55}

@(private)
SLIDER_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
SLIDER_DOCS_USAGE_CALL :: `w.Slider({
	config = {
		id = "volume",
		values = volume[:],
		min = 0,
		max = 100,
		step = 1,
	},
	on_value_change = proc(vals: []f32) { volume[0] = vals[0] },
})`

@(private)
SLIDER_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Slider_Config (values, min, max, step, … + Widget_Config)", "{}"},
	{"child", "proc(Slider_State)", "nil → Slider_Default_Parts"},
	{"on_value_change", "proc(values: []f32)", "nil"},
	{"on_value_commit", "proc(values: []f32)", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_mount", "proc(Slider_State) -> Mount", "nil"},
	{"on_unmount", "proc(Slider_State) -> Mount", "nil"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"on_focus", "proc(Slider_Event)", "nil"},
	{"on_blur", "proc(Slider_Event)", "nil"},
	{"on_mouse_enter", "proc(Slider_Event)", "nil"},
	{"on_mouse_leave", "proc(Slider_Event)", "nil"},
	{"on_mouse_pressed", "proc(Slider_Event)", "nil"},
	{"on_mouse_down", "proc(Slider_Event)", "nil"},
	{"on_mouse_released", "proc(Slider_Event)", "nil"},
	{"on_mouse_move", "proc(Slider_Event)", "nil"},
	{"on_click", "proc(Slider_Event)", "nil"},
	{"on_contextmenu", "proc(Slider_Event)", "nil"},
	{"on_key_pressed", "proc(Slider_Event)", "nil"},
	{"on_key_down", "proc(Slider_Event)", "nil"},
	{"on_key_released", "proc(Slider_Event)", "nil"},
}

@(private)
SLIDER_DOCS_CONFIG := [?]Doc_Prop_Row {
	{"values", "[]f32", "nil (length 1 or 2)"},
	{"min", "f32", "0"},
	{"max", "f32", "100"},
	{"step", "f32", "1"},
	{"min_steps_between_thumbs", "f32", "0"},
	{"orientation", "Slider_Orientation", ".HORIZONTAL"},
	{"inverted", "bool", "false"},
	{"thumb_size", "Cfg(Style_F32)", "unset"},
	{"track_thickness", "Cfg(Style_F32)", "unset"},
	{"disabled", "Cfg(Style_Bool)", "set.Disabled(true)"},
}

@(private)
SLIDER_DOCS_PARTS := [?]Doc_Prop_Row {
	{"Slider_Track", "Slider_Track_Props { config, child }", "Track bar (default Color.MUTED)"},
	{"Slider_Range", "Slider_Range_Props { config }", "Filled span (default Color.PRIMARY)"},
	{"Slider_Thumb", "Slider_Thumb_Props { config.index, child }", "Thumb handle for values[config.index]"},
	{"Slider_Default_Parts", "proc(Slider_State)", "Default child: Track + Range + Thumbs"},
}

@(private)
slider_demo_on_volume :: proc(values: []f32) {
	if len(values) > 0 {
		slider_demo_volume[0] = values[0]
	}
}

@(private)
slider_demo_on_step :: proc(values: []f32) {
	if len(values) > 0 {
		slider_demo_step[0] = values[0]
	}
}

@(private)
slider_demo_on_range :: proc(values: []f32) {
	if len(values) >= 2 {
		slider_demo_range[0] = values[0]
		slider_demo_range[1] = values[1]
	}
}

@(private)
slider_demo_on_vertical :: proc(values: []f32) {
	if len(values) > 0 {
		slider_demo_vertical[0] = values[0]
	}
}

@(private)
slider_demo_on_custom :: proc(values: []f32) {
	if len(values) > 0 {
		slider_demo_custom[0] = values[0]
	}
}

@(private)
slider_demo_custom_thumb_inner :: proc(_: w.Slider_Thumb_State) {
	w.Text({
		config = {
			id = "slider_docs_custom_thumb_label",
			text = "•",
			font_size = set.F32(10),
			color = set.Colors(o.Color.PRIMARY_FOREGROUND),
		},
	})
}

@(private)
slider_demo_custom_parts :: proc(frame_state: w.Slider_State) {
	w.Slider_Track({
		config = {
			id = "slider_docs_custom/track",
			background = set.Background(o.Color.SECONDARY),
		},
	})
	w.Slider_Range({
		config = {
			id = "slider_docs_custom/range",
			background = set.Background(o.Color.PRIMARY),
		},
	})

	for i in 0 ..< frame_state.value_count {
		bg := o.Color.PRIMARY

		if frame_state.is_focused && i == frame_state.active_thumb {
			bg = o.Color.RING
		}

		w.Slider_Thumb({
			config = {
				id = fmt.tprintf("slider_docs_custom/thumb-%d", i),
				index = i,
				background = set.Background(bg),
				border = set.Border(f32(2)),
				border_color = set.Border_color(o.Color.BACKGROUND),
			},
			child = slider_demo_custom_thumb_inner,
		})
	}
}

@(private)
slider_docs_basic_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle({
		config = {
			id = "slider_docs_basic_col",
			direction = set.Direction(.VERTICAL),
			gap_y = set.Gap_Y(u16(6)),
			width = set.Width(360),
		},
		child = slider_docs_basic_inner,
	})
}

@(private)
slider_docs_basic_inner :: proc(_: w.Rectangle_State) {
	w.Slider({
		config = {
			id = "slider_docs_basic",
			values = slider_demo_volume[:],
			min = 0,
			max = 100,
			step = 1,
		},
		on_value_change = slider_demo_on_volume,
	})
	w.Text({
		config = {
			id = "slider_docs_basic_status",
			text = fmt.tprintf("Value: %.0f", slider_demo_volume[0]),
			font_size = set.F32(13),
			color = set.Colors(o.Color.MUTED_FOREGROUND),
		},
	})
}

@(private)
slider_docs_step_preview :: proc(_: w.Rectangle_State) {
	w.Slider({
		config = {
			id = "slider_docs_step",
			values = slider_demo_step[:],
			min = 0,
			max = 100,
			step = 10,
		},
		on_value_change = slider_demo_on_step,
	})
}

@(private)
slider_docs_range_preview :: proc(_: w.Rectangle_State) {
	w.Slider({
		config = {
			id = "slider_docs_range",
			values = slider_demo_range[:],
			min = 0,
			max = 100,
			step = 1,
			min_steps_between_thumbs = 1,
		},
		on_value_change = slider_demo_on_range,
	})
}

@(private)
slider_docs_vertical_row :: proc(_: w.Rectangle_State) {
	w.Slider({
		config = {
			id = "slider_docs_vertical",
			width = set.Width(f32(20)),
			height = set.Height(f32(120)),
			values = slider_demo_vertical[:],
			min = 0,
			max = 100,
			step = 1,
			orientation = .VERTICAL,
		},
		on_value_change = slider_demo_on_vertical,
	})
}

@(private)
slider_docs_vertical_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle({
		config = {
			id = "slider_docs_vertical_wrap",
			height = set.Height(f32(140)),
			justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
		},
		child = slider_docs_vertical_row,
	})
}

@(private)
slider_docs_disabled_preview :: proc(_: w.Rectangle_State) {
	w.Slider({
		config = {
			id = "slider_docs_disabled",
			values = slider_demo_disabled[:],
			min = 0,
			max = 100,
			step = 1,
			disabled = set.Disabled(true),
		},
	})
}

@(private)
slider_docs_custom_preview :: proc(_: w.Rectangle_State) {
	w.Slider({
		config = {
			id = "slider_docs_custom",
			values = slider_demo_custom[:],
			min = 0,
			max = 100,
			step = 1,
			thumb_size = set.F32(f32(18)),
		},
		child = slider_demo_custom_parts,
		on_value_change = slider_demo_on_custom,
	})
}

@(private)
slider_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("slider_docs_title", "Slider")
	doc_lede(
		"slider_docs_lede",
		"Caller-owned values slice (one or two thumbs). Compose Slider_Track, Slider_Range, and Slider_Thumb in child, or omit child for default parts.",
	)

	doc_preview("slider_docs_hero_preview", slider_docs_basic_preview)

	doc_section(
		"slider_docs_installation",
		"Installation",
		"w.Slider in oni/widgets/slider.odin.",
		proc(_: w.Rectangle_State) {
			doc_code("slider_docs_installation_code", SLIDER_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"slider_docs_usage",
		"Usage",
		"Pass values every frame. The widget never mutates your slice.",
		proc(_: w.Rectangle_State) {
			doc_code("slider_docs_usage_call", SLIDER_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"slider_docs_basic",
		"Basic",
		"Single thumb between min and max with optional step snapping.",
		proc(_: w.Rectangle_State) {
			doc_preview("slider_docs_basic_preview_wrap", slider_docs_basic_preview)
			doc_code(
				"slider_docs_basic_code",
				`config = { values = volume[:], min = 0, max = 100, step = 1 }`,
			)
		},
	)

	doc_section(
		"slider_docs_step",
		"Stepped",
		"Larger step snaps keyboard and pointer moves to discrete increments.",
		proc(_: w.Rectangle_State) {
			doc_preview("slider_docs_step_preview_wrap", slider_docs_step_preview)
			doc_code("slider_docs_step_code", `config = { step = 10 }`)
		},
	)

	doc_section(
		"slider_docs_range",
		"Range",
		"Pass two values for a range slider; min_steps_between_thumbs enforces minimum gap in step units.",
		proc(_: w.Rectangle_State) {
			doc_preview("slider_docs_range_preview_wrap", slider_docs_range_preview)
			doc_code(
				"slider_docs_range_code",
				`config = { values = range[:], min_steps_between_thumbs = 1 }`,
			)
		},
	)

	doc_section(
		"slider_docs_vertical",
		"Vertical",
		"orientation = .VERTICAL; set explicit width and height on config.",
		proc(_: w.Rectangle_State) {
			doc_preview("slider_docs_vertical_preview_wrap", slider_docs_vertical_preview)
			doc_code(
				"slider_docs_vertical_code",
				`config = {
	orientation = .VERTICAL,
	width = set.Width(20),
	height = set.Height(140),
}`,
			)
		},
	)

	doc_section(
		"slider_docs_disabled",
		"Disabled",
		"disabled suppresses pointer and keyboard interaction.",
		proc(_: w.Rectangle_State) {
			doc_preview("slider_docs_disabled_preview_wrap", slider_docs_disabled_preview)
			doc_code("slider_docs_disabled_code", `config = { disabled = set.Disabled(true) }`)
		},
	)

	doc_section(
		"slider_docs_custom_parts",
		"Composable parts",
		"Customize track, range fill, and thumb chrome with Slider_Track, Slider_Range, and Slider_Thumb inside child.",
		proc(_: w.Rectangle_State) {
			doc_preview("slider_docs_custom_preview_wrap", slider_docs_custom_preview)
			doc_code(
				"slider_docs_custom_code",
				`child = proc(state: w.Slider_State) {
	w.Slider_Track({config = {background = set.Background(o.Color.SECONDARY)}})
	w.Slider_Range({config = {background = set.Background(o.Color.PRIMARY)}})
	for i in 0 ..< state.value_count {
		w.Slider_Thumb({config = {background = set.Background(o.Color.PRIMARY), index = i}})
	}
}`,
			)
		},
	)

	doc_section(
		"slider_docs_api",
		"API Reference",
		"w.Slider, w.Slider_Track, w.Slider_Range, w.Slider_Thumb.",
		proc(_: w.Rectangle_State) {
			doc_h3("slider_docs_api_props_h3", "Props")
			doc_muted(
				"slider_docs_api_orientation_note",
				"Slider_Orientation: HORIZONTAL | VERTICAL.",
			)
			doc_table("slider_docs_props_table", SLIDER_DOCS_PROPS[:])

			doc_h3("slider_docs_api_parts_h3", "Parts")
			doc_table("slider_docs_parts_table", SLIDER_DOCS_PARTS[:])

			doc_h3("slider_docs_api_config_h3", "Config")
			doc_muted(
				"slider_docs_api_config_note",
				"Slider_Config embeds Widget_Config plus values/min/max/step. Slider_Thumb_Config adds index.",
			)
			doc_table("slider_docs_config_table", SLIDER_DOCS_CONFIG[:])
		},
	)
}

Widget_Slider :: proc() {
	doc_page("slider_docs", slider_docs_body)
}
