package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import ui "../ui"
import "core:fmt"

@(private)
button_docs_clicks: int

@(private)
BUTTON_DOCS_USAGE_IMPORT :: `import ui "app/ui"
import w "oni/widgets"
import set "oni/set"`

@(private)
BUTTON_DOCS_USAGE_CALL :: `ui.Button({
	id = "save",
	variant = .OUTLINE,
	child = proc(_: ui.Button_state) {
		w.Text({config = {id = "save_label", text = "Button"}})
	},
})`

@(private)
BUTTON_DOCS_PRIMITIVE :: `w.Button({
	config = {
		id = "raw_button",
		padding = set.Padding(o.Pd_pos{x = 12, y = 6}),
		border = set.Border(1),
		background = set.Colors(o.Color.PRIMARY),
	},
	on_click = proc(_: w.Button_Event) { /* ... */ },
	child = proc(_: w.Button_State) {
		w.Text({config = {id = "raw_button_label", text = "Primitive"}})
	},
})`

@(private)
BUTTON_DOCS_PROPS := [?]Doc_Prop_Row {
	{"variant", "Button_Variant", ".DEFAULT"},
	{"size", "Button_Size", ".DEFAULT"},
	{"child", "proc(Button_state)", "nil"},
	{"on_click", "proc(Button_Event)", "nil"},
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
BUTTON_DOCS_CONFIG := [?]Doc_Prop_Row {
	{"id", "string", `""`},
	{"disabled", "Cfg(Style_Bool)", "unset"},
	{"tabbable", "Cfg(Style_Bool)", "true (ui.Button)"},
	{"auto_focus", "Cfg(Style_Bool)", "unset"},
	{"padding", "Cfg(Padding)", "from variant / size"},
	{"radius", "Cfg(Radius)", "8 (0 for LINK)"},
	{"border", "Cfg(Border)", "focus ring overlay"},
	{"border_color", "Cfg(Colors)", "transparent / focus RING"},
	{"background", "Cfg(Colors)", "from variant"},
	{"color", "Cfg(Colors)", "unset (child Text)"},
	{"font", "Cfg(Style_Font)", "theme.font_heading"},
	{"font_size", "Cfg(Style_F32)", "from size"},
	{"font_weight", "Cfg(Font_Weight)", "unset"},
	{"font_style", "Cfg(Font_Style)", "unset"},
	{"width", "Width", ".AUTO"},
	{"height", "Height", "unset"},
	{"min_w", "Cfg(Style_F32)", "unset"},
	{"min_h", "Cfg(Style_F32)", "unset"},
	{"max_w", "Cfg(Style_F32)", "unset"},
	{"max_h", "Cfg(Style_F32)", "unset"},
	{"justify", "Cfg(Justify)", "CENTER / CENTER"},
	{"direction", "Cfg(Widget_Direction)", "unset"},
	{"gap_x", "Cfg(Gap_X)", "unset"},
	{"gap_y", "Cfg(Gap_Y)", "unset"},
	{"opacity", "Cfg(Style_F32)", "unset"},
	{"overflow_x", "Cfg(Overflow)", "unset"},
	{"overflow_y", "Cfg(Overflow)", "unset"},
	{"pointer_events", "Cfg(Pointer_Events)", "unset"},
	{"visibility", "Cfg(Visibility)", "unset"},
	{"position", "Cfg(Position)", "unset"},
	{"x", "Cfg(Style_F32)", "unset"},
	{"y", "Cfg(Style_F32)", "unset"},
	{"right", "Cfg(Style_F32)", "unset"},
	{"bottom", "Cfg(Style_F32)", "unset"},
	{"z_index", "Cfg(Style_F32)", "unset"},
	{"flex", "Cfg(Style_F32)", "unset"},
	{"self", "Cfg(Justify)", "unset"},
	{"space", "Cfg(Style_Space)", "unset"},
}

@(private)
BUTTON_DOCS_PRIMITIVE_PROPS := [?]Doc_Prop_Row {
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
button_docs_on_click :: proc(_: ui.Button_Event) {
	button_docs_clicks += 1
}

@(private)
button_docs_hero :: proc(_: w.Rectangle_State) {
	doc_ui_button("button_docs_hero", "Button")
}

@(private)
button_docs_sizes :: proc(_: w.Rectangle_State) {
	doc_ui_button("button_docs_size_sm", "Small", .OUTLINE, .SMALL)
	doc_ui_button("button_docs_size_default", "Default", .OUTLINE, .DEFAULT)
	doc_ui_button("button_docs_size_lg", "Large", .OUTLINE, .LARGE)
	doc_ui_button("button_docs_size_icon", "⌘", .OUTLINE, .ICON)
}

@(private)
button_docs_default_preview :: proc(_: w.Rectangle_State) {
	doc_ui_button("button_docs_default", "Button")
}

@(private)
button_docs_outline_preview :: proc(_: w.Rectangle_State) {
	doc_ui_button("button_docs_outline", "Outline", .OUTLINE)
}

@(private)
button_docs_secondary_preview :: proc(_: w.Rectangle_State) {
	doc_ui_button("button_docs_secondary", "Secondary", .SECONDARY)
}

@(private)
button_docs_ghost_preview :: proc(_: w.Rectangle_State) {
	doc_ui_button("button_docs_ghost", "Ghost", .GHOST)
}

@(private)
button_docs_destructive_preview :: proc(_: w.Rectangle_State) {
	doc_ui_button("button_docs_destructive", "Destructive", .DESTRUCTIVE)
}

@(private)
button_docs_link_preview :: proc(_: w.Rectangle_State) {
	doc_ui_button("button_docs_link", "Link", .LINK)
}

@(private)
button_docs_active_preview :: proc(_: w.Rectangle_State) {
	doc_ui_button("button_docs_active", "Active", .ACTIVE)
}

@(private)
button_docs_icon_preview :: proc(_: w.Rectangle_State) {
	doc_ui_button("button_docs_icon_only", "↑", .DEFAULT, .ICON)
	doc_ui_button("button_docs_icon_outline", "⌘", .OUTLINE, .ICON)
	doc_ui_button("button_docs_icon_ghost", "✦", .GHOST, .ICON)
}

@(private)
button_docs_with_icon_preview :: proc(_: w.Rectangle_State) {
	ui.Button({
		id = "button_docs_with_icon",
		variant = .DEFAULT,
		child = proc(_: ui.Button_state) {
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
button_docs_rounded_preview :: proc(_: w.Rectangle_State) {
	ui.Button({
		id = "button_docs_rounded",
		variant = .DEFAULT,
		radius = set.Radius(999),
		child = proc(_: ui.Button_state) {
			w.Text(
				{
					config = {
						id = "button_docs_rounded_label",
						text = "Get Started",
						font_size = set.F32(14),
						tabbable = set.Tabbable(false),
					},
				},
			)
		},
	})
}

@(private)
button_docs_disabled_preview :: proc(_: w.Rectangle_State) {
	doc_ui_button("button_docs_disabled", "Disabled", .DEFAULT, .DEFAULT, true)
	doc_ui_button("button_docs_disabled_outline", "Disabled", .OUTLINE, .DEFAULT, true)
}

@(private)
button_docs_events_preview :: proc(_: w.Rectangle_State) {
	doc_ui_button(
		"button_docs_click",
		fmt.tprintf("Clicked %d", button_docs_clicks),
		.DEFAULT,
		.DEFAULT,
		false,
		button_docs_on_click,
	)
}

@(private)
button_docs_primitive_preview :: proc(_: w.Rectangle_State) {
	w.Button({
		config = {
			id = "button_docs_primitive",
			padding = set.Padding(o.Pd_pos{x = 12, y = 6}),
			border = set.Border(1),
			border_color = set.Border_color(o.Color.BORDER),
			background = set.Colors(o.Color.PRIMARY),
			radius = set.Radius(8),
			justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
		},
		child = proc(_: w.Button_State) {
			w.Text(
				{
					config = {
						id = "button_docs_primitive_label",
						text = "w.Button",
						font_size = set.F32(14),
						color = set.Colors(o.Color.PRIMARY_FOREGROUND),
						tabbable = set.Tabbable(false),
					},
				},
			)
		},
	})
}

@(private)
button_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("button_docs_title", "Button")
	doc_lede("button_docs_lede", "Displays a button or a component that looks like a button.")

	doc_preview("button_docs_hero_preview", button_docs_hero)

	doc_section(
		"button_docs_installation",
		"Installation",
		"ui.Button lives in the app theme layer. The engine primitive is w.Button from oni/widgets.",
		proc(_: w.Rectangle_State) {
			doc_code("button_docs_installation_code", BUTTON_DOCS_USAGE_IMPORT)
			doc_p(
				"button_docs_installation_note",
				"Prefer ui.Button for variants and sizes. Drop to w.Button when you need fully custom chrome.",
			)
		},
	)

	doc_section(
		"button_docs_usage",
		"Usage",
		"Pass a stable id, optional variant / size, and a child proc that builds the label (usually w.Text).",
		proc(_: w.Rectangle_State) {
			doc_code("button_docs_usage_import", BUTTON_DOCS_USAGE_IMPORT)
			doc_code("button_docs_usage_call", BUTTON_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"button_docs_size",
		"Size",
		"Use the size prop to change padding and font size. ICON is a square control for a single glyph.",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_size_preview", button_docs_sizes)
			doc_code(
				"button_docs_size_code",
				`ui.Button({id = "sm", size = .SMALL, variant = .OUTLINE, child = ...})
ui.Button({id = "md", size = .DEFAULT, variant = .OUTLINE, child = ...})
ui.Button({id = "lg", size = .LARGE, variant = .OUTLINE, child = ...})
ui.Button({id = "icon", size = .ICON, variant = .OUTLINE, child = ...})`,
			)
		},
	)

	doc_section(
		"button_docs_default_sec",
		"Default",
		"Primary action. Uses theme PRIMARY colors for background and hover / pressed states.",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_default_preview", button_docs_default_preview)
			doc_code(
				"button_docs_default_code",
				`ui.Button({id = "default", variant = .DEFAULT, child = ...})`,
			)
		},
	)

	doc_section(
		"button_docs_outline_sec",
		"Outline",
		"Transparent fill with a border. Pass border / border_color when you want a visible outline stroke.",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_outline_preview", button_docs_outline_preview)
			doc_code(
				"button_docs_outline_code",
				`ui.Button({
	id = "outline",
	variant = .OUTLINE,
	border = set.Border(1),
	border_color = set.Border_color(o.Color.BORDER),
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"button_docs_secondary_sec",
		"Secondary",
		"Neutral filled button for less emphasis than Default.",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_secondary_preview", button_docs_secondary_preview)
			doc_code(
				"button_docs_secondary_code",
				`ui.Button({id = "secondary", variant = .SECONDARY, child = ...})`,
			)
		},
	)

	doc_section(
		"button_docs_ghost_sec",
		"Ghost",
		"No fill until hover. Used heavily for sidebar and nav chrome.",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_ghost_preview", button_docs_ghost_preview)
			doc_code(
				"button_docs_ghost_code",
				`ui.Button({id = "ghost", variant = .GHOST, child = ...})`,
			)
		},
	)

	doc_section(
		"button_docs_destructive_sec",
		"Destructive",
		"High-risk actions such as delete or discard.",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_destructive_preview", button_docs_destructive_preview)
			doc_code(
				"button_docs_destructive_code",
				`ui.Button({id = "destructive", variant = .DESTRUCTIVE, child = ...})`,
			)
		},
	)

	doc_section(
		"button_docs_link_sec",
		"Link",
		"Looks like inline text; reduced padding and no radius. Prefer w.Link when the control should navigate.",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_link_preview", button_docs_link_preview)
			doc_code(
				"button_docs_link_code",
				`ui.Button({id = "link", variant = .LINK, child = ...})`,
			)
		},
	)

	doc_section(
		"button_docs_active_sec",
		"Active",
		"Accent-colored selected state for toggle-like chrome (for example a selected nav item).",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_active_preview", button_docs_active_preview)
			doc_code(
				"button_docs_active_code",
				`ui.Button({id = "active", variant = .ACTIVE, child = ...})`,
			)
		},
	)

	doc_section(
		"button_docs_icon_sec",
		"Icon",
		"Use size = .ICON for a square glyph button. Keep the child to a single character or symbol.",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_icon_preview", button_docs_icon_preview)
			doc_code(
				"button_docs_icon_code",
				`ui.Button({
	id = "icon",
	size = .ICON,
	variant = .OUTLINE,
	child = proc(_: ui.Button_state) {
		w.Text({config = {id = "icon_label", text = "⌘", font_size = set.F32(14)}})
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
				`ui.Button({
	id = "with_icon",
	child = proc(_: ui.Button_state) {
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
		"button_docs_rounded_sec",
		"Rounded",
		"Override radius on the embedded Button_Config. Large values read as pill-shaped.",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_rounded_preview", button_docs_rounded_preview)
			doc_code(
				"button_docs_rounded_code",
				`ui.Button({
	id = "rounded",
	variant = .DEFAULT,
	radius = set.Radius(999),
	child = ...,
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
				`ui.Button({
	id = "disabled",
	disabled = set.Bool(true),
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
				`ui.Button({
	id = "save",
	on_click = proc(_: ui.Button_Event) {
		// handle activation
	},
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"button_docs_primitive_sec",
		"Primitive",
		"w.Button is the engine widget: layout chrome, focus, and input with no opinionated variant system. Style it with set.* helpers on Button_Config.",
		proc(_: w.Rectangle_State) {
			doc_preview("button_docs_primitive_preview", button_docs_primitive_preview)
			doc_code("button_docs_primitive_code", BUTTON_DOCS_PRIMITIVE)
		},
	)

	doc_section(
		"button_docs_api",
		"API Reference",
		"ui.Button wraps w.Button and adds variant / size styling. Config fields are embedded via using Button_Config, so id, padding, radius, and other style keys are set at the top level of ui.Button({ ... }).",
		proc(_: w.Rectangle_State) {
			doc_h3("button_docs_api_props_h3", "Props")
			doc_muted(
				"button_docs_api_props_note",
				"ui.Button_props in app/ui/button.odin. Button_Variant: DEFAULT | SECONDARY | OUTLINE | GHOST | DESTRUCTIVE | LINK | ACTIVE. Button_Size: DEFAULT | SMALL | LARGE | ICON.",
			)
			doc_table("button_docs_props_table", BUTTON_DOCS_PROPS[:])

			doc_h3("button_docs_api_config_h3", "Config")
			doc_p(
				"button_docs_api_config_note",
				"Button_Config is Widget_Config. Style overrides use set.* helpers (set.Padding, set.Radius, set.Border, set.Colors, …). Values below are ui.Button defaults after variant / size merge; unset means the field is left for theme / engine resolution.",
			)
			doc_table("button_docs_config_table", BUTTON_DOCS_CONFIG[:])

			doc_h3("button_docs_api_primitive_h3", "w.Button Props")
			doc_p(
				"button_docs_api_primitive_note",
				"Engine primitive in oni/widgets/button.odin. Prefer ui.Button unless you need mount lifecycle or fully custom styling.",
			)
			doc_table("button_docs_primitive_props_table", BUTTON_DOCS_PRIMITIVE_PROPS[:])
		},
	)
}

Widget_Button :: proc() {
	doc_page("button_docs", button_docs_body)
}
