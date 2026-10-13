package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"

@(private)
calendar_demo_mode: w.Calendar_Mode = .SINGLE

@(private)
calendar_demo_selected: w.Calendar_Date

@(private)
calendar_demo_has_selected: bool

@(private)
calendar_demo_dates: [5]w.Calendar_Date

@(private)
calendar_demo_date_count: int

@(private)
calendar_demo_range: w.Calendar_Range

@(private)
calendar_demo_month: w.Calendar_Date = {
	year  = 2024,
	month = 6,
	day   = 1,
}

@(private)
CALENDAR_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
CALENDAR_DOCS_USAGE_CALL :: `w.Calendar({
	config = {id = "event_date", width = set.Width(f32(320))},
	mode = .SINGLE,
	selected = selected,
	has_selected = has_selected,
	month = month,
	on_month_change = proc(next: w.Calendar_Date) { month = next },
	on_select = proc(selection: w.Calendar_Selection) {
		selected = selection.single
		has_selected = selection.has_single
	},
	child = proc(_: w.Calendar_State) {
		w.Calendar_Month({config = {id = "event_date/month"}, month_index = 0})
	},
})`

@(private)
CALENDAR_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Calendar_Config (= Widget_Config)", "{}"},
	{"mode", "Calendar_Mode", ".NONE"},
	{"selected", "Calendar_Date", "{}"},
	{"has_selected", "bool", "false"},
	{"selected_dates", "[]Calendar_Date", "nil"},
	{"selected_range", "Calendar_Range", "{}"},
	{"month", "Calendar_Date", "{}"},
	{"on_month_change", "proc(month: Calendar_Date)", "nil"},
	{"on_select", "proc(selection: Calendar_Selection)", "nil"},
	{"on_day_click", "proc(date: Calendar_Date)", "nil"},
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
	{"style", "Calendar_Style", "{}"},
	{"format_month", "proc(date: Calendar_Date) -> string", "nil"},
	{"format_weekday", "proc(weekday: Calendar_Weekday) -> string", "nil"},
	{"format_day", "proc(date: Calendar_Date) -> string", "nil"},
	{"child", "proc(Calendar_State)", "nil"},
	{"on_mount", "proc(Calendar_State) -> Mount", "nil"},
	{"on_unmount", "proc(Calendar_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"scroll_bar", "Scroll_Bar_Style", "{}"},
	{"on_focus", "proc(Calendar_Event)", "nil"},
	{"on_blur", "proc(Calendar_Event)", "nil"},
	{"on_mouse_enter", "proc(Calendar_Event)", "nil"},
	{"on_mouse_leave", "proc(Calendar_Event)", "nil"},
	{"on_mouse_pressed", "proc(Calendar_Event)", "nil"},
	{"on_mouse_down", "proc(Calendar_Event)", "nil"},
	{"on_mouse_released", "proc(Calendar_Event)", "nil"},
	{"on_mouse_move", "proc(Calendar_Event)", "nil"},
	{"on_click", "proc(Calendar_Event)", "nil"},
	{"on_contextmenu", "proc(Calendar_Event)", "nil"},
	{"on_key_pressed", "proc(Calendar_Event)", "nil"},
	{"on_key_down", "proc(Calendar_Event)", "nil"},
	{"on_key_released", "proc(Calendar_Event)", "nil"},
}

