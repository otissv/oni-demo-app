package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"

@(private)
checkbox_demo_remember: w.Checkbox_Value = .FALSE

@(private)
checkbox_demo_terms: w.Checkbox_Value = .FALSE

@(private)
checkbox_demo_partial: w.Checkbox_Value = .INDETERMINATE

@(private)
checkbox_demo_disabled: w.Checkbox_Value = .TRUE

@(private)
CHECKBOX_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
CHECKBOX_DOCS_USAGE_CALL :: `w.Checkbox({
	config = {id = "remember"},
	checked = remember,
	on_checked_change = proc(checked: w.Checkbox_Value) {
		remember = checked
	},
})`

@(private)
CHECKBOX_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Checkbox_Config (= Widget_Config)", "{}"},
	{"checked", "Checkbox_Value", ".FALSE"},
	{"disabled", "bool", "false"},
	{"child", "proc(Checkbox_State)", "nil"},
	{"on_checked_change", "proc(checked: Checkbox_Value)", "nil"},
	{"on_mount", "proc(Checkbox_State) -> Mount", "nil"},
	{"on_unmount", "proc(Checkbox_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"on_focus", "proc(Checkbox_Event)", "nil"},
	{"on_blur", "proc(Checkbox_Event)", "nil"},
	{"on_mouse_enter", "proc(Checkbox_Event)", "nil"},
	{"on_mouse_leave", "proc(Checkbox_Event)", "nil"},
	{"on_mouse_pressed", "proc(Checkbox_Event)", "nil"},
	{"on_mouse_down", "proc(Checkbox_Event)", "nil"},
	{"on_mouse_released", "proc(Checkbox_Event)", "nil"},
	{"on_mouse_move", "proc(Checkbox_Event)", "nil"},
	{"on_click", "proc(Checkbox_Event)", "nil"},
	{"on_contextmenu", "proc(Checkbox_Event)", "nil"},
	{"on_key_pressed", "proc(Checkbox_Event)", "nil"},
	{"on_key_down", "proc(Checkbox_Event)", "nil"},
	{"on_key_released", "proc(Checkbox_Event)", "nil"},
}

@(private)
CHECKBOX_DOCS_CONFIG := [?]Doc_Prop_Row {
	{"id", "string", `""`},
	{"width", "Width", "16"},
	{"height", "Height", "16"},
	{"padding", "Cfg(Padding)", "unset"},
	{"radius", "Cfg(Radius)", "4"},
	{"border", "Cfg(Border)", "1"},
	{"border_color", "Cfg(Colors)", "BORDER / PRIMARY / RING"},
	{"background", "Cfg(Colors)", "BACKGROUND / PRIMARY"},
	{"color", "Cfg(Colors)", "PRIMARY_FOREGROUND"},
	{"opacity", "Cfg(Style_F32)", "1 (0.5 when disabled)"},
	{"tabbable", "Cfg(Style_Bool)", "true"},
	{"disabled", "Cfg(Style_Bool)", "unset (prefer props.disabled)"},
	{"justify", "Cfg(Justify)", "CENTER"},
	{"overflow_x", "Cfg(Overflow)", ".HIDDEN"},
	{"overflow_y", "Cfg(Overflow)", ".HIDDEN"},
	{"min_w", "Cfg(Style_F32)", "unset"},
	{"min_h", "Cfg(Style_F32)", "unset"},
	{"max_w", "Cfg(Style_F32)", "unset"},
	{"max_h", "Cfg(Style_F32)", "unset"},
	{"visibility", "Cfg(Visibility)", "unset"},
	{"pointer_events", "Cfg(Pointer_Events)", "unset"},
}

@(private)
checkbox_demo_value_label :: proc(value: w.Checkbox_Value) -> string {
	switch value {
	case .FALSE:
		return "false"
	case .TRUE:
		return "true"
	case .INDETERMINATE:
		return "indeterminate"
	}

	return "false"
}

@(private)
checkbox_docs_hero :: proc(_: w.Rectangle_State) {
	w.Rectangle({
		config = {
			id = "checkbox_docs_hero_row",
			direction = set.Direction(.HORIZONTAL),
			justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
			gap_x = set.Gap_X(u16(10)),
		},
		child = proc(_: w.Rectangle_State) {
			w.Checkbox({
				config = {id = "checkbox_docs_hero"},
				checked = checkbox_demo_remember,
				on_checked_change = proc(checked: w.Checkbox_Value) {
					checkbox_demo_remember = checked
				},
			})
			w.Text(
				{
					config = {
						for_id = "checkbox_docs_hero",
						id = "checkbox_docs_hero_text",
						text = "Accept terms and conditions",
						font_size = set.F32(14),
					},
				},
			)
		},
	})
}

