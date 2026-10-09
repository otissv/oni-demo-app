package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"

@(private)
slider_demo_volume: [1]f32 = {48}

@(private)
slider_demo_range: [2]f32 = {25, 75}

@(private)
slider_demo_vertical: [1]f32 = {60}

@(private)
slider_demo_disabled: [1]f32 = {35}

@(private)
slider_demo_step: [1]f32 = {40}

@(private)
slider_demo_custom: [1]f32 = {55}

@(private)
slider_demo_custom_thumb :: proc(frame_state: w.Slider_Thumb_State) {
	bg := o.Color.PRIMARY

	if frame_state.is_active {
		bg = o.Color.RING
	}

	w.Rectangle({
		config = {
			id = fmt.tprintf("slider-demo-custom-thumb-%d", frame_state.index),
			width = set.Width(f32(18)),
			height = set.Height(f32(18)),
			radius = set.Radius(f32(9)),
			background = set.Background(bg),
			border = set.Border(f32(2)),
			border_color = set.Border_color(o.Color.BACKGROUND),
			justify = set.Justify(o.Justify_Align.CENTER),
		},
		child = proc(_: w.Rectangle_State) {
			w.Text({
				config = {
					id = "slider-demo-custom-thumb-label",
					text = "•",
					font_size = set.F32(10),
					color = set.Colors(o.Color.PRIMARY_FOREGROUND),
				},
			})
		},
	})
}

@(private)
slider_demo_body :: proc(_: w.Rectangle_State) {
	w.Text(
		{
			config = {
				id = "slider-demo-caption",
				text = "Slider is caller-owned: pass values every frame (length 1 or 2) and update from on_value_change. Supports step, range, vertical, inverted, keyboard, and optional custom thumb widgets.",
			},
		},
	)

	w.Text(
		{
			config = {
				id = "slider-demo-volume-label",
				text = "Basic",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Slider({
		config = {id = "slider-demo-volume"},
		values = slider_demo_volume[:],
		min = 0,
		max = 100,
		step = 1,
		on_value_change = proc(values: []f32) {
			if len(values) > 0 {
				slider_demo_volume[0] = values[0]
			}
		},
	})

	w.Text(
		{
			config = {
				id = "slider-demo-volume-status",
				text = fmt.tprintf("Value: %.0f", slider_demo_volume[0]),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Text(
		{
			config = {
				id = "slider-demo-step-label",
				text = "Stepped (10)",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Slider({
		config = {id = "slider-demo-step"},
		values = slider_demo_step[:],
		min = 0,
		max = 100,
		step = 10,
		on_value_change = proc(values: []f32) {
			if len(values) > 0 {
				slider_demo_step[0] = values[0]
			}
		},
	})

	w.Text(
		{
			config = {
				id = "slider-demo-step-status",
				text = fmt.tprintf("Value: %.0f", slider_demo_step[0]),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Text(
		{
			config = {
				id = "slider-demo-range-label",
				text = "Range",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Slider({
		config = {id = "slider-demo-range"},
		values = slider_demo_range[:],
		min = 0,
		max = 100,
		step = 1,
		min_steps_between_thumbs = 1,
		on_value_change = proc(values: []f32) {
			if len(values) >= 2 {
				slider_demo_range[0] = values[0]
				slider_demo_range[1] = values[1]
			}
		},
	})

	w.Text(
		{
			config = {
				id = "slider-demo-range-status",
				text = fmt.tprintf(
					"Range: %.0f – %.0f",
					slider_demo_range[0],
					slider_demo_range[1],
				),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Text(
		{
			config = {
				id = "slider-demo-vertical-label",
				text = "Vertical",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Rectangle({
		config = {
			id = "slider-demo-vertical-row",
			direction = set.Direction(.HORIZONTAL),
			justify = set.Justify(o.Justify_Pos{x = .START, y = .CENTER}),
			gap_x = set.Gap_X(u16(16)),
			height = set.Height(f32(160)),
		},
		child = proc(_: w.Rectangle_State) {
			w.Slider({
				config = {
					id = "slider-demo-vertical",
					width = set.Width(f32(20)),
					height = set.Height(f32(140)),
				},
				values = slider_demo_vertical[:],
				min = 0,
				max = 100,
				step = 1,
				orientation = .VERTICAL,
				on_value_change = proc(values: []f32) {
					if len(values) > 0 {
						slider_demo_vertical[0] = values[0]
					}
				},
			})
			w.Text(
				{
					config = {
						id = "slider-demo-vertical-status",
						text = fmt.tprintf("Value: %.0f", slider_demo_vertical[0]),
						font_size = set.F32(13),
						color = set.Colors(o.Color.MUTED_FOREGROUND),
					},
				},
			)
		},
	})

	w.Text(
		{
			config = {
				id = "slider-demo-disabled-label",
				text = "Disabled",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Slider({
		config = {id = "slider-demo-disabled"},
		values = slider_demo_disabled[:],
		min = 0,
		max = 100,
		step = 1,
		disabled = true,
	})

	w.Text(
		{
			config = {
				id = "slider-demo-custom-label",
				text = "Custom thumb",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Slider({
		config = {id = "slider-demo-custom"},
		values = slider_demo_custom[:],
		min = 0,
		max = 100,
		step = 1,
		thumb = slider_demo_custom_thumb,
		on_value_change = proc(values: []f32) {
			if len(values) > 0 {
				slider_demo_custom[0] = values[0]
			}
		},
	})

	w.Text(
		{
			config = {
				id = "slider-demo-custom-status",
				text = fmt.tprintf("Value: %.0f", slider_demo_custom[0]),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

Widget_Slider :: proc() {
	w.Rectangle(
		{
			config = {
				id = "slider-demo",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(12)),
				width = set.Width(f32(480)),
			},
			child = slider_demo_body,
		},
	)
}
