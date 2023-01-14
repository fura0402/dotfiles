local M = {}

local conf = {
  NormalFloat = { link = Normal },
  FloatBorder = { link = Normal },
}

M.set_hl = function(opts)
  if next(opts) then
    for name, val in pairs(opts) do
      merged_conf = rawset(conf, name, val)
    end
  else
    merged_conf = conf
  end

  for name, value in pairs(merged_conf) do
    vim.api.nvim_set_hl(0, name, value)
  end
end

return M
