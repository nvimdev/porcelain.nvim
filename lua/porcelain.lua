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
    --暗蓝紫
    bg = '#1b1b26',
    --
    --莓红
    red = '#c45a65',
    dred = '#ed556a',
    --blue
    qblue = '#4491d4',
    --晴蓝
    blue = '#7487db',
    --
    applegreen = '#90a650',
    -- for sign
    wzgreen = '#69a794',
    green = '#509987',
    --
    --海螺橙
    orange = '#f0945d',
    --枯黄
    yellow = '#cfae6b',
    --牙色
    yase = '#ccc3a7',
    --
    voilet = '#bc84a8',
    yjvoilet = '#525288',
    dpvoilet = '#957FB8',
    danlanzi = '#a7a8bd',
    --
    aqua = '#55a6bd',
    --
    manaohui = '#ccc9c6',
    ---
    notify_red = '#BE3455',
    notify_yellow = '#f4bc34',
    notify_blue = '#1C95FC',
    notify_aqua = '#46D9F2',
    bluelnum = '#294161',
    non = 'NONE',
  }
end

function flip.load()
  local f = flipped()

  local groups = {
    --Neovim Relate
    Normal = { fg = f.manaohui, bg = f.bg },
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
    Title = { fg = f.yellow },
    --cursorline
    Cursorline = { bg = f.base02 },
    CursorLineNr = { fg = f.qblue },
    --pmenu
    Pmenu = { bg = f.base03, fg = f.manaohui },
    PmenuSel = { bg = f.yellow, fg = f.base06 },
    PmenuThumb = { bg = f.base02 },
    PmenuKind = { bg = f.base03, fg = f.blue },
    PmenuKindSel = { link = 'PmenuSel' },
    PmenuExtra = { link = 'Pmenu' },
    PmenuExtraSel = { link = 'PmenuSel' },
    WildMenu = { link = 'pmenu' },
    --statusline
    StatusLine = { bg = f.base05 },
    StatusLineNC = { fg = f.base05, bg = f.base05 },
    WinBar = { bg = f.non },
    WinBarNC = { bg = f.non },
    --Error
    ErrorMsg = { fg = f.notify_red },
    --Markup
    TODO = { bg = f.blue, fg = f.base02 },
    Conceal = { fg = f.green },
    Error = { fg = f.notify_red },
    NonText = { link = 'Comment' },
    --Float
    FloatBorder = { fg = f.blue },
    FloatNormal = { link = 'Normal' },
    FloatShadow = { bg = f.base06 },
    --Fold
    Folded = { fg = f.yjvoilet },
    FoldColumn = { link = 'SignColumn' },
    --Spell
    SpellBad = { fg = f.notify_red },
    SpellCap = { undercurl = true, sp = f.notify_blue },
    SpellRare = { undercurl = true, sp = f.voilet },
    SpellLocal = { undercurl = true, sp = f.notify_aqua },
    --Msg
    WarningMsg = { fg = f.notify_red },
    MoreMsg = { fg = f.green },
    --Internal
    NvimInternalError = { fg = f.notify_red },
    Directory = { fg = f.blue },
    --------------------------------------------------------
    ---@Langauge Relate
    ---@Identifier
    Identifier = { fg = f.yase },
    -- various variable names
    ['@variable'] = { fg = f.yase },
    --built-in variable names (e.g. `this`)
    ['@variable.builtin'] = { fg = f.red },
    Constant = { fg = f.orange },
    ['@constant.builtin'] = { link = 'Constant' },
    -- constants defined by the preprocessor
    ['@constant.macro'] = {},
    --modules or namespaces
    ['@namespace'] = { link = 'Include' },
    --symbols or atoms
    -- ['@symbol'] = {},
    --------------------------------------------------------
    ---@Types
    Type = { fg = f.yellow },
    ['@type.builtin'] = { link = 'Type' },
    --type definitions (e.g. `typedef` in C)
    ['@type.definition'] = { link = 'Type' },
    --type qualifiers (e.g. `const`)
    ['@type.qualifier'] = { fg = f.dpvoilet, italic = true },
    --modifiers that affect storage in memory or life-time like C `static`
    ['@storageclass'] = { fg = f.dpvoilet },
    ['@field'] = { fg = f.wzgreen },
    ['@property'] = { fg = f.wzgreen },
    --------------------------------------------------------
    ---@Keywords
    Keyword = { fg = f.dpvoilet },
    ['@keyword.function'] = { link = 'Keyword' },
    ['@keyword.return'] = { fg = f.dpvoilet, italic = true },
    ['@keyword.operator'] = { link = 'Operator' },
    --if else
    Conditional = { fg = f.voilet },
    --for while
    Repeat = { link = 'Conditional' },
    Debug = { fg = f.red },
    Label = { fg = f.voilet },
    PreProc = { fg = f.dpvoilet },
    Include = { link = 'PreProc' },
    Exception = { fg = f.voilet },
    Statement = { fg = f.voilet },
    Special = { fg = f.yellow },
    --------------------------------------------------------
    ---@Functions
    Function = { fg = f.blue },
    --built-in functions
    ['@function.builtin'] = { fg = f.qblue },
    --function calls
    ['@function.call'] = { link = 'Function' },
    --preprocessor macros
    ['@function.macro'] = { link = 'Function' },
    ['@method'] = { link = 'Function' },
    ['@method.call'] = { link = 'Function' },
    ['@constructor'] = { fg = f.wzgreen },
    ['@parameter'] = { fg = f.aqua },
    --------------------------------------------------------
    ---@Literals
    String = { fg = f.applegreen },
    Number = { fg = f.orange },
    Boolean = { fg = f.orange },
    Float = { link = 'Number' },
    --
    Define = { link = 'PreProc' },
    Operator = { fg = f.red },
    Comment = { fg = f.base01 },
    --------------------------------------------------------
    ---@punctuation
    ['@punctuation.bracket'] = { fg = '#7397ab' },
    ['@punctuation.delimiter'] = { fg = '#7397ab' },
    --------------------------------------------------------
    ---@Tag
    ['@tag.html'] = { fg = f.orange },
    ['@tag.attribute.html'] = { link = '@property' },
    ['@tag.delimiter.html'] = { link = '@punctuation.delimiter' },
    ['@tag.javascript'] = { link = '@tag.html' },
    ['@tag.attribute.javascript'] = { link = '@tag.attribute.html' },
    ['@tag.delimiter.javascript'] = { link = '@tag.delimiter.html' },
    ['@tag.typescript'] = { link = '@tag.html' },
    ['@tag.attribute.typescript'] = { link = '@tag.attribute.html' },
    ['@tag.delimiter.typescript'] = { link = '@tag.delimiter.html' },
    --------------------------------------------------------
    ---@Diff
    DiffAdd = { fg = f.green },
    DiffChange = { fg = f.blue },
    DiffDelete = { fg = f.red },
    DiffText = { fg = f.red, bold = true },
    diffAdded = { fg = f.green },
    diffRemoved = { fg = f.red },
    diffChanged = { fg = f.blue },
    diffOldFile = { fg = f.yellow },
    diffNewFile = { fg = f.orange },
    diffFile = { fg = f.cyan },
    --------------------------------------------------------
    ---@Diagnostic
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
    GitGutterDelete = { fg = f.notify_red },
    GitGutterChangeDelete = { fg = f.notify_red },
    --dashboard
    DashboardHeader = { fg = f.dpvoilet },
    DashboardFooter = { link = 'Comment' },
    DashboardProjectTitle = { fg = f.qblue, bold = true },
    DashboardProjectTitleIcon = { fg = f.danlanzi },
    DashboardProjectIcon = { fg = f.blue },
    DashboardMruTitle = { link = 'DashboardProjectTitle' },
    DashboardMruIcon = { link = 'DashboardProjectTitleIcon' },
    DashboardFiles = { fg = f.base04 },
    DashboardShortCut = { link = 'Comment' },
    DashboardShortCutIcon = { link = '@field' },
    --cmp
    CmpItemAbbr = { fg = f.manaohui },
    CmpItemAbbrMatch = { fg = f.green },
    CmpItemKind = { fg = f.blue },
    --Telescope
    TelescopePromptBorder = { bg = f.base06, fg = f.base06 },
    TelescopePromptNormal = { bg = f.base06, fg = f.dred },
    TelescopeResultsBorder = { bg = f.base06, fg = f.base06 },
    TelescopeResultsNormal = { fg = f.base04 },
    TelescopePreviewBorder = { bg = f.base06, fg = f.base06 },
    TelescopeSelectionCaret = { fg = f.yellow },
    TelescopeMatching = { fg = f.green },
    --CursorWord
    CursorWord = { bg = f.base02 },
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
  g.terminal_color_15 = f.manaohui

  api.nvim_command('hi clear')
  opt.background = 'dark'
  opt.termguicolors = true
  vim.g.colors_name = 'porcelain'
  for group, conf in pairs(groups) do
    api.nvim_set_hl(0, group, conf)
  end
end

return flip