@(private)
checkbox_docs_basic_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle({
		config = {
			id = "checkbox_docs_basic_col",
			direction = set.Direction(.VERTICAL),
			gap_y = set.Gap_Y(u16(8)),
			justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
		},
		child = proc(_: w.Rectangle_State) {
			w.Rectangle({
				config = {
					id = "checkbox_docs_basic_row",
					direction = set.Direction(.HORIZONTAL),
					justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
					gap_x = set.Gap_X(u16(10)),
				},
				child = proc(_: w.Rectangle_State) {
					w.Checkbox({
						config = {id = "checkbox_docs_remember"},
						checked = checkbox_demo_remember,
						on_checked_change = proc(checked: w.Checkbox_Value) {
							checkbox_demo_remember = checked
						},
					})
					w.Text(
						{
							config = {
								for_id = "checkbox_docs_remember",
								id = "checkbox_docs_remember_text",
								text = "Remember me",
								font_size = set.F32(14),
							},
						},
					)
				},
			})
			w.Text(
				{
					config = {
						id = "checkbox_docs_remember_status",
						text = fmt.tprintf(
							"Checked: %s",
							checkbox_demo_value_label(checkbox_demo_remember),
						),
						font_size = set.F32(13),
						color = set.Colors(o.Color.MUTED_FOREGROUND),
					},
				},
			)
		},
	})
}

@(private)
checkbox_docs_form_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle({
		config = {
			id = "checkbox_docs_form_col",
			direction = set.Direction(.VERTICAL),
			gap_y = set.Gap_Y(u16(8)),
			justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
		},
		child = proc(_: w.Rectangle_State) {
			w.Rectangle({
				config = {
					id = "checkbox_docs_terms_row",
					direction = set.Direction(.HORIZONTAL),
					justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
					gap_x = set.Gap_X(u16(10)),
				},
				child = proc(_: w.Rectangle_State) {
					w.Checkbox({
						config = {id = "checkbox_docs_terms"},
						checked = checkbox_demo_terms,
						on_checked_change = proc(checked: w.Checkbox_Value) {
							checkbox_demo_terms = checked
						},
					})
					w.Text(
						{
							config = {
								for_id = "checkbox_docs_terms",
								id = "checkbox_docs_terms_text",
								text = "Accept terms",
								font_size = set.F32(14),
							},
						},
					)
				},
			})
			w.Text(
				{
					config = {
						id = "checkbox_docs_terms_status",
						text = fmt.tprintf(
							"Checked: %s",
							checkbox_demo_value_label(checkbox_demo_terms),
						),
						font_size = set.F32(13),
						color = set.Colors(o.Color.MUTED_FOREGROUND),
					},
				},
			)
		},
	})
}

@(private)
checkbox_docs_indeterminate_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle({
		config = {
			id = "checkbox_docs_partial_col",
			direction = set.Direction(.VERTICAL),
			gap_y = set.Gap_Y(u16(8)),
			justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
		},
		child = proc(_: w.Rectangle_State) {
			w.Rectangle({
				config = {
					id = "checkbox_docs_partial_row",
					direction = set.Direction(.HORIZONTAL),
					justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
					gap_x = set.Gap_X(u16(10)),
				},
				child = proc(_: w.Rectangle_State) {
					w.Checkbox({
						config = {id = "checkbox_docs_partial"},
						checked = checkbox_demo_partial,
						on_checked_change = proc(checked: w.Checkbox_Value) {
							checkbox_demo_partial = checked
						},
					})
					w.Text(
						{
							config = {
								for_id = "checkbox_docs_partial",
								id = "checkbox_docs_partial_text",
								text = "Select all",
								font_size = set.F32(14),
							},
						},
					)
				},
			})
			w.Text(
				{
					config = {
						id = "checkbox_docs_partial_status",
						text = fmt.tprintf(
							"Checked: %s",
							checkbox_demo_value_label(checkbox_demo_partial),
						),
						font_size = set.F32(13),
						color = set.Colors(o.Color.MUTED_FOREGROUND),
					},
				},
			)
		},
	})
}

@(private)
checkbox_docs_disabled_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle({
		config = {
			id = "checkbox_docs_disabled_row",
			direction = set.Direction(.HORIZONTAL),
			justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
			gap_x = set.Gap_X(u16(10)),
		},
		child = proc(_: w.Rectangle_State) {
			w.Checkbox(
				{
					config = {id = "checkbox_docs_disabled"},
					checked = checkbox_demo_disabled,
					disabled = true,
				},
			)
			w.Text(
				{
					config = {
						id = "checkbox_docs_disabled_text",
						text = "Notifications (locked)",
						font_size = set.F32(14),
					},
				},
			)
		},
	})
}

