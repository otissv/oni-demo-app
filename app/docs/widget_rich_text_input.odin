package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"

@(private)
rich_text_input_demo_value: string = "{c:accent}Accent{/c} {b}bold{/b} {i}italic{/i} — edit with inline tags"

@(private)
rich_text_input_demo_owned: bool

@(private)
RICH_TEXT_INPUT_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
RICH_TEXT_INPUT_DOCS_USAGE_CALL :: `w.Rich_Text_Input({
	config = {
		id = "notes",
		text = value,
		placeholder = "{c:muted}Type…{/c}",
		multiline = true,
	},
	on_change = proc(_: w.Rich_Text_Input_Event, tagged: string) {
		if owned { delete(value) } else { owned = true }
		value = tagged
	},
})`

@(private)
RICH_TEXT_INPUT_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Rich_Text_Input_Config", "{}"},
	{"on_change", "proc(Rich_Text_Input_Event, tagged: string)", "nil"},
	{"on_submit", "proc(Rich_Text_Input_Event)", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_mount", "proc(Rich_Text_Input_State) -> Mount", "nil"},
	{"on_unmount", "proc(Rich_Text_Input_State) -> Mount", "nil"},
	{"on_focus", "proc(Rich_Text_Input_Event)", "nil"},
	{"on_blur", "proc(Rich_Text_Input_Event)", "nil"},
	{"on_mouse_enter", "proc(Rich_Text_Input_Event)", "nil"},
	{"on_mouse_leave", "proc(Rich_Text_Input_Event)", "nil"},
	{"on_mouse_pressed", "proc(Rich_Text_Input_Event)", "nil"},
	{"on_mouse_down", "proc(Rich_Text_Input_Event)", "nil"},
	{"on_mouse_released", "proc(Rich_Text_Input_Event)", "nil"},
	{"on_mouse_move", "proc(Rich_Text_Input_Event)", "nil"},
	{"on_click", "proc(Rich_Text_Input_Event)", "nil"},
	{"on_contextmenu", "proc(Rich_Text_Input_Event)", "nil"},
	{"on_key_pressed", "proc(Rich_Text_Input_Event)", "nil"},
	{"on_key_down", "proc(Rich_Text_Input_Event)", "nil"},
	{"on_key_released", "proc(Rich_Text_Input_Event)", "nil"},
}

@(private)
RICH_TEXT_INPUT_DOCS_CONFIG_SPECIFIC := [?]Doc_Prop_Row {
	{"text", "string", `""`},
	{"placeholder", "string", `""`},
	{"multiline", "bool", "false"},
	{"max_length", "int", "0 (no limit)"},
}

@(private)
rich_text_input_demo_on_change :: proc(_: w.Rich_Text_Input_Event, tagged: string) {
	if rich_text_input_demo_owned {
		delete(rich_text_input_demo_value)
	} else {
		rich_text_input_demo_owned = true
	}

	rich_text_input_demo_value = tagged
}

@(private)
rich_text_input_docs_hero :: proc(_: w.Rectangle_State) {
	w.Rectangle({
		config = {
			id = "rich_text_input_docs_hero_col",
			direction = set.Direction(.VERTICAL),
			gap_y = set.Gap_Y(u16(10)),
			width = set.Width(520),
		},
		child = rich_text_input_docs_hero_inner,
	})
}

@(private)
rich_text_input_docs_hero_inner :: proc(_: w.Rectangle_State) {
	w.Text({
		config = {
			for_id = "rich_text_input_docs_hero_field",
			id = "rich_text_input_docs_hero_label",
			text = "Rich text field",
			font_size = set.F32(13),
			color = set.Colors(o.Color.MUTED_FOREGROUND),
		},
	})

	w.Rich_Text_Input({
		config = {
			id = "rich_text_input_docs_hero_field",
			text = rich_text_input_demo_value,
			placeholder = "{c:muted}Placeholder with tags…{/c}",
			multiline = true,
			width = set.Width(520),
			height = set.Height(100),
			font = set.Font(o.theme.font_body),
			font_size = set.F32(15),
		},
		on_change = rich_text_input_demo_on_change,
	})

	w.Text({
		config = {
			id = "rich_text_input_docs_hero_preview_label",
			text = "Preview",
			font_size = set.F32(12),
			color = set.Colors(o.Color.MUTED_FOREGROUND),
		},
	})

	w.RichText({
		config = {
			id = "rich_text_input_docs_hero_preview",
			text = rich_text_input_demo_value,
			width = set.Width(520),
			font_size = set.F32(15),
			line_height = set.F32(1.5),
			wrap = set.Wrap(.BALANCE),
		},
	})
}

