vim.filetype.add({
  extension = {
    launch = 'roslaunch',
  },
  pattern = {
    ['%.launch$'] = function(_, _, _)
      vim.opt.filetype = 'roslaunch'
    end,
  },
})
