let basePath = "~/AppData/Local/nvim/"
runtime plugins.vim


runtime whichkey.vim
" simple save file
nnoremap <silent> <C-s> <Cmd>w<CR>
inoremap <silent> <C-s> <Esc><Cmd>w<CR>
runtime base.vim
autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()
"testing inoremap
"
if has("win32") && has("nvim")
  nnoremap <C-z> <nop>
  inoremap <C-z> <nop>
  vnoremap <C-z> <nop>
  snoremap <C-z> <nop>
  xnoremap <C-z> <nop>
  cnoremap <C-z> <nop>
  onoremap <C-z> <nop>
endif

autocmd BufEnter *.go nnoremap <silent> <buffer> <F5> <Esc>:!go run %<CR>





if has('patch-8.1.1880')
  set completeopt=longest,menuone,popuphidden
  " Highlight the completion documentation popup background/foreground the same as
  " the completion menu itself, for better readability with highlighted
  " documentation.
  set completepopup=highlight:Pmenu,border:off
else
  set completeopt=longest,menuone,preview
  " Set desired preview window height for viewing documentation.
  set previewheight=5
endif
let g:ale_linters = { 'cs': ['OmniSharp'] }
augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END
lua <<EOF
require('crates').setup()



-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}

require("rust-tools").setup(opts)

EOF

lua << EOF
require('go').setup()
require("go.format").goimport()
require ("nvim-autopairs").setup{}
EOF
lua << EOF
require("indent_blankline").setup {
    show_end_of_line = true,
}
EOF

" =Telescope=
"
lua << EOF
require("telescope").setup({
  extensions = {
      file_browser={
      theme= 'ivy'
      },
    coc = { theme = 'dropdown' }
  },
})
require("telescope").load_extension("ui-select")
require('telescope').load_extension('coc')
require("telescope").load_extension("notify")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("project")
require('leap').add_default_mappings()

require('nvim-treesitter.configs').setup {
  highlight = {
    enabled = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  refactor = {
		highlight_definitions = {
			enable = true
		},
		highlight_current_scope = {
			enable = true
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr"
			}
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD"
			}
		}
	},
}

EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=20
" =Lualine=
lua << END
require('lualine').setup()
END

" =Blamer=
let g:blamer_enabled = 1

" =NvimTree=

" =Comment=

lua << EOF
require('Comment').setup()
EOF

" =Toggleterm=

lua << EOF
require("toggleterm").setup{
    on_open = function(terminal)
	local nvimtree = require "nvim-tree"
	local nvimtree_view = require "nvim-tree.view"
	if nvimtree_view.is_visible() and terminal.direction == "horizontal" then
	  local nvimtree_width = vim.fn.winwidth(nvimtree_view.get_winnr())
	  nvimtree.toggle()
	  nvimtree_view.View.width = nvimtree_width
	  nvimtree.toggle(false, true)
	end
    end
}

local conemu = require("toggleterm.terminal").Terminal:new({
    cmd ="cmd /k %CMDER_ROOT%\\vendor\\init.bat",
    dir = "git_dir",
    on_open = function(term)
	vim.cmd("startinsert!")
    end
})

function _conemu_toggle()
    conemu:toggle()
end

local lazygit = require("toggleterm.terminal").Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
  -- function to run on closing the terminal
  on_close = function(term)
    vim.cmd("Closing terminal")
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end
EOF

" =Coc=

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')




" =Notifications
lua << EOF
-- copy selection to a new buffer

function to_new_buffer()
    local vstart = vim.fn.getpos("'<")
    local vend = vim.fn.getpos("'>")
    local line_start = vstart[2]
    local line_end = vend[2]

    local api = vim.api
    api.nvim_feedkeys("y","x",false)
    api.nvim_command("botright split new")
    api.nvim_feedkeys("p","x",false)
end


EOF


lua << EOF
require("notify").setup()
vim.notify = require("notify")
local coc_status_record = {}

function coc_status_notify(msg, level)
  local notify_opts = { title = "LSP Status",
  timeout = 500,
  hide_from_history = true,
style = "minimal",
focusable = false,
  on_close = reset_coc_status_record }
  -- if coc_status_record is not {} then add it to notify_opts to key called "replace"
  if coc_status_record ~= {} then
    notify_opts["replace"] = coc_status_record.id
  end
  coc_status_record = vim.notify(msg, level, notify_opts)
end

function reset_coc_status_record(window)
  coc_status_record = {}
end

local coc_diag_record = {}

function coc_diag_notify(msg, level)
  local notify_opts = { title = "LSP Diagnostics",
  timeout = 500,
focusable = false,
style = "minimal",
  on_close = reset_coc_diag_record }
  -- if coc_diag_record is not {} then add it to notify_opts to key called "replace"
  if coc_diag_record ~= {} then
    notify_opts["replace"] = coc_diag_record.id
  end
  coc_diag_record = vim.notify(msg, level, notify_opts)
end

function reset_coc_diag_record(window)
  coc_diag_record = {}
end
EOF

function! s:DiagnosticNotify() abort
  let l:info = get(b:, 'coc_diagnostic_info', {})
  if empty(l:info) | return '' | endif
  let l:msgs = []
  let l:level = 'info'
   if get(l:info, 'warning', 0)
    let l:level = 'warn'
  endif
  if get(l:info, 'error', 0)
    let l:level = 'error'
  endif

  if get(l:info, 'error', 0)
    call add(l:msgs, ' Errors: ' . l:info['error'])
  endif
  if get(l:info, 'warning', 0)
    call add(l:msgs, ' Warnings: ' . l:info['warning'])
  endif
  if get(l:info, 'information', 0)
    call add(l:msgs, ' Infos: ' . l:info['information'])
  endif
  if get(l:info, 'hint', 0)
    call add(l:msgs, ' Hints: ' . l:info['hint'])
  endif
  let l:msg = join(l:msgs, "\n")
  if empty(l:msg) | let l:msg = ' All OK' | endif
  call v:lua.coc_diag_notify(l:msg, l:level)
endfunction

function! s:StatusNotify() abort
  let l:status = get(g:, 'coc_status', '')
  let l:level = 'info'
  if empty(l:status) | return '' | endif
"  call v:lua.coc_status_notify(l:status, l:level)
endfunction

function! s:InitCoc() abort
  execute "lua vim.notify('Initialized coc.nvim for LSP support', 'info', { title = 'LSP Status' })"
endfunction

autocmd User CocNvimInit call s:InitCoc()
" autocmd User CocDiagnosticChange call s:DiagnosticNotify()
" autocmd User CocStatusChange call s:StatusNotify()

runtime coc-keys.vim

runtime tree.vim

autocmd BufEnter *.go,*.ts,*.tsx,*.cs :TSBufEnable highlight


" commands
"
command! Ci CocCommand tsserver.sortImports 
