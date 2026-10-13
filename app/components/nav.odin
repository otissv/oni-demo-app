package components

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import g "../globlas"
import ui "../ui"
import "core:fmt"

@(private)
nav_item_scratch: struct {
	id, text: string,
	route:    g.Routes,
}

@(private)
nav_item_child :: proc(_: ui.Button_state) {
	w.Text(
		{
			config = {
				id = fmt.tprintf("%s-label", nav_item_scratch.id),
				text = nav_item_scratch.text,
				wrap = set.Wrap(.NONE),
			},
		},
	)
}

@(private)
nav_item_on_click :: proc(_: ui.Button_Event) {
	g.app.Route = nav_item_scratch.route
}

Nav_item :: proc(id: string, route: g.Routes, text: string) {
	nav_item_scratch = {
		id    = id,
		text  = text,
		route = route,
	}

	ui.Button(
		{
			id = id,
			radius = set.Radius(5),
			variant = .GHOST,
			width = set.Width(o.Width_Mode.FIT),
			on_click = nav_item_on_click,
			child = nav_item_child,
		},
	)
}

Nav :: proc() {
	w.Rectangle({
		config = {
			id = "nav",
			direction = set.Direction(.HORIZONTAL),
			gap_x = set.Gap_X(10),
			justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
			padding = set.Padding(o.Pd_struct{x = 10}),
		},
		child = proc(state: w.Rectangle_State) {
			Nav_item("nav-docs-button", .Docs, "Docs")

		},
	})
}
