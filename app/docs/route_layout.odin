package oni_docs

import c "../../app/components"
import o "../../oni"
import w "../../oni/widgets"


Sidebar_Layout_options :: enum {
	// Layout
	LAYOUT_HORIZONTAL,
	LAYOUT_VERTICAL,
	LAYOUT_HORIZONTAL_WRAP,
	LAYOUT_VERTICAL_WRAP,
	LAYOUT_HORIZONTAL_REVERSE,
	LAYOUT_VERTICAL_REVERSE,
	LAYOUT_HORIZONTAL_WRAP_REVERSE,
	LAYOUT_VERTICAL_WRAP_REVERSE,
	LAYOUT_MAX_CONTENT_X,
	LAYOUT_MIN_CONTENT_X,
	LAYOUT_MAX_CONTENT_Y,
	LAYOUT_MIN_CONTENT_Y,
	LAYOUT_ORDER,
	LAYOUT_Z_INDEX,
	LAYOUT_POSITION,
	LAYOUT_VISIBILITY,
	LAYOUT_OPACITY,
	LAYOUT_POPOVER,
	LAYOUT_SCROLLVIEW,
	LAYOUT_GRID,
}

@(private)
active_layout_option: Sidebar_Layout_options = .LAYOUT_HORIZONTAL

direction: o.Direction_Layout = .HORIZONTAL
layout_width: o.Width = .AUTO
layout_height: o.Height = .AUTO
content_align_x: o.Justify_Align = .MAX_CONTENT
content_align_y: o.Justify_Align = .START

layout_container := proc(state: w.Rectangle_State) {
	switch active_layout_option {
	// Layout
	case .LAYOUT_HORIZONTAL:
		Layout_Directions(direction, layout_width, layout_height)
	case .LAYOUT_VERTICAL:
		Layout_Directions(direction, layout_width, layout_height)
	case .LAYOUT_HORIZONTAL_WRAP:
		Layout_Directions(direction, layout_width, layout_height)
	case .LAYOUT_VERTICAL_WRAP:
		Layout_Directions(direction, layout_width, layout_height)
	case .LAYOUT_HORIZONTAL_REVERSE:
		Layout_Directions(direction, layout_width, layout_height)
	case .LAYOUT_VERTICAL_REVERSE:
		Layout_Directions(direction, layout_width, layout_height)
	case .LAYOUT_HORIZONTAL_WRAP_REVERSE:
		Layout_Directions(direction, layout_width, layout_height)
	case .LAYOUT_VERTICAL_WRAP_REVERSE:
		Layout_Directions(direction, layout_width, layout_height)
	case .LAYOUT_MAX_CONTENT_X:
		Layout_Content(direction, layout_width, layout_height, content_align_x, content_align_y)
	case .LAYOUT_MIN_CONTENT_X:
		Layout_Content(direction, layout_width, layout_height, content_align_x, content_align_y)
	case .LAYOUT_MAX_CONTENT_Y:
		Layout_Content(direction, layout_width, layout_height, content_align_x, content_align_y)
	case .LAYOUT_MIN_CONTENT_Y:
		Layout_Content(direction, layout_width, layout_height, content_align_x, content_align_y)
	case .LAYOUT_ORDER:
		Layout_Order()
	case .LAYOUT_Z_INDEX:
		Layout_Z_Index()
	case .LAYOUT_POSITION:
		Layout_Position()
	case .LAYOUT_VISIBILITY:
		Layout_Visibility()
	case .LAYOUT_OPACITY:
		Layout_Opacity()
	case .LAYOUT_POPOVER:
		Layout_Popover()
	case .LAYOUT_SCROLLVIEW:
		Layout_Scrollview()
	case .LAYOUT_GRID:
		Layout_Grid()
	}
}

layout_sidebar := proc(state: w.Rectangle_State) {

	c.sidebar_item("horizontal", "Horizontal", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_HORIZONTAL
		direction = .HORIZONTAL
		layout_width = .AUTO
		layout_height = .AUTO
	})

	c.sidebar_item("horizontal-reverse", "Horizontal Reverse", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_HORIZONTAL_REVERSE
		direction = .HORIZONTAL_REVERSE
		layout_width = .AUTO
		layout_height = .AUTO
	})

	c.sidebar_item("horizontal-wrap", "Horizontal Wrap", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_HORIZONTAL_WRAP
		direction = .HORIZONTAL_WRAP
		layout_width = 400
		layout_height = .AUTO
	})

	c.sidebar_item("horizontal-wrap-reverse", "Horizontal Wrap Reverse", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_HORIZONTAL_WRAP_REVERSE
		direction = .HORIZONTAL_WRAP_REVERSE
		layout_width = 400
		layout_height = .AUTO
	})

	c.sidebar_item("vertical", "Vertical", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_VERTICAL
		direction = .VERTICAL
		layout_width = .AUTO
		layout_height = .AUTO
	})

	c.sidebar_item("vertical-reverse", "Vertical Reverse", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_VERTICAL_REVERSE
		direction = .VERTICAL_REVERSE
		layout_width = .AUTO
		layout_height = .AUTO
	})

	c.sidebar_item("vertical-wrap", "Vertical Wrap", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_VERTICAL_WRAP
		direction = .VERTICAL_WRAP
		layout_width = 280
		layout_height = 400
	})

	c.sidebar_item("vertical-wrap-reverse", "Vertical Wrap Reverse", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_VERTICAL_WRAP_REVERSE
		direction = .VERTICAL_WRAP_REVERSE
		layout_width = 280
		layout_height = 400
	})

	c.sidebar_item("max-content-x", "Max Content X", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_MAX_CONTENT_X
		content_align_x = .MAX_CONTENT
		content_align_y = .START
		direction = .HORIZONTAL
		layout_width = .AUTO
		layout_height = .AUTO
	})

	c.sidebar_item("min-content-x", "Min Content X", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_MIN_CONTENT_X
		content_align_x = .MIN_CONTENT
		content_align_y = .START
		direction = .HORIZONTAL
		layout_width = .AUTO
		layout_height = .AUTO
	})

	c.sidebar_item("max-content-y", "Max Content Y", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_MAX_CONTENT_Y
		content_align_x = .START
		content_align_y = .MAX_CONTENT
		direction = .VERTICAL
		layout_width = .AUTO
		layout_height = .AUTO
	})

	c.sidebar_item("min-content-y", "Min Content Y", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_MIN_CONTENT_Y
		content_align_x = .START
		content_align_y = .MIN_CONTENT
		direction = .VERTICAL
		layout_width = .AUTO
		layout_height = .AUTO
	})

	c.sidebar_item("order", "Order", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_ORDER
	})

	c.sidebar_item("z-index", "Z-Index", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_Z_INDEX
	})

	c.sidebar_item("position", "Position", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_POSITION
	})

	c.sidebar_item("visibility", "Visibility", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_VISIBILITY
	})

	c.sidebar_item("opacity", "Opacity", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_OPACITY
	})

	c.sidebar_item("popover", "Popover", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_POPOVER
	})

	c.sidebar_item("scrollview", "Scrollview", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_SCROLLVIEW
	})

	c.sidebar_item("grid", "Grid", proc() {
		active_docs_section = .Layout
		active_layout_option = .LAYOUT_GRID
	})
}
