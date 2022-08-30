
lua << EOF
require("nvim-tree").setup({

        create_in_closed_folder = true,
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	reload_on_bufenter = true,
	filters ={
	dotfiles =true,
	},
    diagnostics = {
	enable = true,
	show_on_dirs = true,

    }
})

local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

nvim_tree_events.on_tree_open(function ()
  bufferline_state.set_offset(31, "File Tree")
end)

nvim_tree_events.on_tree_close(function ()
  bufferline_state.set_offset(0)
end)
EOF
