package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"

@(private)
button_docs_clicks: int

@(private)
button_docs_scratch: struct {
	id, label:  string,
	foreground: o.Colors,
	on_click:   proc(event: w.Button_Event),
}

@(private)
BUTTON_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
BUTTON_DOCS_USAGE_CALL :: `w.Button({
	config = {
		id = "save",
		width = set.Width(.FIT),
		padding = set.Padding(o.Pd_pos{x = 12, y = 6}),
		border = set.Border(1),
		background = set.Colors(o.Color.PRIMARY),
		radius = set.Radius(8),
		justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
	},
	on_click = proc(_: w.Button_Event) { /* ... */ },
	child = proc(_: w.Button_State) {
		w.Text({config = {id = "save_label", text = "Save"}})
	},
})`

@(private)
BUTTON_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Button_Config (= Widget_Config)", "{}"},
	{"child", "proc(Button_State)", "nil"},
	{"on_click", "proc(Button_Event)", "nil"},
	{"on_mount", "proc(Button_State) -> Mount", "nil"},
	{"on_unmount", "proc(Button_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"scroll_bar", "Scroll_Bar_Style", "{}"},
	{"on_focus", "proc(Button_Event)", "nil"},
	{"on_blur", "proc(Button_Event)", "nil"},
	{"on_mouse_enter", "proc(Button_Event)", "nil"},
	{"on_mouse_leave", "proc(Button_Event)", "nil"},
	{"on_mouse_pressed", "proc(Button_Event)", "nil"},
	{"on_mouse_down", "proc(Button_Event)", "nil"},
	{"on_mouse_released", "proc(Button_Event)", "nil"},
	{"on_mouse_move", "proc(Button_Event)", "nil"},
	{"on_contextmenu", "proc(Button_Event)", "nil"},
	{"on_key_pressed", "proc(Button_Event)", "nil"},
	{"on_key_down", "proc(Button_Event)", "nil"},
	{"on_key_released", "proc(Button_Event)", "nil"},
}

@(private)
BUTTON_DOCS_THEME := [?]Doc_Prop_Row {
	{"kind", "Widget_Kind", ".BUTTON"},
	{"line_height", "Cfg(Style_F32)", "1"},
	{"border", "Cfg(Border)", "1"},
	{"border_color", "Cfg(Colors)", "TRANSPARENT"},
}

@(private)
button_docs_on_click :: proc(_: w.Button_Event) {
	button_docs_clicks += 1
}

@(private)
button_docs_styled_child :: proc(_: w.Button_State) {
	w.Text(
		{
			config = {
				id = fmt.tprintf("%s_label", button_docs_scratch.id),
				text = button_docs_scratch.label,
				font_size = set.F32(14),
				color = set.Colors(button_docs_scratch.foreground),
				tabbable = set.Tabbable(false),
				width = set.Width(.FIT),
			},
		},
	)
}

@(private)
button_docs_styled :: proc(
	id: string,
	label: string,
	background: o.Colors = o.Color.PRIMARY,
	foreground: o.Colors = o.Color.PRIMARY_FOREGROUND,
	disabled: bool = false,
	on_click: proc(event: w.Button_Event) = nil,
	radius: f32 = 8,
) {
	button_docs_scratch = {
		id         = id,
		label      = label,
		foreground = foreground,
		on_click   = on_click,
	}

	config := w.Button_Config {
		id           = id,
		padding      = set.Padding(o.Pd_pos{x = 12, y = 6}),
		border       = set.Border(1),
		border_color = set.Border_color(o.Color.BORDER),
		background   = set.Colors(background),
		radius       = set.Radius(radius),
		justify      = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
		tabbable     = set.Tabbable(true),
	}

	if disabled {
		config.disabled = set.Bool(true)
	}

	w.Button({config = config, on_click = on_click, child = button_docs_styled_child})
}

@(private)
button_docs_hero :: proc(_: w.Rectangle_State) {
	button_docs_styled("button_docs_hero", "Button")
}

@(private)
button_docs_basic_preview :: proc(_: w.Rectangle_State) {
	button_docs_styled("button_docs_basic", "Save")
}

@(private)
button_docs_outline_preview :: proc(_: w.Rectangle_State) {
	w.Button({
		config = {
			id = "button_docs_outline",
			width = set.Width(.FIT),
			padding = set.Padding(o.Pd_pos{x = 12, y = 6}),
			border = set.Border(1),
			border_color = set.Border_color(o.Color.BORDER),
			background = set.Colors(o.RGBA{0, 0, 0, 0}),
			radius = set.Radius(8),
			justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
			tabbable = set.Tabbable(true),
		},
		child = proc(_: w.Button_State) {
			w.Text(
				{
					config = {
						id = "button_docs_outline_label",
						text = "Outline",
						font_size = set.F32(14),
						tabbable = set.Tabbable(false),
					},
				},
			)
		},
	})
}

@(private)
button_docs_with_icon_preview :: proc(_: w.Rectangle_State) {
	w.Button({
		config = {
			id = "button_docs_with_icon",
			width = set.Width(.FIT),
			padding = set.Padding(o.Pd_pos{x = 12, y = 6}),
			border = set.Border(1),
			border_color = set.Border_color(o.Color.BORDER),
			background = set.Colors(o.Color.PRIMARY),
			radius = set.Radius(8),
			justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
			tabbable = set.Tabbable(true),
		},
		child = proc(_: w.Button_State) {
			w.Rectangle({
				config = {
					id = "button_docs_with_icon_row",
					direction = set.Direction(.HORIZONTAL),
					gap_x = set.Gap_X(u16(8)),
					justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
				},
				child = proc(_: w.Rectangle_State) {
					w.Text(
						{
							config = {
								id = "button_docs_with_icon_glyph",
								text = "↗",
								font_size = set.F32(14),
								color = set.Colors(o.Color.PRIMARY_FOREGROUND),
								tabbable = set.Tabbable(false),
							},
						},
					)
					w.Text(
						{
							config = {
								id = "button_docs_with_icon_label",
								text = "New Branch",
								font_size = set.F32(14),
								color = set.Colors(o.Color.PRIMARY_FOREGROUND),
								tabbable = set.Tabbable(false),
							},
						},
					)
				},
			})
		},
	})
}


