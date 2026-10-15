package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"

@(private)
progress_demo_value: f32 = 66

@(private)
progress_demo_inverted: f32 = 40

@(private)
progress_demo_custom: f32 = 72

@(private)
PROGRESS_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
PROGRESS_DOCS_USAGE_CALL :: `w.Progress({
	config = {id = "upload", value = value, min = 0, max = 100},
	child = proc(_: w.Progress_State) {
		w.Progress_Label({config = {id = "upload_label", text = "Uploading…"}})
		w.Progress_Value({})
		w.Progress_Track({
			child = proc(_: w.Progress_Track_State) {
				w.Progress_Indicator({})
			},
		})
	},
})`

@(private)
PROGRESS_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Progress_Config (value + Widget_Config)", "{}"},
	{"child", "proc(Progress_State)", "nil → Progress_Default_Parts"},
	{"on_mount", "proc(Progress_State) -> Mount", "nil"},
	{"on_unmount", "proc(Progress_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"on_focus", "proc(Progress_Event)", "nil"},
	{"on_blur", "proc(Progress_Event)", "nil"},
	{"on_mouse_enter", "proc(Progress_Event)", "nil"},
	{"on_mouse_leave", "proc(Progress_Event)", "nil"},
	{"on_mouse_pressed", "proc(Progress_Event)", "nil"},
	{"on_mouse_down", "proc(Progress_Event)", "nil"},
	{"on_mouse_released", "proc(Progress_Event)", "nil"},
	{"on_mouse_move", "proc(Progress_Event)", "nil"},
	{"on_click", "proc(Progress_Event)", "nil"},
	{"on_contextmenu", "proc(Progress_Event)", "nil"},
	{"on_key_pressed", "proc(Progress_Event)", "nil"},
	{"on_key_down", "proc(Progress_Event)", "nil"},
	{"on_key_released", "proc(Progress_Event)", "nil"},
}

@(private)
PROGRESS_DOCS_CONFIG := [?]Doc_Prop_Row {
	{"value", "f32", "0"},
	{"min", "f32", "0 (default range 0..100 when both 0)"},
	{"max", "f32", "100"},
	{"indeterminate", "bool", "false"},
	{"inverted", "bool", "false — fill from trailing edge"},
	{"track_thickness", "Cfg(Style_F32)", "8"},
	{"disabled", "Cfg(Style_Bool)", "set.Disabled(true)"},
}

@(private)
PROGRESS_LABEL_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Progress_Label_Config (text + Widget_Config)", "{}"},
	{"config.text", "string", `"" — default Text when child is nil`},
	{"child", "proc(Progress_Label_State)", "nil → Text(config.text)"},
}

@(private)
PROGRESS_VALUE_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Progress_Value_Config (= Widget_Config)", "{}"},
	{"format", "proc(value, min, max, indeterminate) -> string", "nil → Progress_Format_Default"},
	{"child", "proc(Progress_Value_State)", "nil → Text(formatted)"},
}

@(private)
PROGRESS_TRACK_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Progress_Track_Config (= Widget_Config)", "{}"},
	{"child", "proc(Progress_Track_State)", "nil — nest Progress_Indicator"},
}

@(private)
PROGRESS_INDICATOR_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Progress_Indicator_Config (= Widget_Config)", "{} — paint-only fill"},
}

@(private)
PROGRESS_HELPERS_DOCS := [?]Doc_Prop_Row {
	{"Progress_Status", "PROGRESSING | COMPLETE | INDETERMINATE", ""},
	{"Progress_Ratio", "proc(value, min, max) -> f32", "clamped 0..1"},
	{"Progress_Resolve_Status", "proc(...) -> Progress_Status", ""},
	{"Progress_Format_Default", "proc(...) -> string", `"42%" or "" when indeterminate`},
	{"Progress_Is_Indeterminate", "proc() -> bool", "false outside a root"},
	{"Progress_Current_Status", "proc() -> Progress_Status", ".PROGRESSING outside"},
	{"Progress_Current_Ratio", "proc() -> f32", "0 when indeterminate / outside"},
	{"Progress_Default_Parts", "proc(Progress_State)", "Track + Indicator"},
}

