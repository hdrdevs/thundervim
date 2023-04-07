
require("plugins")


function file_exists()
    local file_path = os.getenv("HOME") .. '/.config/nvim/sync.lua'
   local f=io.open(file_path,"r")
   if f~=nil then io.close(f) return true else return false end
end


function create_file()
    local file_path = os.getenv("HOME") .. '/.config/nvim/sync.lua'
    local theme_file = io.open(file_path, "w")
    	io.output(theme_file)
    	io.write("ok")
   	io.close(theme_file)
end

--lfs exists, so use it.
if package.loaded["packer"] then

    if not file_exists() then
        require("packer").sync()
        create_file()
    else

    require("keys")
    require("settings")
    require("configtheme")
    require("thememanager")
    require("hydra_vimoptions")

    --plugin confis

    -- require("configs.cokeline")
    require("configs.colorizer")
    --require("configs.feline")
    require("configs.lsp")
    require("configs.nvimtree")
    require("configs.project")
    require("configs.tablines")
    require("configs.whichkey")
    end
end



