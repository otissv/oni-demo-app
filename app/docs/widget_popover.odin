package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"

@(private)
popover_demo_open := false

@(private)
popover_demo_align_open := false

@(private)
POPOVER_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
POPOVER_DOCS_USAGE_CALL :: `w.Popover({
	config = {id = "dimensions"},
	open = open,
	on_open_change = proc(next: bool) { open = next },
	child = proc(_: w.Popover_State) {
		w.Popover_Trigger({
			config = {id = "dimensions_trigger"},
			child = proc(_: w.Popover_Trigger_State) {
				w.Text({config = {id = "dimensions_trigger_label", text = "Open"}})
			},
		})
		w.Popover_Content({
			config = {width = set.Width(f32(240)), padding = set.Padding(f32(12))},
			child = proc(_: w.Popover_Content_Props_State) {
				w.Text({config = {id = "dimensions_body", text = "Popover content"}})
			},
		})
	},
})`

@(private)
POPOVER_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Popover_Config (= Widget_Config)", "{}"},
	{"open", "bool", "false"},
	{"disabled", "bool", "false"},
	{"on_open_change", "proc(open: bool)", "nil"},
	{"child", "proc(Popover_State)", "nil"},
}

@(private)
POPOVER_TRIGGER_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Popover_Trigger_Config (= Widget_Config)", "{}"},
	{"child", "proc(Popover_Trigger_State)", "nil"},
	{"on_click", "proc(Popover_Trigger_Event)", "nil"},
}

@(private)
POPOVER_CONTENT_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Popover_Content_Props_Config (= Widget_Config)", "{}"},
	{"align", "Popover_Align", ".START"},
	{"match_trigger_width", "bool", "false"},
	{"gap", "f32", "4"},
	{"side_margin", "f32", "8"},
	{"child", "proc(Popover_Content_Props_State)", "nil"},
}

@(private)
popover_demo_basic_child :: proc(_: w.Popover_State) {
	w.Popover_Trigger({
		config = {id = "popover-demo-trigger"},
		child = proc(_: w.Popover_Trigger_State) {
			label := popover_demo_open ? "Close" : "Open popover"
			w.Text({config = {id = "popover-demo-trigger-label", text = label}})
		},
	})
	w.Popover_Content({
		config = {
			width = set.Width(f32(260)),
			padding = set.Padding(f32(12)),
			gap_y = set.Gap_Y(u16(8)),
			direction = set.Direction(.VERTICAL),
		},
		child = proc(_: w.Popover_Content_Props_State) {
			w.Text({config = {id = "popover-demo-title", text = "Dimensions"}})
			w.Text(
				{
					config = {
						id = "popover-demo-body",
						text = "Set the dimensions for the layer.",
						color = set.Colors(o.Color.MUTED_FOREGROUND),
					},
				},
			)
		},
	})
}

@(private)
popover_demo_align_child :: proc(_: w.Popover_State) {
	w.Popover_Trigger({
		config = {id = "popover-align-trigger", width = set.Width(f32(200))},
		child = proc(_: w.Popover_Trigger_State) {
			w.Text({config = {id = "popover-align-trigger-label", text = "Align end"}})
		},
	})
	w.Popover_Content({
		config = {width = set.Width(f32(120)), padding = set.Padding(f32(10))},
		align = .END,
		child = proc(_: w.Popover_Content_Props_State) {
			w.Text(
				{
					config = {
						id = "popover-align-body",
						text = "align=.END",
						width = set.Width(.FIT),
					},
				},
			)
		},
	})
}

@(private)
popover_docs_basic_preview :: proc(_: w.Rectangle_State) {
	w.Popover({
		config = {id = "popover-demo"},
		open = popover_demo_open,
		on_open_change = proc(open: bool) {
			popover_demo_open = open
		},
		child = popover_demo_basic_child,
	})
}

@(private)
popover_docs_align_preview :: proc(_: w.Rectangle_State) {
	w.Popover({
		config = {id = "popover-align-demo"},
		open = popover_demo_align_open,
		on_open_change = proc(open: bool) {
			popover_demo_align_open = open
		},
		child = popover_demo_align_child,
	})
}

@(private)
popover_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("popover_docs_title", "Popover")
	doc_lede(
		"popover_docs_lede",
		"shadcn-style floating panel: controlled open state, Popover_Trigger, and viewport-aware Popover_Content.",
	)

	doc_section(
		"popover_docs_usage",
		"Usage",
		"Own open state and compose Trigger + Content inside the root child.",
		proc(_: w.Rectangle_State) {
			doc_code("popover_docs_usage_import", POPOVER_DOCS_USAGE_IMPORT)
			doc_code("popover_docs_usage_call", POPOVER_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"popover_docs_composition",
		"Composition",
		"Popover → Popover_Trigger + Popover_Content. Escape and outside click dismiss while open.",
		proc(_: w.Rectangle_State) {
			doc_code(
				"popover_docs_composition_tree",
				`Popover
├── Popover_Trigger
└── Popover_Content`,
			)
		},
	)

	doc_section(
		"popover_docs_basic",
		"Basic",
		"Click the trigger to open anchored content in .POPOVER space.",
		proc(_: w.Rectangle_State) {
			doc_preview("popover_docs_basic_preview_wrap", popover_docs_basic_preview)
		},
	)

	doc_section(
		"popover_docs_align",
		"Align",
		"align positions the panel against the trigger (.START / .CENTER / .END). Use a narrower panel than the trigger to see .END; match_trigger_width makes widths equal so align is a no-op.",
		proc(_: w.Rectangle_State) {
			doc_preview("popover_docs_align_preview_wrap", popover_docs_align_preview)
		},
	)

	doc_section(
		"popover_docs_api",
		"API Reference",
		"w.Popover, w.Popover_Trigger, and w.Popover_Content in oni/widgets/popover*.odin.",
		proc(_: w.Rectangle_State) {
			doc_h3("popover_docs_api_root_h3", "Popover props")
			doc_table("popover_docs_root_props", POPOVER_DOCS_PROPS[:])
			doc_h3("popover_docs_api_trigger_h3", "Popover_Trigger props")
			doc_table("popover_docs_trigger_props", POPOVER_TRIGGER_DOCS_PROPS[:])
			doc_h3("popover_docs_api_content_h3", "Popover_Content props")
			doc_table("popover_docs_content_props", POPOVER_CONTENT_DOCS_PROPS[:])
		},
	)
}

Widget_Popover :: proc() {
	doc_page("popover_docs", popover_docs_body)
}