@(private)
progress_docs_custom_format :: proc(
	value, min_v, max_v: f32,
	indeterminate: bool,
) -> string {
	if indeterminate {
		return "…"
	}

	return fmt.tprintf("%.0f / %.0f", value, max_v)
}

@(private)
progress_docs_track_with_indicator :: proc(_: w.Progress_Track_State) {
	w.Progress_Indicator({})
}

@(private)
progress_docs_hero_header :: proc(_: w.Rectangle_State) {
	w.Progress_Label({config = {id = "progress_docs_hero_label", text = "Uploading…"}})
	w.Progress_Value({config = {id = "progress_docs_hero_value"}})
}

@(private)
progress_docs_hero_child :: proc(_: w.Progress_State) {
	w.Rectangle({
		config = {
			id = "progress_docs_hero_header",
			direction = set.Direction(.HORIZONTAL),
			justify = set.Justify(o.Justify_Pos{x = .SPACE_BETWEEN, y = .CENTER}),
			width = set.Width(.GROW),
		},
		child = progress_docs_hero_header,
	})
	w.Progress_Track({
		config = {id = "progress_docs_hero_track"},
		child = progress_docs_track_with_indicator,
	})
}

@(private)
progress_docs_hero :: proc(_: w.Rectangle_State) {
	w.Progress({
		config = {
			id = "progress_docs_hero",
			width = set.Width(f32(420)),
			value = progress_demo_value,
			min = 0,
			max = 100,
		},
		child = progress_docs_hero_child,
	})
}

@(private)
progress_docs_default_preview :: proc(_: w.Rectangle_State) {
	w.Progress({
		config = {
			id = "progress_docs_default",
			width = set.Width(f32(420)),
			value = 33,
			min = 0,
			max = 100,
		},
	})
}

@(private)
progress_docs_indet_header :: proc(_: w.Rectangle_State) {
	w.Progress_Label({config = {id = "progress_docs_indet_label", text = "Syncing"}})
	w.Progress_Value({config = {id = "progress_docs_indet_value"}})
}

@(private)
progress_docs_indet_child :: proc(_: w.Progress_State) {
	w.Rectangle({
		config = {
			id = "progress_docs_indet_header",
			direction = set.Direction(.HORIZONTAL),
			justify = set.Justify(o.Justify_Pos{x = .SPACE_BETWEEN, y = .CENTER}),
			width = set.Width(.GROW),
		},
		child = progress_docs_indet_header,
	})
	w.Progress_Track({
		config = {id = "progress_docs_indet_track"},
		child = progress_docs_track_with_indicator,
	})
}

@(private)
progress_docs_indet_preview :: proc(_: w.Rectangle_State) {
	w.Progress({
		config = {
			id = "progress_docs_indet",
			width = set.Width(f32(420)),
			indeterminate = true,
		},
		child = progress_docs_indet_child,
	})
}

@(private)
progress_docs_inverted_header :: proc(_: w.Rectangle_State) {
	w.Progress_Label({config = {id = "progress_docs_inverted_label", text = "Inverted"}})
	w.Progress_Value({config = {id = "progress_docs_inverted_value"}})
}

@(private)
progress_docs_inverted_child :: proc(_: w.Progress_State) {
	w.Rectangle({
		config = {
			id = "progress_docs_inverted_header",
			direction = set.Direction(.HORIZONTAL),
			justify = set.Justify(o.Justify_Pos{x = .SPACE_BETWEEN, y = .CENTER}),
			width = set.Width(.GROW),
		},
		child = progress_docs_inverted_header,
	})
	w.Progress_Track({
		config = {id = "progress_docs_inverted_track"},
		child = progress_docs_track_with_indicator,
	})
}

