
lua << EOF
require("nvim-tree").setup({

        create_in_closed_folder = true,
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	filters ={
	dotfiles =true,
	},
    diagnostics = {
	enable = true,
	show_on_dirs = true,

    }
})

local nvim_tree_events = require('nvim-tree.events')

local bufferline_api = require('bufferline.api')
local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api .set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)
EOF
