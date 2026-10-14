package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"

@(private)
date_picker_demo_selected: w.Calendar_Date

@(private)
date_picker_demo_has_selected: bool

@(private)
date_picker_demo_hero_open: bool

@(private)
date_picker_demo_open: bool

@(private)
date_picker_demo_month: w.Calendar_Date = {
	year  = 2024,
	month = 6,
	day   = 1,
}

@(private)
date_picker_demo_range: w.Calendar_Range

@(private)
date_picker_demo_range_open: bool

@(private)
date_picker_demo_range_month: w.Calendar_Date = {
	year  = 2024,
	month = 6,
	day   = 1,
}

@(private)
date_picker_demo_input_selected: w.Calendar_Date

@(private)
date_picker_demo_input_has_selected: bool

@(private)
date_picker_demo_input_open: bool

@(private)
date_picker_demo_input_month: w.Calendar_Date = {
	year  = 2024,
	month = 6,
	day   = 1,
}

@(private)
DATE_PICKER_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
DATE_PICKER_DOCS_USAGE_CALL :: `w.Date_Picker({
	config = {id = "event"},
	mode = .SINGLE,
	selected = selected,
	has_selected = has_selected,
	open = open,
	month = month,
	on_select = proc(selection: w.Calendar_Selection) {
		selected = selection.single
		has_selected = selection.has_single
	},
	on_open_change = proc(o: bool) { open = o },
	on_month_change = proc(next: w.Calendar_Date) { month = next },
	child = proc(_: w.Date_Picker_State) {
		w.Date_Picker_Trigger({
			config = {id = "event_trigger"},
			child = proc(_: w.Date_Picker_Trigger_State) {
				w.Date_Picker_Value({
					config = {id = "event_value"},
					placeholder = "Pick a date",
				})
			},
		})
	},
})`

@(private)
DATE_PICKER_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Date_Picker_Config (= Widget_Config)", "{}"},
	{"mode", "Calendar_Mode", ".NONE → .SINGLE"},
	{"selected", "Calendar_Date", "{}"},
	{"has_selected", "bool", "false"},
	{"selected_dates", "[]Calendar_Date", "nil"},
	{"selected_range", "Calendar_Range", "{}"},
	{"open", "bool", "false"},
	{"keep_open", "bool", "false"},
	{"month", "Calendar_Date", "{}"},
	{"on_month_change", "proc(month: Calendar_Date)", "nil"},
	{"on_select", "proc(selection: Calendar_Selection)", "nil"},
	{"on_day_click", "proc(date: Calendar_Date)", "nil"},
	{"on_open_change", "proc(open: bool)", "nil"},
	{"required", "bool", "false"},
	{"min", "int", "0"},
	{"max", "int", "0"},
	{"start_month", "Calendar_Date", "{}"},
	{"end_month", "Calendar_Date", "{}"},
	{"start_date", "Calendar_Date", "{}"},
	{"end_date", "Calendar_Date", "{}"},
	{"disabled_matcher", "proc(date: Calendar_Date) -> bool", "nil"},
	{"hidden_matcher", "proc(date: Calendar_Date) -> bool", "nil"},
	{"hide_outside_days", "bool", "false"},
	{"show_week_numbers", "bool", "false"},
	{"week_starts_on", "Calendar_Weekday", ".SUNDAY"},
	{"number_of_months", "int", "1"},
	{"today", "Calendar_Date", "{} (system date)"},
	{"disabled", "bool", "false"},
	{"day_size", "Cfg(Style_F32)", "unset → 36"},
	{"gap", "Cfg(Style_F32)", "unset → 4"},
	{"day", "proc(Calendar_Day_State)", "nil → Calendar_Day"},
	{"format_month", "proc(date: Calendar_Date) -> string", "nil"},
	{"format_weekday", "proc(weekday: Calendar_Weekday) -> string", "nil"},
	{"format_day", "proc(date: Calendar_Date) -> string", "nil"},
	{"format_value", "proc(selection: Calendar_Selection) -> string", "nil"},
	{"child", "proc(Date_Picker_State)", "nil"},
	{"content", "proc(Date_Picker_State)", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_mount", "proc(Date_Picker_State) -> Mount", "nil"},
	{"on_unmount", "proc(Date_Picker_State) -> Mount", "nil"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"on_focus", "proc(Date_Picker_Event)", "nil"},
	{"on_blur", "proc(Date_Picker_Event)", "nil"},
	{"on_mouse_enter", "proc(Date_Picker_Event)", "nil"},
	{"on_mouse_leave", "proc(Date_Picker_Event)", "nil"},
	{"on_mouse_pressed", "proc(Date_Picker_Event)", "nil"},
	{"on_mouse_down", "proc(Date_Picker_Event)", "nil"},
	{"on_mouse_released", "proc(Date_Picker_Event)", "nil"},
	{"on_mouse_move", "proc(Date_Picker_Event)", "nil"},
	{"on_click", "proc(Date_Picker_Event)", "nil"},
	{"on_contextmenu", "proc(Date_Picker_Event)", "nil"},
	{"on_key_pressed", "proc(Date_Picker_Event)", "nil"},
	{"on_key_down", "proc(Date_Picker_Event)", "nil"},
	{"on_key_released", "proc(Date_Picker_Event)", "nil"},
}