@(private)
checkbox_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("checkbox_docs_title", "Checkbox")
	doc_lede(
		"checkbox_docs_lede",
		"A control that lets the user toggle between checked, unchecked, and indeterminate.",
	)

	doc_preview("checkbox_docs_hero_preview", checkbox_docs_hero)

	doc_section(
		"checkbox_docs_installation",
		"Installation",
		"Checkbox is an engine widget in oni/widgets. Pair it with w.Text and for_id for an accessible label.",
		proc(_: w.Rectangle_State) {
			doc_code("checkbox_docs_installation_code", CHECKBOX_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"checkbox_docs_usage",
		"Usage",
		"checked is caller-owned. Pass it every frame and update it from on_checked_change. The widget never mutates caller state.",
		proc(_: w.Rectangle_State) {
			doc_code("checkbox_docs_usage_call", CHECKBOX_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"checkbox_docs_basic",
		"Basic",
		"A labeled checkbox. Point Text_Config.for_id at the checkbox id so clicking the label toggles it.",
		proc(_: w.Rectangle_State) {
			doc_preview("checkbox_docs_basic_preview", checkbox_docs_basic_preview)
			doc_code(
				"checkbox_docs_basic_code",
				`w.Checkbox({
	config = {id = "remember"},
	checked = remember,
	on_checked_change = proc(checked: w.Checkbox_Value) {
		remember = checked
	},
})
w.Text({
	config = {
		for_id = "remember",
		id = "remember_label",
		text = "Remember me",
	},
})`,
			)
		},
	)

	doc_section(
		"checkbox_docs_form",
		"Form field",
		"Use the same pattern for consent or settings rows. Keep a stable config.id for focus and GetElementById.",
		proc(_: w.Rectangle_State) {
			doc_preview("checkbox_docs_form_preview", checkbox_docs_form_preview)
			doc_code(
				"checkbox_docs_form_code",
				`w.Checkbox({
	config = {id = "terms"},
	checked = terms,
	on_checked_change = proc(checked: w.Checkbox_Value) {
		terms = checked
	},
})`,
			)
		},
	)

	doc_section(
		"checkbox_docs_indeterminate",
		"Indeterminate",
		"Pass checked = .INDETERMINATE for a mixed state (for example Select all). Activation moves indeterminate to true",
		proc(_: w.Rectangle_State) {
			doc_preview("checkbox_docs_indeterminate_preview", checkbox_docs_indeterminate_preview)
			doc_code(
				"checkbox_docs_indeterminate_code",
				`w.Checkbox({
	config = {id = "select_all"},
	checked = .INDETERMINATE,
	on_checked_change = proc(checked: w.Checkbox_Value) {
		select_all = checked
	},
})`,
			)
		},
	)

	doc_section(
		"checkbox_docs_disabled",
		"Disabled",
		"Set disabled on the props to suppress interaction. Theme opacity drops to 0.5.",
		proc(_: w.Rectangle_State) {
			doc_preview("checkbox_docs_disabled_preview", checkbox_docs_disabled_preview)
			doc_code(
				"checkbox_docs_disabled_code",
				`w.Checkbox({
	config = {id = "locked"},
	checked = .TRUE,
	disabled = true,
})`,
			)
		},
	)

	doc_section(
		"checkbox_docs_custom",
		"Custom indicator",
		"Pass child to replace the built-in check / minus glyph. child runs only for TRUE and INDETERMINATE.",
		proc(_: w.Rectangle_State) {
			doc_code(
				"checkbox_docs_custom_code",
				`w.Checkbox({
	config = {id = "custom"},
	checked = value,
	on_checked_change = ...,
	child = proc(_: w.Checkbox_State) {
		w.Text({config = {id = "custom_mark", text = "✓", font_size = set.F32(12)}})
	},
})`,
			)
		},
	)

	doc_section(
		"checkbox_docs_api",
		"API Reference",
		"w.Checkbox in oni/widgets/checkbox.odin. Checkbox_Config is Widget_Config.",
		proc(_: w.Rectangle_State) {
			doc_h3("checkbox_docs_api_props_h3", "Props")
			doc_muted(
				"checkbox_docs_api_props_note",
				"Checkbox_Value: FALSE | TRUE | INDETERMINATE. Use Checkbox_Next_Value to compute the value after activation.",
			)
			doc_table("checkbox_docs_props_table", CHECKBOX_DOCS_PROPS[:])

			doc_h3("checkbox_docs_api_config_h3", "Config")
			doc_muted(
				"checkbox_docs_api_config_note",
				"Defaults below come from checkbox_theme_base after merge. Prefer props.disabled over config.disabled.",
			)
			doc_table("checkbox_docs_config_table", CHECKBOX_DOCS_CONFIG[:])
		},
	)
}

Widget_Checkbox :: proc() {
	doc_page("checkbox_docs", checkbox_docs_body)
}
