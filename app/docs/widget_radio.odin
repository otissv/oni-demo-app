package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"

@(private)
radio_demo_plan: string = "pro"

@(private)
radio_demo_density: string = "comfortable"

@(private)
radio_demo_notify: string = "email"

@(private)
radio_demo_locked: string = "all"

@(private)
RADIO_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
RADIO_DOCS_USAGE_CALL :: `w.Radio_Group({
	config = {id = "plan"},
	value = plan,
	name = "plan",
	on_value_change = proc(value: string) { plan = value },
	child = proc(_: w.Radio_Group_State) {
		w.Radio({config = {id = "plan-free"}, value = "free"})
		w.Radio({config = {id = "plan-pro"}, value = "pro"})
	},
})`

@(private)
RADIO_GROUP_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Radio_Group_Config (= Widget_Config)", "{}"},
	{"value", "string", `""`},
	{"name", "string", `""`},
	{"required", "bool", "false"},
	{"disabled", "bool", "false"},
	{"on_value_change", "proc(value: string)", "nil"},
	{"loop", "Radio_Loop", ".ON"},
	{"orientation", "Radio_Orientation", ".VERTICAL"},
	{"child", "proc(Radio_Group_State)", "nil"},
	{"on_mount", "proc(Radio_Group_State) -> Mount", "nil"},
	{"on_unmount", "proc(Radio_Group_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"scroll_bar", "Scroll_Bar_Style", "{}"},
	{"on_focus", "proc(Radio_Group_Event)", "nil"},
	{"on_blur", "proc(Radio_Group_Event)", "nil"},
	{"on_mouse_enter", "proc(Radio_Group_Event)", "nil"},
	{"on_mouse_leave", "proc(Radio_Group_Event)", "nil"},
	{"on_mouse_pressed", "proc(Radio_Group_Event)", "nil"},
	{"on_mouse_down", "proc(Radio_Group_Event)", "nil"},
	{"on_mouse_released", "proc(Radio_Group_Event)", "nil"},
	{"on_mouse_move", "proc(Radio_Group_Event)", "nil"},
	{"on_click", "proc(Radio_Group_Event)", "nil"},
	{"on_contextmenu", "proc(Radio_Group_Event)", "nil"},
	{"on_key_pressed", "proc(Radio_Group_Event)", "nil"},
	{"on_key_down", "proc(Radio_Group_Event)", "nil"},
	{"on_key_released", "proc(Radio_Group_Event)", "nil"},
}

@(private)
RADIO_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Radio_Config (= Widget_Config)", "{}"},
	{"value", "string", `""`},
	{"disabled", "bool", "false"},
	{"child", "proc(Radio_State)", "nil"},
	{"on_mount", "proc(Radio_State) -> Mount", "nil"},
	{"on_unmount", "proc(Radio_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"scroll_bar", "Scroll_Bar_Style", "{}"},
	{"on_focus", "proc(Radio_Event)", "nil"},
	{"on_blur", "proc(Radio_Event)", "nil"},
	{"on_mouse_enter", "proc(Radio_Event)", "nil"},
	{"on_mouse_leave", "proc(Radio_Event)", "nil"},
	{"on_mouse_pressed", "proc(Radio_Event)", "nil"},
	{"on_mouse_down", "proc(Radio_Event)", "nil"},
	{"on_mouse_released", "proc(Radio_Event)", "nil"},
	{"on_mouse_move", "proc(Radio_Event)", "nil"},
	{"on_click", "proc(Radio_Event)", "nil"},
	{"on_contextmenu", "proc(Radio_Event)", "nil"},
	{"on_key_pressed", "proc(Radio_Event)", "nil"},
	{"on_key_down", "proc(Radio_Event)", "nil"},
	{"on_key_released", "proc(Radio_Event)", "nil"},
}

