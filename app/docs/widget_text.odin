package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"

@(private)
TEXT_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
TEXT_DOCS_USAGE_CALL :: `w.Text({
	config = {
		id = "description",
		text = "Paragraph copy.",
		width = set.Width(400),
		wrap = set.Wrap(.BALANCE),
	},
})`

@(private)
TEXT_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Text_Config", "{}"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_mount", "proc(Text_Merged_State) -> Mount", "nil"},
	{"on_unmount", "proc(Text_Merged_State) -> Mount", "nil"},
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
TEXT_DOCS_CONFIG_SPECIFIC := [?]Doc_Prop_Row {
	{"text", "string", `""`},
	{"selectable", "bool", "false"},
	{"for_id", "string", `""`},
}

@(private)
text_docs_hero :: proc(_: w.Rectangle_State) {
	w.Text({
		config = {
			id = "text_docs_hero",
			width = set.Width(480),
			text = "Consequuntur fugit veritatis ea aliquid officiis nesciunt enim. Minima vitae culpa occaecati optio.",
			font_size = set.F32(15),
			line_height = set.F32(1.55),
			wrap = set.Wrap(.BALANCE),
		},
	})
}

@(private)
text_docs_basic_preview :: proc(_: w.Rectangle_State) {
	w.Text({
		config = {
			id = "text_docs_basic",
			width = set.Width(420),
			text = "A simple paragraph with balanced wrapping.",
			font_size = set.F32(14),
			wrap = set.Wrap(.BALANCE),
		},
	})
}

@(private)
text_docs_for_id_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle({
		config = {
			id = "text_docs_for_id_row",
			direction = set.Direction(.HORIZONTAL),
			gap_x = set.Gap_X(u16(10)),
			justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
		},
		child = text_docs_for_id_row,
	})
}

@(private)
text_docs_for_id_row :: proc(_: w.Rectangle_State) {
	w.Checkbox({
		config = {id = "text_docs_for_id_target"},
		checked = .FALSE,
	})
	w.Text({
		config = {
			for_id = "text_docs_for_id_target",
			id = "text_docs_for_id_label",
			text = "Click label to toggle checkbox",
			font_size = set.F32(14),
		},
	})
}

@(private)
text_docs_selectable_preview :: proc(_: w.Rectangle_State) {
	w.Text({
		config = {
			id = "text_docs_selectable",
			width = set.Width(420),
			text = "Selectable plain text — drag to copy.",
			font_size = set.F32(14),
			selectable = true,
		},
	})
}

@(private)
text_docs_typography_preview :: proc(_: w.Rectangle_State) {
	w.Text({
		config = {
			id = "text_docs_typography",
			width = set.Width(420),
			text = "Muted, smaller body with explicit line height.",
			font_size = set.F32(13),
			line_height = set.F32(1.7),
			color = set.Colors(o.Color.MUTED_FOREGROUND),
			wrap = set.Wrap(.BALANCE),
		},
	})
}

@(private)
text_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("text_docs_title", "Text")
	doc_lede(
		"text_docs_lede",
		"Static plain-text display with full Widget_Config typography. Use for labels, descriptions, and helper copy.",
	)

	doc_preview("text_docs_hero_preview", text_docs_hero)

	doc_section(
		"text_docs_installation",
		"Installation",
		"w.Text is the primitive text widget in oni/widgets/text.odin.",
		proc(_: w.Rectangle_State) {
			doc_code("text_docs_installation_code", TEXT_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"text_docs_usage",
		"Usage",
		"Set config.text each frame. For rich inline styles use w.RichText instead.",
		proc(_: w.Rectangle_State) {
			doc_code("text_docs_usage_call", TEXT_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"text_docs_basic",
		"Basic paragraph",
		"Constrain width and enable wrap for readable blocks.",
		proc(_: w.Rectangle_State) {
			doc_preview("text_docs_basic_preview_wrap", text_docs_basic_preview)
			doc_code(
				"text_docs_basic_code",
				`w.Text({ config = {id = "p", text = "…", width = set.Width(400), wrap = set.Wrap(.BALANCE)} })`,
			)
		},
	)

	doc_section(
		"text_docs_for_id",
		"for_id label association",
		"Text_Config.for_id mirrors HTML label for: clicking the text focuses the target widget and may activate it (checkbox toggle, button click).",
		proc(_: w.Rectangle_State) {
			doc_preview("text_docs_for_id_preview_wrap", text_docs_for_id_preview)
			doc_code(
				"text_docs_for_id_code",
				`w.Checkbox({ config = {id = "terms"}, checked = value, ... })
w.Text({ config = {for_id = "terms", id = "terms_label", text = "Accept terms"} })`,
			)
		},
	)

	doc_section(
		"text_docs_selectable",
		"Selectable",
		"config.selectable enables drag-selection of the plain string.",
		proc(_: w.Rectangle_State) {
			doc_preview("text_docs_selectable_preview_wrap", text_docs_selectable_preview)
			doc_code("text_docs_selectable_code", `config = {id = "copy", text = "…", selectable = true}`)
		},
	)

	doc_section(
		"text_docs_typography",
		"Wrap and typography",
		"Use font, font_size, font_weight, color, align, wrap, and line_height from Widget_Config.",
		proc(_: w.Rectangle_State) {
			doc_preview("text_docs_typography_preview_wrap", text_docs_typography_preview)
			doc_code(
				"text_docs_typography_code",
				`config = {
	id = "muted",
	text = "…",
	font_size = set.F32(13),
	color = set.Colors(o.Color.MUTED_FOREGROUND),
	wrap = set.Wrap(.BALANCE),
}`,
			)
		},
	)

	doc_section(
		"text_docs_api",
		"API Reference",
		"w.Text. Text_Config embeds Widget_Config.",
		proc(_: w.Rectangle_State) {
			doc_h3("text_docs_api_props_h3", "Props")
			doc_table("text_docs_props_table", TEXT_DOCS_PROPS[:])

			doc_h3("text_docs_api_config_h3", "Config")
			doc_table("text_docs_config_specific_table", TEXT_DOCS_CONFIG_SPECIFIC[:])
			doc_table("text_docs_config_layout_table", DOC_WIDGET_CONFIG[:])
		},
	)
}

WidgetText :: proc() {
	doc_page("text_docs", text_docs_body)
}
