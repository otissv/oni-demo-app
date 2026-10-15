package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"

@(private)
collapsible_demo_open := false

@(private)
collapsible_demo_disabled_open := true

@(private)
collapsible_demo_force_mount_open := false

@(private)
collapsible_demo_nested_outer := true

@(private)
collapsible_demo_nested_inner := false

@(private)
COLLAPSIBLE_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
COLLAPSIBLE_DOCS_USAGE_CALL :: `w.Collapsible({
	config = {id = "details", open = open},
	on_open_change = proc(next: bool) { open = next },
	child = proc(_: w.Collapsible_State) {
		w.Collapsible_Trigger({
			config = {id = "details_trigger"},
			child = proc(_: w.Collapsible_Trigger_State) {
				w.Text({config = {id = "details_trigger_label", text = "Toggle"}})
			},
		})
		w.Collapsible_Content({
			config = {id = "details_panel", padding = set.Padding(f32(12))},
			child = proc(_: w.Collapsible_Content_State) {
				w.Text({config = {id = "details_body", text = "In-flow panel."}})
			},
		})
	},
})`

@(private)
COLLAPSIBLE_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Collapsible_Config (open + Widget_Config)", "{}"},
	{"on_open_change", "proc(open: bool)", "nil"},
	{"child", "proc(Collapsible_State)", "nil"},
	{"on_mount", "proc(Collapsible_State) -> Mount", "nil"},
	{"on_unmount", "proc(Collapsible_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"on_focus", "proc(Collapsible_Event)", "nil"},
	{"on_blur", "proc(Collapsible_Event)", "nil"},
	{"on_mouse_enter", "proc(Collapsible_Event)", "nil"},
	{"on_mouse_leave", "proc(Collapsible_Event)", "nil"},
	{"on_mouse_pressed", "proc(Collapsible_Event)", "nil"},
	{"on_mouse_down", "proc(Collapsible_Event)", "nil"},
	{"on_mouse_released", "proc(Collapsible_Event)", "nil"},
	{"on_mouse_move", "proc(Collapsible_Event)", "nil"},
	{"on_click", "proc(Collapsible_Event)", "nil"},
	{"on_contextmenu", "proc(Collapsible_Event)", "nil"},
	{"on_key_pressed", "proc(Collapsible_Event)", "nil"},
	{"on_key_down", "proc(Collapsible_Event)", "nil"},
	{"on_key_released", "proc(Collapsible_Event)", "nil"},
}

@(private)
COLLAPSIBLE_DOCS_CONFIG := [?]Doc_Prop_Row {
	{"open", "bool", "false"},
	{"disabled", "Cfg(Style_Bool)", "set.Disabled(true)"},
}

@(private)
COLLAPSIBLE_TRIGGER_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Collapsible_Trigger_Config (= Widget_Config)", "{}"},
	{"child", "proc(Collapsible_Trigger_State)", "nil"},
	{"on_click", "proc(Collapsible_Trigger_Event)", "nil — runs after toggle"},
	{"on_mount", "proc(Collapsible_Trigger_State) -> Mount", "nil"},
	{"on_unmount", "proc(Collapsible_Trigger_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"on_focus", "proc(Collapsible_Trigger_Event)", "nil"},
	{"on_blur", "proc(Collapsible_Trigger_Event)", "nil"},
	{"on_mouse_enter", "proc(Collapsible_Trigger_Event)", "nil"},
	{"on_mouse_leave", "proc(Collapsible_Trigger_Event)", "nil"},
	{"on_mouse_pressed", "proc(Collapsible_Trigger_Event)", "nil"},
	{"on_mouse_down", "proc(Collapsible_Trigger_Event)", "nil"},
	{"on_mouse_released", "proc(Collapsible_Trigger_Event)", "nil"},
	{"on_mouse_move", "proc(Collapsible_Trigger_Event)", "nil"},
	{"on_contextmenu", "proc(Collapsible_Trigger_Event)", "nil"},
	{"on_key_pressed", "proc(Collapsible_Trigger_Event)", "nil"},
	{"on_key_down", "proc(Collapsible_Trigger_Event)", "nil"},
	{"on_key_released", "proc(Collapsible_Trigger_Event)", "nil"},
}

