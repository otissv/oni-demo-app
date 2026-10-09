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
checkbox_demo_body :: proc(_: w.Rectangle_State) {
	w.Text(
		{
			config = {
				id = "checkbox-demo-caption",
				text = "Checkbox is caller-owned: pass checked every frame and update it from on_checked_change. Supports false, true, and indeterminate.",
			},
		},
	)

	w.Text(
		{
			config = {
				id = "checkbox-demo-remember-label",
				text = "Basic",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Rectangle({
		config = {
			id = "checkbox-demo-remember-row",
			direction = set.Direction(.HORIZONTAL),
			justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
			gap_x = set.Gap_X(u16(10)),
		},
		child = proc(_: w.Rectangle_State) {
			w.Checkbox({
				config = {id = "checkbox-demo-remember"},
				checked = checkbox_demo_remember,
				on_checked_change = proc(checked: w.Checkbox_Value) {
					checkbox_demo_remember = checked
				},
			})
			w.Text(
				{
					config = {
						for_id = "checkbox-demo-remember",
						id = "checkbox-demo-remember-text",
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
				id = "checkbox-demo-remember-status",
				text = fmt.tprintf(
					"Checked: %s",
					checkbox_demo_value_label(checkbox_demo_remember),
				),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Text(
		{
			config = {
				id = "checkbox-demo-terms-label",
				text = "Form field",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Rectangle({
		config = {
			id = "checkbox-demo-terms-row",
			direction = set.Direction(.HORIZONTAL),
			justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
			gap_x = set.Gap_X(u16(10)),
		},
		child = proc(_: w.Rectangle_State) {
			w.Checkbox({
				config = {id = "checkbox-demo-terms"},
				checked = checkbox_demo_terms,
				on_checked_change = proc(checked: w.Checkbox_Value) {
					checkbox_demo_terms = checked
				},
			})
			w.Text(
				{
					config = {
						for_id = "checkbox-demo-terms",
						id = "checkbox-demo-terms-text",
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
				id = "checkbox-demo-terms-status",
				text = fmt.tprintf("Checked: %s", checkbox_demo_value_label(checkbox_demo_terms)),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Text(
		{
			config = {
				id = "checkbox-demo-partial-label",
				text = "Indeterminate (becomes true on activate)",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Rectangle({
		config = {
			id = "checkbox-demo-partial-row",
			direction = set.Direction(.HORIZONTAL),
			justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
			gap_x = set.Gap_X(u16(10)),
		},
		child = proc(_: w.Rectangle_State) {
			w.Checkbox({
				config = {id = "checkbox-demo-partial"},
				checked = checkbox_demo_partial,
				on_checked_change = proc(checked: w.Checkbox_Value) {
					checkbox_demo_partial = checked
				},
			})
			w.Text(
				{
					config = {
						for_id = "checkbox-demo-partial",
						id = "checkbox-demo-partial-text",
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
				id = "checkbox-demo-partial-status",
				text = fmt.tprintf(
					"Checked: %s",
					checkbox_demo_value_label(checkbox_demo_partial),
				),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Text(
		{
			config = {
				id = "checkbox-demo-disabled-label",
				text = "Disabled",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Rectangle({
		config = {
			id = "checkbox-demo-disabled-row",
			direction = set.Direction(.HORIZONTAL),
			justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
			gap_x = set.Gap_X(u16(10)),
		},
		child = proc(_: w.Rectangle_State) {
			w.Checkbox(
				{
					config = {id = "checkbox-demo-disabled"},
					checked = checkbox_demo_disabled,
					disabled = true,
				},
			)
			w.Text(
				{
					config = {
						id = "checkbox-demo-disabled-text",
						text = "Notifications (locked)",
						font_size = set.F32(14),
					},
				},
			)
		},
	})
}

Widget_Checkbox :: proc() {
	w.Rectangle(
		{
			config = {
				id = "checkbox-demo",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(12)),
				width = set.Width(f32(480)),
			},
			child = checkbox_demo_body,
		},
	)
}
