package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import ui "../ui"
import "core:fmt"

DOC_CONTENT_WIDTH :: f32(720)

@(private)
doc_code_scratch: struct {
	id, text: string,
}

@(private)
doc_section_scratch: struct {
	id, title, body: string,
	child:           proc(state: w.Rectangle_State),
}

@(private)
doc_button_scratch: struct {
	id, label: string,
	variant:   ui.Button_Variant,
	size:      ui.Button_Size,
	disabled:  bool,
	on_click:  proc(event: ui.Button_Event),
}

Doc_Prop_Row :: struct {
	key, type, value: string,
}

/*
Shared Widget_Config rows for API config tables (Config = Widget_Config widgets).
*/
DOC_WIDGET_CONFIG := [?]Doc_Prop_Row {
	{"id", "string", `""`},
	{"width", "Width", "unset"},
	{"height", "Height", "unset"},
	{"padding", "Cfg(Padding)", "unset"},
	{"radius", "Cfg(Radius)", "unset"},
	{"border", "Cfg(Border)", "unset"},
	{"border_color", "Cfg(Colors)", "unset"},
	{"background", "Cfg(Colors)", "unset"},
	{"color", "Cfg(Colors)", "unset"},
	{"font", "Cfg(Style_Font)", "unset"},
	{"font_size", "Cfg(Style_F32)", "unset"},
	{"font_weight", "Cfg(Font_Weight)", "unset"},
	{"font_style", "Cfg(Font_Style)", "unset"},
	{"opacity", "Cfg(Style_F32)", "unset"},
	{"tabbable", "Cfg(Style_Bool)", "unset"},
	{"disabled", "Cfg(Style_Bool)", "unset"},
	{"justify", "Cfg(Justify)", "unset"},
	{"direction", "Cfg(Widget_Direction)", "unset"},
	{"gap_x", "Cfg(Gap_X)", "unset"},
	{"gap_y", "Cfg(Gap_Y)", "unset"},
	{"overflow_x", "Cfg(Overflow)", "unset"},
	{"overflow_y", "Cfg(Overflow)", "unset"},
	{"min_w", "Cfg(Style_F32)", "unset"},
	{"min_h", "Cfg(Style_F32)", "unset"},
	{"max_w", "Cfg(Style_F32)", "unset"},
	{"max_h", "Cfg(Style_F32)", "unset"},
	{"align", "Cfg(Text_Align)", "unset"},
	{"wrap", "Cfg(Text_Wrap)", "unset"},
	{"line_height", "Cfg(Style_F32)", "unset"},
	{"visibility", "Cfg(Visibility)", "unset"},
	{"pointer_events", "Cfg(Pointer_Events)", "unset"},
	{"position", "Cfg(Position)", "unset"},
	{"x", "Cfg(Style_F32)", "unset"},
	{"y", "Cfg(Style_F32)", "unset"},
	{"z_index", "Cfg(Style_F32)", "unset"},
	{"flex", "Cfg(Style_F32)", "unset"},
}

@(private)
doc_table_scratch: struct {
	id:         string,
	rows:       []Doc_Prop_Row,
	row:        Doc_Prop_Row,
	row_i:      int,
	cell_text:  string,
	cell_muted: bool,
}

@(private)
doc_code_child :: proc(_: w.Rectangle_State) {
	w.Preserve(
		{
			config = {
				id = fmt.tprintf("%s_src", doc_code_scratch.id),
				text = doc_code_scratch.text,
				font = set.Font(o.theme.font_body),
				font_size = set.F32(13),
				line_height = set.F32(1.45),
				tab_size = set.Tab_Size(4),
				color = set.Colors(o.theme.palette[.FOREGROUND]),
			},
		},
	)
}

@(private)
doc_section_inner :: proc(_: w.Rectangle_State) {
	doc_h2(fmt.tprintf("%s_h", doc_section_scratch.id), doc_section_scratch.title)

	if doc_section_scratch.body != "" {
		doc_p(fmt.tprintf("%s_p", doc_section_scratch.id), doc_section_scratch.body)
	}

	if doc_section_scratch.child != nil {
		w.Rectangle(
			{
				config = {
					id = fmt.tprintf("%s_body", doc_section_scratch.id),
					direction = set.Direction(.VERTICAL),
					gap_y = set.Gap_Y(u16(12)),
					width = set.Width(DOC_CONTENT_WIDTH),
					justify = set.Justify(o.Justify_Pos{x = .STRETCH, y = .START}),
				},
				child = doc_section_scratch.child,
			},
		)
	}
}

@(private)
doc_ui_button_child :: proc(_: ui.Button_state) {
	w.Text(
		{
			config = {
				id = fmt.tprintf("%s__label", doc_button_scratch.id),
				text = doc_button_scratch.label,
				font_size = set.F32(14),
				tabbable = set.Tabbable(false),
			},
		},
	)
}

