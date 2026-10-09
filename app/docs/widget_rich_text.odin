package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"

@(private)
RICH_TEXT_DOCS_DEMO_TEXT :: "{c:foreground}Plain{/c} {c:accent}accent{/c} {c:destructive}destructive{/c} {c:muted}muted{/c}\n{b}Bold{/b} {i}italic{/i} {u}underlined{/u}\n{font_size:20}Large{/font_size} {opacity:0.55}Faded{/opacity} {text_decoration_style:dotted}{u}dotted underline{/u}{/text_decoration_style}\nBrace escape: \\{literal}"

@(private)
RICH_TEXT_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
RICH_TEXT_DOCS_USAGE_CALL :: `w.RichText({
	config = {
		id = "bio",
		text = "{c:accent}Hello{/c} {b}world{/b}",
		width = set.Width(400),
		font_size = set.F32(16),
	},
})`

@(private)
RICH_TEXT_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Rich_Text_Config", "{}"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_mount", "proc(Rich_Text_Merged_State) -> Mount", "nil"},
	{"on_unmount", "proc(Rich_Text_Merged_State) -> Mount", "nil"},
	{"on_focus", "proc(Rich_Text_Event)", "nil"},
	{"on_blur", "proc(Rich_Text_Event)", "nil"},
	{"on_mouse_enter", "proc(Rich_Text_Event)", "nil"},
	{"on_mouse_leave", "proc(Rich_Text_Event)", "nil"},
	{"on_mouse_pressed", "proc(Rich_Text_Event)", "nil"},
	{"on_mouse_down", "proc(Rich_Text_Event)", "nil"},
	{"on_mouse_released", "proc(Rich_Text_Event)", "nil"},
	{"on_mouse_move", "proc(Rich_Text_Event)", "nil"},
	{"on_click", "proc(Rich_Text_Event)", "nil"},
	{"on_contextmenu", "proc(Rich_Text_Event)", "nil"},
	{"on_key_pressed", "proc(Rich_Text_Event)", "nil"},
	{"on_key_down", "proc(Rich_Text_Event)", "nil"},
	{"on_key_released", "proc(Rich_Text_Event)", "nil"},
}

@(private)
RICH_TEXT_DOCS_CONFIG_SPECIFIC := [?]Doc_Prop_Row {
	{"text", "string", `""`},
	{"selectable", "bool", "false"},
}

@(private)
rich_text_docs_hero :: proc(_: w.Rectangle_State) {
	w.RichText(
		{
			config = {
				id = "rich_text_docs_hero_body",
				width = set.Width(520),
				text = RICH_TEXT_DOCS_DEMO_TEXT,
				font = set.Font(o.theme.font_body),
				font_size = set.F32(16),
				line_height = set.F32(1.6),
				wrap = set.Wrap(.BALANCE),
			},
		},
	)
}

@(private)
rich_text_docs_tags_preview :: proc(_: w.Rectangle_State) {
	w.RichText(
		{
			config = {
				id = "rich_text_docs_tags",
				width = set.Width(520),
				text = "{c:primary}primary{/c} {c:secondary}secondary{/c} {c:success}success{/c} {c:warning}warning{/c} {c:info}info{/c}",
				font_size = set.F32(15),
				line_height = set.F32(1.55),
			},
		},
	)
}

@(private)
rich_text_docs_shorthand_preview :: proc(_: w.Rectangle_State) {
	w.RichText(
		{
			config = {
				id = "rich_text_docs_shorthand",
				width = set.Width(520),
				text = "{b}bold{/b} {i}italic{/i} {u}underline{/u} {c:accent}accent{/c}",
				font_size = set.F32(15),
			},
		},
	)
}

@(private)
rich_text_docs_escape_preview :: proc(_: w.Rectangle_State) {
	w.RichText(
		{
			config = {
				id = "rich_text_docs_escape",
				width = set.Width(520),
				text = "Literal braces: \\{not a tag\\}",
				font_size = set.F32(15),
			},
		},
	)
}

