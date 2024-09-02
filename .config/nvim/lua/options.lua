require "nvchad.options"

-- Setup WSL clipboard
vim.g.clipboard = {
        name = "clip-wsl",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
        },
        paste = {
            ["+"] = "powershell.exe Get-Clipboard",
            ["*"] = "powershell.exe Get-Clipboard",
        },
        cache_enabled = true,
    }
vim.opt.clipboard = "" -- Do not share unnamed register with system clipboard

-- Set a marker for keeping lines under 80 characters
vim.o.colorcolumn = "81"

