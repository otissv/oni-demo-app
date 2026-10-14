package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"

@(private)
tabs_demo_value: string = "account"

@(private)
tabs_demo_line: string = "overview"

@(private)
tabs_demo_vertical: string = "general"

@(private)
tabs_demo_disabled: string = "active"

@(private)
TABS_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
TABS_DOCS_USAGE_CALL :: `w.Tabs({
	config = {id = "settings"},
	value = tab,
	on_value_change = proc(value: string) { tab = value },
	child = proc(_: w.Tabs_State) {
		w.Tabs_List({
			config = {id = "settings_list"},
			child = proc(_: w.Tabs_List_State) {
				w.Tabs_Trigger({config = {id = "tab_account"}, value = "account", child = ...})
				w.Tabs_Trigger({config = {id = "tab_password"}, value = "password", child = ...})
			},
		})
		w.Tabs_Content({config = {id = "panel_account"}, value = "account", child = ...})
		w.Tabs_Content({config = {id = "panel_password"}, value = "password", child = ...})
	},
})`

@(private)
TABS_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Tabs_Config (= Widget_Config)", "{}"},
	{"value", "string", `""`},
	{"disabled", "bool", "false"},
	{"on_value_change", "proc(value: string)", "nil"},
	{"loop", "Tabs_Loop", ".ON"},
	{"orientation", "Tabs_Orientation", ".HORIZONTAL"},
	{"child", "proc(Tabs_State)", "nil"},
	{"on_mount", "proc(Tabs_State) -> Mount", "nil"},
	{"on_unmount", "proc(Tabs_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"on_focus", "proc(Tabs_Event)", "nil"},
	{"on_blur", "proc(Tabs_Event)", "nil"},
	{"on_mouse_enter", "proc(Tabs_Event)", "nil"},
	{"on_mouse_leave", "proc(Tabs_Event)", "nil"},
	{"on_mouse_pressed", "proc(Tabs_Event)", "nil"},
	{"on_mouse_down", "proc(Tabs_Event)", "nil"},
	{"on_mouse_released", "proc(Tabs_Event)", "nil"},
	{"on_mouse_move", "proc(Tabs_Event)", "nil"},
	{"on_click", "proc(Tabs_Event)", "nil"},
	{"on_contextmenu", "proc(Tabs_Event)", "nil"},
	{"on_key_pressed", "proc(Tabs_Event)", "nil"},
	{"on_key_down", "proc(Tabs_Event)", "nil"},
	{"on_key_released", "proc(Tabs_Event)", "nil"},
}

@(private)
TABS_LIST_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Tabs_List_Config (= Widget_Config)", "{}"},
	{"activate_on_focus", "bool", "false"},
	{"variant", "Tabs_List_Variant", ".DEFAULT"},
	{"child", "proc(Tabs_List_State)", "nil"},
	{"on_mount", "proc(Tabs_List_State) -> Mount", "nil"},
	{"on_unmount", "proc(Tabs_List_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"on_focus", "proc(Tabs_List_Event)", "nil"},
	{"on_blur", "proc(Tabs_List_Event)", "nil"},
	{"on_mouse_enter", "proc(Tabs_List_Event)", "nil"},
	{"on_mouse_leave", "proc(Tabs_List_Event)", "nil"},
	{"on_mouse_pressed", "proc(Tabs_List_Event)", "nil"},
	{"on_mouse_down", "proc(Tabs_List_Event)", "nil"},
	{"on_mouse_released", "proc(Tabs_List_Event)", "nil"},
	{"on_mouse_move", "proc(Tabs_List_Event)", "nil"},
	{"on_click", "proc(Tabs_List_Event)", "nil"},
	{"on_contextmenu", "proc(Tabs_List_Event)", "nil"},
	{"on_key_pressed", "proc(Tabs_List_Event)", "nil"},
	{"on_key_down", "proc(Tabs_List_Event)", "nil"},
	{"on_key_released", "proc(Tabs_List_Event)", "nil"},
}

