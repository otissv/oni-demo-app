package components

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"

Sidebar :: proc(id: string, children: proc(state: w.Rectangle_State)) {
	w.Rectangle(
		{
			config = {
				id = id,
				width = set.Width(300),
				height = set.Height(o.Dim_struct{percent = 100}),
				border = set.Border(o.Bd{r = 1}),
				border_color = set.Border_color(.GRAY_500),
				direction = set.Direction(.VERTICAL),
				justify = set.Justify(o.Justify_Pos{x = .STRETCH, y = .START}),
				padding = set.Padding(o.Pd_struct{r = 5}),
			},
			child = children,
		},
	)
}
