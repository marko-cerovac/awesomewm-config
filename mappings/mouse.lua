local gears = require "gears"
local awful = require "awful"

root.buttons(
    gears.table.join(
        awful.button({ }, 3, function()
            require "menu".main_menu:toggle()
        end),
        awful.button({ }, 4, awful.tag.viewnext),
        awful.button({ }, 5, awful.tag.viewport)
    )
)
