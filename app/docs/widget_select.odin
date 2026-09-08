package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"
import "core:strings"

@(private)
select_demo_fruit: string

@(private)
select_demo_fruit_open: bool

@(private)
select_demo_theme: string = "system"

@(private)
select_demo_theme_open: bool

@(private)
select_demo_langs: [dynamic]string

@(private)
select_demo_on_fruit_value :: proc(value: string) {
	select_demo_fruit = value
}

@(private)
select_demo_on_fruit_open :: proc(open: bool) {
	select_demo_fruit_open = open
}

@(private)
select_demo_on_theme_value :: proc(value: string) {
	select_demo_theme = value
}

@(private)
select_demo_on_theme_open :: proc(open: bool) {
	select_demo_theme_open = open
}

@(private)
select_demo_on_langs_values :: proc(values: []string) {
	for v in select_demo_langs {
		if v != "" {
			delete(v)
		}
	}

	clear(&select_demo_langs)

	for v in values {
		append(&select_demo_langs, strings.clone(v))
	}
}

@(private)
select_demo_fruit_trigger :: proc(_: w.Select_Trigger_State) {
	w.Select_Value({
		config = {id = "select-demo-fruit-value"},
		placeholder = "Pick a fruit…",
	})
}

@(private)
select_demo_fruit_child :: proc(_: w.Select_State) {
	w.Select_Trigger({
		config = {
			id = "select-demo-fruit-trigger",
			width = set.Width(f32(240)),
		},
		child = select_demo_fruit_trigger,
	})
}

@(private)
select_demo_fruit_group :: proc(_: w.Option_Group_State) {
	w.Option({config = {id = "select-demo-opt-apple"}, value = "apple", text = "Apple"})
	w.Option({config = {id = "select-demo-opt-banana"}, value = "banana", text = "Banana"})
	w.Option({config = {id = "select-demo-opt-cherry"}, value = "cherry", text = "Cherry"})
	w.Option(
		{
			config = {id = "select-demo-opt-dragonfruit"},
			value = "dragonfruit",
			text = "Dragonfruit",
		},
	)
}

@(private)
select_demo_fruit_content :: proc(_: w.Select_State) {
	w.Option_Group({
		config = {id = "select-demo-fruit-group"},
		child = select_demo_fruit_group,
	})
}

@(private)
select_demo_theme_trigger :: proc(_: w.Select_Trigger_State) {
	w.Select_Value({
		config = {id = "select-demo-theme-value"},
		placeholder = "Theme",
	})
}

@(private)
select_demo_theme_child :: proc(_: w.Select_State) {
	w.Select_Trigger({
		config = {
			id = "select-demo-theme-trigger",
			width = set.Width(f32(240)),
		},
		child = select_demo_theme_trigger,
	})
}

@(private)
select_demo_theme_group :: proc(_: w.Option_Group_State) {
	w.Option({config = {id = "select-demo-opt-light"}, value = "light", text = "Light"})
	w.Option({config = {id = "select-demo-opt-dark"}, value = "dark", text = "Dark"})
	w.Option({config = {id = "select-demo-opt-system"}, value = "system", text = "System"})
}

@(private)
select_demo_theme_content :: proc(_: w.Select_State) {
	w.Option_Group({
		config = {id = "select-demo-theme-group"},
		child = select_demo_theme_group,
	})
}

@(private)
select_demo_langs_group :: proc(_: w.Option_Group_State) {
	w.Option({config = {id = "select-demo-opt-odin"}, value = "odin", text = "Odin"})
	w.Option({config = {id = "select-demo-opt-rust"}, value = "rust", text = "Rust"})
	w.Option({config = {id = "select-demo-opt-go"}, value = "go", text = "Go"})
	w.Option({config = {id = "select-demo-opt-c"}, value = "c", text = "C"})
	w.Option({config = {id = "select-demo-opt-zig"}, value = "zig", text = "Zig"})
}

@(private)
select_demo_langs_content :: proc(_: w.Select_State) {
	w.Option_Group({
		config = {id = "select-demo-langs-group"},
		child = select_demo_langs_group,
	})
}

@(private)
select_demo_langs_status :: proc() -> string {
	if len(select_demo_langs) == 0 {
		return "(none)"
	}

	joined, _ := strings.join(select_demo_langs[:], ", ", context.temp_allocator)

	return joined
}

@(private)
select_demo_body :: proc(_: w.Rectangle_State) {
	w.Text(
		{
			config = {
				id = "select-demo-caption",
				text = "Select supports disabled, multiple, size (listbox rows), and autocomplete. Dropdown uses Trigger+Value; multiple/size renders an inline list.",
			},
		},
	)

	w.Text(
		{
			config = {
				id = "select-demo-fruit-label",
				text = "Fruit",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Select({
		config = {id = "select-demo-fruit"},
		value = select_demo_fruit,
		open = select_demo_fruit_open,
		autocomplete = "off",
		on_value_change = select_demo_on_fruit_value,
		on_open_change = select_demo_on_fruit_open,
		child = select_demo_fruit_child,
		content = select_demo_fruit_content,
	})

	fruit_status := select_demo_fruit != "" ? select_demo_fruit : "(none)"
	w.Text(
		{
			config = {
				id = "select-demo-fruit-status",
				text = fmt.tprintf("Selected: %s", fruit_status),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Text(
		{
			config = {
				id = "select-demo-theme-label",
				text = "Theme (disabled)",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Select({
		config = {id = "select-demo-theme"},
		value = select_demo_theme,
		open = select_demo_theme_open,
		disabled = true,
		autocomplete = "on",
		on_value_change = select_demo_on_theme_value,
		on_open_change = select_demo_on_theme_open,
		child = select_demo_theme_child,
		content = select_demo_theme_content,
	})

	w.Text(
		{
			config = {
				id = "select-demo-langs-label",
				text = "Languages (multiple, size=4)",
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)

	w.Select({
		config = {id = "select-demo-langs"},
		multiple = true,
		size = 4,
		values = select_demo_langs[:],
		autocomplete = "off",
		on_values_change = select_demo_on_langs_values,
		content = select_demo_langs_content,
	})

	w.Text(
		{
			config = {
				id = "select-demo-langs-status",
				text = fmt.tprintf("Selected: %s", select_demo_langs_status()),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

Widget_Select :: proc() {
	w.Rectangle({
		config = {
			id = "select-demo",
			direction = set.Direction(.VERTICAL),
			gap_y = set.Gap_Y(u16(12)),
			width = set.Width(f32(480)),
		},
		child = select_demo_body,
	})
}
