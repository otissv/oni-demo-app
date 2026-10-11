package components

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import ui "../ui"
import "core:fmt"

Sidebar :: proc(id: string, children: proc(state: w.Rectangle_State)) {
	w.Rectangle(
		{
			config = {
				id = id,
				width = set.Width(300),
				height = set.Height(o.Dim_struct{percent = 100}),
				border_color = set.Border_color(.GRAY_500),
				direction = set.Direction(.VERTICAL),
				justify = set.Justify(o.Justify_Pos{x = .STRETCH, y = .START}),
				padding = set.Padding(o.Pd_struct{x = 12, y = 8}),
				overflow_y = set.Overflow_Y(.SCROLL),
			},
			child = children,
		},
	)
}

sidebar_heading :: proc(id: string, text: string) {
	w.Text({config = {id = id, text = text, font_weight = set.Font_weight(f32(600))}})
}

sidebar_section :: proc(id: string, children: proc(state: w.Rectangle_State)) {
	w.Rectangle(
		{
			config = {id = id, width = set.Width(.GROW), direction = set.Direction(.VERTICAL)},
			child = children,
		},
	)
}

@(private)
sidebar_item_scratch: struct {
	id, text: string,
	on_click: proc(),
}


@(private)
sidebar_item_on_click :: proc(_: ui.Button_Event) {
	if sidebar_item_scratch.on_click != nil {
		sidebar_item_scratch.on_click()
	}
}

sidebar_item :: proc(id: string, text: string, on_click: proc()) {
	sidebar_item_scratch = {
		id       = id,
		text     = text,
		on_click = on_click,
	}

	ui.Button({
		id = id,
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = sidebar_item_on_click,
		width = set.Width(.GROW),
		child = proc(_: ui.Button_state) {
			w.Text(
				{
					config = {
						id = fmt.tprintf("%s-text", sidebar_item_scratch.id),
						text = sidebar_item_scratch.text,
					},
				},
			)
		},
	})
}
