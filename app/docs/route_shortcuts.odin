package oni_docs

import g "../../app/globlas"
import ui "../../app/ui"
import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import c "../components"


shortcuts_container :: proc(state: w.Rectangle_State) {
	w.Rectangle({
		config = {
			id = "shortcuts_route",
			direction = set.Direction(.VERTICAL),
			gap_y = set.Gap_Y(12),
			justify = set.Justify(o.Justify_Pos{x = .STRETCH, y = .START}),
		},
		child = proc(_: w.Rectangle_State) {
			ui.Heading(
				{id = "shortcuts_title", text = "Shortcuts", variant = .H2, theme = o.theme},
			)

			w.Shortcuts_Table(
				{
					config = {
						id = "shortcuts_settings",
						session = &g.app.shortcuts_table,
						bindings_path = g.app.settings_path,
					},
				},
			)
		},
	})
}

shortcuts_sidebar :: proc(state: w.Rectangle_State) {
	c.sidebar_item("shortcuts-button", "Keybindings", proc() {
		active_docs_section = .Shortcuts
	})
}