@(private)
COLLAPSIBLE_TRIGGER_DOCS_CONFIG := [?]Doc_Prop_Row {
	{"disabled", "Cfg(Style_Bool)", "set.Disabled(true)"},
	{"tabbable", "Cfg(Style_Bool)", "theme default true"},
}

@(private)
COLLAPSIBLE_CONTENT_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Collapsible_Content_Config (force_mount + Widget_Config)", "{}"},
	{"child", "proc(Collapsible_Content_State)", "nil"},
	{"on_mount", "proc(Collapsible_Content_State) -> Mount", "nil"},
	{"on_unmount", "proc(Collapsible_Content_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"on_focus", "proc(Collapsible_Content_Event)", "nil"},
	{"on_blur", "proc(Collapsible_Content_Event)", "nil"},
	{"on_mouse_enter", "proc(Collapsible_Content_Event)", "nil"},
	{"on_mouse_leave", "proc(Collapsible_Content_Event)", "nil"},
	{"on_mouse_pressed", "proc(Collapsible_Content_Event)", "nil"},
	{"on_mouse_down", "proc(Collapsible_Content_Event)", "nil"},
	{"on_mouse_released", "proc(Collapsible_Content_Event)", "nil"},
	{"on_mouse_move", "proc(Collapsible_Content_Event)", "nil"},
	{"on_click", "proc(Collapsible_Content_Event)", "nil"},
	{"on_contextmenu", "proc(Collapsible_Content_Event)", "nil"},
	{"on_key_pressed", "proc(Collapsible_Content_Event)", "nil"},
	{"on_key_down", "proc(Collapsible_Content_Event)", "nil"},
	{"on_key_released", "proc(Collapsible_Content_Event)", "nil"},
}

@(private)
COLLAPSIBLE_CONTENT_DOCS_CONFIG := [?]Doc_Prop_Row {
	{"force_mount", "bool", "false"},
	{"disabled", "Cfg(Style_Bool)", "unset"},
}

@(private)
COLLAPSIBLE_HELPERS_DOCS := [?]Doc_Prop_Row {
	{"Collapsible_Is_Open", "proc() -> bool", "false outside a root"},
	{"Collapsible_Set_Open", "proc(open: bool)", "no-op outside a root / when disabled"},
}

