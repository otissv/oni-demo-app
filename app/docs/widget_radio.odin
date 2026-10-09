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
radio_demo_plan_free :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio-demo-plan-free"}, value = "free"})
	w.Text(
		{
			config = {
				for_id = "radio-demo-plan-free",
				id = "radio-demo-plan-free-text",
				text = "Free",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_plan_pro :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio-demo-plan-pro"}, value = "pro"})
	w.Text(
		{
			config = {
				for_id = "radio-demo-plan-pro",
				id = "radio-demo-plan-pro-text",
				text = "Pro",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_plan_team :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio-demo-plan-team"}, value = "team"})
	w.Text(
		{
			config = {
				for_id = "radio-demo-plan-team",
				id = "radio-demo-plan-team-text",
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
				id = "radio-demo-plan-free-row",
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
				id = "radio-demo-plan-pro-row",
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
				id = "radio-demo-plan-team-row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_plan_team,
		},
	)
}

@(private)
radio_demo_density_compact :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio-demo-density-compact"}, value = "compact"})
	w.Text(
		{
			config = {
				for_id = "radio-demo-density-compact",
				id = "radio-demo-density-compact-text",
				text = "Compact",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_density_comfortable :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio-demo-density-comfortable"}, value = "comfortable"})
	w.Text(
		{
			config = {
				for_id = "radio-demo-density-comfortable",
				id = "radio-demo-density-comfortable-text",
				text = "Comfortable",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_density_spacious :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio-demo-density-spacious"}, value = "spacious"})
	w.Text(
		{
			config = {
				for_id = "radio-demo-density-spacious",
				id = "radio-demo-density-spacious-text",
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
				id = "radio-demo-density-compact-row",
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
				id = "radio-demo-density-comfortable-row",
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
				id = "radio-demo-density-spacious-row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_density_spacious,
		},
	)
}

@(private)
radio_demo_notify_all :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio-demo-notify-all"}, value = "all"})
	w.Text(
		{
			config = {
				for_id = "radio-demo-notify-all",
				id = "radio-demo-notify-all-text",
				text = "All messages",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_notify_email :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio-demo-notify-email"}, value = "email"})
	w.Text(
		{
			config = {
				for_id = "radio-demo-notify-email",
				id = "radio-demo-notify-email-text",
				text = "Email only",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_notify_none :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio-demo-notify-none"}, value = "none", disabled = true})
	w.Text(
		{
			config = {
				id = "radio-demo-notify-none-text",
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
				id = "radio-demo-notify-all-row",
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
				id = "radio-demo-notify-email-row",
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
				id = "radio-demo-notify-none-row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_notify_none,
		},
	)
}

@(private)
radio_demo_locked_all :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio-demo-locked-all"}, value = "all"})
	w.Text(
		{
			config = {
				for_id = "radio-demo-locked-all",
				id = "radio-demo-locked-all-text",
				text = "Everyone",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
radio_demo_locked_team :: proc(_: w.Rectangle_State) {
	w.Radio({config = {id = "radio-demo-locked-team"}, value = "team"})
	w.Text(
		{
			config = {
				for_id = "radio-demo-locked-team",
				id = "radio-demo-locked-team-text",
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
				id = "radio-demo-locked-all-row",
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
				id = "radio-demo-locked-team-row",
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				gap_x = set.Gap_X(u16(10)),
			},
			child = radio_demo_locked_team,
		},
	)
}

@(private)
radio_demo_body :: proc(_: w.Rectangle_State) {
	w.Text(
		{
			config = {
				id = "radio-demo-caption",
				text = "Radio group is caller-owned: pass value every frame and update it from on_value_change. Arrow keys move the selection. Space checks the focused item.",
			},
		},
	)

	w.Text(
		{
			config = {
				id = "radio-demo-plan-label",
				text = "Vertical",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
	w.Radio_Group(
		{
			config = {id = "radio-demo-plan"},
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
				id = "radio-demo-plan-status",
				text = fmt.tprintf("Value: %s", radio_demo_plan),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Text(
		{
			config = {
				id = "radio-demo-density-label",
				text = "Horizontal",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
	w.Radio_Group(
		{
			config = {id = "radio-demo-density"},
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
				id = "radio-demo-density-status",
				text = fmt.tprintf("Value: %s", radio_demo_density),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Text(
		{
			config = {
				id = "radio-demo-notify-label",
				text = "Disabled item",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
	w.Radio_Group(
		{
			config = {id = "radio-demo-notify"},
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
				id = "radio-demo-notify-status",
				text = fmt.tprintf("Value: %s", radio_demo_notify),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Text(
		{
			config = {
				id = "radio-demo-locked-label",
				text = "Disabled group",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
	w.Radio_Group(
		{
			config = {id = "radio-demo-locked"},
			value = radio_demo_locked,
			disabled = true,
			child = radio_demo_locked_child,
		},
	)
}

Widget_Radio :: proc() {
	w.Rectangle(
		{
			config = {
				id = "radio-demo",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(12)),
				width = set.Width(f32(480)),
			},
			child = radio_demo_body,
		},
	)
}
