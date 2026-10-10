package oni_docs

import ui "../../app/ui"
import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"


@(private)
Sidebar_Widgets_options :: enum {
	WIDGET_BUTTON,
	WIDGET_CALENDAR,
	WIDGET_DATE_PICKER,
	WIDGET_CHECKBOX,
	WIDGET_COLOR_PICKER,
	WIDGET_IMAGE,
	WIDGET_LINK,
	WIDGET_PRESERVE,
	WIDGET_RADIO,
	WIDGET_RECTANGLE,
	WIDGET_RICH_TEXT,
	WIDGET_RICH_TEXT_INPUT,
	WIDGET_SELECT,
	WIDGET_SLIDER,
	WIDGET_TEXT,
	WIDGET_TEXT_INPUT,
	WIDGET_TABLE,
}

@(private)
active_widget_option: Sidebar_Widgets_options = .WIDGET_BUTTON


widget_container := proc(state: w.Rectangle_State) {
	switch active_widget_option {
	// Widgets
	case .WIDGET_RECTANGLE:
		Widget_Rectangle()
	case .WIDGET_TABLE:
		Widget_Table()
	case .WIDGET_IMAGE:
		Widget_Image()
	case .WIDGET_BUTTON:
		Widget_Button()
	case .WIDGET_CALENDAR:
		Widget_Calendar()
	case .WIDGET_DATE_PICKER:
		Widget_Date_Picker()
	case .WIDGET_CHECKBOX:
		Widget_Checkbox()
	case .WIDGET_COLOR_PICKER:
		Widget_Color_Picker()
	case .WIDGET_LINK:
		Widget_Link()
	case .WIDGET_RADIO:
		Widget_Radio()
	case .WIDGET_PRESERVE:
		Widget_Preserve()
	case .WIDGET_RICH_TEXT:
		Widget_Rich_Text()
	case .WIDGET_RICH_TEXT_INPUT:
		Widget_Rich_Text_Input()
	case .WIDGET_TEXT:
		WidgetText()
	case .WIDGET_TEXT_INPUT:
		Widget_Text_Input()
	case .WIDGET_SELECT:
		Widget_Select()
	case .WIDGET_SLIDER:
		Widget_Slider()
	}
}

widget_sidebar := proc(state: w.Rectangle_State) {
	ui.Button({
		id = "widget_sidebar_button_rect",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_RECTANGLE
		},
		child = proc(_: ui.Button_state) {
			w.Text({config = {id = "widget_sidebar_button_rect_text", text = "Rectangle"}})
		},
	})

	ui.Button({
		id = "widget_sidebar_button_button",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_BUTTON
		},
		child = proc(_: ui.Button_state) {
			w.Text({config = {id = "widget_sidebar_button_button_text", text = "Button"}})
		},
	})

	ui.Button({
		id = "widget_sidebar_button_calendar",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_CALENDAR
		},
		child = proc(_: ui.Button_state) {
			w.Text({config = {id = "widget_sidebar_button_calendar_text", text = "Calendar"}})
		},
	})

	ui.Button({
		id = "widget_sidebar_button_date_picker",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_DATE_PICKER
		},
		child = proc(_: ui.Button_state) {
			w.Text(
				{config = {id = "widget_sidebar_button_date_picker_text", text = "Date Picker"}},
			)
		},
	})

	ui.Button({
		id = "widget_sidebar_button_checkbox",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_CHECKBOX
		},
		child = proc(_: ui.Button_state) {
			w.Text({config = {id = "widget_sidebar_button_checkbox_text", text = "Checkbox"}})
		},
	})

	ui.Button({
		id = "widget_sidebar_button_color_picker",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_COLOR_PICKER
		},
		child = proc(_: ui.Button_state) {
			w.Text(
				{config = {id = "widget_sidebar_button_color_picker_text", text = "Color Picker"}},
			)
		},
	})

	ui.Button({
		id = "widget_sidebar_button_radio",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_RADIO
		},
		child = proc(_: ui.Button_state) {
			w.Text({config = {id = "widget_sidebar_button_radio_text", text = "Radio"}})
		},
	})

	ui.Button({
		id = "widget_sidebar_button_link",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_LINK
		},
		child = proc(_: ui.Button_state) {
			w.Text({config = {id = "widget_sidebar_button_link_text", text = "Link"}})
		},
	})

	ui.Button({
		id = "widget_sidebar_button_image",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_IMAGE

		},
		child = proc(_: ui.Button_state) {
			w.Text({config = {id = "widget_sidebar_button_image_text", text = "Image"}})
		},
	})

	ui.Button({
		id = "widget_sidebar_button_table",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_TABLE

		},
		child = proc(_: ui.Button_state) {
			w.Text({config = {id = "widget_sidebar_button_table_text", text = "Table"}})
		},
	})

	ui.Button({
		id = "widget_sidebar_button_text",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_TEXT
		},
		child = proc(_: ui.Button_state) {
			w.Text({config = {id = "widget_sidebar_button_text_text", text = "Text"}})
		},
	})

	ui.Button({
		id = "widget_sidebar_button_text_input",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_TEXT_INPUT
		},
		child = proc(_: ui.Button_state) {
			w.Text({config = {id = "widget_sidebar_button_text_input_text", text = "Text Input"}})
		},
	})

	ui.Button({
		id = "widget_sidebar_button_rich_text",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_RICH_TEXT
		},
		child = proc(_: ui.Button_state) {
			w.Text({config = {id = "widget_sidebar_button_rich_text_text", text = "RichText"}})
		},
	})

	ui.Button({
		id = "widget_sidebar_button_rich_text_input",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_RICH_TEXT_INPUT
		},
		child = proc(_: ui.Button_state) {
			w.Text(
				{
					config = {
						id = "widget_sidebar_button_rich_text_input_text",
						text = "RichText Input",
					},
				},
			)
		},
	})

	ui.Button({
		id = "widget_sidebar_button_preserve",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_PRESERVE
		},
		child = proc(_: ui.Button_state) {
			w.Text({config = {id = "widget_sidebar_button_preserve_text", text = "Preserve"}})
		},
	})

	ui.Button({
		id = "widget_sidebar_button_select",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_SELECT
		},
		child = proc(_: ui.Button_state) {
			w.Text({config = {id = "widget_sidebar_button_select_text", text = "Select"}})
		},
	})

	ui.Button({
		id = "widget_sidebar_button_slider",
		variant = .GHOST,
		justify = set.Justify(o.Justify_Pos{x = .START, y = .START}),
		radius = set.Radius(5),
		on_click = proc(_: ui.Button_Event) {
			active_widget_option = .WIDGET_SLIDER
		},
		child = proc(_: ui.Button_state) {
			w.Text({config = {id = "widget_sidebar_button_slider_text", text = "Slider"}})
		},
	})

}