@(private)
progress_docs_inverted_preview :: proc(_: w.Rectangle_State) {
	w.Progress({
		config = {
			id = "progress_docs_inverted",
			width = set.Width(f32(420)),
			value = progress_demo_inverted,
			min = 0,
			max = 100,
			inverted = true,
		},
		child = progress_docs_inverted_child,
	})
}

@(private)
progress_docs_custom_header :: proc(_: w.Rectangle_State) {
	w.Progress_Label({config = {id = "progress_docs_custom_label", text = "Custom format"}})
	w.Progress_Value({
		config = {id = "progress_docs_custom_value"},
		format = progress_docs_custom_format,
	})
}

@(private)
progress_docs_custom_child :: proc(_: w.Progress_State) {
	w.Rectangle({
		config = {
			id = "progress_docs_custom_header",
			direction = set.Direction(.HORIZONTAL),
			justify = set.Justify(o.Justify_Pos{x = .SPACE_BETWEEN, y = .CENTER}),
			width = set.Width(.GROW),
		},
		child = progress_docs_custom_header,
	})
	w.Progress_Track({
		config = {
			id = "progress_docs_custom_track",
			background = set.Background(o.Color.SECONDARY),
		},
		child = progress_docs_track_with_indicator,
	})
}

@(private)
progress_docs_custom_preview :: proc(_: w.Rectangle_State) {
	w.Progress({
		config = {
			id = "progress_docs_custom",
			width = set.Width(f32(420)),
			value = progress_demo_custom,
			min = 0,
			max = 100,
			track_thickness = set.F32(12),
		},
		child = progress_docs_custom_child,
	})
}

@(private)
progress_docs_disabled_header :: proc(_: w.Rectangle_State) {
	w.Progress_Label({config = {id = "progress_docs_disabled_label", text = "Disabled"}})
	w.Progress_Value({config = {id = "progress_docs_disabled_value"}})
}

@(private)
progress_docs_disabled_child :: proc(_: w.Progress_State) {
	w.Rectangle({
		config = {
			id = "progress_docs_disabled_header",
			direction = set.Direction(.HORIZONTAL),
			justify = set.Justify(o.Justify_Pos{x = .SPACE_BETWEEN, y = .CENTER}),
			width = set.Width(.GROW),
		},
		child = progress_docs_disabled_header,
	})
	w.Progress_Track({
		config = {id = "progress_docs_disabled_track"},
		child = progress_docs_track_with_indicator,
	})
}

@(private)
progress_docs_disabled_preview :: proc(_: w.Rectangle_State) {
	w.Progress({
		config = {
			id = "progress_docs_disabled",
			width = set.Width(f32(420)),
			value = 55,
			min = 0,
			max = 100,
			disabled = set.Disabled(true),
		},
		child = progress_docs_disabled_child,
	})
}

