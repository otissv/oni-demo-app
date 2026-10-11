package oni_docs

import set "../../oni/set"
import w "../../oni/widgets"
import c "../components"

Docs_Section :: enum {
	Layout,
	Widgets,
	Artboard,
	Shortcuts,
}

active_docs_section: Docs_Section = .Layout


docs_route :: proc() {
	c.View("docs_view", docs_sidebar, docs_container)
}

docs_sidebar :: proc(state: w.Rectangle_State) {
	w.Rectangle({
		config = {
			id = "docs-sidebar",
			width = set.Width(.GROW),
			direction = set.Direction(.VERTICAL),
			gap_y = set.Gap_Y(u16(24)),
		},
		child = proc(state: w.Rectangle_State) {
			c.sidebar_section("layout-sidebar", proc(state: w.Rectangle_State) {
				c.sidebar_heading("layout-sidebar-heading", "Layout")
				layout_sidebar(state)
			})

			c.sidebar_section("widgets-sidebar", proc(state: w.Rectangle_State) {
				c.sidebar_heading("widgets-sidebar-heading", "Widgets")
				widget_sidebar(state)
			})

			c.sidebar_section("artboard-sidebar", proc(state: w.Rectangle_State) {
				c.sidebar_heading("artboard-sidebar-heading", "Artboard")
				artboard_sidebar(state)
			})

			c.sidebar_section("shortcuts-sidebar", proc(state: w.Rectangle_State) {
				c.sidebar_heading("shortcuts-sidebar-heading", "Shortcuts")
				shortcuts_sidebar(state)
			})
		},
	})
}

docs_container :: proc(state: w.Rectangle_State) {
	switch active_docs_section {
	case .Layout:
		layout_container(state)
	case .Widgets:
		widget_container(state)
	case .Artboard:
		artboard_container(state)
	case .Shortcuts:
		shortcuts_container(state)
	}
}