@(private)
date_picker_demo_on_select :: proc(selection: w.Calendar_Selection) {
	date_picker_demo_selected = selection.single
	date_picker_demo_has_selected = selection.has_single
}

@(private)
date_picker_demo_on_hero_open :: proc(open: bool) {
	date_picker_demo_hero_open = open
}

@(private)
date_picker_demo_on_open :: proc(open: bool) {
	date_picker_demo_open = open
}

@(private)
date_picker_demo_on_month :: proc(month: w.Calendar_Date) {
	date_picker_demo_month = month
}

@(private)
date_picker_demo_on_range_select :: proc(selection: w.Calendar_Selection) {
	date_picker_demo_range = selection.range
}

@(private)
date_picker_demo_on_range_open :: proc(open: bool) {
	date_picker_demo_range_open = open
}

@(private)
date_picker_demo_on_range_month :: proc(month: w.Calendar_Date) {
	date_picker_demo_range_month = month
}

@(private)
date_picker_demo_on_input_select :: proc(selection: w.Calendar_Selection) {
	date_picker_demo_input_selected = selection.single
	date_picker_demo_input_has_selected = selection.has_single
}

@(private)
date_picker_demo_on_input_open :: proc(open: bool) {
	date_picker_demo_input_open = open
}

@(private)
date_picker_demo_on_input_month :: proc(month: w.Calendar_Date) {
	date_picker_demo_input_month = month
}

@(private)
date_picker_demo_hero_trigger :: proc(_: w.Date_Picker_Trigger_State) {
	w.Date_Picker_Value(
		{config = {id = "date_picker_docs_hero_value"}, placeholder = "Pick a date"},
	)
}

@(private)
date_picker_demo_hero_child :: proc(_: w.Date_Picker_State) {
	w.Date_Picker_Trigger(
		{
			config = {id = "date_picker_docs_hero_trigger", width = set.Width(f32(260))},
			child = date_picker_demo_hero_trigger,
		},
	)
}

@(private)
date_picker_demo_basic_trigger :: proc(_: w.Date_Picker_Trigger_State) {
	w.Date_Picker_Value(
		{config = {id = "date_picker_docs_basic_value"}, placeholder = "Pick a date"},
	)
}

@(private)
date_picker_demo_basic_child :: proc(_: w.Date_Picker_State) {
	w.Date_Picker_Trigger(
		{
			config = {id = "date_picker_docs_basic_trigger", width = set.Width(f32(260))},
			child = date_picker_demo_basic_trigger,
		},
	)
}

@(private)
date_picker_demo_range_trigger :: proc(_: w.Date_Picker_Trigger_State) {
	w.Date_Picker_Value(
		{config = {id = "date_picker_docs_range_value"}, placeholder = "Pick a date range"},
	)
}

