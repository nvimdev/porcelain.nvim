local api, opt, g = vim.api, vim.opt, vim.g
local flip = {}

local function flipped()
  return {
    --comment
    base01 = '#6e7171',
    base02 = '#363646',
    base03 = '#45465e',
    base04 = '#7C81A4',
    base05 = '#151626',
    base06 = '#16161D',
    --bakcground
    bg = '#1b1b26',
    red = '#ed556a',
    --for variable
    --blue
    qblue = '#619ac3',
    blue = '#6d90d6',
    bluevoilet = '#95a6c9',
    --
    pink = '#ef82a0',
    --
    applegreen = '#9cb553',
    green = '#45b787',
    --
    teal = '#1abc9c',
    ---orange
    orange = '#f0945d',
    lhgreen = '#92b3a5',
    --
    yellow = '#fbb957',
    gryellow = '#f8c387',
    yellowgreen = '#d0deaa',
    --
    voilet = '#917bb5',
    --
    aqua = '#54baba',
    --
    dlsgrey = '#bfc6c9',
    ---
    notify_red = '#e6454a',
    notify_yellow = '#f4bc34',
    notify_blue = '#1C95FC',
    notify_aqua = '#46D9F2',
    --orange for operator
    bluelnum = '#294161',
    non = 'NONE',
  }
end

