package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"

@(private)
RECTANGLE_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
RECTANGLE_DOCS_USAGE_CALL :: `w.Rectangle({
	config = {
		id = "panel",
		direction = set.Direction(.VERTICAL),
		padding = set.Padding(16),
		gap_y = set.Gap_Y(u16(8)),
		background = set.Colors(o.Color.MUTED),
		radius = set.Radius(8),
	},
	child = proc(state: w.Rectangle_State) {
		// children
	},
})`

@(private)
RECTANGLE_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Rectangle_Config (= Widget_Config)", "{}"},
	{"child", "proc(Rectangle_State)", "nil"},
	{"on_mount", "proc(Rectangle_State) -> Mount", "nil"},
	{"on_unmount", "proc(Rectangle_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"scroll_bar", "Scroll_Bar_Style", "{}"},
	{"on_focus", "proc(Rectangle_Event)", "nil"},
	{"on_blur", "proc(Rectangle_Event)", "nil"},
	{"on_mouse_enter", "proc(Rectangle_Event)", "nil"},
	{"on_mouse_leave", "proc(Rectangle_Event)", "nil"},
	{"on_mouse_pressed", "proc(Rectangle_Event)", "nil"},
	{"on_mouse_down", "proc(Rectangle_Event)", "nil"},
	{"on_mouse_released", "proc(Rectangle_Event)", "nil"},
	{"on_mouse_move", "proc(Rectangle_Event)", "nil"},
	{"on_click", "proc(Rectangle_Event)", "nil"},
	{"on_contextmenu", "proc(Rectangle_Event)", "nil"},
	{"on_key_pressed", "proc(Rectangle_Event)", "nil"},
	{"on_key_down", "proc(Rectangle_Event)", "nil"},
	{"on_key_released", "proc(Rectangle_Event)", "nil"},
}

@(private)
rectangle_docs_hero :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "rectangle_docs_hero",
				width = set.Width(200),
				height = set.Height(120),
				background = set.Background(.SKY_500),
				radius = set.Radius(8),
			},
		},
	)
}

@(private)
rectangle_docs_sized_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "rectangle_docs_sized",
				width = set.Width(240),
				height = set.Height(140),
				background = set.Colors(o.Color.PRIMARY),
				radius = set.Radius(12),
				justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
			},
			child = rectangle_docs_sized_label,
		},
	)
}

@(private)
rectangle_docs_sized_label :: proc(_: w.Rectangle_State) {
	w.Text(
		{
			config = {
				id = "rectangle_docs_sized_label",
				text = "240 × 140",
				font_size = set.F32(14),
				color = set.Colors(o.Color.PRIMARY_FOREGROUND),
				tabbable = set.Tabbable(false),
			},
		},
	)
}

@(private)
rectangle_docs_nested_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "rectangle_docs_outer",
				width = set.Width(320),
				padding = set.Padding(16),
				gap_y = set.Gap_Y(u16(8)),
				direction = set.Direction(.VERTICAL),
				background = set.Colors(o.Color.MUTED),
				border = set.Border(1),
				border_color = set.Border_color(o.Color.BORDER),
				radius = set.Radius(8),
			},
			child = rectangle_docs_nested_inner,
		},
	)
}

@(private)
rectangle_docs_nested_inner :: proc(_: w.Rectangle_State) {
	w.Text(
		{
			config = {
				id = "rectangle_docs_nested_title",
				text = "Outer panel",
				font_size = set.F32(14),
				font = set.Font(o.theme.font_heading),
			},
		},
	)
	w.Rectangle(
		{
			config = {
				id = "rectangle_docs_inner",
				padding = set.Padding(12),
				background = set.Colors(o.Color.BACKGROUND),
				border = set.Border(1),
				border_color = set.Border_color(o.Color.BORDER),
				radius = set.Radius(6),
			},
			child = rectangle_docs_nested_body,
		},
	)
}

@(private)
rectangle_docs_nested_body :: proc(_: w.Rectangle_State) {
	w.Text(
		{
			config = {
				id = "rectangle_docs_nested_body",
				text = "Nested child content",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
rectangle_docs_overflow_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "rectangle_docs_overflow",
				width = set.Width(280),
				height = set.Height(120),
				padding = set.Padding(12),
				overflow_y = set.Overflow_Y(.AUTO),
				background = set.Colors(o.Color.MUTED),
				border = set.Border(1),
				border_color = set.Border_color(o.Color.BORDER),
				radius = set.Radius(8),
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(6)),
			},
			child = rectangle_docs_overflow_list,
		},
	)
}