@(private)
date_picker_demo_range_child :: proc(_: w.Date_Picker_State) {
	w.Date_Picker_Trigger(
		{
			config = {id = "date_picker_docs_range_trigger", width = set.Width(f32(280))},
			child = date_picker_demo_range_trigger,
		},
	)
}

@(private)
date_picker_demo_input_child :: proc(_: w.Date_Picker_State) {
	w.Date_Picker_Input(
		{
			config = {id = "date_picker_docs_input", width = set.Width(f32(260))},
			placeholder = "YYYY-MM-DD",
		},
	)
}

@(private)
date_picker_docs_status_text :: proc(selected: w.Calendar_Date, has: bool) -> string {
	if !has {
		return "(none)"
	}

	return w.Calendar_Format_Long(selected, context.temp_allocator)
}

@(private)
date_picker_docs_range_status :: proc() -> string {
	if !date_picker_demo_range.has_from {
		return "(none)"
	}

	from := w.Calendar_Format_Medium(date_picker_demo_range.from, context.temp_allocator)

	if !date_picker_demo_range.has_to {
		return from
	}

	to := w.Calendar_Format_Medium(date_picker_demo_range.to, context.temp_allocator)

	return fmt.tprintf("%s - %s", from, to)
}

@(private)
date_picker_docs_hero_inner :: proc(_: w.Rectangle_State) {
	w.Date_Picker(
		{
			config = {id = "date_picker_docs_hero"},
			mode = .SINGLE,
			selected = date_picker_demo_selected,
			has_selected = date_picker_demo_has_selected,
			open = date_picker_demo_hero_open,
			month = date_picker_demo_month,
			on_select = date_picker_demo_on_select,
			on_open_change = date_picker_demo_on_hero_open,
			on_month_change = date_picker_demo_on_month,
			child = date_picker_demo_hero_child,
		},
	)
	w.Text(
		{
			config = {
				id = "date_picker_docs_hero_status",
				text = fmt.tprintf(
					"Selected: %s",
					date_picker_docs_status_text(
						date_picker_demo_selected,
						date_picker_demo_has_selected,
					),
				),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
date_picker_docs_hero_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "date_picker_docs_hero_col",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(8)),
			},
			child = date_picker_docs_hero_inner,
		},
	)
}

@(private)
date_picker_docs_basic_inner :: proc(_: w.Rectangle_State) {
	w.Date_Picker(
		{
			config = {id = "date_picker_docs_basic"},
			mode = .SINGLE,
			selected = date_picker_demo_selected,
			has_selected = date_picker_demo_has_selected,
			open = date_picker_demo_open,
			month = date_picker_demo_month,
			on_select = date_picker_demo_on_select,
			on_open_change = date_picker_demo_on_open,
			on_month_change = date_picker_demo_on_month,
			child = date_picker_demo_basic_child,
		},
	)
	w.Text(
		{
			config = {
				id = "date_picker_docs_basic_status",
				text = fmt.tprintf(
					"Selected: %s",
					date_picker_docs_status_text(
						date_picker_demo_selected,
						date_picker_demo_has_selected,
					),
				),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
date_picker_docs_basic_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "date_picker_docs_basic_col",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(8)),
			},
			child = date_picker_docs_basic_inner,
		},
	)
}

@(private)
date_picker_docs_range_inner :: proc(_: w.Rectangle_State) {
	w.Date_Picker(
		{
			config = {id = "date_picker_docs_range"},
			mode = .RANGE,
			selected_range = date_picker_demo_range,
			open = date_picker_demo_range_open,
			month = date_picker_demo_range_month,
			number_of_months = 2,
			on_select = date_picker_demo_on_range_select,
			on_open_change = date_picker_demo_on_range_open,
			on_month_change = date_picker_demo_on_range_month,
			child = date_picker_demo_range_child,
		},
	)
	w.Text(
		{
			config = {
				id = "date_picker_docs_range_status",
				text = fmt.tprintf("Selected: %s", date_picker_docs_range_status()),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
date_picker_docs_range_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "date_picker_docs_range_col",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(8)),
			},
			child = date_picker_docs_range_inner,
		},
	)
}

