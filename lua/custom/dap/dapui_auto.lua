local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

local signs = {
  Breakpoint = "",
  BreakpointCondition = "",
  BreakpointRejected = "",
}

for type, icon in pairs(signs) do
  local hl = "Dap" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = "DiagnosticSignError", numhl = "" })
end

vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticSignOk", numhl = "" })

--dapui
dapui.setup({
  icons = { expanded = " ", collapsed = " ", current_frame = " " },
  controls = {
    icons = {
      pause = " ",
      play = " ",
      step_into = " ",
      step_over = " ",
      step_out = " ",
      step_back = " ",
      run_last = " ",
      terminate = " ",
    },
  },
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
})