@(private)
button_docs_disabled_preview :: proc(_: w.Rectangle_State) {
	button_docs_styled("button_docs_disabled", "Disabled", disabled = true)
	button_docs_styled(
		"button_docs_disabled_outline",
		"Disabled",
		background = o.RGBA{0, 0, 0, 0},
		foreground = o.Color.FOREGROUND,
		disabled = true,
	)
}

@(private)
button_docs_events_preview :: proc(_: w.Rectangle_State) {
	button_docs_styled(
		"button_docs_click",
		fmt.tprintf("Clicked %d", button_docs_clicks),
		on_click = button_docs_on_click,
	)
}

@(private)
button_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("button_docs_title", "Button")
	doc_lede(
		"button_docs_lede",
		"Interactive control with layout chrome, focus, and pointer / keyboard handling. Style with set.* helpers on Button_Config — there is no built-in variant system.",
	)

	doc_preview("button_docs_hero_preview", button_docs_hero)

	doc_section(
		"button_docs_installation",
		"Installation",
		"w.Button is the engine button widget in oni/widgets/button.odin.",
		proc(_: w.Rectangle_State) {
			doc_code("button_docs_installation_code", BUTTON_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"button_docs_usage",
		"Usage",
		"Pass a stable config.id, style fields via set.*, and a child proc that builds the label (usually w.Text).",
		proc(_: w.Rectangle_State) {
			doc_code("button_docs_usage_import", BUTTON_DOCS_USAGE_IMPORT)
			doc_code("button_docs_usage_call", BUTTON_DOCS_USAGE_CALL)
		},
	)


	doc_section(
		"button_docs_basic_sec",
		"Basic",
		"Set padding, background, border, and radius on the config. Child text color is independent of the button chrome.",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_basic_preview", button_docs_basic_preview)
			doc_code(
				"button_docs_basic_code",
				`w.Button({
	config = {
		id = "save",
		width = set.Width(.FIT),
		padding = set.Padding(o.Pd_pos{x = 12, y = 6}),
		background = set.Colors(o.Color.PRIMARY),
		radius = set.Radius(8),
		justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
	},
	child = proc(_: w.Button_State) {
		w.Text({config = {id = "save_label", text = "Save"}})
	},
})`,
			)
		},
	)


	doc_section(
		"button_docs_with_icon_sec",
		"With Icon",
		"Compose icon and label as children inside the button. A horizontal Rectangle with gap_x keeps spacing consistent.",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_with_icon_preview", button_docs_with_icon_preview)
			doc_code(
				"button_docs_with_icon_code",
				`w.Button({
	config = {id = "with_icon", ...},
	child = proc(_: w.Button_State) {
		w.Rectangle({
			config = {
				id = "with_icon_row",
				direction = set.Direction(.HORIZONTAL),
				gap_x = set.Gap_X(u16(8)),
				justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
			},
			child = proc(_: w.Rectangle_State) {
				w.Text({config = {id = "with_icon_glyph", text = "↗"}})
				w.Text({config = {id = "with_icon_label", text = "New Branch"}})
			},
		})
	},
})`,
			)
		},
	)


	doc_section(
		"button_docs_disabled_sec",
		"Disabled",
		"Set disabled on the config. Interaction and tab focus are suppressed by the engine.",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_disabled_preview", button_docs_disabled_preview)
			doc_code(
				"button_docs_disabled_code",
				`w.Button({
	config = {
		id = "disabled",
		disabled = set.Bool(true),
		...,
	},
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"button_docs_events_sec",
		"Events",
		"Handle activation with on_click. Pointer, focus, and key handlers mirror other widgets.",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_events_preview", button_docs_events_preview)
			doc_p(
				"button_docs_events_note",
				"Stable config.id values are required for focus, GetElementById, and FocusElement.",
			)
			doc_code(
				"button_docs_events_code",
				`w.Button({
	config = {id = "save", ...},
	on_click = proc(_: w.Button_Event) {
		// handle activation
	},
	child = ...,
})`,
			)
		},
	)


	doc_section(
		"button_docs_api",
		"API Reference",
		"w.Button in oni/widgets/button.odin. Button_Config is Widget_Config. Theme base adds kind, line_height, and a transparent border; override chrome with set.* helpers.",
		proc(_: w.Rectangle_State) {
			doc_h3("button_docs_api_props_h3", "Props")
			doc_table("button_docs_props_table", BUTTON_DOCS_PROPS[:])

			doc_h3("button_docs_api_theme_h3", "Theme defaults")
			doc_table("button_docs_theme_table", BUTTON_DOCS_THEME[:])

			doc_h3("button_docs_api_config_h3", "Config")
			doc_p(
				"button_docs_api_config_note",
				"Style overrides use set.* helpers (set.Padding, set.Radius, set.Border, set.Colors, …). Unset fields are left for theme / engine resolution.",
			)


			doc_table("button_docs_config_table", DOC_WIDGET_CONFIG[:])
		},
	)


}

Widget_Button :: proc() {
	doc_page("button_docs", button_docs_body)
}
