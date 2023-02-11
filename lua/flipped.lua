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
      red = "#ed556a",
      cream = "#e0d1ad",
      --for variable
      --blue
      qblue = '#5698c3',
      blue = "#6d90d6",
      lightblue = '#95a6c9',
      --
      pink = "#ef82a0",
      --
      applegreen = '#9cb553',
      green = "#45b787",
      teal = "#1abc9c",
      ---orange
      orange = '#f0945d',
      orangewhite = '#ddbb99',
      --
      yellow = "#fbb957",
      yellowgreen = '#d0deaa',
      --
      voilet = "#957FB8",
      aqua = "#5cb3cc",
      ---
      notify_red = "#e6454a",
      notify_yellow = "#f4bc34",
      notify_blue = "#1C95FC",
      notify_aqua = "#46D9F2",
      --orange for operator
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
      ["@variable"]              = { fg = f.applegreen },
      --built-in variable names (e.g. `this`)
      ["@variable.builtin"]      = { fg = f.yellowgreen, italic = true },
      Constant                   = { fg = f.teal },
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
      ["@field"]                 = { fg = f.orange },
      ["@property"]              = { fg = f.orange },
      --------------------------------------------------------
      ---@Keywords
      Keyword                    = { fg = f.voilet },
      ["@keyword.function"]      = { fg = f.voilet },
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
      ["@function.builtin"]      = { fg = f.qblue },
      --function calls
      ["@function.call"]         = { fg = f.blue },
      --preprocessor macros
      ["@function.macro"]        = { fg = f.blue },
      ["@method"]                = { fg = f.blue },
      ["@method.call"]           = { fg = f.blue },
      ["@constructor"]           = { fg = f.cream },
      ["@parameter"]             = { fg = f.moonwhite },
      --------------------------------------------------------
      ---@Literals
      String                     = { fg = f.orangewhite },
      Number                     = { fg = f.yellow },
      Boolean                    = { fg = f.yellow },
      Float                      = { link = 'Number' },
      --
      Define                     = { link = 'PreProc' },
      Operator                   = { fg = f.pink },
      Comment                    = { fg = f.base01 },
      --------------------------------------------------------
      ---@punctuation
      ["@punctuation.bracket"]   = { fg = f.lightblue },
      ["@punctuation.delimiter"] = { fg = f.lightblue },
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
      --dashboard
      DashboardHeader            = { fg = f.voilet },
      DashboardFooter            = { link = 'Comment' },
      DashboardProjectTitle      = { fg = f.notify_blue },
      DashboardProjectTitleIcon  = { fg = f.teal },
      DashboardProjectIcon       = { fg = f.orangewhite },
      DashboardMruTitle          = { fg = f.notify_blue },
      DashboardMruIcon           = { fg = f.teal },
      DashboardFiles             = { fg = f.base04 },
      DashboardShortCut          = { link = 'Comment' },
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