/*
Scrollable docs page shell sized to the window below the nav bar.
*/
doc_page :: proc(id: string, child: proc(state: w.Rectangle_State)) {
	settings := o.Settings_Get()
	page_h := max(f32(200), f32(settings.window_height) - 80)

	w.Rectangle(
		{
			config = {
				id = id,
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(28)),
				width = set.Width(DOC_CONTENT_WIDTH),
				height = set.Height(page_h),
				overflow_y = set.Overflow_Y(.AUTO),
				padding = set.Padding(o.Pd_struct{r = 24, b = 48}),
				justify = set.Justify(o.Justify_Pos{x = .STRETCH, y = .START}),
			},
			child = child,
		},
	)
}

doc_title :: proc(id, text: string) {
	w.Text(
		{
			config = {
				id = id,
				text = text,
				width = set.Width(DOC_CONTENT_WIDTH),
				font = set.Font(o.theme.font_heading),
				font_size = set.F32(36),
				line_height = set.F32(1.15),
				color = set.Colors(o.theme.palette[.FOREGROUND]),
			},
		},
	)
}

doc_lede :: proc(id, text: string) {
	w.Text(
		{
			config = {
				id = id,
				text = text,
				width = set.Width(DOC_CONTENT_WIDTH),
				font = set.Font(o.theme.font_body),
				font_size = set.F32(16),
				line_height = set.F32(1.55),
				wrap = set.Wrap(.BALANCE),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

doc_h2 :: proc(id, text: string) {
	w.Text(
		{
			config = {
				id = id,
				text = text,
				width = set.Width(DOC_CONTENT_WIDTH),
				font = set.Font(o.theme.font_heading),
				font_size = set.F32(24),
				line_height = set.F32(1.2),
				color = set.Colors(o.theme.palette[.FOREGROUND]),
			},
		},
	)
}

doc_h3 :: proc(id, text: string) {
	w.Text(
		{
			config = {
				id = id,
				text = text,
				width = set.Width(DOC_CONTENT_WIDTH),
				font = set.Font(o.theme.font_heading),
				font_size = set.F32(18),
				line_height = set.F32(1.25),
				color = set.Colors(o.theme.palette[.FOREGROUND]),
			},
		},
	)
}

doc_p :: proc(id, text: string) {
	w.Text(
		{
			config = {
				id = id,
				text = text,
				width = set.Width(DOC_CONTENT_WIDTH),
				font = set.Font(o.theme.font_body),
				font_size = set.F32(14),
				line_height = set.F32(1.55),
				wrap = set.Wrap(.BALANCE),
				color = set.Colors(o.theme.palette[.FOREGROUND]),
			},
		},
	)
}

doc_muted :: proc(id, text: string) {
	w.Text(
		{
			config = {
				id = id,
				text = text,
				width = set.Width(DOC_CONTENT_WIDTH),
				font = set.Font(o.theme.font_body),
				font_size = set.F32(13),
				line_height = set.F32(1.5),
				wrap = set.Wrap(.BALANCE),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

doc_code :: proc(id, code: string) {
	doc_code_scratch = {
		id   = id,
		text = code,
	}

	w.Rectangle(
		{
			config = {
				id = id,
				direction = set.Direction(.VERTICAL),
				width = set.Width(DOC_CONTENT_WIDTH),
				padding = set.Padding(16),
				background = set.Colors(o.Color.MUTED),
				radius = set.Radius(8),
				overflow_x = set.Overflow_X(.AUTO),
			},
			child = doc_code_child,
		},
	)
}

doc_preview :: proc(id: string, child: proc(state: w.Rectangle_State)) {
	w.Rectangle(
		{
			config = {
				id = id,
				direction = set.Direction(.HORIZONTAL),
				gap_x = set.Gap_X(u16(12)),
				width = set.Width(DOC_CONTENT_WIDTH),
				padding = set.Padding(24),
				border = set.Border(1),
				border_color = set.Border_color(o.Color.BORDER),
				radius = set.Radius(8),
				justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
			},
			child = child,
		},
	)
}

doc_row :: proc(id: string, child: proc(state: w.Rectangle_State)) {
	w.Rectangle(
		{
			config = {
				id = id,
				direction = set.Direction(.HORIZONTAL),
				gap_x = set.Gap_X(u16(12)),
				width = set.Width(DOC_CONTENT_WIDTH),
				justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
			},
			child = child,
		},
	)
}

doc_section :: proc(id, title, body: string, child: proc(state: w.Rectangle_State) = nil) {
	doc_section_scratch = {
		id    = id,
		title = title,
		body  = body,
		child = child,
	}

	w.Rectangle(
		{
			config = {
				id = id,
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(12)),
				width = set.Width(DOC_CONTENT_WIDTH),
				justify = set.Justify(o.Justify_Pos{x = .STRETCH, y = .START}),
			},
			child = doc_section_inner,
		},
	)
}

@(private)
doc_table_cell_child :: proc(_: w.Table_Cell_State) {
	w.Text(
		{
			config = {
				id = fmt.tprintf("%s_text", doc_table_scratch.id),
				text = doc_table_scratch.cell_text,
				font = set.Font(o.theme.font_body),
				font_size = set.F32(13),
				wrap = set.Wrap(.BALANCE),
				color = set.Colors(
					doc_table_scratch.cell_muted ? o.Color.MUTED_FOREGROUND : o.theme.palette[.FOREGROUND],
				),
			},
		},
	)
}

@(private)
doc_table_heading_child :: proc(_: w.Table_Heading_State) {
	w.Text(
		{
			config = {
				id = fmt.tprintf("%s_text", doc_table_scratch.id),
				text = doc_table_scratch.cell_text,
				font = set.Font(o.theme.font_heading),
				font_size = set.F32(13),
				color = set.Colors(o.theme.palette[.FOREGROUND]),
			},
		},
	)
}

@(private)
doc_table_emit_heading :: proc(suffix, text: string) {
	prev_id := doc_table_scratch.id
	doc_table_scratch.id = fmt.tprintf("%s_%s", prev_id, suffix)
	doc_table_scratch.cell_text = text

	w.Table_Heading(
		{
			config = {
				id = doc_table_scratch.id,
				border = set.Border(.INHERIT),
				padding = set.Padding(o.Pd_pos{x = 12, y = 10}),
				background = set.Colors(o.Color.MUTED),
			},
			child = doc_table_heading_child,
		},
	)

	doc_table_scratch.id = prev_id
}

@(private)
doc_table_emit_cell :: proc(suffix, text: string, muted: bool) {
	prev_id := doc_table_scratch.id
	doc_table_scratch.id = fmt.tprintf("%s_%s", prev_id, suffix)
	doc_table_scratch.cell_text = text
	doc_table_scratch.cell_muted = muted

	w.Table_Cell(
		{
			config = {
				id = doc_table_scratch.id,
				border = set.Border(.INHERIT),
				padding = set.Padding(o.Pd_pos{x = 12, y = 10}),
			},
			child = doc_table_cell_child,
		},
	)

	doc_table_scratch.id = prev_id
}

@(private)
doc_table_head_row :: proc(_: w.Table_Row_State) {
	doc_table_emit_heading("h_key", "Key")
	doc_table_emit_heading("h_type", "Type")
	doc_table_emit_heading("h_value", "Value")
}

@(private)
doc_table_head :: proc(_: w.Table_Head_State) {
	w.Table_Row(
		{
			config = {
				id = fmt.tprintf("%s_head_row", doc_table_scratch.id),
				border = set.Border(.INHERIT),
			},
			child = doc_table_head_row,
		},
	)
}

@(private)
doc_table_data_row :: proc(_: w.Table_Row_State) {
	r := doc_table_scratch.row
	i := doc_table_scratch.row_i
	doc_table_emit_cell(fmt.tprintf("r%d_key", i), r.key, false)
	doc_table_emit_cell(fmt.tprintf("r%d_type", i), r.type, true)
	doc_table_emit_cell(fmt.tprintf("r%d_value", i), r.value, true)
}

@(private)
doc_table_body_rows :: proc(_: w.Table_Body_State) {
	rows := doc_table_scratch.rows

	for row, i in rows {
		doc_table_scratch.row = row
		doc_table_scratch.row_i = i

		w.Table_Row(
			{
				config = {
					id = fmt.tprintf("%s_r%d", doc_table_scratch.id, i),
					border = set.Border(.INHERIT),
				},
				child = doc_table_data_row,
			},
		)
	}
}

@(private)
doc_table_root :: proc(_: w.Table_State) {
	table_id := doc_table_scratch.id

	w.Table_Head(
		{
			config = {id = fmt.tprintf("%s_head", table_id), border = set.Border(.INHERIT)},
			child = doc_table_head,
		},
	)

	w.Table_Body({config = {id = fmt.tprintf("%s_body", table_id)}, child = doc_table_body_rows})
}

/*
Renders a Key / Type / Value props table for API reference sections.
*/
doc_table :: proc(id: string, rows: []Doc_Prop_Row) {
	doc_table_scratch = {
		id   = id,
		rows = rows,
	}

	w.Table(
		{
			config = {
				id = id,
				direction = set.Direction(.VERTICAL),
				width = set.Width(DOC_CONTENT_WIDTH),
				justify = set.Justify(o.Justify_Pos{x = .STRETCH, y = .START}),
				border = set.Border(1),
				border_color = set.Border_color(o.Color.BORDER),
				radius = set.Radius(8),
				overflow_x = set.Overflow_X(.AUTO),
			},
			child = doc_table_root,
		},
	)
}

doc_ui_button :: proc(
	id: string,
	label: string,
	variant: ui.Button_Variant = .DEFAULT,
	size: ui.Button_Size = .DEFAULT,
	disabled: bool = false,
	on_click: proc(event: ui.Button_Event) = nil,
) {
	doc_button_scratch = {
		id       = id,
		label    = label,
		variant  = variant,
		size     = size,
		disabled = disabled,
		on_click = on_click,
	}

	props := ui.Button_props {
		id       = id,
		variant  = variant,
		size     = size,
		on_click = on_click,
		child    = doc_ui_button_child,
	}

	if variant == .OUTLINE {
		props.border = set.Border(1)
		props.border_color = set.Border_color(o.Color.BORDER)
	}

	if disabled {
		props.disabled = set.Bool(true)
	}

	ui.Button(props)
}
