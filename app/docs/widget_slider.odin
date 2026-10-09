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
	config = {id = "volume"},
	values = volume[:],
	min = 0,
	max = 100,
	step = 1,
	on_value_change = proc(vals: []f32) { volume[0] = vals[0] },
})`

@(private)
SLIDER_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Slider_Config (= Widget_Config)", "{}"},
	{"values", "[]f32", "required (len 1 or 2)"},
	{"min", "f32", "0"},
	{"max", "f32", "100"},
	{"step", "f32", "1"},
	{"min_steps_between_thumbs", "f32", "0"},
	{"orientation", "Slider_Orientation", ".HORIZONTAL"},
	{"inverted", "bool", "false"},
	{"disabled", "bool", "false"},
	{"style", "Slider_Style", "{}"},
	{"thumb", "proc(Slider_Thumb_State)", "nil"},
	{"on_value_change", "proc(values: []f32)", "nil"},
	{"on_value_commit", "proc(values: []f32)", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_mount", "proc(Slider_State) -> Mount", "nil"},
	{"on_unmount", "proc(Slider_State) -> Mount", "nil"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"scroll_bar", "Scroll_Bar_Style", "{}"},
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
SLIDER_DOCS_STYLE := [?]Doc_Prop_Row {
	{"track", "Cfg(Colors)", "theme track"},
	{"range", "Cfg(Colors)", "theme range fill"},
	{"thumb", "Cfg(Colors)", "theme thumb"},
	{"thumb_border", "Cfg(Colors)", "theme thumb border"},
	{"thumb_size", "Cfg(Style_F32)", "default thumb diameter"},
	{"track_thickness", "Cfg(Style_F32)", "default track thickness"},
	{"radius", "Cfg(Radius)", "track corners"},
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
slider_demo_custom_thumb_inner :: proc(_: w.Rectangle_State) {
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
slider_demo_custom_thumb :: proc(frame_state: w.Slider_Thumb_State) {
	bg := o.Color.PRIMARY

	if frame_state.is_active {
		bg = o.Color.RING
	}

	w.Rectangle({
		config = {
			id = fmt.tprintf("slider_docs_custom_thumb_%d", frame_state.index),
			width = set.Width(f32(18)),
			height = set.Height(f32(18)),
			radius = set.Radius(f32(9)),
			background = set.Background(bg),
			border = set.Border(f32(2)),
			border_color = set.Border_color(o.Color.BACKGROUND),
			justify = set.Justify(o.Justify_Align.CENTER),
		},
		child = slider_demo_custom_thumb_inner,
	})
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
		config = {id = "slider_docs_basic"},
		values = slider_demo_volume[:],
		min = 0,
		max = 100,
		step = 1,
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
		config = {id = "slider_docs_step"},
		values = slider_demo_step[:],
		min = 0,
		max = 100,
		step = 10,
		on_value_change = slider_demo_on_step,
	})
}

@(private)
slider_docs_range_preview :: proc(_: w.Rectangle_State) {
	w.Slider({
		config = {id = "slider_docs_range"},
		values = slider_demo_range[:],
		min = 0,
		max = 100,
		step = 1,
		min_steps_between_thumbs = 1,
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
		},
		values = slider_demo_vertical[:],
		min = 0,
		max = 100,
		step = 1,
		orientation = .VERTICAL,
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
		config = {id = "slider_docs_disabled"},
		values = slider_demo_disabled[:],
		min = 0,
		max = 100,
		step = 1,
		disabled = true,
	})
}

@(private)
slider_docs_custom_preview :: proc(_: w.Rectangle_State) {
	w.Slider({
		config = {id = "slider_docs_custom"},
		values = slider_demo_custom[:],
		min = 0,
		max = 100,
		step = 1,
		thumb = slider_demo_custom_thumb,
		on_value_change = slider_demo_on_custom,
	})
}

@(private)
slider_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("slider_docs_title", "Slider")
	doc_lede(
		"slider_docs_lede",
		"Caller-owned values slice (one or two thumbs). Pointer and keyboard update via on_value_change; on_value_commit runs when a drag ends.",
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
				`values = volume[:], min = 0, max = 100, step = 1`,
			)
		},
	)

	doc_section(
		"slider_docs_step",
		"Stepped",
		"Larger step snaps keyboard and pointer moves to discrete increments.",
		proc(_: w.Rectangle_State) {
			doc_preview("slider_docs_step_preview_wrap", slider_docs_step_preview)
			doc_code("slider_docs_step_code", `step = 10`)
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
				`values = range[:], min_steps_between_thumbs = 1`,
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
				`orientation = .VERTICAL,
config = { width = set.Width(20), height = set.Height(140) }`,
			)
		},
	)

	doc_section(
		"slider_docs_disabled",
		"Disabled",
		"disabled suppresses pointer and keyboard interaction.",
		proc(_: w.Rectangle_State) {
			doc_preview("slider_docs_disabled_preview_wrap", slider_docs_disabled_preview)
			doc_code("slider_docs_disabled_code", `disabled = true`)
		},
	)

	doc_section(
		"slider_docs_custom_thumb",
		"Custom thumb",
		"thumb replaces built-in thumb chrome per thumb index; track and range still use the default painter.",
		proc(_: w.Rectangle_State) {
			doc_preview("slider_docs_custom_preview_wrap", slider_docs_custom_preview)
			doc_code(
				"slider_docs_custom_code",
				`thumb = proc(state: w.Slider_Thumb_State) {
	w.Rectangle({ /* sized to hit rect */ })
}`,
			)
		},
	)

	doc_section(
		"slider_docs_api",
		"API Reference",
		"w.Slider. Slider_Config is Widget_Config.",
		proc(_: w.Rectangle_State) {
			doc_h3("slider_docs_api_props_h3", "Props")
			doc_muted(
				"slider_docs_api_orientation_note",
				"Slider_Orientation: HORIZONTAL | VERTICAL.",
			)
			doc_table("slider_docs_props_table", SLIDER_DOCS_PROPS[:])

			doc_h3("slider_docs_api_config_h3", "Config")
			doc_table("slider_docs_config_table", DOC_WIDGET_CONFIG[:])

			doc_h3("slider_docs_api_style_h3", "Style")
			doc_table("slider_docs_style_table", SLIDER_DOCS_STYLE[:])
		},
	)
}

Widget_Slider :: proc() {
	doc_page("slider_docs", slider_docs_body)
}
