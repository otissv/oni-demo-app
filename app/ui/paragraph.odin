package ui

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"


Paragraph_Props :: struct {
	using _: w.Text_Config,
	theme:   ^o.Theme,
}

Paragraph :: proc(props: Paragraph_Props) {
	theme := props.theme != nil ? props.theme : o.theme

	base := w.Text_Config {
		font        = set.Font(theme.font_body),
		font_size   = set.F32(theme.font_body.size_px),
		line_height = set.F32(1.5),
		color       = set.Colors(o.theme.palette[.FOREGROUND]),
	}

	config := w.Text_Config {
		o.merge_widget_config(base, props),
		props.text,
		props.selectable,
		props.for_id,
	}

	w.Text({config = config})
}
