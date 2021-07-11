local u_git = {}

u_git.get_worktree = function()
  local success, worktree = pcall(vim.fn.FugitiveWorkTree)
  if not success then
    success, worktree = pcall(vim.fn.FindRootDirectory)
  end
  if not success then
    return ''
  end
  return worktree
end

u_git.exec = function(git_cmd, worktree)
  local wt = worktree or u_git.get_worktree()
  local opt = wt and '-C ' .. wt or ''
  local out = vim.fn.system('git ' .. opt .. ' ' .. git_cmd)
  return out
end

return u_git
