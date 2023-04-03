require("plugins")

local checklib = nil


local status, checklib = pcall(require, "lsp-zero")
if (status) then
    --lfs exists, so use it.
    if checklib ~= nil then
        require("keys")
        require("settings")
        require("configtheme")
        require("thememanager")
        require("hydra_vimoptions")

        --plugin confis

        require("configs.cokeline")
        require("configs.colorizer")
        require("configs.feline")
        require("configs.lsp")
        require("configs.nvimtree")
        require("configs.project")
        require("configs.rainbow")
        require("configs.tablines")
        require("configs.treesitter")
        require("configs.whichkey")
    end
end
