package oni_docs

import o "../../oni"
import set "../../oni/set"
import w "../../oni/widgets"

@(private)
dialog_demo_open := false

@(private)
dialog_demo_custom_scrim_open := false

@(private)
DIALOG_DOCS_USAGE_IMPORT :: `import w "oni/widgets"
import set "oni/set"`

@(private)
DIALOG_DOCS_USAGE_CALL :: `w.Dialog({
	config = {id = "profile"},
	open = open,
	on_open_change = proc(next: bool) { open = next },
	child = proc(_: w.Dialog_State) {
		w.Dialog_Trigger({
			config = {id = "profile_trigger"},
			child = proc(_: w.Dialog_Trigger_State) {
				w.Text({config = {id = "profile_trigger_label", text = "Edit profile"}})
			},
		})
		w.Dialog_Scrim({config = {id = "profile_scrim"}})
		w.Dialog_Content({
			config = {width = set.Width(f32(420)), padding = set.Padding(f32(24))},
			child = proc(_: w.Dialog_Content_Props_State) {
				w.Text({config = {id = "profile_title", text = "Edit profile"}})
				w.Dialog_Cancel({
					config = {id = "profile_cancel"},
					child = proc(_: w.Dialog_Cancel_State) {
						w.Text({config = {id = "profile_cancel_label", text = "Cancel"}})
					},
				})
				w.Dialog_Action({
					config = {id = "profile_save"},
					on_click = proc(_: w.Dialog_Action_Event) { /* save */ },
					child = proc(_: w.Dialog_Action_State) {
						w.Text({config = {id = "profile_save_label", text = "Save"}})
					},
				})
			},
		})
	},
})`

@(private)
DIALOG_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Dialog_Config (= Widget_Config)", "{}"},
	{"open", "bool", "false"},
	{"disabled", "bool", "false"},
	{"on_open_change", "proc(open: bool)", "nil"},
	{"child", "proc(Dialog_State)", "nil"},
}

@(private)
DIALOG_TRIGGER_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Dialog_Trigger_Config (= Widget_Config)", "{}"},
	{"child", "proc(Dialog_Trigger_State)", "nil"},
	{"on_click", "proc(Dialog_Trigger_Event)", "nil"},
}

@(private)
DIALOG_SCRIM_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Dialog_Scrim_Config (= Widget_Config)", "{}"},
	{"child", "proc(Dialog_Scrim_State)", "nil"},
}

@(private)
DIALOG_CONTENT_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Dialog_Content_Props_Config (= Widget_Config)", "{}"},
	{"child", "proc(Dialog_Content_Props_State)", "nil"},
}

@(private)
DIALOG_ACTION_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Dialog_Action_Config (= Button_Config)", "{}"},
	{"child", "proc(Dialog_Action_State)", "nil"},
	{"on_click", "proc(Dialog_Action_Event)", "nil"},
}

@(private)
DIALOG_CANCEL_DOCS_PROPS := [?]Doc_Prop_Row {
	{"config", "Dialog_Cancel_Config (= Button_Config)", "{}"},
	{"child", "proc(Dialog_Cancel_State)", "nil"},
	{"on_click", "proc(Dialog_Cancel_Event)", "nil — closes dialog"},
}

@(private)
dialog_demo_child :: proc(_: w.Dialog_State) {
	w.Dialog_Trigger({
		config = {id = "dialog-demo-trigger"},
		child = proc(_: w.Dialog_Trigger_State) {
			label := dialog_demo_open ? "Close dialog" : "Open dialog"
			w.Text({config = {id = "dialog-demo-trigger-label", text = label}})
		},
	})
	w.Dialog_Scrim({config = {id = "dialog-demo-scrim"}})
	w.Dialog_Content({
		config = {
			width = set.Width(f32(400)),
			padding = set.Padding(f32(24)),
			gap_y = set.Gap_Y(u16(12)),
			direction = set.Direction(.VERTICAL),
		},
		child = proc(_: w.Dialog_Content_Props_State) {
			w.Text({config = {id = "dialog-demo-title", text = "Edit profile"}})
			w.Text(
				{
					config = {
						id = "dialog-demo-body",
						text = "Make changes to your profile here. Click save when you are done.",
						color = set.Colors(o.Color.MUTED_FOREGROUND),
					},
				},
			)
			w.Rectangle({
				config = {
					id = "dialog-demo-footer",
					direction = set.Direction(.HORIZONTAL),
					gap_x = set.Gap_X(u16(8)),
					justify = set.Justify(o.Justify_Pos{x = .END, y = .CENTER}),
				},
				child = proc(_: w.Rectangle_State) {
					w.Dialog_Cancel({
						config = {
							id = "dialog-demo-cancel",
							padding = set.Padding(f32(8)),
							background = set.Background(o.Color.SECONDARY),
							radius = set.Radius(f32(6)),
						},
						child = proc(_: w.Dialog_Cancel_State) {
							w.Text({config = {id = "dialog-demo-cancel-label", text = "Cancel"}})
						},
					})
					w.Dialog_Action({
						config = {
							id = "dialog-demo-save",
							padding = set.Padding(f32(8)),
							background = set.Background(o.Color.PRIMARY),
							radius = set.Radius(f32(6)),
						},
						on_click = proc(_: w.Dialog_Action_Event) {
							dialog_demo_open = false
						},
						child = proc(_: w.Dialog_Action_State) {
							w.Text({config = {id = "dialog-demo-save-label", text = "Save changes"}})
						},
					})
				},
			})
		},
	})
}