@(private)
CALENDAR_DOCS_CONFIG := [?]Doc_Prop_Row {
	{"id", "string", `""`},
	{"width", "Width", ".GROW"},
	{"height", "Height", "unset"},
	{"padding", "Cfg(Padding)", "unset"},
	{"radius", "Cfg(Radius)", "unset"},
	{"border", "Cfg(Border)", "unset"},
	{"border_color", "Cfg(Colors)", "unset"},
	{"background", "Cfg(Colors)", "unset"},
	{"disabled", "Cfg(Style_Bool)", "unset (prefer props.disabled)"},
	{"tabbable", "Cfg(Style_Bool)", "unset"},
	{"opacity", "Cfg(Style_F32)", "unset"},
	{"overflow_x", "Cfg(Overflow)", "unset"},
	{"overflow_y", "Cfg(Overflow)", "unset"},
	{"justify", "Cfg(Justify)", "unset"},
	{"direction", "Cfg(Widget_Direction)", "unset"},
	{"gap_x", "Cfg(Gap_X)", "unset"},
	{"gap_y", "Cfg(Gap_Y)", "unset"},
	{"min_w", "Cfg(Style_F32)", "unset"},
	{"min_h", "Cfg(Style_F32)", "unset"},
	{"max_w", "Cfg(Style_F32)", "unset"},
	{"max_h", "Cfg(Style_F32)", "unset"},
	{"visibility", "Cfg(Visibility)", "unset"},
	{"pointer_events", "Cfg(Pointer_Events)", "unset"},
}

@(private)
CALENDAR_DOCS_STYLE := [?]Doc_Prop_Row {
	{"day_size", "Cfg(Style_F32)", "36"},
	{"gap", "Cfg(Style_F32)", "4"},
	{"selected", "Cfg(Colors)", "theme selected"},
	{"selected_fg", "Cfg(Colors)", "theme selected fg"},
	{"today", "Cfg(Colors)", "theme today"},
	{"outside", "Cfg(Colors)", "theme outside"},
	{"range_middle", "Cfg(Colors)", "theme range middle"},
	{"day_hover", "Cfg(Colors)", "theme hover"},
	{"nav_button", "Cfg(Colors)", "theme nav"},
	{"radius", "Cfg(Radius)", "theme radius"},
}

@(private)
calendar_demo_on_select :: proc(selection: w.Calendar_Selection) {
	switch selection.mode {
	case .NONE:
	case .SINGLE:
		calendar_demo_selected = selection.single
		calendar_demo_has_selected = selection.has_single
	case .MULTIPLE:
		calendar_demo_date_count = min(len(selection.multiple), len(calendar_demo_dates))

		for i in 0 ..< calendar_demo_date_count {
			calendar_demo_dates[i] = selection.multiple[i]
		}
	case .RANGE:
		calendar_demo_range = selection.range
	}
}

@(private)
calendar_demo_status_text :: proc() -> string {
	switch calendar_demo_mode {
	case .NONE:
		return "No selection mode"
	case .SINGLE:
		if calendar_demo_has_selected {
			return fmt.tprintf("Selected %s", w.Calendar_Format_ISO(calendar_demo_selected))
		}

		return "Pick a day"
	case .MULTIPLE:
		return fmt.tprintf("%d days selected (max 5)", calendar_demo_date_count)
	case .RANGE:
		if calendar_demo_range.has_from && calendar_demo_range.has_to {
			return fmt.tprintf(
				"%s → %s",
				w.Calendar_Format_ISO(calendar_demo_range.from),
				w.Calendar_Format_ISO(calendar_demo_range.to),
			)
		}

		if calendar_demo_range.has_from {
			return fmt.tprintf(
				"From %s — pick end",
				w.Calendar_Format_ISO(calendar_demo_range.from),
			)
		}

		return "Pick a range"
	}

	return "Pick a day"
}

@(private)
calendar_demo_on_month :: proc(month: w.Calendar_Date) {
	calendar_demo_month = month
}

@(private)
calendar_demo_weekend_disabled :: proc(date: w.Calendar_Date) -> bool {
	weekday, ok := w.Calendar_Date_Weekday(date)

	return ok && (weekday == .SATURDAY || weekday == .SUNDAY)
}

@(private)
calendar_demo_set_single :: proc(_: w.Button_Event) {
	calendar_demo_mode = .SINGLE
}

@(private)
calendar_demo_set_multiple :: proc(_: w.Button_Event) {
	calendar_demo_mode = .MULTIPLE
	calendar_demo_date_count = 0
}

