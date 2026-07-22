package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"


@(private)
rich_text_input_demo_value: string =
	"{c:accent}Accent{/c} {b}bold{/b} {i}italic{/i} — edit with inline tags"

@(private)
rich_text_input_demo_owned: bool

Widget_Rich_Text_Input :: proc() {
	w.Rectangle({
		config = {
			id = "rich-text-input-demo",
			direction = set.Direction(.VERTICAL),
			gap_y = set.Gap_Y(u16(12)),
			width = set.Width(520),
		},
		child = proc(_: w.Rectangle_State) {
			w.Text({
				config = {
					id = "rich-text-input-demo-caption",
					text = "RichTextInput stores tagged source text. Use {c:accent}color{/c}, {b}bold{/b}, {i}italic{/i}, {u}underline{/u}, and other style tags while typing.",
				},
			})

			w.Rich_Text_Input({
				config = {
					id = "rich-text-input-demo-field",
					text = rich_text_input_demo_value,
					placeholder = "{c:muted}Placeholder with tags…{/c}",
					width = set.Width(520),
					font = set.Font(o.theme.font_body),
					font_size = set.F32(16),
					line_height = set.F32(1.5),
				},
				on_change = proc(_: w.Rich_Text_Input_Event, tagged: string) {
					if rich_text_input_demo_owned {
						delete(rich_text_input_demo_value)
					} else {
						rich_text_input_demo_owned = true
					}

					rich_text_input_demo_value = tagged
				},
			})

			w.Text({
				config = {
					id = "rich-text-input-demo-preview-label",
					text = "Preview",
					font_size = set.F32(13),
					color = set.Colors(o.Color.MUTED_FOREGROUND),
				},
			})

			w.RichText({
				config = {
					id = "rich-text-input-demo-preview",
					text = rich_text_input_demo_value,
					width = set.Width(520),
					font = set.Font(o.theme.font_body),
					font_size = set.F32(16),
					line_height = set.F32(1.5),
					wrap = set.Wrap(.BALANCE),
				},
			})
		},
	})
}
