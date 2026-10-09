package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"

@(private)
link_demo_last_href: string

@(private)
link_demo_activate_count: int

@(private)
link_demo_on_navigate :: proc(event: w.Link_Event) {
	link_demo_last_href = event.frame_state.href
	link_demo_activate_count += 1
}

@(private)
LINK_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
LINK_DOCS_USAGE_CALL :: `w.Link({
	config = {id = "docs"},
	href = "/docs/widgets",
	text = "Widget reference",
	suppress_open_url = true,
	on_navigate = proc(event: w.Link_Event) {
		// route or log event.frame_state.href
	},
})`

@(private)
LINK_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Link_Config (= Widget_Config)", "{}"},
	{"href", "string", `""`},
	{"text", "string", `""`},
	{"mod", "Link_Mod", ".NONE"},
	{"suppress_open_url", "bool", "false"},
	{"disabled", "bool", "false"},
	{"child", "proc(Link_State)", "nil"},
	{"on_navigate", "proc(Link_Event)", "nil"},
	{"on_mount", "proc(Link_State) -> Mount", "nil"},
	{"on_unmount", "proc(Link_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"scroll_bar", "Scroll_Bar_Style", "{}"},
	{"on_focus", "proc(Link_Event)", "nil"},
	{"on_blur", "proc(Link_Event)", "nil"},
	{"on_mouse_enter", "proc(Link_Event)", "nil"},
	{"on_mouse_leave", "proc(Link_Event)", "nil"},
	{"on_mouse_pressed", "proc(Link_Event)", "nil"},
	{"on_mouse_down", "proc(Link_Event)", "nil"},
	{"on_mouse_released", "proc(Link_Event)", "nil"},
	{"on_mouse_move", "proc(Link_Event)", "nil"},
	{"on_click", "proc(Link_Event)", "nil"},
	{"on_contextmenu", "proc(Link_Event)", "nil"},
	{"on_key_pressed", "proc(Link_Event)", "nil"},
	{"on_key_down", "proc(Link_Event)", "nil"},
	{"on_key_released", "proc(Link_Event)", "nil"},
}

@(private)
link_docs_hero :: proc(_: w.Rectangle_State) {
	w.Link(
		{
			config = {id = "link_docs_hero"},
			href = "/docs/widgets",
			text = "Open widgets docs",
			suppress_open_url = true,
			on_navigate = link_demo_on_navigate,
		},
	)
}

@(private)
link_docs_basic_preview :: proc(_: w.Rectangle_State) {
	w.Link(
		{
			config = {id = "link_docs_basic"},
			href = "/docs/widgets",
			text = "Open widgets docs",
			suppress_open_url = true,
			on_navigate = link_demo_on_navigate,
		},
	)
}

@(private)
link_docs_mod_preview :: proc(_: w.Rectangle_State) {
	w.Link(
		{
			config = {id = "link_docs_mod"},
			href = "https://example.com",
			text = "MOD+click external example.com",
			mod = .PRIMARY,
			on_navigate = link_demo_on_navigate,
		},
	)
}

@(private)
link_docs_disabled_preview :: proc(_: w.Rectangle_State) {
	w.Link(
		{
			config = {id = "link_docs_disabled"},
			href = "/locked",
			text = "Unavailable destination",
			disabled = true,
			suppress_open_url = true,
		},
	)
}

@(private)
link_docs_events_preview :: proc(_: w.Rectangle_State) {
	w.Text(
		{
			config = {
				id = "link_docs_events_status",
				text = fmt.tprintf(
					"Activations: %d — last href: %s",
					link_demo_activate_count,
					link_demo_last_href != "" ? link_demo_last_href : "(none)",
				),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
link_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("link_docs_title", "Link")
	doc_lede(
		"link_docs_lede",
		"Inline hyperlink styled like HTML <a>: href destination, Enter to activate when focused, optional modifier clicks, and OS URL open for allowlisted absolute URLs.",
	)

	doc_preview("link_docs_hero_preview", link_docs_hero)

	doc_section(
		"link_docs_installation",
		"Installation",
		"Link is an engine widget in oni/widgets. Use suppress_open_url when the app handles routing itself.",
		proc(_: w.Rectangle_State) {
			doc_code("link_docs_installation_code", LINK_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"link_docs_usage",
		"Usage",
		"Provide href and text each frame. on_navigate runs on activation; on_click also fires. Space does not activate a link.",
		proc(_: w.Rectangle_State) {
			doc_code("link_docs_usage_call", LINK_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"link_docs_basic",
		"Basic",
		"A plain click activates when mod is .NONE. Internal paths typically set suppress_open_url so only your handler runs.",
		proc(_: w.Rectangle_State) {
			doc_preview("link_docs_basic_preview_wrap", link_docs_basic_preview)
			doc_code(
				"link_docs_basic_code",
				`w.Link({
	config = {id = "docs"},
	href = "/docs/widgets",
	text = "Open widgets docs",
	suppress_open_url = true,
	on_navigate = on_navigate,
})`,
			)
		},
	)

	doc_section(
		"link_docs_modifier",
		"Modifier click",
		"Set mod to require a keyboard modifier for pointer activation. .PRIMARY is Ctrl on Linux/Windows and Cmd on macOS. Enter still activates without the modifier.",
		proc(_: w.Rectangle_State) {
			doc_preview("link_docs_mod_preview_wrap", link_docs_mod_preview)
			doc_code(
				"link_docs_mod_code",
				`w.Link({
	config = {id = "external"},
	href = "https://example.com",
	text = "Open in browser",
	mod = .PRIMARY,
	on_navigate = on_navigate,
})`,
			)
		},
	)

	doc_section(
		"link_docs_disabled",
		"Disabled",
		"disabled suppresses interaction and lowers opacity. href is still exposed on state for screen readers.",
		proc(_: w.Rectangle_State) {
			doc_preview("link_docs_disabled_preview_wrap", link_docs_disabled_preview)
			doc_code(
				"link_docs_disabled_code",
				`w.Link({
	config = {id = "locked"},
	href = "/locked",
	text = "Unavailable",
	disabled = true,
})`,
			)
		},
	)

	doc_section(
		"link_docs_events",
		"Events",
		"Track on_navigate to observe activations. Link_Mod also supports .CTRL, .SHIFT, .ALT, and .SUPER.",
		proc(_: w.Rectangle_State) {
			doc_preview("link_docs_events_preview_wrap", link_docs_events_preview)
			doc_code(
				"link_docs_events_code",
				`on_navigate = proc(event: w.Link_Event) {
	last_href = event.frame_state.href
	count += 1
}`,
			)
		},
	)

	doc_section(
		"link_docs_api",
		"API Reference",
		"w.Link in oni/widgets/link.odin. Link_Config is Widget_Config.",
		proc(_: w.Rectangle_State) {
			doc_h3("link_docs_api_props_h3", "Props")
			doc_muted(
				"link_docs_api_props_note",
				"Link_Mod: NONE | CTRL | SHIFT | ALT | SUPER | PRIMARY.",
			)
			doc_table("link_docs_props_table", LINK_DOCS_PROPS[:])

			doc_h3("link_docs_api_config_h3", "Config")
			doc_muted(
				"link_docs_api_config_note",
				"Theme defaults include underline, primary color, and tabbable true.",
			)
			doc_table("link_docs_config_table", DOC_WIDGET_CONFIG[:])
		},
	)
}

Widget_Link :: proc() {
	doc_page("link_docs", link_docs_body)
}