@(private)
TABS_TRIGGER_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Tabs_Trigger_Config (= Widget_Config)", "{}"},
	{"value", "string", `""`},
	{"disabled", "bool", "false"},
	{"child", "proc(Tabs_Trigger_State)", "nil"},
	{"on_mount", "proc(Tabs_Trigger_State) -> Mount", "nil"},
	{"on_unmount", "proc(Tabs_Trigger_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"on_focus", "proc(Tabs_Trigger_Event)", "nil"},
	{"on_blur", "proc(Tabs_Trigger_Event)", "nil"},
	{"on_mouse_enter", "proc(Tabs_Trigger_Event)", "nil"},
	{"on_mouse_leave", "proc(Tabs_Trigger_Event)", "nil"},
	{"on_mouse_pressed", "proc(Tabs_Trigger_Event)", "nil"},
	{"on_mouse_down", "proc(Tabs_Trigger_Event)", "nil"},
	{"on_mouse_released", "proc(Tabs_Trigger_Event)", "nil"},
	{"on_mouse_move", "proc(Tabs_Trigger_Event)", "nil"},
	{"on_click", "proc(Tabs_Trigger_Event)", "nil"},
	{"on_contextmenu", "proc(Tabs_Trigger_Event)", "nil"},
	{"on_key_pressed", "proc(Tabs_Trigger_Event)", "nil"},
	{"on_key_down", "proc(Tabs_Trigger_Event)", "nil"},
	{"on_key_released", "proc(Tabs_Trigger_Event)", "nil"},
}

@(private)
TABS_CONTENT_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Tabs_Content_Config (= Widget_Config)", "{}"},
	{"value", "string", `""`},
	{"force_mount", "bool", "false"},
	{"child", "proc(Tabs_Content_State)", "nil"},
	{"on_mount", "proc(Tabs_Content_State) -> Mount", "nil"},
	{"on_unmount", "proc(Tabs_Content_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"on_focus", "proc(Tabs_Content_Event)", "nil"},
	{"on_blur", "proc(Tabs_Content_Event)", "nil"},
	{"on_mouse_enter", "proc(Tabs_Content_Event)", "nil"},
	{"on_mouse_leave", "proc(Tabs_Content_Event)", "nil"},
	{"on_mouse_pressed", "proc(Tabs_Content_Event)", "nil"},
	{"on_mouse_down", "proc(Tabs_Content_Event)", "nil"},
	{"on_mouse_released", "proc(Tabs_Content_Event)", "nil"},
	{"on_mouse_move", "proc(Tabs_Content_Event)", "nil"},
	{"on_click", "proc(Tabs_Content_Event)", "nil"},
	{"on_contextmenu", "proc(Tabs_Content_Event)", "nil"},
	{"on_key_pressed", "proc(Tabs_Content_Event)", "nil"},
	{"on_key_down", "proc(Tabs_Content_Event)", "nil"},
	{"on_key_released", "proc(Tabs_Content_Event)", "nil"},
}

@(private)
tabs_demo_label :: proc(for_id, id, text: string) {
	w.Text({config = {for_id = for_id, id = id, text = text, font_size = set.F32(14)}})
}