function flip.load()
  local f = flipped()

  local groups = {
    --Neovim Relate
    Normal = { fg = f.dlsgrey, bg = f.bg },
    --signcolumn
    SignColumn = { bg = f.bg },
    --buffer
    LineNr = { fg = f.bluelnum },
    EndOfBuffer = { bg = f.non, fg = f.bg },
    Search = { bg = f.base04, fg = f.base06 },
    Visual = { bg = f.base03 },
    ColorColumn = { bg = f.base06 },
    Whitespace = { fg = f.base02 },
    --window
    VertSplit = { fg = f.base02 },
    Title = { fg = f.orange },
    --cursorline
    Cursorline = { bg = f.base02 },
    CursorLineNr = { fg = f.qblue },
    --pmen
    Pmenu = { bg = f.base03, fg = f.dlsgrey },
    PmenuSel = { bg = f.yellow, fg = f.base06 },
    PmenuThumb = { bg = f.base02 },
    WildMenu = { link = 'pmenu' },
    --statusline
    StatusLine = { bg = f.base05 },
    StatusLineNC = { fg = f.base05, bg = f.base05 },
    WinBar = { link = 'StatusLine' },
    WinBarNC = { link = 'StatusLineNC' },
    --Error
    ErrorMsg = { bg = f.notify_red },
    --Markup
    TODO = { bg = f.blue, fg = f.base02 },
    Conceal = { fg = f.green },
    Error = { fg = f.notify_red },
    NonText = { link = 'Comment' },
    --Float
    FloatBorder = { fg = f.blue },
    FloatNormal = { link = 'Normal' },
    --Fold
    Fold = { fg = f.base03 },
    FoldColumn = { link = 'SignColumn' },
    --Spell
    SpellBad = { fg = f.notify_red },
    --------------------------------------------------------
    ---@Langauge Relate
    ---@Identifier
    Identifier = { fg = f.applegreen },
    -- various variable names
    ['@variable'] = { fg = f.applegreen },
    --built-in variable names (e.g. `this`)
    ['@variable.builtin'] = { fg = '#b9dec9', italic = true },
    Constant = { fg = f.teal },
    ['@constant.builtin'] = { link = 'Constant' },
    -- constants defined by the preprocessor
    ['@constant.macro'] = {},
    --modules or namespaces
    ['@namespace'] = { link = 'Include' },
    --symbols or atoms
    -- ['@symbol'] = {},
    --------------------------------------------------------
    ---@Types
    Type = { fg = f.aqua },
    ['@type.builtin'] = { link = 'Type' },
    --type definitions (e.g. `typedef` in C)
    ['@type.definition'] = { link = 'Type' },
    --type qualifiers (e.g. `const`)
    ['@type.qualifier'] = { fg = f.voilet },
    --modifiers that affect storage in memory or life-time like C `static`
    ['@storageclass'] = { fg = f.voilet },
    ['@field'] = { fg = f.orange },
    ['@property'] = { fg = f.orange },
    --------------------------------------------------------
    ---@Keywords
    Keyword = { fg = f.voilet },
    ['@keyword.function'] = { fg = f.voilet },
    ['@keyword.return'] = { fg = f.red, italic = true },
    ['@keyword.operator'] = { link = 'Operator' },
    --if else
    Conditional = { fg = f.voilet },
    --for while
    Repeat = { fg = f.voilet },
    Debug = { fg = f.red },
    Label = { fg = f.pink },
    Include = { link = 'PreProc' },
    Exception = { fg = f.pink },
    Statement = { fg = f.orange },
    PreProc = { fg = f.voilet },
    --------------------------------------------------------
    ---@Functions
    Function = { fg = f.blue },
    --built-in functions
    ['@function.builtin'] = { fg = f.qblue },
    --function calls
    ['@function.call'] = { fg = f.blue },
    --preprocessor macros
    ['@function.macro'] = { fg = f.blue },
    ['@method'] = { fg = f.blue },
    ['@method.call'] = { fg = f.blue },
    ['@constructor'] = { fg = f.lhgreen },
    ['@parameter'] = { fg = f.yellow },
    --------------------------------------------------------
    ---@Literals
    String = { fg = f.gryellow },
    Number = { fg = f.pink },
    Boolean = { fg = f.pink },
    Float = { link = 'Number' },
    --
    Define = { link = 'PreProc' },
    Operator = { fg = f.dlsgrey },
    Comment = { fg = f.base01 },
    --------------------------------------------------------
    ---@punctuation
    ['@punctuation.bracket'] = { fg = f.bluevoilet },
    ['@punctuation.delimiter'] = { fg = f.bluevoilet },
    --------------------------------------------------------
    ---@Diff
    DiffAdd = { fg = f.green },
    DifChange = { fg = f.blue },
    DifDelete = { fg = f.red },
    diffAdded = { fg = f.green },
    diffRemoved = { fg = f.red },
    diffChanged = { fg = f.blue },
    diffOldFile = { fg = f.yellow },
    diffNewFile = { fg = f.orange },
    diffFile = { fg = f.cyan },
    --------------------------------------------------------
    ---@Lsp
    DiagnosticError = { link = 'Error' },
    DiagnosticWarn = { fg = f.notify_yellow },
    DiagnosticInfo = { fg = f.notify_blue },
    DiagnosticHint = { fg = f.notify_aqua },
    DiagnosticSignError = { link = 'DiagnosticError' },
    DiagnosticSignWarn = { link = 'DiagnosticWarn' },
    DiagnosticSignInfo = { link = 'DiagnosticInfo' },
    DiagnosticSignHint = { link = 'DiagnosticHint' },
    DiagnosticUnderlineError = { undercurl = true, sp = f.notify_red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = f.notify_yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = f.notify_blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = f.notify_aqua },
    ---@plugin
    GitGutterAdd = { fg = f.green },
    GitGutterChange = { fg = f.blue },
    GitGutterDelete = { fg = f.red },
    GitGutterChangeDelete = { fg = f.red },
    --dashboard
    DashboardHeader = { fg = f.voilet },
    DashboardFooter = { link = 'Comment' },
    DashboardProjectTitle = { fg = f.yellow },
    DashboardProjectTitleIcon = { fg = f.blue },
    DashboardProjectIcon = { fg = f.orange },
    DashboardMruTitle = { fg = f.yellow },
    DashboardMruIcon = { fg = f.blue },
    DashboardFiles = { fg = f.base04 },
    DashboardShortCut = { link = 'Comment' },
    DashboardShortCutIcon = { link = '@variable' },
    --cmp
    CmpItemAbbr = { fg = f.dlsgrey },
    CmpItemAbbrMatch = { fg = f.teal },
    CmpItemKind = { fg = f.blue },
    --Telescope
    TelescopePromptBorder = { bg = f.base06, fg = f.base06 },
    TelescopePromptNormal = { bg = f.base06, fg = f.red },
    TelescopeResultsBorder = { bg = f.base06, fg = f.base06 },
    TelescopeResultsNormal = { fg = f.base04 },
    TelescopePreviewBorder = { bg = f.base06, fg = f.base06 },
    TelescopeSelectionCaret = { fg = f.yellow },
    TelescopeMatching = { fg = f.teal },
  }

  g.terminal_color_0 = f.bg
  g.terminal_color_1 = f.red
  g.terminal_color_2 = f.applegreen
  g.terminal_color_3 = f.yellow
  g.terminal_color_4 = f.blue
  g.terminal_color_5 = f.violet
  g.terminal_color_6 = f.aqua
  g.terminal_color_7 = f.base06
  g.terminal_color_8 = f.base05
  g.terminal_color_9 = f.notify_red
  g.terminal_color_10 = f.green
  g.terminal_color_11 = f.notify_yellow
  g.terminal_color_12 = f.notify_blue
  g.terminal_color_13 = f.violet
  g.terminal_color_14 = f.notify_aqua
  g.terminal_color_15 = f.dlsgrey

  api.nvim_command('hi clear')
  opt.background = 'dark'
  opt.termguicolors = true
  vim.g.colors_name = 'flipped'
  for group, conf in pairs(groups) do
    api.nvim_set_hl(0, group, conf)
  end
end

return flip