@(private)
radio_demo_plan_free :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio_docs_plan_free"}, value = "free"})
	w.Text(
		{
			config = {
				for_id = "radio_docs_plan_free",
				id = "radio_docs_plan_free_text",
				text = "Free",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_plan_pro :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio_docs_plan_pro"}, value = "pro"})
	w.Text(
		{
			config = {
				for_id = "radio_docs_plan_pro",
				id = "radio_docs_plan_pro_text",
				text = "Pro",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_plan_team :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio_docs_plan_team"}, value = "team"})
	w.Text(
		{
			config = {
				for_id = "radio_docs_plan_team",
				id = "radio_docs_plan_team_text",
				text = "Team",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_plan_child :: proc(_: w.Radio_Group_State) {
	w.Rectangle(
		{
			config = {
				id = "radio_docs_plan_free_row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_plan_free,
		},
	)
	w.Rectangle(
		{
			config = {
				id = "radio_docs_plan_pro_row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_plan_pro,
		},
	)
	w.Rectangle(
		{
			config = {
				id = "radio_docs_plan_team_row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_plan_team,
		},
	)
}

@(private)
radio_docs_vertical_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "radio_docs_vertical_col",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(8)),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
			},
			child = radio_docs_vertical_inner,
		},
	)
}

@(private)
radio_docs_vertical_inner :: proc(_: w.Rectangle_State) {
	w.Radio_Group(
		{
			config = {id = "radio_docs_plan"},
			value = radio_demo_plan,
			name = "plan",
			on_value_change = proc(value: string) {
				radio_demo_plan = value
			},
			child = radio_demo_plan_child,
		},
	)
	w.Text(
		{
			config = {
				id = "radio_docs_plan_status",
				text = fmt.tprintf("Value: %s", radio_demo_plan),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
radio_demo_density_compact :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio_docs_density_compact"}, value = "compact"})
	w.Text(
		{
			config = {
				for_id = "radio_docs_density_compact",
				id = "radio_docs_density_compact_text",
				text = "Compact",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_density_comfortable :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio_docs_density_comfortable"}, value = "comfortable"})
	w.Text(
		{
			config = {
				for_id = "radio_docs_density_comfortable",
				id = "radio_docs_density_comfortable_text",
				text = "Comfortable",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_density_spacious :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio_docs_density_spacious"}, value = "spacious"})
	w.Text(
		{
			config = {
				for_id = "radio_docs_density_spacious",
				id = "radio_docs_density_spacious_text",
				text = "Spacious",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_density_child :: proc(_: w.Radio_Group_State) {
	w.Rectangle(
		{
			config = {
				id = "radio_docs_density_compact_row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_density_compact,
		},
	)
	w.Rectangle(
		{
			config = {
				id = "radio_docs_density_comfortable_row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_density_comfortable,
		},
	)
	w.Rectangle(
		{
			config = {
				id = "radio_docs_density_spacious_row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_density_spacious,
		},
	)
}

@(private)
radio_docs_horizontal_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "radio_docs_horizontal_col",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(8)),
			},
			child = radio_docs_horizontal_inner,
		},
	)
}

@(private)
radio_docs_horizontal_inner :: proc(_: w.Rectangle_State) {
	w.Radio_Group(
		{
			config = {id = "radio_docs_density"},
			value = radio_demo_density,
			orientation = .HORIZONTAL,
			on_value_change = proc(value: string) {
				radio_demo_density = value
			},
			child = radio_demo_density_child,
		},
	)
	w.Text(
		{
			config = {
				id = "radio_docs_density_status",
				text = fmt.tprintf("Value: %s", radio_demo_density),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
radio_demo_notify_all :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio_docs_notify_all"}, value = "all"})
	w.Text(
		{
			config = {
				for_id = "radio_docs_notify_all",
				id = "radio_docs_notify_all_text",
				text = "All messages",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_notify_email :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio_docs_notify_email"}, value = "email"})
	w.Text(
		{
			config = {
				for_id = "radio_docs_notify_email",
				id = "radio_docs_notify_email_text",
				text = "Email only",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_notify_none :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio_docs_notify_none"}, value = "none", disabled = true})
	w.Text(
		{
			config = {
				id = "radio_docs_notify_none_text",
				text = "Muted",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_notify_child :: proc(_: w.Radio_Group_State) {
	w.Rectangle(
		{
			config = {
				id = "radio_docs_notify_all_row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_notify_all,
		},
	)
	w.Rectangle(
		{
			config = {
				id = "radio_docs_notify_email_row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_notify_email,
		},
	)
	w.Rectangle(
		{
			config = {
				id = "radio_docs_notify_none_row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_notify_none,
		},
	)
}

@(private)
radio_docs_disabled_item_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "radio_docs_notify_col",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(8)),
			},
			child = radio_docs_disabled_item_inner,
		},
	)
}

@(private)
radio_docs_disabled_item_inner :: proc(_: w.Rectangle_State) {
	w.Radio_Group(
		{
			config = {id = "radio_docs_notify"},
			value = radio_demo_notify,
			name = "notify",
			required = true,
			on_value_change = proc(value: string) {
				radio_demo_notify = value
			},
			child = radio_demo_notify_child,
		},
	)
	w.Text(
		{
			config = {
				id = "radio_docs_notify_status",
				text = fmt.tprintf("Value: %s", radio_demo_notify),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
radio_demo_locked_all :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio_docs_locked_all"}, value = "all"})
	w.Text(
		{
			config = {
				for_id = "radio_docs_locked_all",
				id = "radio_docs_locked_all_text",
				text = "Everyone",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_locked_team :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio_docs_locked_team"}, value = "team"})
	w.Text(
		{
			config = {
				for_id = "radio_docs_locked_team",
				id = "radio_docs_locked_team_text",
				text = "Team",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_locked_child :: proc(_: w.Radio_Group_State) {
	w.Rectangle(
		{
			config = {
				id = "radio_docs_locked_all_row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_locked_all,
		},
	)
	w.Rectangle(
		{
			config = {
				id = "radio_docs_locked_team_row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_locked_team,
		},
	)
}

@(private)
radio_docs_disabled_group_preview :: proc(_: w.Rectangle_State) {
	w.Radio_Group(
		{
			config = {id = "radio_docs_locked"},
			value = radio_demo_locked,
			disabled = true,
			child = radio_demo_locked_child,
		},
	)
}

@(private)
radio_docs_hero :: proc(_: w.Rectangle_State) {
	w.Radio_Group(
		{
			config = {id = "radio_docs_hero"},
			value = radio_demo_plan,
			on_value_change = proc(value: string) {
				radio_demo_plan = value
			},
			child = radio_demo_plan_child,
		},
	)
}

@(private)
radio_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("radio_docs_title", "Radio")
	doc_lede(
		"radio_docs_lede",
		"Single-choice groups (Radix RadioGroup): caller-owned value, arrow-key navigation, and labeled items via Text for_id.",
	)

	doc_preview("radio_docs_hero_preview", radio_docs_hero)

	doc_section(
		"radio_docs_installation",
		"Installation",
		"Use w.Radio_Group as the root and w.Radio for each option in oni/widgets.",
		proc(_: w.Rectangle_State) {
			doc_code("radio_docs_installation_code", RADIO_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"radio_docs_usage",
		"Usage",
		"value is caller-owned. Pass it every frame and update from on_value_change. Each Radio needs a unique value string inside the group.",
		proc(_: w.Rectangle_State) {
			doc_code("radio_docs_usage_call", RADIO_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"radio_docs_vertical",
		"Vertical",
		"Default orientation is vertical: Up/Down move focus and change selection when loop is ON.",
		proc(_: w.Rectangle_State) {
			doc_preview("radio_docs_vertical_preview_wrap", radio_docs_vertical_preview)
			doc_code(
				"radio_docs_vertical_code",
				`w.Radio_Group({
	config = {id = "plan"},
	value = plan,
	name = "plan",
	on_value_change = proc(value: string) { plan = value },
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"radio_docs_horizontal",
		"Horizontal",
		"orientation = .HORIZONTAL lays out items in a row and maps Left/Right arrow keys.",
		proc(_: w.Rectangle_State) {
			doc_preview("radio_docs_horizontal_preview_wrap", radio_docs_horizontal_preview)
			doc_code(
				"radio_docs_horizontal_code",
				`w.Radio_Group({
	config = {id = "density"},
	value = density,
	orientation = .HORIZONTAL,
	on_value_change = proc(value: string) { density = value },
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"radio_docs_disabled_item",
		"Disabled item",
		"Set disabled on a single Radio to skip it in keyboard navigation. required on the group is exposed on state for form owners.",
		proc(_: w.Rectangle_State) {
			doc_preview("radio_docs_disabled_item_preview_wrap", radio_docs_disabled_item_preview)
			doc_code(
				"radio_docs_disabled_item_code",
				`w.Radio({
	config = {id = "muted"},
	value = "none",
	disabled = true,
})`,
			)
		},
	)

	doc_section(
		"radio_docs_disabled_group",
		"Disabled group",
		"disabled on Radio_Group disables every item without double opacity on each Radio.",
		proc(_: w.Rectangle_State) {
			doc_preview("radio_docs_disabled_group_preview_wrap", radio_docs_disabled_group_preview)
			doc_code(
				"radio_docs_disabled_group_code",
				`w.Radio_Group({
	config = {id = "locked"},
	value = value,
	disabled = true,
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"radio_docs_api",
		"API Reference",
		"w.Radio_Group and w.Radio in oni/widgets/radio_group.odin and radio.odin.",
		proc(_: w.Rectangle_State) {
			doc_h3("radio_docs_api_group_props_h3", "Radio_Group props")
			doc_muted(
				"radio_docs_api_group_note",
				"Radio_Loop: ON | OFF. Radio_Orientation: VERTICAL | HORIZONTAL. Empty value means no selection.",
			)
			doc_table("radio_docs_group_props_table", RADIO_GROUP_DOCS_PROPS[:])

			doc_h3("radio_docs_api_group_config_h3", "Radio_Group config")
			doc_table("radio_docs_group_config_table", DOC_WIDGET_CONFIG[:])

			doc_h3("radio_docs_api_radio_props_h3", "Radio props")
			doc_muted(
				"radio_docs_api_radio_note",
				"Radio is inert outside a Radio_Group. child replaces the checked dot and runs only while checked.",
			)
			doc_table("radio_docs_radio_props_table", RADIO_DOCS_PROPS[:])
		},
	)
}

Widget_Radio :: proc() {
	doc_page("radio_docs", radio_docs_body)
}
