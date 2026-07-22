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

Widget_Text_Input :: proc() {
	w.Rectangle({
		config = {
			id = "text-input-demo",
			direction = set.Direction(.VERTICAL),
			gap_y = set.Gap_Y(u16(12)),
			width = set.Width(480),
		},
		child = proc(_: w.Rectangle_State) {
			w.Text(
				{
					config = {
						id = "text-input-demo-caption",
						text = "Single-line, password, and multiline text inputs. Tab between fields; type to edit.",
					},
				},
			)

			w.Text(
				{
					config = {
						id = "text-input-demo-single-label",
						text = "Single line",
						font_size = set.F32(13),
						color = set.Colors(o.Color.MUTED_FOREGROUND),
					},
				},
			)

			w.Text_Input({
				config = {
					id = "text-input-demo-single",
					text = text_input_demo_value,
					placeholder = "Type here…",
					width = set.Width(480),
					radius = set.Radius(10),
				},
				on_change = proc(_: w.Text_Input_Event, text: string) {
					if text_input_demo_owned {
						delete(text_input_demo_value)
					} else {
						text_input_demo_owned = true
					}

					text_input_demo_value = text
				},
			})

			w.Text(
				{
					config = {
						id = "text-input-demo-password-label",
						text = "Password",
						font_size = set.F32(13),
						color = set.Colors(o.Color.MUTED_FOREGROUND),
					},
				},
			)

			w.Text_Input({
				config = {
					id = "text-input-demo-password",
					text = text_input_password_value,
					placeholder = "••••••••",
					password = true,
					width = set.Width(480),
				},
				on_change = proc(_: w.Text_Input_Event, text: string) {
					if text_input_password_owned {
						delete(text_input_password_value)
					} else {
						text_input_password_owned = true
					}

					text_input_password_value = text
				},
			})

			w.Text(
				{
					config = {
						id = "text-input-demo-multiline-label",
						text = "Multiline",
						font_size = set.F32(13),
						color = set.Colors(o.Color.MUTED_FOREGROUND),
					},
				},
			)

			w.Text_Input({
				config = {
					id = "text-input-demo-multiline",
					text = text_input_multiline_value,
					placeholder = "Multiple lines…",
					multiline = true,
					width = set.Width(480),
					height = set.Height(96),
				},
				on_change = proc(_: w.Text_Input_Event, text: string) {
					if text_input_multiline_owned {
						delete(text_input_multiline_value)
					} else {
						text_input_multiline_owned = true
					}

					text_input_multiline_value = text
				},
			})
		},
	})
}
