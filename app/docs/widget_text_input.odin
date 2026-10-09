package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"

@(private)
text_input_demo_value: string = "Hello, Oni!"

@(private)
text_input_demo_owned: bool

@(private)
text_input_password_value: string = "secret"

@(private)
text_input_password_owned: bool

@(private)
text_input_multiline_value: string = "Line one\nLine two\nLine three"

@(private)
text_input_multiline_owned: bool

@(private)
text_input_readonly_value: string = "read only value"

@(private)
TEXT_INPUT_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
TEXT_INPUT_DOCS_USAGE_CALL :: `w.Text_Input({
	config = {id = "name", text = value, placeholder = "Name"},
	on_change = proc(_: w.Text_Input_Event, text: string) {
		if owned { delete(value) } else { owned = true }
		value = text
	},
})`

@(private)
TEXT_INPUT_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Text_Input_Config", "{}"},
	{"on_change", "proc(Text_Input_Event, text: string)", "nil"},
	{"on_submit", "proc(Text_Input_Event)", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_mount", "proc(Text_Input_State) -> Mount", "nil"},
	{"on_unmount", "proc(Text_Input_State) -> Mount", "nil"},
	{"on_focus", "proc(Text_Input_Event)", "nil"},
	{"on_blur", "proc(Text_Input_Event)", "nil"},
	{"on_mouse_enter", "proc(Text_Input_Event)", "nil"},
	{"on_mouse_leave", "proc(Text_Input_Event)", "nil"},
	{"on_mouse_pressed", "proc(Text_Input_Event)", "nil"},
	{"on_mouse_down", "proc(Text_Input_Event)", "nil"},
	{"on_mouse_released", "proc(Text_Input_Event)", "nil"},
	{"on_mouse_move", "proc(Text_Input_Event)", "nil"},
	{"on_click", "proc(Text_Input_Event)", "nil"},
	{"on_contextmenu", "proc(Text_Input_Event)", "nil"},
	{"on_key_pressed", "proc(Text_Input_Event)", "nil"},
	{"on_key_down", "proc(Text_Input_Event)", "nil"},
	{"on_key_released", "proc(Text_Input_Event)", "nil"},
}

@(private)
TEXT_INPUT_DOCS_CONFIG_SPECIFIC := [?]Doc_Prop_Row {
	{"text", "string", `""`},
	{"placeholder", "string", `""`},
	{"multiline", "bool", "false"},
	{"max_length", "int", "0 (no limit)"},
	{"password", "bool", "false"},
	{"readonly", "bool", "false"},
	{"select_on_focus", "bool", "true single-line; false multiline unless set"},
}

@(private)
text_input_demo_on_change :: proc(_: w.Text_Input_Event, text: string) {
	if text_input_demo_owned {
		delete(text_input_demo_value)
	} else {
		text_input_demo_owned = true
	}

	text_input_demo_value = text
}

@(private)
text_input_password_on_change :: proc(_: w.Text_Input_Event, text: string) {
	if text_input_password_owned {
		delete(text_input_password_value)
	} else {
		text_input_password_owned = true
	}

	text_input_password_value = text
}

@(private)
text_input_multiline_on_change :: proc(_: w.Text_Input_Event, text: string) {
	if text_input_multiline_owned {
		delete(text_input_multiline_value)
	} else {
		text_input_multiline_owned = true
	}

	text_input_multiline_value = text
}

@(private)
text_input_docs_single_preview :: proc(_: w.Rectangle_State) {
	w.Text_Input({
		config = {
			id = "text_input_docs_single",
			text = text_input_demo_value,
			placeholder = "Type here…",
			width = set.Width(420),
		},
		on_change = text_input_demo_on_change,
	})
}

@(private)
text_input_docs_password_preview :: proc(_: w.Rectangle_State) {
	w.Text_Input({
		config = {
			id = "text_input_docs_password",
			text = text_input_password_value,
			placeholder = "••••••••",
			password = true,
			width = set.Width(420),
		},
		on_change = text_input_password_on_change,
	})
}

@(private)
text_input_docs_multiline_preview :: proc(_: w.Rectangle_State) {
	w.Text_Input({
		config = {
			id = "text_input_docs_multiline",
			text = text_input_multiline_value,
			placeholder = "Multiple lines…",
			multiline = true,
			width = set.Width(420),
			height = set.Height(88),
			overflow_y = set.Overflow_Y(.SCROLL),
		},
		on_change = text_input_multiline_on_change,
	})
}