@(private)
date_picker_docs_input_inner :: proc(_: w.Rectangle_State) {
	w.Date_Picker(
		{
			config = {id = "date_picker_docs_input_root"},
			mode = .SINGLE,
			selected = date_picker_demo_input_selected,
			has_selected = date_picker_demo_input_has_selected,
			open = date_picker_demo_input_open,
			month = date_picker_demo_input_month,
			on_select = date_picker_demo_on_input_select,
			on_open_change = date_picker_demo_on_input_open,
			on_month_change = date_picker_demo_on_input_month,
			child = date_picker_demo_input_child,
		},
	)
	w.Text(
		{
			config = {
				id = "date_picker_docs_input_status",
				text = fmt.tprintf(
					"Selected: %s",
					date_picker_docs_status_text(
						date_picker_demo_input_selected,
						date_picker_demo_input_has_selected,
					),
				),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
date_picker_docs_input_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "date_picker_docs_input_col",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(8)),
			},
			child = date_picker_docs_input_inner,
		},
	)
}

@(private)
date_picker_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("date_picker_docs_title", "Date Picker")
	doc_lede(
		"date_picker_docs_lede",
		"Composable date input: Date_Picker_Trigger + Date_Picker_Value (or Date_Picker_Input), with an anchored Calendar panel. Selection, open, and month are caller-owned.",
	)

	doc_preview("date_picker_docs_hero_preview", date_picker_docs_hero_preview)

	doc_section(
		"date_picker_docs_installation",
		"Installation",
		"Date_Picker nests Popover + Calendar internally. Author child places Date_Picker_Trigger / Date_Picker_Value, or Date_Picker_Input for typed ISO dates. Override content to replace the default Calendar panel.",
		proc(_: w.Rectangle_State) {
			doc_code("date_picker_docs_installation_code", DATE_PICKER_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"date_picker_docs_usage",
		"Usage",
		"selected / has_selected (or range / dates), open, and month are caller-owned. Omit content to get the default Calendar panel.",
		proc(_: w.Rectangle_State) {
			doc_code("date_picker_docs_usage_call", DATE_PICKER_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"date_picker_docs_composition",
		"Composition",
		"Author child builds the trigger. Date_Picker wraps it in Popover and opens Popover_Content with Calendar + Calendar_Default_Months (or your content override).",
		proc(_: w.Rectangle_State) {
			doc_code(
				"date_picker_docs_composition_code",
				`Date_Picker
└── Popover (internal)
    ├── child → Date_Picker_Trigger → Date_Picker_Value
    └── Popover_Content → Calendar → Calendar_Default_Months
         (or custom content)`,
			)
		},
	)

	doc_section(
		"date_picker_docs_basic",
		"Basic",
		"Trigger shows a long-form date or placeholder. Choosing a day closes the popover.",
		proc(_: w.Rectangle_State) {
			doc_preview("date_picker_docs_basic_preview_wrap", date_picker_docs_basic_preview)
		},
	)

	doc_section(
		"date_picker_docs_range",
		"Range picker",
		"mode=.RANGE keeps the popover open until both ends are chosen. number_of_months can show two months.",
		proc(_: w.Rectangle_State) {
			doc_preview("date_picker_docs_range_preview_wrap", date_picker_docs_range_preview)
		},
	)

	doc_section(
		"date_picker_docs_input",
		"Input",
		"Date_Picker_Input accepts YYYY-MM-DD and opens the calendar on focus/click.",
		proc(_: w.Rectangle_State) {
			doc_preview("date_picker_docs_input_preview_wrap", date_picker_docs_input_preview)
		},
	)

	doc_section(
		"date_picker_docs_props",
		"Props",
		"Root Date_Picker props. Calendar chrome options are forwarded to the default panel.",
		proc(_: w.Rectangle_State) {
			doc_table("date_picker_docs_props_table", DATE_PICKER_DOCS_PROPS[:])
		},
	)
}

Widget_Date_Picker :: proc() {
	doc_page("date_picker_docs", date_picker_docs_body)
}
