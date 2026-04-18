return {
  "folke/snacks.nvim",
  opts = {
    dashboard = { enabled = false },

    explorer = {
      win = {
        list = {
          keys = {
            ["O"] = "open_external",
          },
        },
      },
      actions = {
        open_external = function(_, item)
          local path = item.file
          if not path then
            return
          end

          local cmd
          if vim.fn.has("win32") == 1 then
            cmd = { "explorer" }
          elseif vim.fn.has("mac") == 1 then
            cmd = { "open" }
          else
            cmd = { "xdg-open" }
          end

          vim.fn.jobstart(vim.list_extend(cmd, { path }), { detach = true })
        end,
      },
    },
  },
}