@(private)
calendar_demo_set_range :: proc(_: w.Button_Event) {
	calendar_demo_mode = .RANGE
	calendar_demo_range = {}
}

@(private)
calendar_demo_mode_child_single :: proc(_: w.Button_State) {
	w.Text(
		{
			config = {
				id = "calendar_docs_mode_single_label",
				text = "Single",
				font_size = set.F32(13),
				tabbable = set.Tabbable(false),
			},
		},
	)
}

@(private)
calendar_demo_mode_child_multiple :: proc(_: w.Button_State) {
	w.Text(
		{
			config = {
				id = "calendar_docs_mode_multiple_label",
				text = "Multiple",
				font_size = set.F32(13),
				tabbable = set.Tabbable(false),
			},
		},
	)
}

@(private)
calendar_demo_mode_child_range :: proc(_: w.Button_State) {
	w.Text(
		{
			config = {
				id = "calendar_docs_mode_range_label",
				text = "Range",
				font_size = set.F32(13),
				tabbable = set.Tabbable(false),
			},
		},
	)
}

@(private)
calendar_demo_mode_button :: proc(
	id: string,
	mode: w.Calendar_Mode,
	on_click: proc(event: w.Button_Event),
	child: proc(frame_state: w.Button_State),
) {
	active := calendar_demo_mode == mode

	w.Button(
		{
			config = {
				id = id,
				padding = set.Padding(o.Pd_struct{x = 10, y = 6}),
				radius = set.Radius(f32(6)),
				width = set.Width(.FIT),
				background = set.Background(active ? o.Color.PRIMARY : o.Color.SECONDARY),
				color = set.Colors(
					active ? o.Color.PRIMARY_FOREGROUND : o.Color.SECONDARY_FOREGROUND,
				),
			},
			on_click = on_click,
			child = child,
		},
	)
}

@(private)
calendar_docs_month_child :: proc(_: w.Calendar_State) {
	w.Calendar_Month({config = {id = "calendar_docs_main/month"}, month_index = 0})
}

@(private)
calendar_docs_weekends_child :: proc(_: w.Calendar_State) {
	w.Calendar_Month({config = {id = "calendar_docs_weekends/month"}, month_index = 0})
}

@(private)
calendar_docs_disabled_child :: proc(_: w.Calendar_State) {
	w.Calendar_Month({config = {id = "calendar_docs_disabled/month"}, month_index = 0})
}

@(private)
calendar_docs_basic_child :: proc(_: w.Calendar_State) {
	w.Calendar_Month({config = {id = "calendar_docs_basic/month"}, month_index = 0})
}

@(private)
calendar_docs_mode_row :: proc(_: w.Rectangle_State) {
	calendar_demo_mode_button(
		"calendar_docs_mode_single",
		.SINGLE,
		calendar_demo_set_single,
		calendar_demo_mode_child_single,
	)
	calendar_demo_mode_button(
		"calendar_docs_mode_multiple",
		.MULTIPLE,
		calendar_demo_set_multiple,
		calendar_demo_mode_child_multiple,
	)
	calendar_demo_mode_button(
		"calendar_docs_mode_range",
		.RANGE,
		calendar_demo_set_range,
		calendar_demo_mode_child_range,
	)
}

@(private)
calendar_docs_hero :: proc(_: w.Rectangle_State) {
	w.Calendar(
		{
			config = {id = "calendar_docs_hero", width = set.Width(f32(320))},
			mode = .SINGLE,
			month = {year = 2024, month = 6, day = 1},
			today = {year = 2024, month = 6, day = 15},
			selected = {year = 2024, month = 6, day = 10},
			has_selected = true,
			child = calendar_docs_basic_child,
		},
	)
}