@(private)
rich_text_docs_selectable_preview :: proc(_: w.Rectangle_State) {
	w.RichText(
		{
			config = {
				id = "rich_text_docs_selectable",
				width = set.Width(520),
				text = "{c:muted}Selectable{/c} — drag to copy plain text.",
				font_size = set.F32(15),
				selectable = true,
			},
		},
	)
}

@(private)
rich_text_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("rich_text_docs_title", "Rich Text")
	doc_lede(
		"rich_text_docs_lede",
		"Display styled copy from a single tagged string. Inline tags map to Widget_Config style fields and theme color names; shorthand covers bold, italic, underline, and color.",
	)

	doc_preview("rich_text_docs_hero_preview", rich_text_docs_hero)

	doc_section(
		"rich_text_docs_installation",
		"Installation",
		"RichText lives in oni/widgets/rich_text.odin. Import the widgets package as w.",
		proc(_: w.Rectangle_State) {
			doc_code("rich_text_docs_installation_code", RICH_TEXT_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"rich_text_docs_usage",
		"Usage",
		"Pass tagged source in config.text. Layout measures plain text; the draw pass paints per-run styles parsed from tags.",
		proc(_: w.Rectangle_State) {
			doc_code("rich_text_docs_usage_call", RICH_TEXT_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"rich_text_docs_tags",
		"Colors and style tags",
		"Use {c:name}…{/c} for palette names (accent, destructive, muted, primary, …). Any Widget_Config field name works as a tag, e.g. {font_size:20}…{/font_size}, {opacity:0.6}…{/opacity}, {font:Inter:24}…{/font}.",
		proc(_: w.Rectangle_State) {
			doc_preview("rich_text_docs_tags_preview", rich_text_docs_tags_preview)
			doc_code(
				"rich_text_docs_tags_code",
				`text = "{c:accent}Accent{/c} {font_size:18}Large{/font_size} {opacity:0.7}Soft{/opacity}"`,
			)
		},
	)

	doc_section(
		"rich_text_docs_shorthand",
		"Shorthand",
		"Short tags: {b}bold{/b}, {i}italic{/i}, {u}underline{/u}, {c:accent}color{/c}. They expand to the same fields as the long form.",
		proc(_: w.Rectangle_State) {
			doc_preview("rich_text_docs_shorthand_preview", rich_text_docs_shorthand_preview)
			doc_code(
				"rich_text_docs_shorthand_code",
				`"{b}Bold{/b} {i}italic{/i} {u}underline{/u} {c:destructive}warn{/c}"`,
			)
		},
	)

	doc_section(
		"rich_text_docs_escape",
		"Escape",
		"Prefix { with backslash to render a literal brace in output.",
		proc(_: w.Rectangle_State) {
			doc_preview("rich_text_docs_escape_preview", rich_text_docs_escape_preview)
			doc_code("rich_text_docs_escape_code", `"Brace escape: \\{literal}"`)
		},
	)

	doc_section(
		"rich_text_docs_selectable",
		"Selectable",
		"Set config.selectable to allow drag-selection; copied text is the plain string without tags.",
		proc(_: w.Rectangle_State) {
			doc_preview("rich_text_docs_selectable_preview", rich_text_docs_selectable_preview)
			doc_code(
				"rich_text_docs_selectable_code",
				`config = {id = "copy", text = "…", selectable = true}`,
			)
		},
	)

	doc_section(
		"rich_text_docs_api",
		"API Reference",
		"w.RichText in oni/widgets/rich_text.odin. Rich_Text_Config embeds Widget_Config.",
		proc(_: w.Rectangle_State) {
			doc_h3("rich_text_docs_api_props_h3", "Props")
			doc_table("rich_text_docs_props_table", RICH_TEXT_DOCS_PROPS[:])

			doc_h3("rich_text_docs_api_config_h3", "Config")
			doc_muted(
				"rich_text_docs_api_config_text_note",
				"Content fields below; layout and typography follow Widget_Config.",
			)
			doc_table("rich_text_docs_config_specific_table", RICH_TEXT_DOCS_CONFIG_SPECIFIC[:])
			doc_table("rich_text_docs_config_layout_table", DOC_WIDGET_CONFIG[:])
		},
	)
}

Widget_Rich_Text :: proc() {
	doc_page("rich_text_docs", rich_text_docs_body)
}
