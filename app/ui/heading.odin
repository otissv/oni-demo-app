package ui

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"


Heading_Variant :: enum {
	H1,
	H2,
	H3,
	H4,
	H5,
	H6,
}


Heading_Props :: struct {
	using _: w.Text_Config,
	variant: Heading_Variant,
	theme:   ^o.Theme,
}

Heading :: proc(props: Heading_Props) {
	font_size: o.Cfg(o.Style_F32)

	switch props.variant {
	case .H1:
		font_size = set.F32(32)
	case .H2:
		font_size = set.F32(28)
	case .H3:
		font_size = set.F32(24)
	case .H4:
		font_size = set.F32(20)
	case .H5:
		font_size = set.F32(18)
	case .H6:
		font_size = set.F32(16)
	}

	theme := props.theme != nil ? props.theme : o.theme

	base := w.Text_Config {
		font        = set.Font(theme.font_heading),
		color       = set.Colors(o.theme.palette[.FOREGROUND]),
		font_size   = font_size,
		line_height = set.F32(1),
	}

	config := w.Text_Config {
		o.merge_widget_config(base, props),
		props.text,
		props.selectable,
		props.for_id,
	}

	w.Text({config = config})
}