@(private)
text_input_docs_readonly_preview :: proc(_: w.Rectangle_State) {
	w.Text_Input({
		config = {
			id = "text_input_docs_readonly",
			text = text_input_readonly_value,
			readonly = true,
			width = set.Width(420),
		},
	})
}

@(private)
text_input_docs_hero :: proc(_: w.Rectangle_State) {
	w.Rectangle({
		config = {
			id = "text_input_docs_hero_col",
			direction = set.Direction(.VERTICAL),
			gap_y = set.Gap_Y(u16(10)),
			width = set.Width(440),
		},
		child = text_input_docs_hero_inner,
	})
}

@(private)
text_input_docs_hero_inner :: proc(_: w.Rectangle_State) {
	w.Text({
		config = {
			id = "text_input_docs_hero_caption",
			text = "Single line field (tab to password and multiline examples on the full demo route).",
			font_size = set.F32(13),
			color = set.Colors(o.Color.MUTED_FOREGROUND),
		},
	})
	w.Rectangle({
		config = {id = "text_input_docs_hero_field_wrap"},
		child = text_input_docs_single_preview,
	})
}

@(private)
text_input_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("text_input_docs_title", "Text Input")
	doc_lede(
		"text_input_docs_lede",
		"Plain-text editable field with optional password masking, multiline editing, and readonly mode. text is caller-owned; update from on_change.",
	)

	doc_preview("text_input_docs_hero_preview", text_input_docs_hero)

	doc_section(
		"text_input_docs_installation",
		"Installation",
		"w.Text_Input in oni/widgets/text_input.odin.",
		proc(_: w.Rectangle_State) {
			doc_code("text_input_docs_installation_code", TEXT_INPUT_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"text_input_docs_usage",
		"Usage",
		"Pass config.text every frame. on_submit fires on Enter for single-line fields.",
		proc(_: w.Rectangle_State) {
			doc_code("text_input_docs_usage_call", TEXT_INPUT_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"text_input_docs_single",
		"Single line",
		"Default single-line input with placeholder and optional select-on-focus.",
		proc(_: w.Rectangle_State) {
			doc_preview("text_input_docs_single_preview_wrap", text_input_docs_single_preview)
			doc_code(
				"text_input_docs_single_code",
				`w.Text_Input({
	config = {id = "email", text = value, placeholder = "you@example.com"},
	on_change = proc(_, text: string) { value = text },
})`,
			)
		},
	)

	doc_section(
		"text_input_docs_password",
		"Password",
		"password masks display and maps caret movement through the underlying plain string.",
		proc(_: w.Rectangle_State) {
			doc_preview("text_input_docs_password_preview_wrap", text_input_docs_password_preview)
			doc_code(
				"text_input_docs_password_code",
				`config = {id = "pw", text = value, password = true}`,
			)
		},
	)

	doc_section(
		"text_input_docs_multiline",
		"Multiline",
		"multiline enables soft line breaks; set height and overflow_y for scrollable areas.",
		proc(_: w.Rectangle_State) {
			doc_preview("text_input_docs_multiline_preview_wrap", text_input_docs_multiline_preview)
			doc_code(
				"text_input_docs_multiline_code",
				`config = {
	id = "notes",
	text = value,
	multiline = true,
	height = set.Height(96),
	overflow_y = set.Overflow_Y(.SCROLL),
}`,
			)
		},
	)

	doc_section(
		"text_input_docs_readonly",
		"Readonly",
		"readonly shows text without accepting edits; useful for display-only form rows.",
		proc(_: w.Rectangle_State) {
			doc_preview("text_input_docs_readonly_preview_wrap", text_input_docs_readonly_preview)
			doc_code(
				"text_input_docs_readonly_code",
				`w.Text_Input({ config = {id = "id", text = "fixed", readonly = true} })`,
			)
		},
	)

	doc_section(
		"text_input_docs_api",
		"API Reference",
		"w.Text_Input. Text_Input_Config embeds Widget_Config.",
		proc(_: w.Rectangle_State) {
			doc_h3("text_input_docs_api_props_h3", "Props")
			doc_table("text_input_docs_props_table", TEXT_INPUT_DOCS_PROPS[:])

			doc_h3("text_input_docs_api_config_h3", "Config")
			doc_table("text_input_docs_config_specific_table", TEXT_INPUT_DOCS_CONFIG_SPECIFIC[:])
			doc_table("text_input_docs_config_layout_table", DOC_WIDGET_CONFIG[:])
		},
	)
}

Widget_Text_Input :: proc() {
	doc_page("text_input_docs", text_input_docs_body)
}
