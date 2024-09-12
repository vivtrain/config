require "nvchad.options"

-- Setup WSL clipboard
vim.g.clipboard = {
        name = "clip-wsl",
        copy = {
            ["+"] = "clip.exe",
            ["*"] = "clip.exe",
        },
        paste = {
            ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = true,
    }
vim.opt.clipboard = "" -- Do not share unnamed register with system clipboard

-- Set a marker for keeping lines under 80 characters
vim.o.colorcolumn = "81"

