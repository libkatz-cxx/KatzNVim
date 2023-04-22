local settings = {
    -- every line should be same width without escaped \
    header = {
				type = 'text',
        oldfiles_directory = false,
        align = 'center',
        fold_section = false,
        title = 'Header',
        margin = 15,
				content = {
      			"           ▄ ▄                   ",
      			"       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
      			"       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
      			"    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
      			"  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
      			"  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
      			"▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
      			"█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
      			"    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
				},
				highlight = 'Statement',
        default_color = '',
        oldfiles_amount = 0,
	    },

    -- name which will be displayed and command
    body = {
        type = 'mapping',
        oldfiles_directory = false,
        align = 'center',
        fold_section = false,
        title = 'Basic Commands',
        margin = 5,
        content = {
					  { ' Recent files', 'Telescope oldfiles', '<leader>of' },
						{ ' File browser', 'NvimTreeOpen', '<leader>fb' },
            { ' Find file', 'Telescope find_files', '<leader>ff' },
						{ ' Bookmarks', 'Telescope marks', '<leader>bb' },
						{ ' Mappings', 'Telescope keymaps', '<leader>kk' },
            { ' Themes', 'Telescope colorscheme', '<leader>cs' },
        },
        highlight = 'String',
        default_color = '',
        oldfiles_amount = 0,
    },
    footer = {
				type = 'text',
        content = require('startup.functions').packer_plugins(),
        oldfiles_directory = false,
        align = 'center',
        fold_section = false,
        title = '',
        margin = 5,
        highlight = 'TSString',
        default_color = '#FFFFFF',
        oldfiles_amount = 10,
    },

    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 3, 3, 0 },
    },
    mappings = {
        execute_command = '<CR>',
        open_file = 'o',
        open_file_split = '<c-o>',
        open_section = '<TAB>',
        open_help = '?',
    },
    colors = {
        background = '#1f2227',
        folded_section = '#56b6c2',
    },
    parts = { 'header', 'body', 'footer' },
}
return settings