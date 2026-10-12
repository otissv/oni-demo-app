package oni_docs

import c "../../app/components"
import w "../../oni/widgets"


Sidebar_Widgets_options :: enum {
	WIDGET_BUTTON,
	WIDGET_CALENDAR,
	WIDGET_CHECKBOX,
	WIDGET_COLOR_PICKER,
	WIDGET_DATE_PICKER,
	WIDGET_IMAGE,
	WIDGET_LINK,
	WIDGET_PRESERVE,
	WIDGET_RADIO,
	WIDGET_RECTANGLE,
	WIDGET_RICH_TEXT,
	WIDGET_RICH_TEXT_INPUT,
	WIDGET_SELECT,
	WIDGET_SLIDER,
	WIDGET_TABLE,
	WIDGET_TABS,
	WIDGET_TEXT,
	WIDGET_TEXT_INPUT,
}

@(private)
active_widget_option: Sidebar_Widgets_options = .WIDGET_CALENDAR


widget_container := proc(state: w.Rectangle_State) {
	switch active_widget_option {
	case .WIDGET_BUTTON:
		Widget_Button()
	case .WIDGET_CALENDAR:
		Widget_Calendar()
	case .WIDGET_CHECKBOX:
		Widget_Checkbox()
	case .WIDGET_COLOR_PICKER:
		Widget_Color_Picker()
	case .WIDGET_DATE_PICKER:
		Widget_Date_Picker()
	case .WIDGET_IMAGE:
		Widget_Image()
	case .WIDGET_LINK:
		Widget_Link()
	case .WIDGET_PRESERVE:
		Widget_Preserve()
	case .WIDGET_RADIO:
		Widget_Radio()
	case .WIDGET_RECTANGLE:
		Widget_Rectangle()
	case .WIDGET_RICH_TEXT:
		Widget_Rich_Text()
	case .WIDGET_RICH_TEXT_INPUT:
		Widget_Rich_Text_Input()
	case .WIDGET_SELECT:
		Widget_Select()
	case .WIDGET_SLIDER:
		Widget_Slider()
	case .WIDGET_TABLE:
		Widget_Table()
	case .WIDGET_TABS:
		Widget_Tabs()
	case .WIDGET_TEXT:
		WidgetText()
	case .WIDGET_TEXT_INPUT:
		Widget_Text_Input()
	}
}

widget_sidebar := proc(state: w.Rectangle_State) {
	c.sidebar_item("widget-button", "Button", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_BUTTON
	})

	c.sidebar_item("widget-calendar", "Calendar", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_CALENDAR
	})

	c.sidebar_item("widget-checkbox", "Checkbox", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_CHECKBOX
	})

	c.sidebar_item("widget-color-picker", "Color Picker", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_COLOR_PICKER
	})

	c.sidebar_item("widget-date-picker", "Date Picker", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_DATE_PICKER
	})

	c.sidebar_item("widget-image", "Image", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_IMAGE
	})

	c.sidebar_item("widget-link", "Link", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_LINK
	})

	c.sidebar_item("widget-preserve", "Preserve", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_PRESERVE
	})

	c.sidebar_item("widget-radio", "Radio", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_RADIO
	})

	c.sidebar_item("widget-rectangle", "Rectangle", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_RECTANGLE
	})

	c.sidebar_item("widget-rich-text", "RichText", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_RICH_TEXT
	})

	c.sidebar_item("widget-rich-text-input", "RichText Input", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_RICH_TEXT_INPUT
	})

	c.sidebar_item("widget-select", "Select", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_SELECT
	})

	c.sidebar_item("widget-slider", "Slider", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_SLIDER
	})

	c.sidebar_item("widget-table", "Table", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_TABLE
	})

	c.sidebar_item("widget-tabs", "Tabs", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_TABS
	})

	c.sidebar_item("widget-text", "Text", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_TEXT
	})

	c.sidebar_item("widget-text-input", "Text Input", proc() {
		active_docs_section = .Widgets
		active_widget_option = .WIDGET_TEXT_INPUT
	})
}
