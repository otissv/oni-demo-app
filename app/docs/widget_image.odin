package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"
import g "../globlas"

@(private)
IMAGE_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
IMAGE_DOCS_USAGE_CALL :: `w.Image({
	texture = logo,
	config = {
		id = "logo",
		width = set.Width(464),
		height = set.Height(464),
		texture_fit = set.Texture_Fit(.CONTAIN),
	},
})`

@(private)
IMAGE_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Image_Config (= Widget_Config)", "{}"},
	{"texture", "Texture_Handle", "{}"},
	{"src", "Rect", "{}"},
	{"dst", "Rect", "{}"},
	{"tint", "Colors", "unset"},
	{"alt", "string", `""`},
	{"texture_fit", "Cfg(Style_Texture_Fit)", "unset"},
	{"texture_pos", "Cfg(Style_Texture_Pos)", "unset"},
	{"child", "proc(Image_State)", "nil"},
	{"on_mount", "proc(Image_State) -> Mount", "nil"},
	{"on_unmount", "proc(Image_State) -> Mount", "nil"},
	{"unmount", "bool", "false"},
	{"can_interactive_during_mount", "bool", "false"},
	{"on_scroll", "proc(scroll_x, scroll_y: f32)", "nil"},
	{"on_focus", "proc(Image_Event)", "nil"},
	{"on_blur", "proc(Image_Event)", "nil"},
	{"on_mouse_enter", "proc(Image_Event)", "nil"},
	{"on_mouse_leave", "proc(Image_Event)", "nil"},
	{"on_mouse_pressed", "proc(Image_Event)", "nil"},
	{"on_mouse_down", "proc(Image_Event)", "nil"},
	{"on_mouse_released", "proc(Image_Event)", "nil"},
	{"on_mouse_move", "proc(Image_Event)", "nil"},
	{"on_click", "proc(Image_Event)", "nil"},
	{"on_contextmenu", "proc(Image_Event)", "nil"},
	{"on_key_pressed", "proc(Image_Event)", "nil"},
	{"on_key_down", "proc(Image_Event)", "nil"},
	{"on_key_released", "proc(Image_Event)", "nil"},
}

@(private)
image_docs_hero :: proc(_: w.Rectangle_State) {
	w.Image(
		{
			texture = g.app.image_texture,
			config = {
				id = "image_docs_hero",
				width = set.Width(464),
				height = set.Height(464),
				texture_fit = set.Texture_Fit(.CONTAIN),
			},
		},
	)
}

@(private)
image_docs_fit_preview :: proc(_: w.Rectangle_State) {
	w.Image(
		{
			texture = g.app.image_texture,
			config = {
				id = "image_docs_fit",
				width = set.Width(320),
				height = set.Height(180),
				background = set.Colors(o.Color.MUTED),
				border = set.Border(1),
				border_color = set.Border_color(o.Color.BORDER),
				radius = set.Radius(8),
				texture_fit = set.Texture_Fit(.CONTAIN),
			},
		},
	)
}

@(private)
image_docs_pos_preview :: proc(_: w.Rectangle_State) {
	w.Image(
		{
			texture = g.app.image_texture,
			config = {
				id = "image_docs_pos",
				width = set.Width(320),
				height = set.Height(180),
				background = set.Colors(o.Color.MUTED),
				border = set.Border(1),
				border_color = set.Border_color(o.Color.BORDER),
				radius = set.Radius(8),
				texture_fit = set.Texture_Fit(.COVER),
			},
			texture_pos = set.Texture_Pos(o.Texture_Pos_X_Y{x = 50, y = 50}),
		},
	)
}

@(private)
image_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("image_docs_title", "Image")
	doc_lede(
		"image_docs_lede",
		"Displays a GPU texture inside styled layout chrome with CSS-like object-fit and object-position.",
	)

	doc_preview("image_docs_hero_preview", image_docs_hero)

	doc_section(
		"image_docs_installation",
		"Installation",
		"Image is an engine widget in oni/widgets. Load textures with o.Load_Texture and pass a Texture_Handle each frame.",
		proc(_: w.Rectangle_State) {
			doc_code("image_docs_installation_code", IMAGE_DOCS_USAGE_IMPORT)
		},
	)

	doc_section(
		"image_docs_usage",
		"Usage",
		"Set width and height on config for a fixed viewport. Intrinsic size uses the texture dimensions when both axes are auto.",
		proc(_: w.Rectangle_State) {
			doc_code("image_docs_usage_call", IMAGE_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"image_docs_fit",
		"Fit",
		"texture_fit maps to object-fit: FILL, CONTAIN, COVER, SCALE_DOWN, and NONE. CONTAIN letterboxes inside the box without cropping.",
		proc(_: w.Rectangle_State) {
			doc_preview("image_docs_fit_preview_wrap", image_docs_fit_preview)
			doc_code(
				"image_docs_fit_code",
				`w.Image({
	texture = logo,
	config = {
		id = "banner",
		width = set.Width(320),
		height = set.Height(180),
		texture_fit = set.Texture_Fit(.CONTAIN),
	},
})`,
			)
		},
	)

	doc_section(
		"image_docs_position",
		"Positioning",
		"texture_pos sets the anchor inside the content box (percent x/y or edge insets). Useful with COVER to focus on part of the source.",
		proc(_: w.Rectangle_State) {
			doc_preview("image_docs_pos_preview_wrap", image_docs_pos_preview)
			doc_code(
				"image_docs_pos_code",
				`w.Image({
	texture = photo,
	config = {
		id = "crop",
		width = set.Width(320),
		height = set.Height(180),
		texture_fit = set.Texture_Fit(.COVER),
	},
	texture_pos = set.Texture_Pos(o.Texture_Pos_X_Y{x = 50, y = 50}),
})`,
			)
		},
	)

	doc_section(
		"image_docs_api",
		"API Reference",
		"w.Image in oni/widgets/image.odin. Image_Config is Widget_Config.",
		proc(_: w.Rectangle_State) {
			doc_h3("image_docs_api_props_h3", "Props")
			doc_muted(
				"image_docs_api_props_note",
				"texture_fit and texture_pos may also live on config; when set on props they override config for that frame.",
			)
			doc_table("image_docs_props_table", IMAGE_DOCS_PROPS[:])

			doc_h3("image_docs_api_config_h3", "Config")
			doc_muted(
				"image_docs_api_config_note",
				"Widget_Config fields below. config.texture_fit and config.texture_pos are merged with props.texture_fit / props.texture_pos.",
			)
			doc_table("image_docs_config_table", DOC_WIDGET_CONFIG[:])
		},
	)
}

Widget_Image :: proc() {
	doc_page("image_docs", image_docs_body)
}
