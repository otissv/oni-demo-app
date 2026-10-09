package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"

@(private)
TABLE_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
TABLE_DOCS_USAGE_CALL :: `w.Table({
	config = {id = "scores", border = set.Border(1), radius = set.Radius(8)},
	child = proc(_: w.Table_State) {
		w.Table_Head({ config = {id = "head"}, child = ... })
		w.Table_Body({ config = {id = "body"}, child = ... })
	},
})`

@(private)
TABLE_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Table_Config (= Widget_Config)", "{}"},
	{"child", "proc(Table_State)", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_mount", "proc(Table_State) -> Mount", "nil"},
	{"on_unmount", "proc(Table_State) -> Mount", "nil"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"scroll_bar", "Scroll_Bar_Style", "{}"},
	{"on_focus", "proc(Table_Event)", "nil"},
	{"on_blur", "proc(Table_Event)", "nil"},
	{"on_mouse_enter", "proc(Table_Event)", "nil"},
	{"on_mouse_leave", "proc(Table_Event)", "nil"},
	{"on_mouse_pressed", "proc(Table_Event)", "nil"},
	{"on_mouse_down", "proc(Table_Event)", "nil"},
	{"on_mouse_released", "proc(Table_Event)", "nil"},
	{"on_mouse_move", "proc(Table_Event)", "nil"},
	{"on_click", "proc(Table_Event)", "nil"},
	{"on_contextmenu", "proc(Table_Event)", "nil"},
	{"on_key_pressed", "proc(Table_Event)", "nil"},
	{"on_key_down", "proc(Table_Event)", "nil"},
	{"on_key_released", "proc(Table_Event)", "nil"},
}

@(private)
TABLE_DOCS_PARTS := [?]Doc_Prop_Row {
	{"Table_Head", "proc(Table_Head_Props)", "Header section; column headings"},
	{"Table_Body", "proc(Table_Body_Props)", "Main data rows"},
	{"Table_Foot", "proc(Table_Foot_Props)", "Footer section"},
	{"Table_Caption", "proc(Table_Caption_Props)", "Accessible caption above/below table"},
	{"Table_Row", "proc(Table_Row_Props)", "Horizontal row inside head/body/foot"},
	{"Table_Heading", "proc(Table_Heading_Props)", "Header cell (th)"},
	{"Table_Cell", "proc(Table_Cell_Props)", "Data cell (td)"},
}

@(private)
table_docs_player_h1_text :: proc(_: w.Table_Heading_State) {
	w.Text({config = {id = "table_docs_h_player", text = "Player Name"}})
}

@(private)
table_docs_player_h2_text :: proc(_: w.Table_Heading_State) {
	w.Text({config = {id = "table_docs_h_items", text = "Items"}})
}

@(private)
table_docs_player_h3_text :: proc(_: w.Table_Heading_State) {
	w.Text({config = {id = "table_docs_h_score", text = "Score"}})
}

@(private)
table_docs_player_head_row :: proc(_: w.Table_Row_State) {
	w.Table_Heading({
		config = {id = "table_docs_th_player", border = set.Border(.INHERIT)},
		child = table_docs_player_h1_text,
	})
	w.Table_Heading({
		config = {id = "table_docs_th_items", border = set.Border(.INHERIT)},
		child = table_docs_player_h2_text,
	})
	w.Table_Heading({
		config = {id = "table_docs_th_score", border = set.Border(.INHERIT)},
		child = table_docs_player_h3_text,
	})
}

@(private)
table_docs_player_head :: proc(_: w.Table_Head_State) {
	w.Table_Row({
		config = {id = "table_docs_head_row", border = set.Border(.INHERIT)},
		child = table_docs_player_head_row,
	})
}

@(private)
table_docs_r1_c1_text :: proc(_: w.Table_Cell_State) {
	w.Text({config = {id = "table_docs_r1_c1_text", text = "Player 1"}})
}

@(private)
table_docs_r1_c2_text :: proc(_: w.Table_Cell_State) {
	w.Text({config = {id = "table_docs_r1_c2_text", text = "10"}})
}

@(private)
table_docs_r1_c3_text :: proc(_: w.Table_Cell_State) {
	w.Text({config = {id = "table_docs_r1_c3_text", text = "1"}})
}

@(private)
table_docs_player_row1 :: proc(_: w.Table_Row_State) {
	w.Table_Cell({config = {id = "table_docs_r1_c1"}, child = table_docs_r1_c1_text})
	w.Table_Cell({config = {id = "table_docs_r1_c2"}, child = table_docs_r1_c2_text})
	w.Table_Cell({config = {id = "table_docs_r1_c3"}, child = table_docs_r1_c3_text})
}

@(private)
table_docs_r2_c1_text :: proc(_: w.Table_Cell_State) {
	w.Text({config = {id = "table_docs_r2_c1_text", text = "Player 2"}})
}

