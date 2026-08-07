local last_active_buf = nil

local function is_valid_file_buf(buf)
  if not buf or not vim.api.nvim_buf_is_valid(buf) then return false end
  if not vim.bo[buf].buflisted then return false end
  local buftype = vim.bo[buf].buftype
  if buftype ~= "" then return false end
  local ft = vim.bo[buf].filetype
  if ft == "neo-tree" or ft == "NvimTree" or ft == "snacks_picker" or ft == "TelescopePrompt" then return false end
  return true
end

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(args)
    local buf = args.buf
    if is_valid_file_buf(buf) then
      local status, state = pcall(require, "bufferline.state")
      local ui_status, ui = pcall(require, "bufferline.ui")

      if status and state then
        if not state.custom_sort or #state.custom_sort == 0 then
          local sort = {}
          for _, b in ipairs(vim.api.nvim_list_bufs()) do
            if is_valid_file_buf(b) then
              table.insert(sort, b)
            end
          end
          state.custom_sort = sort
        end

        local exists = false
        for _, id in ipairs(state.custom_sort) do
          if id == buf then
            exists = true
            break
          end
        end

        if not exists then
          local target_idx = nil
          if last_active_buf then
            for idx, id in ipairs(state.custom_sort) do
              if id == last_active_buf then
                target_idx = idx
                break
              end
            end
          end

          if target_idx then
            table.insert(state.custom_sort, target_idx + 1, buf)
          else
            table.insert(state.custom_sort, buf)
          end
          if ui_status and ui then pcall(ui.refresh) end
        end
      end

      last_active_buf = buf
    end
  end,
})

vim.api.nvim_create_autocmd("BufDelete", {
  callback = function(args)
    local buf = args.buf
    local status, state = pcall(require, "bufferline.state")
    if status and state and state.custom_sort then
      for idx, id in ipairs(state.custom_sort) do
        if id == buf then
          table.remove(state.custom_sort, idx)
          break
        end
      end
      local ui_status, ui = pcall(require, "bufferline.ui")
      if ui_status and ui then pcall(ui.refresh) end
    end
  end,
})

local function close_buffer_vscode_style(target_buf)
  target_buf = target_buf or vim.api.nvim_get_current_buf()
  local current_buf = vim.api.nvim_get_current_buf()

  if target_buf == current_buf then
    local status, state = pcall(require, "bufferline.state")
    local sort = (status and state and state.custom_sort) or {}
    local current_idx = nil
    for idx, id in ipairs(sort) do
      if id == target_buf then
        current_idx = idx
        break
      end
    end

    if current_idx then
      if current_idx < #sort then
        vim.api.nvim_set_current_buf(sort[current_idx + 1])
      elseif current_idx > 1 then
        vim.api.nvim_set_current_buf(sort[current_idx - 1])
      end
    end
  end

  if Snacks and Snacks.bufdelete then
    Snacks.bufdelete(target_buf)
  else
    vim.cmd("bd " .. target_buf)
  end
end

return {
  "akinsho/bufferline.nvim",
  keys = {
    { "<leader>bd", function() close_buffer_vscode_style() end, desc = "Delete Buffer (VSCode style)" },
    { "<leader>bD", function() close_buffer_vscode_style() end, desc = "Delete Buffer (Force)" },
  },
  opts = {
    options = {
      close_command = function(bufnr)
        close_buffer_vscode_style(bufnr)
      end,
      right_mouse_command = function(bufnr)
        close_buffer_vscode_style(bufnr)
      end,
    },
  },
}
