local function set_layout()
    ---@diagnostic disable-next-line: undefined-global
    local xplr = xplr
    xplr.config.layouts.builtin.default = {
        Vertical = {
            config = {
                constraints = {
                    { Length = 2 },
                    { Min = 1 },
                    { Length = 2 },
                },
            },
            splits = {
                "SortAndFilter",
                {
                    Horizontal = {
                        config = {
                            constraints = {
                                { Percentage = 20 },
                                { Percentage = 60 },
                                { Percentage = 20 },
                            },
                        },
                        splits = {
                            "Selection",
                            "Table",
                            "HelpMenu",
                        },
                    },
                },
                "InputAndLogs",
            },
        },
    }

    xplr.config.layouts.builtin.no_help = {
        Vertical = {
            config = {
                constraints = {
                    { Length = 2 },
                    { Min = 1 },
                },
            },
            splits = {
                "SortAndFilter",
                {
                    Horizontal = {
                        config = {
                            constraints = {
                                { Percentage = 80 },
                                { Percentage = 20 },
                            },
                        },
                        splits = {
                            "Table",
                            "Selection",
                        },
                    },
                },
                "InputAndLogs",
            },
        },
    }

    xplr.config.layouts.builtin.no_selection = {
        Vertical = {
            config = {
                constraints = {
                    { Length = 2 },
                    { Min = 1 },
                    { Length = 2 },
                },
            },
            splits = {
                "SortAndFilter",
                {
                    Horizontal = {
                        config = {
                            constraints = {
                                { Percentage = 80 },
                                { Percentage = 20 },
                            },
                        },
                        splits = {
                            "Table",
                            "HelpMenu",
                        },
                    },
                },
                "InputAndLogs",
            },
        },
    }

    xplr.config.layouts.builtin.no_help_no_selection = {
        Vertical = {
            config = {
                constraints = {
                    { Length = 2 },
                    { Min = 1 },
                    { Length = 2 },
                },
            },
            splits = {
                "SortAndFilter",
                "Table",
                "InputAndLogs",
            },
        },
    }
end

local function setup(args)
    ---@diagnostic disable-next-line: undefined-global
    local xplr = xplr

    xplr.config.general.panel_ui.default.border_type = "Plain"
    xplr.config.general.panel_ui.default.border_style.fg = { Rgb = { 206, 206, 206 }}

    xplr.config.node_types.directory.style = {
        fg = { Rgb = { 251, 241, 199 }},
        add_modifiers = { },
    }

    args = args or {}
    args.keep_default_layout = args.keep_default_layout or false

    xplr.config.general.default_ui.prefix = " "
    xplr.config.general.default_ui.suffix = ""

    xplr.config.general.focus_ui.prefix = ""
    xplr.config.general.focus_ui.suffix = ""
    xplr.config.general.focus_ui.style.fg = { Rgb = { 65, 11, 12 } }
    xplr.config.general.focus_ui.style.bg = { Rgb = { 206, 206, 206 } }
    xplr.config.general.focus_ui.style.add_modifiers = { "Bold" }

    xplr.config.general.selection_ui.prefix = " "
    xplr.config.general.selection_ui.suffix = ""
    xplr.config.general.selection_ui.style.fg = { Rgb = { 153, 153, 0 } }
    xplr.config.general.selection_ui.style.add_modifiers = { "Italic", "CrossedOut" }

    xplr.config.general.focus_selection_ui.prefix = ""
    xplr.config.general.focus_selection_ui.suffix = ""
    xplr.config.general.focus_selection_ui.style.fg = { Rgb = { 65, 11, 12 } }
    xplr.config.general.focus_selection_ui.style.bg = { Rgb = { 206, 206, 206 } }
    xplr.config.general.focus_selection_ui.style.add_modifiers = { "Bold", "Italic", "CrossedOut" }

    xplr.config.general.sort_and_filter_ui.separator.format = " » "

    xplr.config.general.panel_ui.default.title.style.bg = { Rgb = { 65, 11, 12} }
    xplr.config.general.panel_ui.default.title.style.fg = { Rgb = { 206, 206, 206 } }
    xplr.config.general.panel_ui.default.title.style.add_modifiers = { "Bold" }
    xplr.config.general.panel_ui.default.style.fg = { Rgb = { 206, 206, 206 } }
    xplr.config.general.panel_ui.default.style.bg = { Rgb = { 40, 40, 40 } }
    xplr.config.general.panel_ui.default.borders = { "Top", "Right", "Bottom", "Left"}
    xplr.config.general.panel_ui.help_menu.style.bg = { Rgb = { 33, 29, 29 } }
    xplr.config.general.panel_ui.help_menu.style.fg = { Rgb = { 251, 241, 199 } }

    if args.keep_default_layout then
        xplr.config.general.panel_ui.selection.style.bg = { Rgb = { 33, 29, 29 } }
        xplr.config.general.panel_ui.selection.style.fg = { Rgb = { 251, 241, 199 } }
    else
        set_layout()
    end
end

return { setup = setup }