@(private)
dialog_demo_custom_scrim_child :: proc(_: w.Dialog_State) {
	w.Dialog_Trigger({
		config = {id = "dialog-custom-scrim-trigger"},
		child = proc(_: w.Dialog_Trigger_State) {
			label := dialog_demo_custom_scrim_open ? "Close dialog" : "Custom scrim"
			w.Text({config = {id = "dialog-custom-scrim-trigger-label", text = label}})
		},
	})
	w.Dialog_Scrim(
		{
			config = {
				id = "dialog-custom-scrim",
				background = set.Background(o.Color.RED_500),
				justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
			},
		},
	)
	w.Dialog_Content({
		config = {width = set.Width(f32(360)), padding = set.Padding(f32(24))},
		child = proc(_: w.Dialog_Content_Props_State) {
			w.Text({config = {id = "dialog-custom-scrim-title", text = "Custom backdrop"}})
		},
	})
}

@(private)
dialog_docs_basic_preview :: proc(_: w.Rectangle_State) {
	w.Dialog({
		config = {id = "dialog-demo"},
		open = dialog_demo_open,
		on_open_change = proc(open: bool) {
			dialog_demo_open = open
		},
		child = dialog_demo_child,
	})
}

@(private)
dialog_docs_custom_scrim_preview :: proc(_: w.Rectangle_State) {
	w.Dialog({
		config = {id = "dialog-custom-scrim-demo"},
		open = dialog_demo_custom_scrim_open,
		on_open_change = proc(open: bool) {
			dialog_demo_custom_scrim_open = open
		},
		child = dialog_demo_custom_scrim_child,
	})
}

@(private)
dialog_docs_body :: proc(_: w.Rectangle_State) {
	doc_title("dialog_docs_title", "Dialog")
	doc_lede(
		"dialog_docs_lede",
		"shadcn-style modal: controlled open state, viewport-fixed Dialog_Scrim in .OVERLAY space, and centered Dialog_Content.",
	)

	doc_section(
		"dialog_docs_usage",
		"Usage",
		"Own open state and compose Trigger, Scrim, and Content inside the root child.",
		proc(_: w.Rectangle_State) {
			doc_code("dialog_docs_usage_import", DIALOG_DOCS_USAGE_IMPORT)
			doc_code("dialog_docs_usage_call", DIALOG_DOCS_USAGE_CALL)
		},
	)

	doc_section(
		"dialog_docs_composition",
		"Composition",
		"Dialog → Dialog_Trigger + Dialog_Scrim + Dialog_Content (+ Dialog_Cancel / Dialog_Action). Escape and outside click dismiss while open.",
		proc(_: w.Rectangle_State) {
			doc_code(
				"dialog_docs_composition_tree",
				`Dialog
├── Dialog_Trigger
├── Dialog_Scrim
└── Dialog_Content
    ├── Dialog_Cancel   // closes by default; on_click replaces close
    └── Dialog_Action   // Button; close from app state in on_click`,
			)
		},
	)

	doc_section(
		"dialog_docs_basic",
		"Basic",
		"Dialog_Scrim uses position = .FIXED relative to the viewport (not the dialog root) and paints in .OVERLAY space.",
		proc(_: w.Rectangle_State) {
			doc_preview("dialog_docs_basic_preview_wrap", dialog_docs_basic_preview)
		},
	)

	doc_section(
		"dialog_docs_custom_scrim",
		"Custom scrim",
		"Override config (background, layout) or pass child to paint on top of the default full-viewport scrim.",
		proc(_: w.Rectangle_State) {
			doc_preview("dialog_docs_custom_scrim_preview_wrap", dialog_docs_custom_scrim_preview)
			doc_code(
				"dialog_docs_custom_scrim_code",
				`w.Dialog_Scrim({
	config = {
		id = "profile_scrim",
		background = set.Background(o.Color.RED_500),
		justify = set.Justify(o.Justify_Pos{x = .CENTER, y = .CENTER}),
	},
	child = proc(_: w.Dialog_Scrim_State) {
		w.Text({config = {id = "scrim_label", text = "Custom backdrop"}})
	},
})`,
			)
		},
	)

	doc_section(
		"dialog_docs_api",
		"API Reference",
		"w.Dialog, w.Dialog_Trigger, w.Dialog_Scrim, w.Dialog_Content, w.Dialog_Cancel, and w.Dialog_Action in oni/widgets/dialog*.odin.",
		proc(_: w.Rectangle_State) {
			doc_h3("dialog_docs_api_root_h3", "Dialog props")
			doc_table("dialog_docs_root_props", DIALOG_DOCS_PROPS[:])
			doc_h3("dialog_docs_api_trigger_h3", "Dialog_Trigger props")
			doc_table("dialog_docs_trigger_props", DIALOG_TRIGGER_DOCS_PROPS[:])
			doc_h3("dialog_docs_api_scrim_h3", "Dialog_Scrim props")
			doc_table("dialog_docs_scrim_props", DIALOG_SCRIM_DOCS_PROPS[:])
			doc_h3("dialog_docs_api_content_h3", "Dialog_Content props")
			doc_table("dialog_docs_content_props", DIALOG_CONTENT_DOCS_PROPS[:])
			doc_h3("dialog_docs_api_cancel_h3", "Dialog_Cancel props")
			doc_table("dialog_docs_cancel_props", DIALOG_CANCEL_DOCS_PROPS[:])
			doc_h3("dialog_docs_api_action_h3", "Dialog_Action props")
			doc_table("dialog_docs_action_props", DIALOG_ACTION_DOCS_PROPS[:])
		},
	)
}

Widget_Dialog :: proc() {
	doc_page("dialog_docs", dialog_docs_body)
}