@(private)
tabs_demo_panel_text :: proc(id, text: string) {
	w.Text(
		{
			config = {
				id = id,
				text = text,
				font_size = set.F32(14),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
tabs_docs_hero_list :: proc(_: w.Tabs_List_State) {
	w.Tabs_Trigger({
		config = {id = "tabs_docs_hero_account"},
		value = "account",
		child = proc(_: w.Tabs_Trigger_State) {
			tabs_demo_label("tabs_docs_hero_account", "tabs_docs_hero_account_text", "Account")
		},
	})
	w.Tabs_Trigger({
		config = {id = "tabs_docs_hero_password"},
		value = "password",
		child = proc(_: w.Tabs_Trigger_State) {
			tabs_demo_label("tabs_docs_hero_password", "tabs_docs_hero_password_text", "Password")
		},
	})
}

@(private)
tabs_docs_hero_child :: proc(_: w.Tabs_State) {
	w.Tabs_List({config = {id = "tabs_docs_hero_list"}, child = tabs_docs_hero_list})
	w.Tabs_Content({
		config = {
			id = "tabs_docs_hero_account_panel",
			background = set.Colors(.SECONDARY),
			border = set.Border(o.Bd{t = 1}),
			border_color = set.Border_color(.BACKGROUND),
			width = set.Width(.GROW),
			padding = set.Padding(f32(10)),
		},
		value = "account",
		child = proc(_: w.Tabs_Content_State) {
			tabs_demo_panel_text(
				"tabs_docs_hero_account_body",
				"Make changes to your account here.",
			)
		},
	})
	w.Tabs_Content({
		config = {
			id = "tabs_docs_hero_password_panel",
			background = set.Colors(.SECONDARY),
			border = set.Border(o.Bd{t = 1}),
			border_color = set.Border_color(.BACKGROUND),
			padding = set.Padding(f32(10)),
			width = set.Width(.GROW),
		},
		value = "password",
		child = proc(_: w.Tabs_Content_State) {
			tabs_demo_panel_text("tabs_docs_hero_password_body", "Change your password here.")
		},
	})
}

@(private)
tabs_docs_hero :: proc(_: w.Rectangle_State) {
	w.Tabs({
		config = {id = "tabs_docs_hero"},
		value = tabs_demo_value,
		on_value_change = proc(value: string) {
			tabs_demo_value = value
		},
		child = tabs_docs_hero_child,
	})
}

@(private)
tabs_docs_line_list :: proc(_: w.Tabs_List_State) {
	w.Tabs_Trigger({
		config = {id = "tabs_docs_line_overview"},
		value = "overview",
		child = proc(_: w.Tabs_Trigger_State) {
			tabs_demo_label("tabs_docs_line_overview", "tabs_docs_line_overview_text", "Overview")
		},
	})
	w.Tabs_Trigger({
		config = {id = "tabs_docs_line_analytics"},
		value = "analytics",
		child = proc(_: w.Tabs_Trigger_State) {
			tabs_demo_label(
				"tabs_docs_line_analytics",
				"tabs_docs_line_analytics_text",
				"Analytics",
			)
		},
	})
	w.Tabs_Trigger({
		config = {id = "tabs_docs_line_reports"},
		value = "reports",
		child = proc(_: w.Tabs_Trigger_State) {
			tabs_demo_label("tabs_docs_line_reports", "tabs_docs_line_reports_text", "Reports")
		},
	})
}

@(private)
tabs_docs_line_preview :: proc(_: w.Rectangle_State) {
	w.Tabs({
		config = {id = "tabs_docs_line", width = set.Width(f32(420))},
		value = tabs_demo_line,
		on_value_change = proc(value: string) {
			tabs_demo_line = value
		},
		child = proc(_: w.Tabs_State) {
			w.Tabs_List(
				{
					config = {id = "tabs_docs_line_list"},
					variant = .LINE,
					activate_on_focus = true,
					child = tabs_docs_line_list,
				},
			)
			w.Tabs_Content({
				config = {
					id = "tabs_docs_line_overview_panel",
					background = set.Colors(.SECONDARY),
					padding = set.Padding(f32(10)),
				},
				value = "overview",
				child = proc(_: w.Tabs_Content_State) {
					tabs_demo_panel_text(
						"tabs_docs_line_overview_body",
						"Workspace stats and activity.",
					)
				},
			})
			w.Tabs_Content({
				config = {
					id = "tabs_docs_line_analytics_panel",
					background = set.Colors(.SECONDARY),
					padding = set.Padding(f32(10)),
				},
				value = "analytics",
				child = proc(_: w.Tabs_Content_State) {
					tabs_demo_panel_text(
						"tabs_docs_line_analytics_body",
						"Traffic and conversion metrics.",
					)
				},
			})
			w.Tabs_Content({
				config = {
					id = "tabs_docs_line_reports_panel",
					background = set.Colors(.SECONDARY),
					padding = set.Padding(f32(10)),
				},
				value = "reports",
				child = proc(_: w.Tabs_Content_State) {
					tabs_demo_panel_text(
						"tabs_docs_line_reports_body",
						"Exportable weekly reports.",
					)
				},
			})
		},
	})
}

@(private)
tabs_docs_vertical_list :: proc(_: w.Tabs_List_State) {
	w.Tabs_Trigger({
		config = {id = "tabs_docs_vertical_general"},
		value = "general",
		child = proc(_: w.Tabs_Trigger_State) {
			tabs_demo_label(
				"tabs_docs_vertical_general",
				"tabs_docs_vertical_general_text",
				"General",
			)
		},
	})
	w.Tabs_Trigger({
		config = {id = "tabs_docs_vertical_security"},
		value = "security",
		child = proc(_: w.Tabs_Trigger_State) {
			tabs_demo_label(
				"tabs_docs_vertical_security",
				"tabs_docs_vertical_security_text",
				"Security",
			)
		},
	})
}

@(private)
tabs_docs_vertical_preview :: proc(_: w.Rectangle_State) {
	w.Tabs({
		config = {
			id = "tabs_docs_vertical",
			width = set.Width(f32(420)),
			gap_x = set.Gap_X(u16(1)),
		},
		value = tabs_demo_vertical,
		orientation = .VERTICAL,
		on_value_change = proc(value: string) {
			tabs_demo_vertical = value
		},
		child = proc(_: w.Tabs_State) {
			w.Tabs_List(
				{config = {id = "tabs_docs_vertical_list"}, child = tabs_docs_vertical_list},
			)
			w.Tabs_Content({
				config = {
					id = "tabs_docs_vertical_general_panel",
					flex = set.F32(1),
					background = set.Colors(.SECONDARY),
					padding = set.Padding(f32(10)),
				},
				value = "general",
				child = proc(_: w.Tabs_Content_State) {
					tabs_demo_panel_text(
						"tabs_docs_vertical_general_body",
						"Profile and preferences.",
					)
				},
			})
			w.Tabs_Content({
				config = {
					id = "tabs_docs_vertical_security_panel",
					flex = set.F32(1),
					background = set.Colors(.SECONDARY),
					padding = set.Padding(f32(10)),
				},
				value = "security",
				child = proc(_: w.Tabs_Content_State) {
					tabs_demo_panel_text(
						"tabs_docs_vertical_security_body",
						"Sessions and two-factor auth.",
					)
				},
			})
		},
	})
}

@(private)
tabs_docs_disabled_list :: proc(_: w.Tabs_List_State) {
	w.Tabs_Trigger({
		config = {id = "tabs_docs_disabled_active"},
		value = "active",
		child = proc(_: w.Tabs_Trigger_State) {
			tabs_demo_label(
				"tabs_docs_disabled_active",
				"tabs_docs_disabled_active_text",
				"Active",
			)
		},
	})
	w.Tabs_Trigger({
		config = {id = "tabs_docs_disabled_locked"},
		value = "locked",
		disabled = true,
		child = proc(_: w.Tabs_Trigger_State) {
			tabs_demo_label(
				"tabs_docs_disabled_locked",
				"tabs_docs_disabled_locked_text",
				"Locked",
			)
		},
	})
	w.Tabs_Trigger({
		config = {id = "tabs_docs_disabled_archive"},
		value = "archive",
		child = proc(_: w.Tabs_Trigger_State) {
			tabs_demo_label(
				"tabs_docs_disabled_archive",
				"tabs_docs_disabled_archive_text",
				"Archive",
			)
		},
	})
}

@(private)
tabs_docs_disabled_preview :: proc(_: w.Rectangle_State) {
	w.Tabs({
		config = {
			id = "tabs_docs_disabled",
			width = set.Width(f32(420)),
			gap_y = set.Gap_Y(u16(1)),
			disabled = set.Disabled(true),
		},
		value = tabs_demo_disabled,
		on_value_change = proc(value: string) {
			tabs_demo_disabled = value
		},
		child = proc(_: w.Tabs_State) {
			w.Tabs_List(
				{config = {id = "tabs_docs_disabled_list"}, child = tabs_docs_disabled_list},
			)
			w.Tabs_Content({
				config = {
					id = "tabs_docs_disabled_active_panel",
					background = set.Colors(.SECONDARY),
					padding = set.Padding(f32(10)),
				},
				value = "active",
				child = proc(_: w.Tabs_Content_State) {
					tabs_demo_panel_text("tabs_docs_disabled_active_body", "Enabled tab content.")
				},
			})
			w.Tabs_Content({
				config = {
					id = "tabs_docs_disabled_locked_panel",
					background = set.Colors(.SECONDARY),
					padding = set.Padding(f32(10)),
				},
				value = "locked",
				child = proc(_: w.Tabs_Content_State) {
					tabs_demo_panel_text(
						"tabs_docs_disabled_locked_body",
						"This panel stays unreachable while Locked is disabled.",
					)
				},
			})
			w.Tabs_Content({
				config = {
					id = "tabs_docs_disabled_archive_panel",
					background = set.Colors(.SECONDARY),
					padding = set.Padding(f32(10)),
				},
				value = "archive",
				child = proc(_: w.Tabs_Content_State) {
					tabs_demo_panel_text("tabs_docs_disabled_archive_body", "Archived items.")
				},
			})
		},
	})
}

@(private)
tabs_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("tabs_docs_title", "Tabs")
	doc_lede(
		"tabs_docs_lede",
		"Composable layered panels: Tabs + Tabs_List + Tabs_Trigger + Tabs_Content with caller-owned value and roving focus.",
	)

	doc_preview("tabs_docs_hero_preview", tabs_docs_hero)

	doc_section(
		"tabs_docs_installation",
		"Installation",
		"Use w.Tabs as the root with w.Tabs_List, w.Tabs_Trigger, and w.Tabs_Content in oni/widgets.",
		proc(_: w.Rectangle_State) {
			doc_code("tabs_docs_installation_code", TABS_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"tabs_docs_usage",
		"Usage",
		"value is caller-owned. Pass it every frame and update from on_value_change. Each trigger and content panel shares a unique value string.",
		proc(_: w.Rectangle_State) {
			doc_code("tabs_docs_usage_call", TABS_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"tabs_docs_line",
		"Line",
		"variant = .LINE on Tabs_List draws an underline style. activate_on_focus selects as arrow keys move.",
		proc(_: w.Rectangle_State) {
			doc_preview("tabs_docs_line_preview_wrap", tabs_docs_line_preview)
			doc_code(
				"tabs_docs_line_code",
				`w.Tabs_List({
	config = {id = "list"},
	variant = .LINE,
	activate_on_focus = true,
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"tabs_docs_vertical",
		"Vertical",
		"orientation = .VERTICAL lays the list in a column beside panels and maps Up/Down.",
		proc(_: w.Rectangle_State) {
			doc_preview("tabs_docs_vertical_preview_wrap", tabs_docs_vertical_preview)
			doc_code(
				"tabs_docs_vertical_code",
				`w.Tabs({
	config = {id = "prefs"},
	value = tab,
	orientation = .VERTICAL,
	on_value_change = proc(value: string) { tab = value },
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"tabs_docs_disabled",
		"Disabled",
		"disabled on a Tabs_Trigger skips it in keyboard navigation. disabled on Tabs dims the whole root.",
		proc(_: w.Rectangle_State) {
			doc_preview("tabs_docs_disabled_preview_wrap", tabs_docs_disabled_preview)
			doc_code(
				"tabs_docs_disabled_code",
				`w.Tabs_Trigger({
	config = {id = "locked"},
	value = "locked",
	disabled = true,
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"tabs_docs_api",
		"API Reference",
		"w.Tabs, w.Tabs_List, w.Tabs_Trigger, and w.Tabs_Content in oni/widgets/tabs*.odin.",
		proc(_: w.Rectangle_State) {
			doc_h3("tabs_docs_api_root_props_h3", "Tabs props")
			doc_muted(
				"tabs_docs_api_root_note",
				"Tabs_Loop: ON | OFF. Tabs_Orientation: HORIZONTAL | VERTICAL. Empty value means no active panel.",
			)
			doc_table("tabs_docs_root_props_table", TABS_DOCS_PROPS[:])

			doc_h3("tabs_docs_api_list_props_h3", "Tabs_List props")
			doc_muted(
				"tabs_docs_api_list_note",
				"Tabs_List_Variant: DEFAULT | LINE. activate_on_focus defaults false (Space/Enter activate).",
			)
			doc_table("tabs_docs_list_props_table", TABS_LIST_DOCS_PROPS[:])

			doc_h3("tabs_docs_api_trigger_props_h3", "Tabs_Trigger props")
			doc_muted(
				"tabs_docs_api_trigger_note",
				"Trigger is inert outside Tabs. value must be unique inside the root.",
			)
			doc_table("tabs_docs_trigger_props_table", TABS_TRIGGER_DOCS_PROPS[:])

			doc_h3("tabs_docs_api_content_props_h3", "Tabs_Content props")
			doc_muted(
				"tabs_docs_api_content_note",
				"Inactive panels use visibility NONE unless force_mount keeps them HIDDEN in the tree.",
			)
			doc_table("tabs_docs_content_props_table", TABS_CONTENT_DOCS_PROPS[:])

			doc_h3("tabs_docs_api_config_h3", "Config")
			doc_table("tabs_docs_config_table", DOC_WIDGET_CONFIG[:])
		},
	)
}

Widget_Tabs :: proc() {
	doc_page("tabs_docs", tabs_docs_body)
}
