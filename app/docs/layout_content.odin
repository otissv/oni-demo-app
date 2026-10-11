package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"

/*
Content-align demo: siblings equalize to max/min intrinsic size on the chosen axis.

Boxes use AUTO width/height so min/max-content justify can resize them. Labels use
`wrap = NONE` so BALANCE does not stretch measure width to the row. The "fixed"
box keeps definite size and is skipped by content-align (control).
*/
Layout_Content :: proc(
	direction: o.Direction_Layout,
	layout_width: o.Width,
	layout_height: o.Height,
	content_align_x: o.Justify_Align,
	content_align_y: o.Justify_Align,
) {
	child: proc(state: w.Rectangle_State)

	if content_align_y == .MAX_CONTENT || content_align_y == .MIN_CONTENT {
		child = proc(state: w.Rectangle_State) {
			_ = state

			w.Rectangle({
				config = {
					id = "short",
					padding = set.Padding(o.Pd_struct{x = 12, y = 8}),
					background = set.Colors(o.theme.palette[.DESTRUCTIVE]),
					radius = set.Radius(8),
				},
				child = proc(_: w.Rectangle_State) {
					w.Text({config = {id = "short-label", text = "item", wrap = set.Wrap(.NONE)}})
				},
			})

			w.Rectangle({
				config = {
					id = "medium",
					padding = set.Padding(o.Pd_struct{x = 12, y = 16}),
					background = set.Colors(o.theme.palette[.ACCENT]),
					radius = set.Radius(8),
				},
				child = proc(_: w.Rectangle_State) {
					w.Text({config = {id = "medium-label", text = "item", wrap = set.Wrap(.NONE)}})
				},
			})

			w.Rectangle({
				config = {
					id = "long",
					padding = set.Padding(o.Pd_struct{x = 12, y = 24}),
					background = set.Colors(o.theme.palette[.SUCCESS]),
					radius = set.Radius(8),
				},
				child = proc(_: w.Rectangle_State) {
					w.Text({config = {id = "long-label", text = "item", wrap = set.Wrap(.NONE)}})
				},
			})

			w.Rectangle({
				config = {
					id = "fixed",
					width = 140,
					height = 100,
					padding = set.Padding(f32(8)),
					background = set.Colors(o.theme.palette[.INFO]),
					radius = set.Radius(8),
				},
				child = proc(_: w.Rectangle_State) {
					w.Text(
						{config = {id = "fixed-label", text = "fixed", wrap = set.Wrap(.NONE)}},
					)
				},
			})
		}
	} else {
		child = proc(state: w.Rectangle_State) {
			_ = state

			w.Rectangle({
				config = {
					id = "short",
					padding = set.Padding(f32(8)),
					background = set.Colors(o.theme.palette[.DESTRUCTIVE]),
					radius = set.Radius(8),
				},
				child = proc(_: w.Rectangle_State) {
					w.Text({config = {id = "short-label", text = "sm", wrap = set.Wrap(.NONE)}})
				},
			})

			w.Rectangle({
				config = {
					id = "medium",
					padding = set.Padding(f32(16)),
					background = set.Colors(o.theme.palette[.ACCENT]),
					radius = set.Radius(8),
				},
				child = proc(_: w.Rectangle_State) {
					w.Text(
						{
							config = {
								id = "medium-label",
								text = "medium",
								wrap = set.Wrap(.NONE),
							},
						},
					)
				},
			})

			w.Rectangle({
				config = {
					id = "long",
					padding = set.Padding(f32(24)),
					background = set.Colors(o.theme.palette[.SUCCESS]),
					radius = set.Radius(8),
				},
				child = proc(_: w.Rectangle_State) {
					w.Text(
						{
							config = {
								id = "long-label",
								text = "long label",
								wrap = set.Wrap(.NONE),
							},
						},
					)
				},
			})

			w.Rectangle({
				config = {
					id = "fixed",
					width = 140,
					height = 100,
					padding = set.Padding(f32(8)),
					background = set.Colors(o.theme.palette[.INFO]),
					radius = set.Radius(8),
				},
				child = proc(_: w.Rectangle_State) {
					w.Text(
						{config = {id = "fixed-label", text = "fixed", wrap = set.Wrap(.NONE)}},
					)
				},
			})
		}
	}

	w.Rectangle({
		config = {
			id = "layout_content",
			space = set.Space(.SCREEN),
			direction = set.Direction(direction),
			gap_x = set.Gap_X(u16(8)),
			gap_y = set.Gap_Y(u16(8)),
			width = set.Width(layout_width),
			height = set.Height(layout_height),
			padding = set.Padding(f32(20)),
			justify = set.Justify(o.Justify_Pos{x = content_align_x, y = content_align_y}),
			background = set.Colors(o.theme.palette[.BACKGROUND]),
			radius = set.Radius(10),
		},
		child = child,
	})
}
