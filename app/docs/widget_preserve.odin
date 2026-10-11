package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"

PRESERVE_DEMO_TEXT :: "Two  spaces stay wide.\n\tTabbed line\n\t\tNested tab\nThis line is intentionally long and should scroll horizontally inside the block below.\nCRLF line\r\nNext line after CRLF\n"

@(private)
PRESERVE_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
PRESERVE_DOCS_USAGE_CALL :: `w.Preserve({
	config = {
		id = "log",
		text = log_text,
		font_size = set.F32(14),
		tab_size = set.Tab_Size(4),
	},
})`

@(private)
PRESERVE_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Preserve_Config (= Text_Config)", "{}"},
	{"on_mount", "proc(Text_Merged_State) -> Mount", "nil"},
	{"on_unmount", "proc(Text_Merged_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_focus", "proc(Text_Event)", "nil"},
	{"on_blur", "proc(Text_Event)", "nil"},
	{"on_mouse_enter", "proc(Text_Event)", "nil"},
	{"on_mouse_leave", "proc(Text_Event)", "nil"},
	{"on_mouse_pressed", "proc(Text_Event)", "nil"},
	{"on_mouse_down", "proc(Text_Event)", "nil"},
	{"on_mouse_released", "proc(Text_Event)", "nil"},
	{"on_mouse_move", "proc(Text_Event)", "nil"},
	{"on_click", "proc(Text_Event)", "nil"},
	{"on_contextmenu", "proc(Text_Event)", "nil"},
	{"on_key_pressed", "proc(Text_Event)", "nil"},
	{"on_key_down", "proc(Text_Event)", "nil"},
	{"on_key_released", "proc(Text_Event)", "nil"},
}

@(private)
PRESERVE_DOCS_CONFIG_TEXT := [?]Doc_Prop_Row {
	{"text", "string", `""`},
	{"selectable", "bool", "false"},
	{"for_id", "string", `""`},
	{"tab_size", "Cfg(Style_F32)", "unset (default 4 in preserve_apply_defaults path)"},
}

@(private)
preserve_docs_hero :: proc(_: w.Rectangle_State) {
	w.Preserve(
		{
			config = {
				id = "preserve_docs_hero",
				text = "  leading spaces\n\t\ttabs preserved",
				font_size = set.F32(14),
				tab_size = set.Tab_Size(4),
			},
		},
	)
}

@(private)
preserve_docs_whitespace_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "preserve_docs_whitespace_port",
				height = set.Height(240),
				padding = set.Padding(12),
				background = set.Colors(o.Color.MUTED),
				radius = set.Radius(8),
				overflow_x = set.Overflow_X(.AUTO),
				overflow_y = set.Overflow_Y(.AUTO),
			},
			child = preserve_docs_whitespace_inner,
		},
	)
}

@(private)
preserve_docs_whitespace_inner :: proc(_: w.Rectangle_State) {
	w.Preserve(
		{
			config = {
				id = "preserve_docs_whitespace_text",
				text = PRESERVE_DEMO_TEXT,
				font = set.Font(o.theme.font_body),
				font_size = set.F32(14),
				tab_size = set.Tab_Size(4),
			},
		},
	)
}

@(private)
preserve_docs_tab_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "preserve_docs_tab_row",
				direction = set.Direction(.HORIZONTAL),
				gap_x = set.Gap_X(u16(24)),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
			},
			child = preserve_docs_tab_columns,
		},
	)
}

@(private)
preserve_docs_tab_columns :: proc(_: w.Rectangle_State) {
	w.Preserve(
		{
			config = {
				id = "preserve_docs_tab_4",
				text = "tab_size 4:\n\tone\n\t\ttwo",
				font_size = set.F32(14),
				tab_size = set.Tab_Size(4),
			},
		},
	)
	w.Preserve(
		{
			config = {
				id = "preserve_docs_tab_8",
				text = "tab_size 8:\n\tone\n\t\ttwo",
				font_size = set.F32(14),
				tab_size = set.Tab_Size(8),
			},
		},
	)
}

@(private)
preserve_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("preserve_docs_title", "Preserve")
	doc_lede(
		"preserve_docs_lede",
		"Preformatted text with wrap PRESERVE: tabs, spaces, newlines, and CRLF are kept. Use inside a scrollable parent when content overflows.",
	)

	doc_preview("preserve_docs_hero_preview", preserve_docs_hero)

	doc_section(
		"preserve_docs_installation",
		"Installation",
		"Preserve is a thin wrapper over Text in oni/widgets/preserve.odin with preserve-oriented defaults.",
		proc(_: w.Rectangle_State) {
			doc_code("preserve_docs_installation_code", PRESERVE_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"preserve_docs_usage",
		"Usage",
		"Pass the full string in config.text each frame. Unset wrap defaults to PRESERVE; align defaults to LEFT.",
		proc(_: w.Rectangle_State) {
			doc_code("preserve_docs_usage_call", PRESERVE_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"preserve_docs_whitespace",
		"Whitespace",
		"Double spaces, tab characters, and hard breaks render literally. Wrap the block in a Rectangle with overflow auto for scrolling.",
		proc(_: w.Rectangle_State) {
			doc_preview("preserve_docs_whitespace_preview_wrap", preserve_docs_whitespace_preview)
			doc_code(
				"preserve_docs_whitespace_code",
				`w.Rectangle({
	config = {
		id = "viewport",
		width = set.Width(480),
		height = set.Height(240),
		overflow_x = set.Overflow_X(.AUTO),
		overflow_y = set.Overflow_Y(.AUTO),
	},
	child = proc(_: w.Rectangle_State) {
		w.Preserve({
			config = {id = "body", text = PRESERVE_DEMO_TEXT},
		})
	},
})`,
			)
		},
	)

	doc_section(
		"preserve_docs_tab_size",
		"tab_size",
		"tab_size sets the width of each tab stop in spaces. Compare 4 vs 8 for nested indentation.",
		proc(_: w.Rectangle_State) {
			doc_preview("preserve_docs_tab_preview_wrap", preserve_docs_tab_preview)
			doc_code(
				"preserve_docs_tab_code",
				`w.Preserve({
	config = {
		id = "indented",
		text = "\tone\n\t\ttwo",
		tab_size = set.Tab_Size(8),
	},
})`,
			)
		},
	)

	doc_section(
		"preserve_docs_api",
		"API Reference",
		"w.Preserve in oni/widgets/preserve.odin. Preserve_Props is Text_Props; Preserve_Config embeds Text_Config.",
		proc(_: w.Rectangle_State) {
			doc_h3("preserve_docs_api_props_h3", "Props")
			doc_table("preserve_docs_props_table", PRESERVE_DOCS_PROPS[:])

			doc_h3("preserve_docs_api_config_h3", "Config")
			doc_muted(
				"preserve_docs_api_config_text_note",
				"Text-specific fields on Preserve_Config (Widget_Config fields follow).",
			)
			doc_table("preserve_docs_config_text_table", PRESERVE_DOCS_CONFIG_TEXT[:])
			doc_table("preserve_docs_config_layout_table", DOC_WIDGET_CONFIG[:])
		},
	)
}

Widget_Preserve :: proc() {
	doc_page("preserve_docs", preserve_docs_body)
}