@(private)
rich_text_input_docs_editor_preview :: proc(_: w.Rectangle_State) {
	w.Rich_Text_Input({
		config = {
			id = "rich_text_input_docs_editor",
			text = rich_text_input_demo_value,
			multiline = true,
			width = set.Width(480),
			height = set.Height(88),
		},
		on_change = rich_text_input_demo_on_change,
	})
}

@(private)
rich_text_input_docs_placeholder_preview :: proc(_: w.Rectangle_State) {
	w.Rich_Text_Input({
		config = {
			id = "rich_text_input_docs_placeholder",
			text = "",
			placeholder = "{c:muted}Empty — placeholder uses tags too{/c}",
			width = set.Width(480),
		},
	})
}

@(private)
rich_text_input_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("rich_text_input_docs_title", "Rich Text Input")
	doc_lede(
		"rich_text_input_docs_lede",
		"Editable field that stores tagged source text. on_change delivers the full tagged string; pair with RichText for a live preview.",
	)

	doc_preview("rich_text_input_docs_hero_preview", rich_text_input_docs_hero)

	doc_section(
		"rich_text_input_docs_installation",
		"Installation",
		"Rich_Text_Input is in oni/widgets/rich_text_input.odin.",
		proc(_: w.Rectangle_State) {
			doc_code("rich_text_input_docs_installation_code", RICH_TEXT_INPUT_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"rich_text_input_docs_usage",
		"Usage",
		"text is caller-owned. Clone tagged strings from on_change when you replace heap storage (delete the previous value when you already own it).",
		proc(_: w.Rectangle_State) {
			doc_code("rich_text_input_docs_usage_call", RICH_TEXT_INPUT_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"rich_text_input_docs_editor",
		"Multiline editor and RichText preview",
		"Use multiline for notes; render the same tagged string with w.RichText below the field.",
		proc(_: w.Rectangle_State) {
			doc_preview("rich_text_input_docs_editor_preview_wrap", rich_text_input_docs_editor_preview)
			doc_code(
				"rich_text_input_docs_editor_code",
				`w.Rich_Text_Input({ config = {id = "src", text = value, multiline = true}, on_change = ... })
w.RichText({ config = {id = "preview", text = value} })`,
			)
		},
	)

	doc_section(
		"rich_text_input_docs_placeholder",
		"Placeholder",
		"placeholder accepts the same inline tags as RichText; it shows when text is empty and the field is not composing IME text.",
		proc(_: w.Rectangle_State) {
			doc_preview(
				"rich_text_input_docs_placeholder_preview_wrap",
				rich_text_input_docs_placeholder_preview,
			)
			doc_code(
				"rich_text_input_docs_placeholder_code",
				`placeholder = "{c:muted}Hint{/c}"`,
			)
		},
	)

	doc_section(
		"rich_text_input_docs_api",
		"API Reference",
		"w.Rich_Text_Input. Rich_Text_Input_Config embeds Widget_Config.",
		proc(_: w.Rectangle_State) {
			doc_h3("rich_text_input_docs_api_props_h3", "Props")
			doc_table("rich_text_input_docs_props_table", RICH_TEXT_INPUT_DOCS_PROPS[:])

			doc_h3("rich_text_input_docs_api_config_h3", "Config")
			doc_table(
				"rich_text_input_docs_config_specific_table",
				RICH_TEXT_INPUT_DOCS_CONFIG_SPECIFIC[:],
			)
			doc_table("rich_text_input_docs_config_layout_table", DOC_WIDGET_CONFIG[:])
		},
	)
}

Widget_Rich_Text_Input :: proc() {
	doc_page("rich_text_input_docs", rich_text_input_docs_body)
}
