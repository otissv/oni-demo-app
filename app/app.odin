package app

import o "../oni"
import set "../oni/set"
import w "../oni/widgets"
import c "./components"
import docs "./docs"
import g "./globlas"


@(init)
register_init :: proc "contextless" () {
	init = run_init
}

@(private)
run_init :: proc() {
	docs.routes_init()
}


NAV_BAR_H :: f32(60)

@(private)
main_route_child :: proc(_: w.Rectangle_State) {
	#partial switch g.app.Route {
	case .Artboard:
		docs.artboard_route()
	case .About:
		docs.about_route()
	case .Layout:
		docs.layout_route()
	case .Home:
		docs.home_route()
	case .Widgets:
		docs.widgets_route()
	case .Shortcuts:
		docs.shortcuts_route()
	}
}

@(private)
app_root_child :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "nav_bar",
				height = set.Height(NAV_BAR_H),
				width = set.Width(o.Dim_struct{percent = 100}),
				direction = set.Direction(.HORIZONTAL),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
				padding = set.Padding(o.Pd_struct{l = 16, r = 16}),
			},
			child = proc(_: w.Rectangle_State) {
				c.Nav()
			},
		},
	)

	w.Rectangle(
		{
			config = {
				id = "main",
				flex = set.Flex(1),
				width = set.Width(o.Dim_struct{percent = 100}),
				direction = set.Direction(.VERTICAL),
				padding = set.Padding(o.Pd_struct{x = 10}),
				justify = set.Justify(o.Justify_Pos{x = .STRETCH, y = .STRETCH}),
			},
			child = main_route_child,
		},
	)
}

main_ui :: proc() {
	o.Begin_Screen()

	w.Rectangle(
		{
			config = {
				id = "app_root",
				width = set.Width(o.Dim_struct{percent = 100}),
				height = set.Height(o.Dim_struct{percent = 100}),
				direction = set.Direction(.VERTICAL),
				justify = set.Justify(o.Justify_Pos{x = .STRETCH, y = .STRETCH}),
			},
			child = app_root_child,
		},
	)

	o.End_Screen()
}

app_draw :: proc() {
	o.Render(main_ui)
}
