package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"

@(private)
context_menu_demo_open := false

@(private)
context_menu_demo_last_action := "Right-click the surface"

@(private)
CONTEXT_MENU_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
CONTEXT_MENU_DOCS_USAGE_CALL :: `w.Context_Menu({
	config = {id = "file", open = open},
	on_open_change = proc(next: bool) { open = next },
	child = proc(_: w.Context_Menu_State) {
		w.Context_Menu_Trigger({
			config = {id = "file_trigger", width = set.Width(.FIT), height = set.Height(.FIT)},
			child = proc(_: w.Context_Menu_Trigger_State) {
				w.Text({config = {id = "file_trigger_label", text = "Right-click here"}})
			},
		})
		w.Context_Menu_Content({
			config = {width = set.Width(.FIT)},
			child = proc(_: w.Context_Menu_Content_Props_State) {
				w.Context_Menu_Item({
					config = {id = "file_open"},
					on_click = proc(_: w.Context_Menu_Item_Event) { /* … */ },
					child = proc(_: w.Context_Menu_Item_State) {
						w.Text({config = {id = "file_open_label", text = "Open"}})
					},
				})
				w.Context_Menu_Separator({config = {id = "file_sep"}})
				w.Context_Menu_Item({
					config = {id = "file_delete"},
					child = proc(_: w.Context_Menu_Item_State) {
						w.Text({config = {id = "file_delete_label", text = "Delete"}})
					},
				})
			},
		})
	},
})`

@(private)
CONTEXT_MENU_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Context_Menu_Config (open + Widget_Config)", "{}"},
	{"on_open_change", "proc(open: bool)", "nil"},
	{"child", "proc(Context_Menu_State)", "nil"},
	{"on_mount", "proc(Context_Menu_State) -> Mount", "nil"},
	{"on_unmount", "proc(Context_Menu_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"on_focus", "proc(Context_Menu_Event)", "nil"},
	{"on_blur", "proc(Context_Menu_Event)", "nil"},
	{"on_mouse_enter", "proc(Context_Menu_Event)", "nil"},
	{"on_mouse_leave", "proc(Context_Menu_Event)", "nil"},
	{"on_mouse_pressed", "proc(Context_Menu_Event)", "nil"},
	{"on_mouse_down", "proc(Context_Menu_Event)", "nil"},
	{"on_mouse_released", "proc(Context_Menu_Event)", "nil"},
	{"on_mouse_move", "proc(Context_Menu_Event)", "nil"},
	{"on_click", "proc(Context_Menu_Event)", "nil"},
	{"on_contextmenu", "proc(Context_Menu_Event)", "nil"},
	{"on_key_pressed", "proc(Context_Menu_Event)", "nil"},
	{"on_key_down", "proc(Context_Menu_Event)", "nil"},
	{"on_key_released", "proc(Context_Menu_Event)", "nil"},
}

@(private)
CONTEXT_MENU_DOCS_CONFIG := [?]Doc_Prop_Row {
	{"open", "bool", "false"},
	{"disabled", "Cfg(Style_Bool)", "set.Disabled(true)"},
}

@(private)
CONTEXT_MENU_TRIGGER_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Context_Menu_Trigger_Config (= Widget_Config)", "{}"},
	{"child", "proc(Context_Menu_Trigger_State)", "nil"},
	{"on_contextmenu", "proc(Context_Menu_Trigger_Event)", "nil — runs after open-at-pointer"},
	{"on_click", "proc(Context_Menu_Trigger_Event)", "nil — left-click closes if open"},
}

@(private)
CONTEXT_MENU_CONTENT_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Context_Menu_Content_Props_Config (placement + Widget_Config)", "{}"},
	{"config.anchor_align", "Context_Menu_Align", ".START"},
	{"config.anchor_gap", "f32", "0"},
	{"config.viewport_margin", "f32", "8"},
	{"child", "proc(Context_Menu_Content_Props_State)", "nil"},
}

