local api, opt = vim.api, vim.opt
local flip = {}

local function flipped()
  return {
      --comment
      base01 = "#6e7171",
      base02 = "#363646",
      base03 = "#45465e",
      base04 = "#7C81A4",
      base05 = '#21212e',
      base06 = '#16161D',
      --bakcground
      bg = "#1b1b26",
      red = "#BE3455",
      cream = "#e0d1ad",
      --for variable
      moonwhite = '#b2cddb',
      blue = "#6d90d6",
      lightblue = '#95a6c9',
      falan = "#30aecf",
      pink = "#ff779f",
      green = "#68945c",
      gtea = "#91b821",
      ---orange
      orange = "#ff770f",
      orangeyellow = '#f3993a',
      orangewhite = '#ddbb99',
      --
      yellow = "#f2c867",
      teal = '#0d9e82',
      voilet = "#957FB8",
      aqua = "#04b4ba",
      ---
      notify_red = "#e6454a",
      notify_yellow = "#f4bc34",
      notify_blue = "#1C95FC",
      notify_aqua = "#46D9F2",
      --orange for operator
      lightorange = "#dc7759",
      bluelnum = "#294161",
      non = "NONE",
  }
end

function flip.load()
  local f = flipped()

  local groups = {
      --Neovim Relate
      Normal                     = { fg = f.cream, bg = f.bg },
      --signcolumn
      SignColumn                 = { bg = f.bg },
      --buffer
      LineNr                     = { fg = f.bluelnum },
      EndOfBuffer                = { bg = f.non, fg = f.bg },
      Search                     = { bg = f.base04, fg = f.base06 },
      Visual                     = { bg = f.base03 },
      ColorColumn                = { bg = f.base06 },
      Whitespace                 = { fg = f.base02 },
      --window
      VertSplit                  = { fg = f.base02 },
      Title                      = { fg = f.lightorange },
      --cursorline
      Cursorline                 = { bg = f.base02 },
      CursorLineNr               = { fg = "#71A8CB" },
      --pmen
      Pmenu                      = { bg = f.base03, fg = f.orangewhite },
      PmenuSel                   = { bg = f.yellow, fg = f.base06 },
      PmenuThumb                 = { bg = "#baadae" },
      --statusline
      StatusLine                 = { bg = f.base05 },
      StatusLineNC               = { fg = f.base05, bg = f.base05 },
      --Error
      ErrorMsg                   = { bg = f.notify_red },
      --Markup
      TODO                       = { bg = f.falan, fg = f.base02 },
      Conceal                    = { fg = f.falan },
      --------------------------------------------------------
      ---@Langauge Relate
      ---@Identifier
      Identifier                 = { fg = f.cream },
      -- various variable names
      ["@variable"]              = { fg = f.moonwhite },
      --built-in variable names (e.g. `this`)
      ["@variable.builtin"]      = { fg = f.aqua, italic = true },
      Constant                   = { fg = f.falan },
      ["@constant.builtin"]      = { link = 'Constant' },
      -- constants defined by the preprocessor
      ["@constant.macro"]        = {},
      --modules or namespaces
      ["@namespace"]             = { link = 'Include' },
      --symbols or atoms
      ["@symbol"]                = {},
      --------------------------------------------------------
      ---@Types
      Type                       = { fg = f.aqua },
      ["@type.builtin"]          = { link = 'Type' },
      --type definitions (e.g. `typedef` in C)
      ["@type.definition"]       = { link = 'Type' },
      --type qualifiers (e.g. `const`)
      ["@type.qualifier"]        = { fg = f.voilet },
      --modifiers that affect storage in memory or life-time like C `static`
      ["@storageclass"]          = { fg = f.voilet },
      ["@field"]                 = { fg = f.gtea },
      ["@property"]              = { fg = f.gtea },
      --------------------------------------------------------
      ---@Keywords
      Keyword                    = { fg = f.voilet },
      ["@keyword.function"]      = { fg = f.blue },
      ["@keyword.return"]        = { fg = f.red, italic = true },
      ["@keyword.operator"]      = { link = "Operator" },
      --if else
      Conditional                = { fg = f.voilet },
      --for while
      Repeat                     = { fg = f.voilet },
      Debug                      = { fg = f.notify_red },
      Label                      = { fg = f.pink },
      Include                    = { link = 'PreProc' },
      Exception                  = { fg = f.pink },
      Statement                  = { fg = f.violet },
      PreProc                    = { fg = f.voilet },
      --------------------------------------------------------
      ---@Functions
      Function                   = { fg = f.blue },
      --built-in functions
      ["@function.builtin"]      = { fg = f.orangeyellow },
      --function calls
      ["@function.call"]         = { fg = f.yellow },
      --preprocessor macros
      ["@function.macro"]        = { fg = f.yellow },
      ["@method"]                = { fg = f.yellow },
      ["@method.call"]           = { fg = f.yellow },
      ["@constructor"]           = { fg = f.blue },
      ["@parameter"]             = { fg = f.blue },
      --------------------------------------------------------
      ---@Literals
      String                     = { fg = f.green },
      Number                     = { fg = f.orange },
      Boolean                    = { fg = f.orange },
      Float                      = { link = 'Number' },
      --
      Define                     = { link = 'PreProc' },
      Operator                   = { fg = f.pink },
      Comment                    = { fg = f.base01 },
      --------------------------------------------------------
      ---@punctuation
      ["@punctuation.bracket"]   = { fg = f.orangewhite },
      ["@punctuation.delimiter"] = { fg = f.orangewhite },
      --------------------------------------------------------
      ---@Diff
      DiffAdd                    = { bg = f.green },
      DifChange                  = { bg = f.blue },
      DifDelete                  = { bg = f.red },
      diffAdded                  = { fg = f.green },
      diffRemoved                = { fg = f.red },
      diffChanged                = { fg = f.blue },
      diffOldFile                = { fg = f.yellow },
      diffNewFile                = { fg = f.orange },
      diffFile                   = { fg = f.cyan },
      --------------------------------------------------------
      ---@Lsp
      DiagnosticError            = { fg = f.notify_red },
      DiagnosticWarn             = { fg = f.notify_yellow },
      DiagnosticInfo             = { fg = f.notify_blue },
      DiagnosticHint             = { fg = f.notify_aqua },
      DiagnosticSignError        = { link = "DiagnosticError" },
      DiagnosticSignWarn         = { link = "DiagnosticWarn" },
      DiagnosticSignInfo         = { link = "DiagnosticInfo" },
      DiagnosticSignHint         = { link = "DiagnosticHint" },
      DiagnosticUnderlineError   = { undercurl = true, sp = f.notify_red },
      DiagnosticUnderlineWarn    = { undercurl = true, sp = f.notify_yellow },
      DiagnosticUnderlineInfo    = { undercurl = true, sp = f.notify_blue },
      DiagnosticUnderlineHint    = { undercurl = true, sp = f.notify_aqua },
      --plugin
      GitGutterAdd               = { fg = f.green },
      GitGutterChange            = { fg = f.blue },
      GitGutterDelete            = { fg = f.red },
      GitGutterChangeDelete      = { fg = f.red },
      DashboardHeader            = { fg = f.orangeyellow },
      DashboardFooter            = { link = 'Comment' },
      DashboardProjectTitle      = { fg = f.notify_blue },
      DashboardProjectTitleIcon  = { fg = f.aqua },
      DashboardProjectIcon       = { fg = f.yellow },
      DashboardMruTitle          = { fg = f.notify_blue },
      DashboardMruIcon           = { fg = f.aqua },
      DashboardFiles             = { fg = f.base04 },
      DashboardShortCut          = { fg = f.green },
      --cmp
      CmpItemAbbr                = { fg = f.orangewhite },
      CmpItemAbbrMatch           = { fg = f.teal },
  }

  api.nvim_command("hi clear")
  opt.background = "dark"
  opt.termguicolors = true
  vim.g.colors_name = "flipped"
  for group, conf in pairs(groups) do
    api.nvim_set_hl(0, group, conf)
  end
end

return flip
