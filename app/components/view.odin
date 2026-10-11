package components

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"

@(private)
view_children: struct {
	sidebar:   proc(state: w.Rectangle_State),
	container: proc(state: w.Rectangle_State),
}

@(private)
view_child :: proc(state: w.Rectangle_State) {
	sidebar_id := fmt.tprintf("{}_sidebar", state.config.id)

	Sidebar(sidebar_id, view_children.sidebar)
	w.Rectangle(
		{
			config = {
				id = "container",
				flex = set.Flex(1),
				height = set.Height(o.Dim_struct{percent = 100}),
				direction = set.Direction(.VERTICAL),
				padding = set.Padding(o.Pd_struct{l = 20}),
				justify = set.Justify(o.Justify_Pos{x = .STRETCH, y = .STRETCH}),
			},
			child = view_children.container,
		},
	)
}

View :: proc(
	id: string,
	sidebar: proc(state: w.Rectangle_State),
	container: proc(state: w.Rectangle_State),
) {
	view_children = {sidebar, container}

	w.Rectangle(
		{
			config = {
				id = id,
				width = set.Width(o.Dim_struct{percent = 100}),
				height = set.Height(o.Dim_struct{percent = 100}),
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .STRETCH}),
			},
			child = view_child,
		},
	)
}
