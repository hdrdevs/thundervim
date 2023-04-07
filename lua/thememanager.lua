local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

COLOR_SCHEMES = {
    { title = "Oxo Carbon",        cmd = "oxocarbon" },
    { title = "Gruvbox",           cmd = "gruvbox" },
    { title = "Dracula",           cmd = "dracula" },
    { title = "Tender",            cmd = "tender" },
    { title = "Melange",           cmd = "melange" },
    { title = "Nordic",            cmd = "nordic" },
    { title = "One Darker",        cmd = "onedarker" },
    { title = "Tokyo Night",       cmd = "tokyonight" },
    { title = "Tokyo Night Storm", cmd = "tokyonight-storm" },
    { title = "Tokyo Night Day",   cmd = "tokyonight-day" },
    { title = "Tokyo Night Moon",  cmd = "tokyonight-moon" },
}

MENU_COLORSCHEMES_ITEMS = {}

for index, item in pairs(COLOR_SCHEMES) do
    table.insert(MENU_COLORSCHEMES_ITEMS, Menu.item(item.title))
end


function writeTheme(themecmd)
    local file_path = os.getenv("HOME") .. '/.config/nvim/lua/configtheme.lua'
    local theme_file = io.open(file_path, "w")
    io.output(theme_file)
    io.write("vim.cmd('colorscheme " .. themecmd .. "')\n")
    io.close(theme_file)
end

function getColorSchemeCommand(title)
    for index, item in pairs(COLOR_SCHEMES) do
        if (item.title == title) then
            return item.cmd
        end
    end
end

function setColorScheme(item)
    --print("setear color scheme", item.text)
    local cmd = getColorSchemeCommand(item.text)
    print(cmd)
    vim.cmd("colorscheme " .. cmd)
    writeTheme(cmd)
    require("notify")("Color scheme has changed to " .. item.text)
end

local menuColorScheme = Menu({
    position = "50%",
    size = {
        width = 25,
        height = 6,
    },
    border = {
        style = "single",
        text = {
            top = "[Choose-Color-Scheme]",
            top_align = "center",
        },
    },
    win_options = {
        winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
}, {
    lines = MENU_COLORSCHEMES_ITEMS,
    max_width = 20,
    keymap = {
        focus_next = { "j", "<Down>", "<Tab>" },
        focus_prev = { "k", "<Up>", "<S-Tab>" },
        close = { "<Esc>", "<C-c>" },
        submit = { "<CR>", "<Space>" },
    },
    on_close = function()
        print("Menu Closed!")
    end,
    on_submit = function(item)
        setColorScheme(item)
    end,
})

local gO_CangeCS = "Change Color Scheme"

local menuGlobal = Menu({
    position = "50%",
    size = {
        width = 25,
        height = 2,
    },
    border = {
        style = "single",
        text = {
            top = "[Tweaks]",
            top_align = "center",
        },
    },
    win_options = {
        winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
}, {
    lines = {
        Menu.item(gO_CangeCS),
        Menu.item("Exit"),
    },
    max_width = 20,
    keymap = {
        focus_next = { "j", "<Down>", "<Tab>" },
        focus_prev = { "k", "<Up>", "<S-Tab>" },
        close = { "<Esc>", "<C-c>" },
        submit = { "<CR>", "<Space>" },
    },
    on_close = function()
        print("Menu Closed!")
    end,
    on_submit = function(item)
        if item.text == gO_CangeCS then
            menuColorScheme:mount()
        end
        print("Menu Submitted: ", item.text)
    end,
})

function ShowGlobalMenu()
    menuGlobal:mount()
end

vim.api.nvim_create_user_command('ShowTweaks', function()
    ShowGlobalMenu()
end, {})

vim.api.nvim_create_user_command('TogleTerminal', function()
    require("nvterm.terminal").toggle "float"
end, {})


vim.api.nvim_create_user_command('AddMark', function()
    vim.api.nvim_feedkeys('m;', "m", true)
end, {})

vim.api.nvim_create_user_command('QuitMark', function()
    vim.api.nvim_feedkeys('dm-', "m", true)
end, {})

vim.api.nvim_create_user_command('QuitAllMarks', function()
    vim.api.nvim_feedkeys('dma', "m", true)
end, {})