@(private)
calendar_docs_modes_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle({
		config = {
			id = "calendar_docs_modes_col",
			direction = set.Direction(.VERTICAL),
			gap_y = set.Gap_Y(u16(12)),
			width = set.Width(.GROW),
			justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
		},
		child = proc(_: w.Rectangle_State) {
			w.Rectangle(
				{
					config = {
						id = "calendar_docs_mode_row",
						gap_x = set.Gap_X(u16(8)),
						width = set.Width(.GROW),
						justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
					},
					child = calendar_docs_mode_row,
				},
			)
			w.Text(
				{
					config = {
						id = "calendar_docs_status",
						text = calendar_demo_status_text(),
						font_size = set.F32(13),
						color = set.Colors(o.Color.MUTED_FOREGROUND),
						width = set.Width(.FIT),
					},
				},
			)
			w.Calendar(
				{
					config = {id = "calendar_docs_main", width = set.Width(f32(320))},
					mode = calendar_demo_mode,
					selected = calendar_demo_selected,
					has_selected = calendar_demo_has_selected,
					selected_dates = calendar_demo_dates[:calendar_demo_date_count],
					selected_range = calendar_demo_range,
					month = calendar_demo_month,
					on_month_change = calendar_demo_on_month,
					on_select = calendar_demo_on_select,
					today = {year = 2024, month = 6, day = 15},
					show_week_numbers = true,
					required = calendar_demo_mode == .SINGLE,
					max = calendar_demo_mode == .MULTIPLE ? 5 : 0,
					child = calendar_docs_month_child,
				},
			)
		},
	})
}

@(private)
calendar_docs_weekends_preview :: proc(_: w.Rectangle_State) {
	w.Calendar(
		{
			config = {id = "calendar_docs_weekends", width = set.Width(f32(320))},
			mode = .SINGLE,
			month = {year = 2024, month = 6, day = 1},
			today = {year = 2024, month = 6, day = 15},
			disabled_matcher = calendar_demo_weekend_disabled,
			hide_outside_days = true,
			child = calendar_docs_weekends_child,
		},
	)
}

@(private)
calendar_docs_disabled_preview :: proc(_: w.Rectangle_State) {
	w.Calendar(
		{
			config = {id = "calendar_docs_disabled", width = set.Width(f32(320))},
			mode = .SINGLE,
			month = {year = 2024, month = 6, day = 1},
			today = {year = 2024, month = 6, day = 15},
			selected = {year = 2024, month = 6, day = 10},
			has_selected = true,
			disabled = true,
			child = calendar_docs_disabled_child,
		},
	)
}

