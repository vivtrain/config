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
vim.opt.clipboard="" -- Do not share unnamed register with system clipboard