@(private)
rectangle_docs_overflow_list :: proc(_: w.Rectangle_State) {
	for i in 0 ..< 8 {
		w.Text(
			{
				config = {
					id = fmt.tprintf("rectangle_docs_overflow_line_%d", i),
					text = fmt.tprintf("Scrollable row %d", i + 1),
					font_size = set.F32(13),
				},
			},
		)
	}
}

@(private)
rectangle_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("rectangle_docs_title", "Rectangle")
	doc_lede(
		"rectangle_docs_lede",
		"Flex layout container: direction, gap, padding, background, borders, overflow, and full pointer or keyboard interaction on the box.",
	)

	doc_preview("rectangle_docs_hero_preview", rectangle_docs_hero)

	doc_section(
		"rectangle_docs_installation",
		"Installation",
		"Rectangle is the foundational layout widget in oni/widgets. Most widgets and doc helpers compose Rectangle.",
		proc(_: w.Rectangle_State) {
			doc_code("rectangle_docs_installation_code", RECTANGLE_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"rectangle_docs_usage",
		"Usage",
		"Pass child to build a tree. Layout runs on the layout pass; chrome and children draw on the draw pass.",
		proc(_: w.Rectangle_State) {
			doc_code("rectangle_docs_usage_call", RECTANGLE_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"rectangle_docs_sized",
		"Sized box",
		"Fixed width and height define a colored region. Use justify to center labels inside the box.",
		proc(_: w.Rectangle_State) {
			doc_preview("rectangle_docs_sized_preview_wrap", rectangle_docs_sized_preview)
			doc_code(
				"rectangle_docs_sized_code",
				`w.Rectangle({
	config = {
		id = "card",
		width = set.Width(240),
		height = set.Height(140),
		background = set.Colors(o.Color.PRIMARY),
		radius = set.Radius(12),
		justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
	},
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"rectangle_docs_nested",
		"Nested children",
		"Stack vertical sections with gap_y and nest another Rectangle for inset surfaces.",
		proc(_: w.Rectangle_State) {
			doc_preview("rectangle_docs_nested_preview_wrap", rectangle_docs_nested_preview)
			doc_code(
				"rectangle_docs_nested_code",
				`w.Rectangle({
	config = {
		id = "outer",
		direction = set.Direction(.VERTICAL),
		gap_y = set.Gap_Y(u16(8)),
		padding = set.Padding(16),
	},
	child = proc(_: w.Rectangle_State) {
		w.Rectangle({config = {id = "inner", padding = set.Padding(12)}, child = ...})
	},
})`,
			)
		},
	)

	doc_section(
		"rectangle_docs_overflow",
		"Overflow",
		"overflow_y = .AUTO adds scrolling when children exceed the fixed height. Pair with on_scroll when you need scroll offsets.",
		proc(_: w.Rectangle_State) {
			doc_preview("rectangle_docs_overflow_preview_wrap", rectangle_docs_overflow_preview)
			doc_code(
				"rectangle_docs_overflow_code",
				`w.Rectangle({
	config = {
		id = "scroll",
		width = set.Width(280),
		height = set.Height(120),
		overflow_y = set.Overflow_Y(.AUTO),
		direction = set.Direction(.VERTICAL),
	},
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"rectangle_docs_api",
		"API Reference",
		"w.Rectangle in oni/widgets/rectangle.odin. Rectangle_Config is Widget_Config.",
		proc(_: w.Rectangle_State) {
			doc_h3("rectangle_docs_api_props_h3", "Props")
			doc_table("rectangle_docs_props_table", RECTANGLE_DOCS_PROPS[:])

			doc_h3("rectangle_docs_api_config_h3", "Config")
			doc_table("rectangle_docs_config_table", DOC_WIDGET_CONFIG[:])
		},
	)
}

Widget_Rectangle :: proc() {
	doc_page("rectangle_docs", rectangle_docs_body)
}