@(private)
CONTEXT_MENU_ITEM_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Context_Menu_Item_Config (= Widget_Config)", "{}"},
	{"child", "proc(Context_Menu_Item_State)", "nil"},
	{"on_click", "proc(Context_Menu_Item_Event)", "nil — runs then closes menu"},
	{"disabled", "Cfg(Style_Bool) on config", "set.Disabled(true)"},
}

@(private)
CONTEXT_MENU_SEPARATOR_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Context_Menu_Separator_Config (= Widget_Config)", "{}"},
	{"child", "proc(Context_Menu_Separator_State)", "nil"},
}

@(private)
CONTEXT_MENU_HELPERS_DOCS := [?]Doc_Prop_Row {
	{"Context_Menu_Is_Open", "proc() -> bool", "false outside a root"},
	{"Context_Menu_Set_Open", "proc(open: bool)", "no-op outside / when disabled"},
}

@(private)
context_menu_docs_item_label :: proc(id, text: string) {
	w.Text({config = {id = id, text = text, font_size = set.F32(12)}})
}

@(private)
context_menu_docs_on_back :: proc(_: w.Context_Menu_Item_Event) {
	context_menu_demo_last_action = "Back"
}

@(private)
context_menu_docs_on_forward :: proc(_: w.Context_Menu_Item_Event) {
	context_menu_demo_last_action = "Forward"
}

@(private)
context_menu_docs_on_reload :: proc(_: w.Context_Menu_Item_Event) {
	context_menu_demo_last_action = "Reload"
}

@(private)
context_menu_docs_on_copy :: proc(_: w.Context_Menu_Item_Event) {
	context_menu_demo_last_action = "Copy"
}

@(private)
context_menu_docs_on_paste :: proc(_: w.Context_Menu_Item_Event) {
	context_menu_demo_last_action = "Paste"
}