@(private)
progress_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("progress_docs_title", "Progress")
	doc_lede(
		"progress_docs_lede",
		"Display-only completion bar: Progress + Label / Value / Track / Indicator with caller-owned value.",
	)

	doc_preview("progress_docs_hero_preview", progress_docs_hero)

	doc_section(
		"progress_docs_installation",
		"Installation",
		"Use w.Progress as the root with optional Label, Value, Track, and Indicator parts in oni/widgets.",
		proc(_: w.Rectangle_State) {
			doc_code("progress_docs_installation_code", PROGRESS_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"progress_docs_usage",
		"Usage",
		"config.value is caller-owned every frame. There is no on_value_change — the app drives the value. Parts must be descendants of the root.",
		proc(_: w.Rectangle_State) {
			doc_code("progress_docs_usage_call", PROGRESS_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"progress_docs_composition",
		"Composition",
		"Nil child uses Progress_Default_Parts (Track + Indicator). Progress_Indicator is paint-only inside the track.",
		proc(_: w.Rectangle_State) {
			doc_code(
				"progress_docs_composition_tree",
				`Progress
├── Progress_Label
├── Progress_Value
└── Progress_Track
    └── Progress_Indicator`,
			)
			doc_preview("progress_docs_default_preview_wrap", progress_docs_default_preview)
			doc_muted(
				"progress_docs_default_note",
				"Above: Progress with no child — Progress_Default_Parts only.",
			)
		},
	)

	doc_section(
		"progress_docs_indeterminate",
		"Indeterminate",
		"config.indeterminate paints a partial fill and clears Progress_Value text (status INDETERMINATE).",
		proc(_: w.Rectangle_State) {
			doc_preview("progress_docs_indet_preview_wrap", progress_docs_indet_preview)
			doc_code(
				"progress_docs_indet_code",
				`w.Progress({
	config = {id = "sync", indeterminate = true},
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"progress_docs_inverted",
		"Inverted",
		"config.inverted fills from the trailing edge (RTL-friendly).",
		proc(_: w.Rectangle_State) {
			doc_preview("progress_docs_inverted_preview_wrap", progress_docs_inverted_preview)
			doc_code(
				"progress_docs_inverted_code",
				`w.Progress({
	config = {id = "rtl", value = value, inverted = true},
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"progress_docs_format",
		"Custom value",
		"Pass format on Progress_Value to replace Progress_Format_Default percent text. track_thickness thickens Track / Indicator.",
		proc(_: w.Rectangle_State) {
			doc_preview("progress_docs_custom_preview_wrap", progress_docs_custom_preview)
			doc_code(
				"progress_docs_format_code",
				`w.Progress_Value({
	format = proc(value, min_v, max_v: f32, indeterminate: bool) -> string {
		if indeterminate do return "…"
		return fmt.tprintf("%.0f / %.0f", value, max_v)
	},
})`,
			)
		},
	)

	doc_section(
		"progress_docs_disabled",
		"Disabled",
		"config.disabled dims the root and propagates to Label / Value / Track.",
		proc(_: w.Rectangle_State) {
			doc_preview("progress_docs_disabled_preview_wrap", progress_docs_disabled_preview)
		},
	)

	doc_section(
		"progress_docs_api",
		"API Reference",
		"w.Progress and parts in oni/widgets/progress*.odin. Helpers live in progress_shared.odin.",
		proc(_: w.Rectangle_State) {
			doc_h3("progress_docs_api_root_props_h3", "Progress props")
			doc_muted(
				"progress_docs_api_root_note",
				"Display-only: pass config.value every frame. Status is derived from value, bounds, and indeterminate.",
			)
			doc_table("progress_docs_root_props_table", PROGRESS_DOCS_PROPS[:])

			doc_h3("progress_docs_api_root_config_h3", "Progress config")
			doc_table("progress_docs_root_config_table", PROGRESS_DOCS_CONFIG[:])

			doc_h3("progress_docs_api_label_h3", "Progress_Label props")
			doc_table("progress_docs_label_props_table", PROGRESS_LABEL_DOCS_PROPS[:])

			doc_h3("progress_docs_api_value_h3", "Progress_Value props")
			doc_table("progress_docs_value_props_table", PROGRESS_VALUE_DOCS_PROPS[:])

			doc_h3("progress_docs_api_track_h3", "Progress_Track props")
			doc_table("progress_docs_track_props_table", PROGRESS_TRACK_DOCS_PROPS[:])

			doc_h3("progress_docs_api_indicator_h3", "Progress_Indicator props")
			doc_table("progress_docs_indicator_props_table", PROGRESS_INDICATOR_DOCS_PROPS[:])

			doc_h3("progress_docs_api_helpers_h3", "Helpers")
			doc_table("progress_docs_helpers_table", PROGRESS_HELPERS_DOCS[:])

			doc_h3("progress_docs_api_layout_config_h3", "Layout config")
			doc_muted(
				"progress_docs_api_layout_config_note",
				"Shared Widget_Config layout fields (width, padding, gap, …) apply on each widget config.",
			)
			doc_table("progress_docs_config_table", DOC_WIDGET_CONFIG[:])
		},
	)
}

Widget_Progress :: proc() {
	doc_page("progress_docs", progress_docs_body)
}
