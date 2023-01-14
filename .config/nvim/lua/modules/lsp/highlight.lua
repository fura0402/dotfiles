vim.cmd([[
  highlight! CmpItemAbbrDeprecated guifg=#808080 guibg=NONE gui=strikethrough
  highlight! CmpItemAbbrMatch guifg=#82AAFF guibg=NONE gui=bold
  highlight! CmpItemAbbrMatchFuzzy guifg=#82AAFF guibg=NONE gui=bold
  highlight! CmpItemMenu guifg=#C792EA guibg=NONE gui=italic

  " highlight! CmpItemKindField guifg=#EED8DA guibg=#B5585F 
  highlight! link CmpItemKindField TSField
  highlight! link CmpItemKindProperty CmpItemKindField 
  highlight! link CmpItemKindEvent CmpItemKindField 

  " highlight! CmpItemKindText guifg=#C3E88D guibg=#9FBD73 
  highlight! link CmpItemKindText TSText
  highlight! link CmpItemKindEnum CmpItemKindText 
  highlight! link CmpItemKindKeyword CmpItemKindText 

  " highlight! CmpItemKindConstant guifg=#FFE082 guibg=#D4BB6C 
  highlight! link CmpItemKindConstant Constant
  highlight! link CmpItemKindConstructor CmpItemKindConstant 
  highlight! link CmpItemKindReference CmpItemKindConstant 

  highlight! link CmpItemKindFunction Function
  highlight! link CmpItemKindStruct CmpItemKindFunction 
  highlight! link CmpItemKindClass CmpItemKindFunction 
  highlight! link CmpItemKindModule CmpItemKindFunction 
  highlight! link CmpItemKindOperator CmpItemKindFunction 

  " highlight! CmpItemKindVariable guifg=#C5CDD9 guibg=#7E8294 
  highlight! link CmpItemKindVariable TSVariable
  highlight! link CmpItemKindFile CmpItemKindVariable 

  highlight! CmpItemKindUnit guifg=#F5EBD9 guibg=#D4A959 
  " highlight! link CmpItemKindUnit 
  highlight! link CmpItemKindSnippet CmpItemKindUnit 
  highlight! link CmpItemKindFolder CmpItemKindUnit 

  " highlight! CmpItemKindMethod guifg=#DDE5F5 guibg=#6C8ED4 
  highlight! link CmpItemKindMethod TSMethod
  highlight! link CmpItemKindValue CmpItemKindMethod 
  highlight! link CmpItemKindEnumMember CmpItemKindMethod 

  highlight! CmpItemKindInterface guifg=#D8EEEB guibg=#58B5A8 
  " highlight! link CmpItemKindInterface 
  highlight! link CmpItemKindColor CmpItemKindInterface 
  highlight! link CmpItemKindTypeParameter CmpItemKindInterface 
]])

-- Do not working...
-- local conf = {
--   CmpItemAbbrDeprecated = { fg = "#808080", bg = "NONE", strikethrough=true },
--   CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", bold=true },
--   CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", bold=true },
--   CmpItemMenu = { fg = "#C792EA", bg = "NONE", italic=true },
--
--   CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
--   CmpItemKindProperty = { link = CmpItemKindField },
--   CmpItemKindEvent = { link = CmpItemKindField },
--
--   CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
--   CmpItemKindEnum = { link = CmpItemKindText },
--   CmpItemKindKeyword = { link = CmpItemKindText },
--
--   CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
--   CmpItemKindConstructor = { link = CmpItemKindConstant },
--   CmpItemKindReference = { link = CmpItemKindConstant },
--
--   -- CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
--   CmpItemKindFunction = { link = Function, default },
--   CmpItemKindStruct = { link = CmpItemKindFunction },
--   CmpItemKindClass = { link = CmpItemKindFunction },
--   CmpItemKindModule = { link = CmpItemKindFunction },
--   CmpItemKindOperator = { link = CmpItemKindFunction },
--
--   CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
--   CmpItemKindFile = { link = CmpItemKindVariable },
--
--   CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
--   CmpItemKindSnippet = { link = CmpItemKindUnit },
--   CmpItemKindFolder = { link = CmpItemKindUnit },
--
--   CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
--   CmpItemKindValue = { link = CmpItemKindMethod },
--   CmpItemKindEnumMember = { link = CmpItemKindMethod },
--
--   CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
--   CmpItemKindColor = { link = CmpItemKindInterface },
--   CmpItemKindTypeParameter = { link = CmpItemKindInterface },
-- }

-- local set_hl = function(conf)
--   for name, value in pairs(conf) do
--     vim.api.nvim_set_hl(0, name, value)
--   end
-- end
--
-- set_hl(conf)
