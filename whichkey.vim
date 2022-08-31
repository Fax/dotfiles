

lua << EOF
require("which-key").setup {}
local wk = require("which-key")
wk.register({
  ["<leader>n"]  = { name = "+NvimTree" },
  ["<leader>no"]  = { "<cmd>NvimTreeToggle<cr>", "NvimTree: open and close tree." },

  ["<leader>c"]  = { name = "+Customs" },
  ["<leader>co"] = { ":setlocal spell! spelllang=en_uk<cr>", "Customs: check spell." },
  ["<c-p>"] = {"<cmd>Telescope find_files<cr>", "Find File"},
  ["<c-f>"] = {"<cmd>Telescope live_grep<cr>", "Search"},
  ["<s-f12>"] = { "<cmd>Telescope coc references<cr>", "Telescope: popup references." },
  ["<leader>f"]  = { name = "+Telescope"},
  ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Telescope: lists files in your cwd." },
  ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Telescope: search for a string in your cwd live." },
  ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Telescope: lists open buffers in current instance." },
  ["<leader>fr"] = { "<cmd>Telescope coc references<cr>", "Telescope: popup references." },
  ["<leader>fh"] = { "<cmd>Telescope notify<cr>", "Telescope: search the history." },
  ["<leader>fd"] = { "<cmd>Telescope coc diagnostics<cr>", "Telescope: search the diagnostics." },

  ["<leader>r"] ={name="+Refactor"},
  ["<leader>re"] ={"<cmd>lua to_new_buffer()<cr>","Extract selection to new buffer: works in visual mode."},

  ["<leader>t"]  = { name = "+Toggleterm" },
  ["<leader>tt"] = { "<cmd>ToggleTerm size=20 dir=. direction=horizontal<cr>", "ToggleTerm: spawn a terminal." },
  ["<leader>tg"] = { "<cmd>lua _lazygit_toggle()<cr>", "ToggleTerm: spawn lazygit." },
  ["<leader>ty"] = { "<cmd>lua _conemu_toggle()<cr>", "ToggleTerm: spawn conemu." },
  ["<M-f>"] = {"<cmd>CocCommand prettier.forceFormatDocument<cr>","format"}
})

wk.register({

  ["<leader>r"] ={name="+Refactor"},
  ["<leader>re"] ={"<cmd>lua to_new_buffer()<cr>","Extract selection to new buffer"},
},{mode="v"})
EOF
