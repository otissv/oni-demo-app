package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import "core:fmt"
import "core:strings"

@(private)
select_demo_fruit: string

@(private)
select_demo_fruit_owned: bool

@(private)
select_demo_fruit_open: bool

@(private)
select_demo_fruit_hero_open: bool

@(private)
select_demo_theme: string = "system"

@(private)
select_demo_theme_owned: bool

@(private)
select_demo_theme_open: bool

@(private)
select_demo_langs: [dynamic]string

@(private)
SELECT_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"
import "core:strings"`

@(private)
SELECT_DOCS_USAGE_CALL :: `w.Select({
	config = {id = "fruit"},
	value = fruit,
	open = fruit_open,
	on_value_change = proc(v: string) { fruit = strings.clone(v) },
	on_open_change = proc(o: bool) { fruit_open = o },
	child = proc(_: w.Select_State) {
		w.Select_Trigger({ config = {id = "fruit_trigger"}, child = ... })
	},
	content = proc(_: w.Select_State) {
		w.Option_Group({ config = {id = "fruit_group"}, child = ... })
	},
})`

@(private)
SELECT_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Select_Config (= Widget_Config)", "{}"},
	{"value", "string", `""`},
	{"values", "[]string", "nil"},
	{"open", "bool", "false"},
	{"name", "string", `""`},
	{"required", "bool", "false"},
	{"disabled", "bool", "false"},
	{"multiple", "bool", "false"},
	{"size", "u8", "0"},
	{"autocomplete", "string", `""`},
	{"on_value_change", "proc(value: string)", "nil"},
	{"on_values_change", "proc(values: []string)", "nil"},
	{"on_open_change", "proc(open: bool)", "nil"},
	{"child", "proc(Select_State)", "nil"},
	{"content", "proc(Select_State)", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_mount", "proc(Select_State) -> Mount", "nil"},
	{"on_unmount", "proc(Select_State) -> Mount", "nil"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"scroll_bar", "Scroll_Bar_Style", "{}"},
	{"on_focus", "proc(Select_Event)", "nil"},
	{"on_blur", "proc(Select_Event)", "nil"},
	{"on_mouse_enter", "proc(Select_Event)", "nil"},
	{"on_mouse_leave", "proc(Select_Event)", "nil"},
	{"on_mouse_pressed", "proc(Select_Event)", "nil"},
	{"on_mouse_down", "proc(Select_Event)", "nil"},
	{"on_mouse_released", "proc(Select_Event)", "nil"},
	{"on_mouse_move", "proc(Select_Event)", "nil"},
	{"on_click", "proc(Select_Event)", "nil"},
	{"on_contextmenu", "proc(Select_Event)", "nil"},
	{"on_key_pressed", "proc(Select_Event)", "nil"},
	{"on_key_down", "proc(Select_Event)", "nil"},
	{"on_key_released", "proc(Select_Event)", "nil"},
}

@(private)
select_demo_store_string :: proc(dst: ^string, owned: ^bool, value: string) {
	if owned^ && dst^ != "" {
		delete(dst^)
	}

	if value == "" {
		dst^ = ""
		owned^ = false

		return
	}

	dst^ = strings.clone(value)
	owned^ = true
}

@(private)
select_demo_on_fruit_value :: proc(value: string) {
	select_demo_store_string(&select_demo_fruit, &select_demo_fruit_owned, value)
}

@(private)
select_demo_on_fruit_open :: proc(open: bool) {
	select_demo_fruit_open = open
}

@(private)
select_demo_on_fruit_hero_open :: proc(open: bool) {
	select_demo_fruit_hero_open = open
}

@(private)
select_demo_on_theme_value :: proc(value: string) {
	select_demo_store_string(&select_demo_theme, &select_demo_theme_owned, value)
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
	w.Select_Value({config = {id = "select_docs_fruit_value"}, placeholder = "Pick a fruit…"})
}

@(private)
select_demo_fruit_child :: proc(_: w.Select_State) {
	w.Select_Trigger(
		{
			config = {id = "select_docs_fruit_trigger", width = set.Width(f32(240))},
			child = select_demo_fruit_trigger,
		},
	)
}

@(private)
select_demo_fruit_group :: proc(_: w.Option_Group_State) {
	w.Option({config = {id = "select_docs_opt_apple"}, value = "apple", text = "Apple"})
	w.Option({config = {id = "select_docs_opt_banana"}, value = "banana", text = "Banana"})
	w.Option({config = {id = "select_docs_opt_cherry"}, value = "cherry", text = "Cherry"})
}

@(private)
select_demo_fruit_content :: proc(_: w.Select_State) {
	w.Option_Group({config = {id = "select_docs_fruit_group"}, child = select_demo_fruit_group})
}

@(private)
select_demo_fruit_hero_trigger :: proc(_: w.Select_Trigger_State) {
	w.Select_Value({config = {id = "select_docs_hero_fruit_value"}, placeholder = "Pick a fruit…"})
}

@(private)
select_demo_fruit_hero_child :: proc(_: w.Select_State) {
	w.Select_Trigger(
		{
			config = {id = "select_docs_hero_fruit_trigger", width = set.Width(f32(240))},
			child = select_demo_fruit_hero_trigger,
		},
	)
}

@(private)
select_demo_fruit_hero_group :: proc(_: w.Option_Group_State) {
	w.Option({config = {id = "select_docs_hero_opt_apple"}, value = "apple", text = "Apple"})
	w.Option({config = {id = "select_docs_hero_opt_banana"}, value = "banana", text = "Banana"})
	w.Option({config = {id = "select_docs_hero_opt_cherry"}, value = "cherry", text = "Cherry"})
}

@(private)
select_demo_fruit_hero_content :: proc(_: w.Select_State) {
	w.Option_Group(
		{config = {id = "select_docs_hero_fruit_group"}, child = select_demo_fruit_hero_group},
	)
}

@(private)
select_demo_theme_trigger :: proc(_: w.Select_Trigger_State) {
	w.Select_Value({config = {id = "select_docs_theme_value"}, placeholder = "Theme"})
}

@(private)
select_demo_theme_child :: proc(_: w.Select_State) {
	w.Select_Trigger(
		{
			config = {id = "select_docs_theme_trigger", width = set.Width(f32(240))},
			child = select_demo_theme_trigger,
		},
	)
}

@(private)
select_demo_theme_group :: proc(_: w.Option_Group_State) {
	w.Option({config = {id = "select_docs_opt_light"}, value = "light", text = "Light"})
	w.Option({config = {id = "select_docs_opt_dark"}, value = "dark", text = "Dark"})
	w.Option({config = {id = "select_docs_opt_system"}, value = "system", text = "System"})
}

@(private)
select_demo_theme_content :: proc(_: w.Select_State) {
	w.Option_Group({config = {id = "select_docs_theme_group"}, child = select_demo_theme_group})
}

@(private)
select_demo_langs_group :: proc(_: w.Option_Group_State) {
	w.Option({config = {id = "select_docs_opt_odin"}, value = "odin", text = "Odin"})
	w.Option({config = {id = "select_docs_opt_rust"}, value = "rust", text = "Rust"})
	w.Option({config = {id = "select_docs_opt_go"}, value = "go", text = "Go"})
}

@(private)
select_demo_langs_content :: proc(_: w.Select_State) {
	w.Option_Group({config = {id = "select_docs_langs_group"}, child = select_demo_langs_group})
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
select_docs_hero_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "select_docs_hero_col",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(8)),
			},
			child = select_docs_hero_inner,
		},
	)
}

@(private)
select_docs_hero_inner :: proc(_: w.Rectangle_State) {
	w.Select(
		{
			config = {id = "select_docs_hero"},
			value = select_demo_fruit,
			open = select_demo_fruit_hero_open,
			on_value_change = select_demo_on_fruit_value,
			on_open_change = select_demo_on_fruit_hero_open,
			child = select_demo_fruit_hero_child,
			content = select_demo_fruit_hero_content,
		},
	)
	fruit_status := select_demo_fruit != "" ? select_demo_fruit : "(none)"
	w.Text(
		{
			config = {
				id = "select_docs_hero_status",
				text = fmt.tprintf("Selected: %s", fruit_status),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
select_docs_basic_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "select_docs_basic_col",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(8)),
			},
			child = select_docs_basic_inner,
		},
	)
}

@(private)
select_docs_basic_inner :: proc(_: w.Rectangle_State) {
	w.Select(
		{
			config = {id = "select_docs_basic"},
			value = select_demo_fruit,
			open = select_demo_fruit_open,
			on_value_change = select_demo_on_fruit_value,
			on_open_change = select_demo_on_fruit_open,
			child = select_demo_fruit_child,
			content = select_demo_fruit_content,
		},
	)
	fruit_status := select_demo_fruit != "" ? select_demo_fruit : "(none)"
	w.Text(
		{
			config = {
				id = "select_docs_basic_status",
				text = fmt.tprintf("Selected: %s", fruit_status),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
select_docs_disabled_preview :: proc(_: w.Rectangle_State) {
	w.Select(
		{
			config = {id = "select_docs_disabled"},
			value = select_demo_theme,
			open = select_demo_theme_open,
			disabled = true,
			on_value_change = select_demo_on_theme_value,
			on_open_change = select_demo_on_theme_open,
			child = select_demo_theme_child,
			content = select_demo_theme_content,
		},
	)
}

@(private)
select_docs_multiple_preview :: proc(_: w.Rectangle_State) {
	w.Rectangle(
		{
			config = {
				id = "select_docs_multiple_col",
				direction = set.Direction(.VERTICAL),
				gap_y = set.Gap_Y(u16(8)),
			},
			child = select_docs_multiple_inner,
		},
	)
}

@(private)
select_docs_multiple_inner :: proc(_: w.Rectangle_State) {
	w.Select(
		{
			config = {id = "select_docs_multiple"},
			multiple = true,
			size = 4,
			values = select_demo_langs[:],
			on_values_change = select_demo_on_langs_values,
			content = select_demo_langs_content,
		},
	)
	w.Text(
		{
			config = {
				id = "select_docs_multiple_status",
				text = fmt.tprintf("Selected: %s", select_demo_langs_status()),
				font_size = set.F32(13),
				color = set.Colors(o.Color.MUTED_FOREGROUND),
			},
		},
	)
}

@(private)
select_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("select_docs_title", "Select")
	doc_lede(
		"select_docs_lede",
		"Radix-style select root: controlled-only value and open state, trigger + popover content for single choice, or an inline listbox when multiple or size > 1.",
	)

	doc_preview("select_docs_hero_preview", select_docs_hero_preview)

	doc_section(
		"select_docs_installation",
		"Installation",
		"Select composes Select_Trigger, Select_Value, Option_Group, and Option from oni/widgets.",
		proc(_: w.Rectangle_State) {
			doc_code("select_docs_installation_code", SELECT_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"select_docs_usage",
		"Usage",
		"value, open, and values are always caller-owned. Clone callback strings if you store them past the frame. child builds the trigger; content builds the dropdown panel.",
		proc(_: w.Rectangle_State) {
			doc_code("select_docs_usage_call", SELECT_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"select_docs_basic",
		"Basic dropdown",
		"Select_Trigger wraps Select_Value; Option_Group lists Option rows in content.",
		proc(_: w.Rectangle_State) {
			doc_preview("select_docs_basic_preview_wrap", select_docs_basic_preview)
			doc_code(
				"select_docs_basic_code",
				`child = proc(_: w.Select_State) {
	w.Select_Trigger({
		config = {id = "trigger"},
		child = proc(_: w.Select_Trigger_State) {
			w.Select_Value({config = {id = "value"}, placeholder = "Pick…"})
		},
	})
},
content = proc(_: w.Select_State) {
	w.Option_Group({
		config = {id = "group"},
		child = proc(_: w.Option_Group_State) {
			w.Option({config = {id = "a"}, value = "a", text = "A"})
		},
	})
},`,
			)
		},
	)

	doc_section(
		"select_docs_disabled",
		"Disabled",
		"props.disabled blocks interaction; combine with a fixed value for locked settings.",
		proc(_: w.Rectangle_State) {
			doc_preview("select_docs_disabled_preview_wrap", select_docs_disabled_preview)
			doc_code(
				"select_docs_disabled_code",
				`w.Select({ config = {id = "theme"}, value = "system", disabled = true, ... })`,
			)
		},
	)

	doc_section(
		"select_docs_multiple",
		"Multiple listbox",
		"multiple with size renders a visible list; on_values_change receives the new slice — clone strings if you store them on the heap.",
		proc(_: w.Rectangle_State) {
			doc_preview("select_docs_multiple_preview_wrap", select_docs_multiple_preview)
			doc_code(
				"select_docs_multiple_code",
				`w.Select({
	config = {id = "langs"},
	multiple = true,
	size = 4,
	values = selected[:],
	on_values_change = proc(vals: []string) { /* clone into dynamic array */ },
	content = ...,
})`,
			)
		},
	)

	doc_section(
		"select_docs_api",
		"API Reference",
		"w.Select in oni/widgets/select.odin. Select_Config is Widget_Config.",
		proc(_: w.Rectangle_State) {
			doc_h3("select_docs_api_props_h3", "Props")
			doc_table("select_docs_props_table", SELECT_DOCS_PROPS[:])

			doc_h3("select_docs_api_config_h3", "Config")
			doc_table("select_docs_config_table", DOC_WIDGET_CONFIG[:])
		},
	)
}

Widget_Select :: proc() {
	doc_page("select_docs", select_docs_body)
}
