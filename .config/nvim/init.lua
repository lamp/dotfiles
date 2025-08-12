local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

local cmd = require('pckr.loader.cmd')
local keys = require('pckr.loader.keys')

require('pckr').add{
  'tpope/vim-sensible';
  'airblade/vim-rooter';
  'tpope/vim-surround';
  'tpope/vim-repeat';
  'tpope/vim-dispatch';
  'radenling/vim-dispatch-neovim';
  'airblade/vim-gitgutter';
  {'mg979/vim-visual-multi', branch = 'master' };
  'rebelot/kanagawa.nvim';
  {'nvim-treesitter/nvim-treesitter', run  = ':TSUpdate'};
  'nvim-lualine/lualine.nvim';
  'simeji/winresizer';
  {'lambdalisue/fern.vim', branch  = 'main' };
  'unblevable/quick-scope';
  'karb94/neoscroll.nvim';
  'startup-nvim/startup.nvim';
  'nvim-lua/plenary.nvim';
  {'nvim-telescope/telescope.nvim', tag = '0.1.8' };
  'numToStr/Comment.nvim';
  'jeetsukumaran/vim-buffergator';
  'neovim/nvim-lspconfig';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-path';
  'hrsh7th/cmp-cmdline';
  'hrsh7th/nvim-cmp';
  'SirVer/ultisnips';
  'quangnguyen30192/cmp-nvim-ultisnips';
  {'lamp/cmp-iced', requires = {'hrsh7th/nvim-cmp'}};
  'guns/vim-sexp';
  'junegunn/fzf';
  'liquidz/vim-iced';
  -- 'liquidz/vim-iced-project-namespaces';
  'liquidz/vim-iced-function-list', -- {'for': 'clojure', 'on': 'IcedBrowseFunction'};
				-- TODO: re-enable
  -- 'liquidz/vim-iced-kaocha';
  -- 'liquidz/vim-iced-fern-debugger';
  'tpope/vim-sexp-mappings-for-regular-people';
  {'eraserhd/parinfer-rust', run = 'nix-shell --run \"cargo build --release \"'}; -- 'cargo build --release' };
  'bronson/vim-trailing-whitespace';
  'cohama/lexima.vim';
  'elmcast/elm-vim';
  'nvim-lua/plenary.nvim';
  'nvim-tree/nvim-web-devicons';
  'folke/trouble.nvim';
  'MunifTanjim/nui.nvim';
  'nvim-neo-tree/neo-tree.nvim';
  'mrquantumcodes/bufferchad.nvim';
  'folke/noice.nvim';
	'gcmt/vessel.nvim';
}

require('Comment').setup()
require("startup").setup({theme = "dashboard"})

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
require("trouble").setup { }
require('neoscroll').setup()

require("bufferchad").setup({
  mapping = "<leader>bb", -- Map any key, or set to NONE to disable key mapping
  mark_mapping = "<leader>bm", -- The keybinding to display just the marked buffers
  order = "LAST_USED_UP", -- LAST_USED_UP (default)/ASCENDING/DESCENDING/REGULAR
  style = "default", -- default, modern (requires dressing.nvim and nui.nvim), telescope (requires telescope.nvim)
  close_mapping = "<Esc><Esc>", -- only for the default style window. 
})

-- require('neorg').setup {
--     load = {
--         ["core.defaults"] = {}, -- Loads default behaviour
--         ["core.export"] = {},
--         ["core.export.markdown"] = {},
--         ["core.completion"] = {config = { engine = "nvim-cmp" }}, -- allows for autocompletion
--         ["core.summary"] = {config = { strategy = "default" }}, -- generates summaries
--         ["core.concealer"] = {}, -- Adds pretty icons to your documents
--         ["core.dirman"] = { -- Manages Neorg workspaces
--             config = {
--                 workspaces = {
--                     notes = "~/notes",
--                     work = "~/work",
--                 },
--             },
--         },
--     },
-- }

require('telescope').setup{
}

-- // lualine config

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'location'}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})

-- LSP  setup
local nvim_lsp = require('lspconfig')
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local servers = { 'clojure_lsp', 'typescript-language-server', 'rls', 'solargraph' }
local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
    ['<C-e>'] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'iced' },
    { name = 'buffer' },
    { name = 'ultisnips'},
  })
})

require('nvim-treesitter.configs').setup ({
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
	indent = {
		enable = true
	},

	ensure_installed = {
		"clojure",
		"json",
		"javascript",
		"typescript",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"bash",
		"lua",
		"vim"
	},

	-- List of parsers to ignore installing (for "all")

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

require("vessel").setup({
  create_commands = true
})
vim.keymap.set('n', '<C-E>', ':WinResizerStartResize<cr>')

vim.keymap.set('n', '<leader>fe', ':Fern . -drawer -toggle -reveal=%<cr>')
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', ':Telescope help_tags<cr>')
vim.keymap.set('n', '<leader>fc', ':Telescope commands<cr>')
vim.keymap.set('n', '<leader>f', ':Neotree reveal_file=%<cr>')
vim.keymap.set('n', '<C-S>', ':Telescope git_files<cr>')
-- nnoremap <leader>fe :Fern . -drawer -toggle -reveal=%<CR>
-- nnoremap <leader>ff <cmd>Telescope find_files<cr>
-- nnoremap <leader>fg <cmd>Telescope live_grep<cr>
-- nnoremap <leader>fb <cmd>Telescope buffers<cr>
-- nnoremap <leader>fh <cmd>Telescope help_tags<cr>
-- nnoremap <leader>fc <cmd>Telescope commands<cr>
-- nnoremap <C-S> <cmd>Telescope git_files<cr>
-- nnoremap <leader>f <cmd>Neotree reveal_file=%<cr>

vim.cmd("colorscheme kanagawa")

vim.o.termguicolors = true
vim.opt.completeopt = {menu,menuone,noselect}

vim.o.tabstop = 2
vim.o.hidden = true
vim.o.background = "dark"
vim.o.number = true
vim.o.wrap = false
vim.o.splitright = true
vim.o.synmaxcol = 256
vim.o.relativenumber = true
vim.o.ttyfast = true
vim.o.cursorline = false
vim.o.cursorcolumn = false
vim.o.foldmethod = "expr"
vim.o.foldexpr= "nvim_treesitter#foldexpr()"
vim.o.foldenable = false
vim.o.filetype = 'on'
vim.o.syntax = 'on'

vim.o.lazyredraw = true

vim.g.iced_enable_default_key_mappings  = true
vim.g.loaded_python_provider = 0
vim.g.rooter_patterns = {'.git' }
