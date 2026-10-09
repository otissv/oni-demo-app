package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"

@(private)
link_demo_last_href: string

@(private)
link_demo_activate_count: int

@(private)
link_demo_on_navigate :: proc(event: w.Link_Event) {
	link_demo_last_href = event.frame_state.href
	link_demo_activate_count += 1
}

@(private)
link_demo_body :: proc(_: w.Rectangle_State) {
	w.Text(
		{
			config = {
				id = "link-demo-caption",
				text = "Link matches HTML <a>: href destination, Enter to activate when focused, optional MOD+click. Allowlisted absolute URLs open via the OS unless suppress_open_url is set.",
			},
		},
	)

	w.Text(
		{
			config = {
				id = "link-demo-basic-label",
				text = "Basic (click)",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Link(
		{
			config = {id = "link-demo-basic"},
			href = "/docs/widgets",
			text = "Open widgets docs",
			suppress_open_url = true,
			on_navigate = link_demo_on_navigate,
		},
	)

	w.Text(
		{
			config = {
				id = "link-demo-mod-label",
				text = "Primary modifier + click (Ctrl on Linux/Windows, Cmd on macOS)",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Link(
		{
			config = {id = "link-demo-mod"},
			href = "https://example.com",
			text = "MOD+click external example.com",
			mod = .PRIMARY,
			on_navigate = link_demo_on_navigate,
		},
	)

	w.Text(
		{
			config = {
				id = "link-demo-disabled-label",
				text = "Disabled",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Link(
		{
			config = {id = "link-demo-disabled"},
			href = "/locked",
			text = "Unavailable destination",
			disabled = true,
			suppress_open_url = true,
		},
	)

	w.Text(
		{
			config = {
				id = "link-demo-status",
				text = fmt.tprintf(
					"Activations: %d — last href: %s",
					link_demo_activate_count,
					link_demo_last_href != "" ? link_demo_last_href : "(none)",
				),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

Widget_Link :: proc() {
	w.Rectangle(
		{
			config = {
				id = "link-demo",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(12)),
				width = set.Width(f32(520)),
			},
			child = link_demo_body,
		},
	)
}
