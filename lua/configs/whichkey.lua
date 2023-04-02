local wk = require("which-key")
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1

wk.register({
    g = {
        name = "Git",
        g = { "<cmd>Git<cr>", "Open Git - vim-fugitive" },
        a = { "<cmd>Gwrite<cr>", "Add file to the staged files" },
    },
    e = {
        name = "File Explorer",
        t = { "<cmd>NvimTreeToggle<cr>", "Nvim Tree - File Explorer" },
        e = { "<cmd>Explore<cr>", "Neovim default - File Explorer" },
    },
    b = {
        name = "Buffers",
        b = { "<cmd>Telescope buffers<cr>", "List of buffers" },
        c = { "<cmd>bdelete!<cr>", "Close file" },
    },
    f = {
        name = "Find with Telescope",
        f = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search in file" },
        a = { "<cmd>Telescope find_files<cr>", "Search files" },
        g = { "<cmd>Telescope live_grep<cr>", "Search into files" },
        p = { "<cmd>Telescope projects<cr>", "Switch to another project" },
    },
    m = {
        name = "Marks",
        a = { "<cmd>AddMark<cr>", "Add mark" },
        q = { "<cmd>QuitMark<cr>", "Delete mark" },
        d = { "<cmd>QuitAllMarks<cr>", "Delete all marks" },
        n = { "<Plug>(Marks-next)", "Go to next mark" },
        p = { "<Plug>(Marks-prev)", "Go to previous mark" },
        m = { "<cmd>MarksListAll<cr>", "List all marks" },
    },
    u = { "<cmd>UndotreeToggle<cr>", "Undo Tree Togle" },
    t = { "<cmd>ShowTweaks<cr>", "Tweaks dialog" },
    q = { "<cmd>qa<cr>", "Exit to command line" },
    s = {
        name = "Splits",
        v = { "<cmd>vsplit<cr>", "Vertical Split" },
        h = { "<cmd>split<cr>", "Horizontal Split" },
        r = {
            name = "Reize",
            w = { "<cmd>resize +10<cr>", "Increase horizontal size" },
            s = { "<cmd>resize -10<cr>", "Reduce horizontal size" },
            v = { "<cmd>vertical resize +10<cr>", "Increase vertical size" },
            f = { "<cmd>vertical resize -10<cr>", "Reduce vertical size" },
        },
    },
    l = {
        name = "Lsp - Language Server Protocol",
        i = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Get info" },
        d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
        r = { "<cmd>lua vim.lsp.buf.references()<cr>", "Get references" },
        x = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Refactor" },
    },
}, { prefix = "<leader>" })
