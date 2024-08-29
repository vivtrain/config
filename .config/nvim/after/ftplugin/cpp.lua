
local map = vim.keymap.set

-- DAP Commands
map("n", "<leader>dc", "<cmd> DapContinue <cr>", {desc = "DAP Debugger continue"} )
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <cr>", {desc = "DAP Debugger toggle breakpoint"} )
map("n", "<leader>di", "<cmd> DapStepInto <cr>", {desc = "DAP Debugger step into"} )
map("n", "<leader>do", "<cmd> DapStepOver <cr>", {desc = "DAP Debugger step over"} )
map("n", "<leader>dx", "<cmd> DapStepOut <cr>", {desc = "DAP Debugger step out (i.e. exit)"} )
map("n", "<leader>dt", "<cmd> DapTerminate <cr>", {desc = "DAP Debugger Terminate"} )

