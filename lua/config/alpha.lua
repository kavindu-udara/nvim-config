local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  "███╗   ██╗██╗   ██╗██╗███╗   ███╗",
  "████╗  ██║██║   ██║██║████╗ ████║",
  "██╔██╗ ██║██║   ██║██║██╔████╔██║",
  "██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
  "██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
  "╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
}

dashboard.section.buttons.val = {
  dashboard.button("e", "📄  New File", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "🔍  Find File", ":Telescope find_files<CR>"),
  dashboard.button("r", "🕘  Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("q", "❌  Quit NVIM", ":qa<CR>"),
}

dashboard.section.footer.val = "Have a productive session! 🚀"

alpha.setup(dashboard.config)