@(private)
collapsible_docs_panel_text :: proc(id, text: string) {
	w.Text(
		{
			config = {
				id = id,
				text = text,
				font_size = set.F32(14),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
collapsible_docs_trigger_chrome :: proc(id: string, child: proc(_: w.Collapsible_Trigger_State)) {
	w.Collapsible_Trigger({
		config = {
			id = id,
			width = set.Width(.FIT),
			padding = set.Padding(o.Pd_struct{x = 10, y = 6}),
			background = set.Background(o.Color.SECONDARY),
			radius = set.Radius(f32(6)),
			border = set.Border(f32(1)),
			border_color = set.Border_color(.BORDER),
		},
		child = child,
	})
}

@(private)
collapsible_docs_panel_chrome :: proc(
	id: string,
	force_mount: bool,
	child: proc(_: w.Collapsible_Content_State),
) {
	w.Collapsible_Content({
		config = {
			id = id,
			force_mount = force_mount,
			width = set.Width(.GROW),
			padding = set.Padding(f32(12)),
			background = set.Colors(.SECONDARY),
			border = set.Border(o.Bd{t = 1}),
			border_color = set.Border_color(.BORDER),
			radius = set.Radius(f32(6)),
		},
		child = child,
	})
}

@(private)
collapsible_docs_hero_trigger_child :: proc(_: w.Collapsible_Trigger_State) {
	label := collapsible_demo_open ? "Hide details" : "Show details"
	w.Text(
		{
			config = {
				id = "collapsible_docs_hero_trigger_label",
				text = label,
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
collapsible_docs_hero_panel_child :: proc(_: w.Collapsible_Content_State) {
	collapsible_docs_panel_text(
		"collapsible_docs_hero_panel_body",
		"Content stays in the parent layout flow and expands or collapses with config.open.",
	)
}

@(private)
collapsible_docs_hero_child :: proc(_: w.Collapsible_State) {
	collapsible_docs_trigger_chrome(
		"collapsible_docs_hero_trigger",
		collapsible_docs_hero_trigger_child,
	)
	collapsible_docs_panel_chrome(
		"collapsible_docs_hero_panel",
		false,
		collapsible_docs_hero_panel_child,
	)
}

@(private)
collapsible_docs_hero :: proc(_: w.Rectangle_State) {
	w.Collapsible({
		config = {
			id = "collapsible_docs_hero",
			width = set.Width(f32(420)),
			gap_y = set.Gap_Y(u16(8)),
			open = collapsible_demo_open,
		},
		on_open_change = proc(open: bool) {
			collapsible_demo_open = open
		},
		child = collapsible_docs_hero_child,
	})
}

@(private)
collapsible_docs_disabled_trigger_child :: proc(_: w.Collapsible_Trigger_State) {
	w.Text(
		{
			config = {
				id = "collapsible_docs_disabled_trigger_label",
				text = "Disabled root",
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
collapsible_docs_disabled_panel_child :: proc(_: w.Collapsible_Content_State) {
	collapsible_docs_panel_text(
		"collapsible_docs_disabled_panel_body",
		"Root config.disabled blocks Collapsible_Trigger toggles and Collapsible_Set_Open.",
	)
}

@(private)
collapsible_docs_disabled_child :: proc(_: w.Collapsible_State) {
	collapsible_docs_trigger_chrome(
		"collapsible_docs_disabled_trigger",
		collapsible_docs_disabled_trigger_child,
	)
	collapsible_docs_panel_chrome(
		"collapsible_docs_disabled_panel",
		false,
		collapsible_docs_disabled_panel_child,
	)
}

@(private)
collapsible_docs_disabled_preview :: proc(_: w.Rectangle_State) {
	w.Collapsible({
		config = {
			id = "collapsible_docs_disabled",
			width = set.Width(f32(420)),
			gap_y = set.Gap_Y(u16(8)),
			open = collapsible_demo_disabled_open,
			disabled = set.Disabled(true),
		},
		on_open_change = proc(open: bool) {
			collapsible_demo_disabled_open = open
		},
		child = collapsible_docs_disabled_child,
	})
}

@(private)
collapsible_docs_force_mount_trigger_child :: proc(_: w.Collapsible_Trigger_State) {
	label := collapsible_demo_force_mount_open ? "Hide (force_mount)" : "Show (force_mount)"
	w.Text(
		{
			config = {
				id = "collapsible_docs_force_mount_trigger_label",
				text = label,
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
collapsible_docs_force_mount_panel_child :: proc(_: w.Collapsible_Content_State) {
	collapsible_docs_panel_text(
		"collapsible_docs_force_mount_body",
		"Closed panels stay in the tree as HIDDEN instead of visibility NONE.",
	)
}

@(private)
collapsible_docs_force_mount_child :: proc(_: w.Collapsible_State) {
	collapsible_docs_trigger_chrome(
		"collapsible_docs_force_mount_trigger",
		collapsible_docs_force_mount_trigger_child,
	)
	collapsible_docs_panel_chrome(
		"collapsible_docs_force_mount_panel",
		true,
		collapsible_docs_force_mount_panel_child,
	)
}

@(private)
collapsible_docs_force_mount_preview :: proc(_: w.Rectangle_State) {
	w.Collapsible({
		config = {
			id = "collapsible_docs_force_mount",
			width = set.Width(f32(420)),
			gap_y = set.Gap_Y(u16(8)),
			open = collapsible_demo_force_mount_open,
		},
		on_open_change = proc(open: bool) {
			collapsible_demo_force_mount_open = open
		},
		child = collapsible_docs_force_mount_child,
	})
}

@(private)
collapsible_docs_nested_outer_trigger_child :: proc(_: w.Collapsible_Trigger_State) {
	label := collapsible_demo_nested_outer ? "Hide section" : "Show section"
	w.Text(
		{
			config = {
				id = "collapsible_docs_nested_outer_trigger_label",
				text = label,
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
collapsible_docs_nested_inner_trigger_child :: proc(_: w.Collapsible_Trigger_State) {
	label := collapsible_demo_nested_inner ? "Hide nested" : "Show nested"
	w.Text(
		{
			config = {
				id = "collapsible_docs_nested_inner_trigger_label",
				text = label,
				font_size = set.F32(14),
			},
		},
	)
}

@(private)
collapsible_docs_nested_inner_panel_child :: proc(_: w.Collapsible_Content_State) {
	collapsible_docs_panel_text(
		"collapsible_docs_nested_inner_panel_body",
		"Inner Trigger / Content talk to the nearest Collapsible root.",
	)
}

@(private)
collapsible_docs_nested_inner_child :: proc(_: w.Collapsible_State) {
	collapsible_docs_trigger_chrome(
		"collapsible_docs_nested_inner_trigger",
		collapsible_docs_nested_inner_trigger_child,
	)
	collapsible_docs_panel_chrome(
		"collapsible_docs_nested_inner_panel",
		false,
		collapsible_docs_nested_inner_panel_child,
	)
}

@(private)
collapsible_docs_nested_outer_panel_child :: proc(_: w.Collapsible_Content_State) {
	collapsible_docs_panel_text(
		"collapsible_docs_nested_outer_body",
		"Roots nest via the shared context stack.",
	)
	w.Collapsible({
		config = {
			id = "collapsible_docs_nested_inner",
			width = set.Width(.GROW),
			gap_y = set.Gap_Y(u16(8)),
			open = collapsible_demo_nested_inner,
		},
		on_open_change = proc(open: bool) {
			collapsible_demo_nested_inner = open
		},
		child = collapsible_docs_nested_inner_child,
	})
}

@(private)
collapsible_docs_nested_outer_child :: proc(_: w.Collapsible_State) {
	collapsible_docs_trigger_chrome(
		"collapsible_docs_nested_outer_trigger",
		collapsible_docs_nested_outer_trigger_child,
	)
	w.Collapsible_Content({
		config = {
			id = "collapsible_docs_nested_outer_panel",
			width = set.Width(.GROW),
			padding = set.Padding(f32(12)),
			gap_y = set.Gap_Y(u16(8)),
			background = set.Colors(.SECONDARY),
			border = set.Border(o.Bd{t = 1}),
			border_color = set.Border_color(.BORDER),
			radius = set.Radius(f32(6)),
		},
		child = collapsible_docs_nested_outer_panel_child,
	})
}

@(private)
collapsible_docs_nested_preview :: proc(_: w.Rectangle_State) {
	w.Collapsible({
		config = {
			id = "collapsible_docs_nested_outer",
			width = set.Width(f32(420)),
			gap_y = set.Gap_Y(u16(8)),
			open = collapsible_demo_nested_outer,
		},
		on_open_change = proc(open: bool) {
			collapsible_demo_nested_outer = open
		},
		child = collapsible_docs_nested_outer_child,
	})
}

@(private)
collapsible_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("collapsible_docs_title", "Collapsible")
	doc_lede(
		"collapsible_docs_lede",
		"Composable in-flow expand/collapse: Collapsible + Collapsible_Trigger + Collapsible_Content with caller-owned open.",
	)

	doc_preview("collapsible_docs_hero_preview", collapsible_docs_hero)

	doc_section(
		"collapsible_docs_installation",
		"Installation",
		"Use w.Collapsible as the root with w.Collapsible_Trigger and w.Collapsible_Content in oni/widgets.",
		proc(_: w.Rectangle_State) {
			doc_code("collapsible_docs_installation_code", COLLAPSIBLE_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"collapsible_docs_usage",
		"Usage",
		"config.open is caller-owned. Pass it every frame and update from on_open_change. Trigger and Content must be descendants of the root.",
		proc(_: w.Rectangle_State) {
			doc_code("collapsible_docs_usage_call", COLLAPSIBLE_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"collapsible_docs_composition",
		"Composition",
		"Unlike Dialog / Popover overlays, Collapsible_Content stays in the parent layout and expands or collapses with open.",
		proc(_: w.Rectangle_State) {
			doc_code(
				"collapsible_docs_composition_tree",
				`Collapsible
├── Collapsible_Trigger   // click / keyboard toggles open
└── Collapsible_Content   // in-flow panel; NONE when closed`,
			)
		},
	)

	doc_section(
		"collapsible_docs_disabled",
		"Disabled",
		"config.disabled on Collapsible blocks toggles from Trigger and Collapsible_Set_Open. Trigger also inherits root disabled.",
		proc(_: w.Rectangle_State) {
			doc_preview("collapsible_docs_disabled_preview_wrap", collapsible_docs_disabled_preview)
			doc_code(
				"collapsible_docs_disabled_code",
				`w.Collapsible({
	config = {id = "locked", open = open, disabled = set.Disabled(true)},
	on_open_change = proc(next: bool) { open = next },
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"collapsible_docs_force_mount",
		"Force mount",
		"Closed panels use visibility NONE (removed from layout) unless config.force_mount keeps them in the tree as HIDDEN.",
		proc(_: w.Rectangle_State) {
			doc_preview(
				"collapsible_docs_force_mount_preview_wrap",
				collapsible_docs_force_mount_preview,
			)
			doc_code(
				"collapsible_docs_force_mount_code",
				`w.Collapsible_Content({
	config = {id = "panel", force_mount = true},
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"collapsible_docs_nested",
		"Nested",
		"Collapsible roots nest. Parts bind to the nearest root via the shared context stack in collapsible_shared.odin.",
		proc(_: w.Rectangle_State) {
			doc_preview("collapsible_docs_nested_preview_wrap", collapsible_docs_nested_preview)
		},
	)

	doc_section(
		"collapsible_docs_helpers",
		"Helpers",
		"Inside a root child tree, query or set open without threading props.",
		proc(_: w.Rectangle_State) {
			doc_code(
				"collapsible_docs_helpers_code",
				`if w.Collapsible_Is_Open() {
	// ...
}
w.Collapsible_Set_Open(true)`,
			)
		},
	)

	doc_section(
		"collapsible_docs_api",
		"API Reference",
		"w.Collapsible, w.Collapsible_Trigger, and w.Collapsible_Content in oni/widgets/collapsible*.odin.",
		proc(_: w.Rectangle_State) {
			doc_h3("collapsible_docs_api_root_props_h3", "Collapsible props")
			doc_muted(
				"collapsible_docs_api_root_note",
				"Pass config.open every frame. on_open_change receives the next open flag after a successful toggle.",
			)
			doc_table("collapsible_docs_root_props_table", COLLAPSIBLE_DOCS_PROPS[:])

			doc_h3("collapsible_docs_api_root_config_h3", "Collapsible config")
			doc_table("collapsible_docs_root_config_table", COLLAPSIBLE_DOCS_CONFIG[:])

			doc_h3("collapsible_docs_api_trigger_props_h3", "Collapsible_Trigger props")
			doc_muted(
				"collapsible_docs_api_trigger_note",
				"Trigger is inert outside Collapsible. Click and keyboard activation toggle open; user on_click runs after the toggle.",
			)
			doc_table("collapsible_docs_trigger_props_table", COLLAPSIBLE_TRIGGER_DOCS_PROPS[:])

			doc_h3("collapsible_docs_api_trigger_config_h3", "Collapsible_Trigger config")
			doc_table("collapsible_docs_trigger_config_table", COLLAPSIBLE_TRIGGER_DOCS_CONFIG[:])

			doc_h3("collapsible_docs_api_content_props_h3", "Collapsible_Content props")
			doc_muted(
				"collapsible_docs_api_content_note",
				"Outside a Collapsible root the panel stays inert and hidden. frame_state.open mirrors the nearest root.",
			)
			doc_table("collapsible_docs_content_props_table", COLLAPSIBLE_CONTENT_DOCS_PROPS[:])

			doc_h3("collapsible_docs_api_content_config_h3", "Collapsible_Content config")
			doc_table("collapsible_docs_content_config_table", COLLAPSIBLE_CONTENT_DOCS_CONFIG[:])

			doc_h3("collapsible_docs_api_helpers_h3", "Helpers")
			doc_table("collapsible_docs_helpers_table", COLLAPSIBLE_HELPERS_DOCS[:])

			doc_h3("collapsible_docs_api_layout_config_h3", "Layout config")
			doc_muted(
				"collapsible_docs_api_layout_config_note",
				"Shared Widget_Config layout fields (width, padding, gap, …) apply on each widget config.",
			)
			doc_table("collapsible_docs_config_table", DOC_WIDGET_CONFIG[:])
		},
	)
}

Widget_Collapsible :: proc() {
	doc_page("collapsible_docs", collapsible_docs_body)
}