@(private)
context_menu_docs_hero_trigger_child :: proc(_: w.Context_Menu_Trigger_State) {
	w.Text(
		{
			config = {
				id = "context_menu_docs_hero_trigger_label",
				text = "Right-click this surface",
				font_size = set.F32(14),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
context_menu_docs_hero_content_child :: proc(_: w.Context_Menu_Content_Props_State) {
	w.Context_Menu_Item({
		config = {id = "context_menu_docs_hero_back"},
		on_click = context_menu_docs_on_back,
		child = proc(_: w.Context_Menu_Item_State) {
			context_menu_docs_item_label("context_menu_docs_hero_back_label", "Back")
		},
	})
	w.Context_Menu_Item({
		config = {id = "context_menu_docs_hero_forward"},
		on_click = context_menu_docs_on_forward,
		child = proc(_: w.Context_Menu_Item_State) {
			context_menu_docs_item_label("context_menu_docs_hero_forward_label", "Forward")
		},
	})
	w.Context_Menu_Separator({config = {id = "context_menu_docs_hero_sep"}})
	w.Context_Menu_Item({
		config = {id = "context_menu_docs_hero_reload"},
		on_click = context_menu_docs_on_reload,
		child = proc(_: w.Context_Menu_Item_State) {
			context_menu_docs_item_label("context_menu_docs_hero_reload_label", "Reload")
		},
	})
	w.Context_Menu_Item({
		config = {id = "context_menu_docs_hero_locked", disabled = set.Disabled(true)},
		child = proc(_: w.Context_Menu_Item_State) {
			context_menu_docs_item_label("context_menu_docs_hero_locked_label", "Locked")
		},
	})
}

@(private)
context_menu_docs_hero_child :: proc(_: w.Context_Menu_State) {
	w.Context_Menu_Trigger(
		{
			config = {
				id = "context_menu_docs_hero_trigger",
				width = set.Width(.FIT),
				height = set.Height(.FIT),
				padding = set.Padding(f32(16)),
				background = set.Background(o.Color.SECONDARY),
				border = set.Border(f32(1)),
				border_color = set.Border_color(.BORDER),
				radius = set.Radius(f32(8)),
				justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
			},
			child = context_menu_docs_hero_trigger_child,
		},
	)
	w.Context_Menu_Content(
		{config = {width = set.Width(f32(180))}, child = context_menu_docs_hero_content_child},
	)
}

@(private)
context_menu_docs_hero_status :: proc(_: w.Rectangle_State) {
	w.Text(
		{
			config = {
				id = "context_menu_docs_hero_status",
				text = context_menu_demo_last_action,
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
context_menu_docs_hero_col_child :: proc(_: w.Rectangle_State) {
	w.Context_Menu({
		config = {id = "context_menu_docs_hero", open = context_menu_demo_open},
		on_open_change = proc(open: bool) {
			context_menu_demo_open = open
		},
		child = context_menu_docs_hero_child,
	})
	context_menu_docs_hero_status({})
}

@(private)
context_menu_docs_hero :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "context_menu_docs_hero_col",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(8)),
			},
			child = context_menu_docs_hero_col_child,
		},
	)
}

@(private)
context_menu_docs_align_content_child :: proc(_: w.Context_Menu_Content_Props_State) {
	w.Context_Menu_Item({
		config = {id = "context_menu_docs_align_copy"},
		on_click = context_menu_docs_on_copy,
		child = proc(_: w.Context_Menu_Item_State) {
			context_menu_docs_item_label("context_menu_docs_align_copy_label", "Copy")
		},
	})
	w.Context_Menu_Item({
		config = {id = "context_menu_docs_align_paste"},
		on_click = context_menu_docs_on_paste,
		child = proc(_: w.Context_Menu_Item_State) {
			context_menu_docs_item_label("context_menu_docs_align_paste_label", "Paste")
		},
	})
}

@(private)
context_menu_demo_align_open := false

@(private)
context_menu_docs_align_trigger_child :: proc(_: w.Context_Menu_Trigger_State) {
	w.Text(
		{
			config = {
				id = "context_menu_docs_align_trigger_label",
				text = "Right-click · anchor_align=.END",
				font_size = set.F32(14),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
context_menu_docs_align_child :: proc(_: w.Context_Menu_State) {
	w.Context_Menu_Trigger(
		{
			config = {
				id = "context_menu_docs_align_trigger",
				width = set.Width(.FIT),
				height = set.Height(.FIT),
				padding = set.Padding(f32(12)),
				background = set.Background(o.Color.SECONDARY),
				border = set.Border(f32(1)),
				border_color = set.Border_color(.BORDER),
				radius = set.Radius(f32(8)),
				justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
			},
			child = context_menu_docs_align_trigger_child,
		},
	)
	w.Context_Menu_Content(
		{
			config = {width = set.Width(f32(160)), anchor_align = .END, anchor_gap = 4},
			child = context_menu_docs_align_content_child,
		},
	)
}

@(private)
context_menu_docs_align_preview :: proc(_: w.Rectangle_State) {
	w.Context_Menu({
		config = {id = "context_menu_docs_align", open = context_menu_demo_align_open},
		on_open_change = proc(open: bool) {
			context_menu_demo_align_open = open
		},
		child = context_menu_docs_align_child,
	})
}

@(private)
context_menu_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("context_menu_docs_title", "Context Menu")
	doc_lede(
		"context_menu_docs_lede",
		"Pointer-anchored menu: controlled open, Context_Menu_Trigger, Content, Item, and Separator.",
	)

	doc_preview("context_menu_docs_hero_preview", context_menu_docs_hero)

	doc_section(
		"context_menu_docs_installation",
		"Installation",
		"Use w.Context_Menu as the root with Trigger, Content, Item, and Separator in oni/widgets.",
		proc(_: w.Rectangle_State) {
			doc_code("context_menu_docs_installation_code", CONTEXT_MENU_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"context_menu_docs_usage",
		"Usage",
		"config.open is caller-owned. Right-click (contextmenu) on the trigger opens Content at the pointer. Escape and outside press dismiss.",
		proc(_: w.Rectangle_State) {
			doc_code("context_menu_docs_usage_call", CONTEXT_MENU_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"context_menu_docs_composition",
		"Composition",
		"Content paints in .POPOVER space. Left-click on the trigger closes when open but does not open. Item click runs on_click then closes.",
		proc(_: w.Rectangle_State) {
			doc_code(
				"context_menu_docs_composition_tree",
				`Context_Menu
├── Context_Menu_Trigger
└── Context_Menu_Content
    ├── Context_Menu_Item
    ├── Context_Menu_Separator
    └── Context_Menu_Item`,
			)
		},
	)

	doc_section(
		"context_menu_docs_align",
		"Align",
		"config.anchor_align / anchor_gap / viewport_margin place the panel relative to the pointer (or trigger fallback).",
		proc(_: w.Rectangle_State) {
			doc_preview("context_menu_docs_align_preview_wrap", context_menu_docs_align_preview)
			doc_code(
				"context_menu_docs_align_code",
				`w.Context_Menu_Content({
	config = {width = set.Width(f32(160)), anchor_align = .END, anchor_gap = 4},
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"context_menu_docs_helpers",
		"Helpers",
		"Inside a root child tree, query or set open without threading props.",
		proc(_: w.Rectangle_State) {
			doc_code(
				"context_menu_docs_helpers_code",
				`if w.Context_Menu_Is_Open() {
	// ...
}
w.Context_Menu_Set_Open(false)`,
			)
		},
	)

	doc_section(
		"context_menu_docs_api",
		"API Reference",
		"w.Context_Menu and parts in oni/widgets/context_menu*.odin. Shared context in context_menu_shared.odin.",
		proc(_: w.Rectangle_State) {
			doc_h3("context_menu_docs_api_root_props_h3", "Context_Menu props")
			doc_muted(
				"context_menu_docs_api_root_note",
				"Pass config.open every frame. on_open_change receives the next open flag after open/dismiss.",
			)
			doc_table("context_menu_docs_root_props_table", CONTEXT_MENU_DOCS_PROPS[:])

			doc_h3("context_menu_docs_api_root_config_h3", "Context_Menu config")
			doc_table("context_menu_docs_root_config_table", CONTEXT_MENU_DOCS_CONFIG[:])

			doc_h3("context_menu_docs_api_trigger_h3", "Context_Menu_Trigger props")
			doc_muted(
				"context_menu_docs_api_trigger_note",
				"Trigger is inert outside Context_Menu. Inherits root disabled.",
			)
			doc_table("context_menu_docs_trigger_props_table", CONTEXT_MENU_TRIGGER_DOCS_PROPS[:])

			doc_h3("context_menu_docs_api_content_h3", "Context_Menu_Content props")
			doc_muted(
				"context_menu_docs_api_content_note",
				"Skipped while closed. Outside a root the content is inert. Context_Menu_Align: START | CENTER | END.",
			)
			doc_table("context_menu_docs_content_props_table", CONTEXT_MENU_CONTENT_DOCS_PROPS[:])

			doc_h3("context_menu_docs_api_item_h3", "Context_Menu_Item props")
			doc_table("context_menu_docs_item_props_table", CONTEXT_MENU_ITEM_DOCS_PROPS[:])

			doc_h3("context_menu_docs_api_sep_h3", "Context_Menu_Separator props")
			doc_table("context_menu_docs_sep_props_table", CONTEXT_MENU_SEPARATOR_DOCS_PROPS[:])

			doc_h3("context_menu_docs_api_helpers_h3", "Helpers")
			doc_table("context_menu_docs_helpers_table", CONTEXT_MENU_HELPERS_DOCS[:])

			doc_h3("context_menu_docs_api_layout_config_h3", "Layout config")
			doc_muted(
				"context_menu_docs_api_layout_config_note",
				"Shared Widget_Config layout fields (width, padding, gap, …) apply on each widget config.",
			)
			doc_table("context_menu_docs_config_table", DOC_WIDGET_CONFIG[:])
		},
	)
}

Widget_Context_Menu :: proc() {
	doc_page("context_menu_docs", context_menu_docs_body)
}