@(private)
calendar_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("calendar_docs_title", "Calendar")
	doc_lede(
		"calendar_docs_lede",
		"A calendar that lets users select a date, multiple dates, or a date range.",
	)

	doc_preview("calendar_docs_hero_preview", calendar_docs_hero)

	doc_section(
		"calendar_docs_installation",
		"Installation",
		"Calendar is an engine widget in oni/widgets. Compose day chrome with Calendar_Month (or finer parts) inside child.",
		proc(_: w.Rectangle_State) {
			doc_code("calendar_docs_installation_code", CALENDAR_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"calendar_docs_usage",
		"Usage",
		"Selection and displayed month are caller-owned. Pass the current selection and month every frame, then update them from on_select and on_month_change.",
		proc(_: w.Rectangle_State) {
			doc_code("calendar_docs_usage_call", CALENDAR_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"calendar_docs_modes",
		"Selection modes",
		"mode selects SINGLE, MULTIPLE, or RANGE. For MULTIPLE, pass selected_dates and optional max. For RANGE, pass selected_range.",
		proc(_: w.Rectangle_State) {
			doc_preview("calendar_docs_modes_preview", calendar_docs_modes_preview)
			doc_code(
				"calendar_docs_modes_code",
				`w.Calendar({
	config = {id = "dates"},
	mode = .MULTIPLE,
	selected_dates = dates[:count],
	max = 5,
	on_select = proc(selection: w.Calendar_Selection) { /* copy selection.multiple */ },
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"calendar_docs_disabled_days",
		"Disabled days",
		"disabled_matcher returns true for days that cannot be selected. hide_outside_days hides days from adjacent months. start_date / end_date clamp the selectable window.",
		proc(_: w.Rectangle_State) {
			doc_preview("calendar_docs_weekends_preview", calendar_docs_weekends_preview)
			doc_code(
				"calendar_docs_weekends_code",
				`w.Calendar({
	config = {id = "weekdays_only"},
	mode = .SINGLE,
	disabled_matcher = proc(date: w.Calendar_Date) -> bool {
		weekday, ok := w.Calendar_Date_Weekday(date)
		return ok && (weekday == .SATURDAY || weekday == .SUNDAY)
	},
	hide_outside_days = true,
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"calendar_docs_week_numbers",
		"Week numbers",
		"Set show_week_numbers to show ISO-style week numbers beside the grid. Calendar_Month includes them when the root flag is set.",
		proc(_: w.Rectangle_State) {
			doc_muted(
				"calendar_docs_week_numbers_note",
				"The interactive modes demo above enables show_week_numbers.",
			)
			doc_code(
				"calendar_docs_week_numbers_code",
				`w.Calendar({
	config = {id = "with_weeks"},
	mode = .SINGLE,
	show_week_numbers = true,
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"calendar_docs_disabled_widget",
		"Disabled",
		"Set disabled on the props to block all interaction while still rendering the current selection.",
		proc(_: w.Rectangle_State) {
			doc_preview("calendar_docs_disabled_preview", calendar_docs_disabled_preview)
			doc_code(
				"calendar_docs_disabled_code",
				`w.Calendar({
	config = {id = "locked"},
	mode = .SINGLE,
	selected = {year = 2024, month = 6, day = 10},
	has_selected = true,
	disabled = true,
	child = ...,
})`,
			)
		},
	)

	doc_section(
		"calendar_docs_composition",
		"Composition",
		"Put Calendar_Month inside child for the default layout (nav, caption, weekdays, optional week numbers, grid). Or compose Calendar_Navigation, Calendar_Caption, Calendar_Weekdays, Calendar_Week_Numbers, and Calendar_Grid yourself.",
		proc(_: w.Rectangle_State) {
			doc_code(
				"calendar_docs_composition_code",
				`w.Calendar({
	config = {id = "custom"},
	mode = .SINGLE,
	child = proc(_: w.Calendar_State) {
		w.Calendar_Navigation({config = {id = "custom/nav"}})
		w.Calendar_Caption({config = {id = "custom/caption"}, month_index = 0})
		w.Calendar_Weekdays({config = {id = "custom/weekdays"}, month_index = 0})
		w.Calendar_Grid({config = {id = "custom/grid"}, month_index = 0})
	},
})`,
			)
		},
	)

	doc_section(
		"calendar_docs_api",
		"API Reference",
		"w.Calendar in oni/widgets/calendar.odin. Calendar_Config is Widget_Config. Day chrome colors and sizing go through style: Calendar_Style.",
		proc(_: w.Rectangle_State) {
			doc_h3("calendar_docs_api_props_h3", "Props")
			doc_muted(
				"calendar_docs_api_props_note",
				"Calendar_Mode: NONE | SINGLE | MULTIPLE | RANGE. selection.multiple is temp-allocator — copy it if it must outlive on_select.",
			)
			doc_table("calendar_docs_props_table", CALENDAR_DOCS_PROPS[:])

			doc_h3("calendar_docs_api_config_h3", "Config")
			doc_muted(
				"calendar_docs_api_config_note",
				"Calendar_Config is Widget_Config. Style chrome for days uses the separate style prop, not these fields.",
			)
			doc_table("calendar_docs_config_table", CALENDAR_DOCS_CONFIG[:])

			doc_h3("calendar_docs_api_style_h3", "Style")
			doc_table("calendar_docs_style_table", CALENDAR_DOCS_STYLE[:])
		},
	)
}

Widget_Calendar :: proc() {
	doc_page("calendar_docs", calendar_docs_body)
}