@(private)
table_docs_r2_c2_text :: proc(_: w.Table_Cell_State) {
	w.Text({config = {id = "table_docs_r2_c2_text", text = "20"}})
}

@(private)
table_docs_r2_c3_text :: proc(_: w.Table_Cell_State) {
	w.Text({config = {id = "table_docs_r2_c3_text", text = "2"}})
}

@(private)
table_docs_player_row2 :: proc(_: w.Table_Row_State) {
	w.Table_Cell({
		config = {id = "table_docs_r2_c1", border = set.Border(.INHERIT)},
		child = table_docs_r2_c1_text,
	})
	w.Table_Cell({
		config = {id = "table_docs_r2_c2", border = set.Border(.INHERIT)},
		child = table_docs_r2_c2_text,
	})
	w.Table_Cell({
		config = {id = "table_docs_r2_c3", border = set.Border(.INHERIT)},
		child = table_docs_r2_c3_text,
	})
}

@(private)
table_docs_player_body :: proc(_: w.Table_Body_State) {
	w.Table_Row({config = {id = "table_docs_row1"}, child = table_docs_player_row1})
	w.Table_Row({config = {id = "table_docs_row2"}, child = table_docs_player_row2})
}

@(private)
table_docs_player_root :: proc(_: w.Table_State) {
	w.Table_Head({
		config = {id = "table_docs_head", border = set.Border(.INHERIT)},
		child = table_docs_player_head,
	})
	w.Table_Body({config = {id = "table_docs_body"}, child = table_docs_player_body})
}

@(private)
table_docs_player_preview :: proc(_: w.Rectangle_State) {
	w.Table({
		config = {
			id = "table_docs_player",
			direction = set.Direction(.VERTICAL),
			justify = set.Justify(o.Justify_Pos{x = .STRETCH, y = .STRETCH}),
			width = set.Width(480),
			border = set.Border(1),
			radius = set.Radius(10),
		},
		child = table_docs_player_root,
	})
}

@(private)
table_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("table_docs_title", "Table")
	doc_lede(
		"table_docs_lede",
		"Composable table layout: Table root with Table_Head, Table_Body, and optional foot/caption; rows contain heading or data cells.",
	)

	doc_preview("table_docs_hero_preview", table_docs_player_preview)

	doc_section(
		"table_docs_installation",
		"Installation",
		"Table parts live under oni/widgets/table*.odin.",
		proc(_: w.Rectangle_State) {
			doc_code("table_docs_installation_code", TABLE_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"table_docs_usage",
		"Usage",
		"child on Table builds the section tree. Each part accepts Widget_Config styling and its own child callback.",
		proc(_: w.Rectangle_State) {
			doc_code("table_docs_usage_call", TABLE_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"table_docs_basic",
		"Basic table",
		"Border and radius on the root; use border = .INHERIT on rows and cells for shared grid lines.",
		proc(_: w.Rectangle_State) {
			doc_preview("table_docs_basic_preview_wrap", table_docs_player_preview)
			doc_code(
				"table_docs_basic_code",
				`w.Table({
	config = {id = "t", border = set.Border(1), radius = set.Radius(8)},
	child = table_docs_player_root,
})`,
			)
		},
	)

	doc_section(
		"table_docs_composition",
		"Composition",
		"Typical structure: Table → Table_Head / Table_Body → Table_Row → Table_Heading or Table_Cell → Text (or other widgets).",
		proc(_: w.Rectangle_State) {
			doc_code(
				"table_docs_composition_code",
				`w.Table({ child = proc(_: w.Table_State) {
	w.Table_Head({ child = proc(_: w.Table_Head_State) {
		w.Table_Row({ child = proc(_: w.Table_Row_State) {
			w.Table_Heading({ child = ... })
		}})
	}})
	w.Table_Body({ child = proc(_: w.Table_Body_State) {
		w.Table_Row({ child = proc(_: w.Table_Row_State) {
			w.Table_Cell({ child = ... })
		}})
	}})
}})`,
			)
		},
	)

	doc_section(
		"table_docs_api",
		"API Reference",
		"w.Table and table part widgets. Table_Config is Widget_Config.",
		proc(_: w.Rectangle_State) {
			doc_h3("table_docs_api_props_h3", "Props")
			doc_table("table_docs_props_table", TABLE_DOCS_PROPS[:])

			doc_h3("table_docs_api_config_h3", "Config")
			doc_table("table_docs_config_table", DOC_WIDGET_CONFIG[:])

			doc_h3("table_docs_api_parts_h3", "Parts")
			doc_table("table_docs_parts_table", TABLE_DOCS_PARTS[:])
		},
	)
}

Widget_Table :: proc() {
	doc_page("table_docs", table_docs_body)
}
