package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"

/*
CSS grid demo: template columns (px + fr), grid-rows, gaps, and line placement / span.
*/
Layout_Grid :: proc() {
	w.Grid({
		config = {
			id = "layout_grid",
			space = set.Space(.SCREEN),
			width = set.Width(520),
			height = set.Height(320),
			padding = set.Padding(f32(20)),
			gap_x = set.Gap_X(u16(10)),
			gap_y = set.Gap_Y(u16(10)),
			grid_template_columns = set.Grid_Template_Columns("120px 1fr 1fr"),
			grid_template_rows = set.Grid_Rows(3),
			background = set.Colors(o.theme.palette[.BACKGROUND]),
			radius = set.Radius(10),
		},
		child = proc(_: w.Grid_State) {
			w.Rectangle({
				config = {
					id = "grid-header",
					grid_column = set.Grid_Column("1 / 4"),
					padding = set.Padding(f32(12)),
					background = set.Colors(o.theme.palette[.INFO]),
					radius = set.Radius(8),
					justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
				},
				child = proc(_: w.Rectangle_State) {
					w.Text({config = {id = "grid-header-label", text = "header (grid-column: 1 / 4)"}})
				},
			})
			w.Rectangle({
				config = {
					id = "grid-sidebar",
					grid_row_start = set.Row_Start(2),
					grid_row_end = set.Row_End(4),
					padding = set.Padding(f32(12)),
					background = set.Colors(o.theme.palette[.ACCENT]),
					radius = set.Radius(8),
					justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
				},
				child = proc(_: w.Rectangle_State) {
					w.Text({config = {id = "grid-sidebar-label", text = "sidebar rows 2–3"}})
				},
			})
			w.Rectangle({
				config = {
					id = "grid-main",
					grid_column_start = set.Col_Start(2),
					grid_column_end = set.Col_End(4),
					grid_row_start = set.Row_Start(2),
					padding = set.Padding(f32(12)),
					background = set.Colors(o.theme.palette[.SUCCESS]),
					radius = set.Radius(8),
					justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
				},
				child = proc(_: w.Rectangle_State) {
					w.Text({config = {id = "grid-main-label", text = "main cols 2–3"}})
				},
			})
			w.Rectangle({
				config = {
					id = "grid-footer",
					grid_column = set.Grid_Column("2 / 4"),
					grid_row_start = set.Row_Start(3),
					padding = set.Padding(f32(12)),
					background = set.Colors(o.theme.palette[.DESTRUCTIVE]),
					radius = set.Radius(8),
					justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
				},
				child = proc(_: w.Rectangle_State) {
					w.Text({config = {id = "grid-footer-label", text = "footer cols 2–3"}})
				},
			})
		},
	})
}
