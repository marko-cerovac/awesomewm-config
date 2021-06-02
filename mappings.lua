-- Standard awesome library
local gears = require('gears')
local awful = require('awful')

-- Popup keys
local hotkeys_popup = require("awful.hotkeys_popup")

-- Control widgets
local widgets = require("widgets")

-- Key mappings

-- Set Modkey
modkey = 'Mod4'

-- Mouse bindings
root.buttons(gears.table.join(
    -- awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

globalkeys = gears.table.join(

    -- Awesome

	-- Reload awesome
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
	-- Exit awesome
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    -- Show help screen
    awful.key({ modkey,           }, "s",      hotkeys_popup.show_help,
              {description="show help", group="awesome"}),

    -- Window navigation and resizing

    -- Focus on next window
    awful.key({ modkey,           }, "k", function () awful.client.focus.byidx( 1) end,
        {description = "focus next by index", group = "client"}),

    -- Focus on previous window
    awful.key({ modkey,           }, "j", function () awful.client.focus.byidx(-1) end,
        {description = "focus previous by index", group = "client"}),

    -- Swap fucused client with next
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),

    -- Swap fucused client with previous
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),

    -- Focus on the next screen
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),

    -- Focus on the previous screen
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end,
              {description = "focus the previous screen", group = "screen"}),

    -- Jump to urgent client
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto,
              {description = "jump to urgent client", group = "client"}),

    -- Increase master width
    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),

    -- Decrease master width
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),

    -- Increase the number of masters
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
              {description = "increase the number of master clients", group = "layout"}),

    -- Decrease the number of masters
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
              {description = "decrease the number of master clients", group = "layout"}),

    -- Increase the number of columns
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),

    -- Decrease the number of columns
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),


    -- Layouts

    -- Next layout
    awful.key({ modkey,           }, "Tab", function () awful.layout.inc( 1)                end,
              {description = "next layout", group = "layout"}),

    -- Previous layout
    awful.key({ modkey, "Shift"   }, "Tab", function () awful.layout.inc(-1)                end,
              {description = "previous layout", group = "layout"}),


    -- Launch mappings

    -- Terminal
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),

	-- St
    awful.key({ modkey },            "t",     function () awful.util.spawn("st") end,
              {description = "Launch Rofi run prompt", group = "launcher"}),

    -- Rofi
    awful.key({ modkey },            "r",     function () awful.util.spawn("rofi -show drun") end,
              {description = "Launch Rofi run prompt", group = "launcher"}),

    -- Ranger
    awful.key({ modkey },            "e",     function () awful.util.spawn("alacritty -e ranger") end,
              {description = "Launch Ranger file manager", group = "launcher"}),

    -- Nemo
    awful.key({ modkey },            "n",     function () awful.util.spawn("nemo") end,
              {description = "Launch Nemo file manager", group = "launcher"}),

    -- Brave
    awful.key({ modkey },            "b",     function () awful.util.spawn("brave") end,
              {description = "Launch Brave browser", group = "launcher"}),

    -- Pavucontrol
    awful.key({ modkey },            "v",     function () awful.util.spawn("pavucontrol") end,
              {description = "Launch Pavucontrol volume control", group = "launcher"}),


	-- Control keys

	-- Mute the volume
	awful.key({},	  "XF86AudioMute", function ()
		awful.util.spawn("pactl set-sink-mute 0 toggle")
        widgets.myvolume.update()
		end,
			  {description = "Mute volume", group = "control"}),

	-- Raise the volume
	awful.key({},	  "XF86AudioRaiseVolume", function()
		awful.util.spawn("pactl set-sink-volume 0 +10%")
        widgets.myvolume.update()
		end,
			  {description = "Raise volume", group = "control"}),

	-- Lower the volume
	awful.key({},	  "XF86AudioLowerVolume", function()
		awful.util.spawn("pactl set-sink-volume 0 -10%")
        widgets.myvolume.update()
		end,
			  {description = "Lower volume", group = "control"}),

	-- Mute the microphone
	awful.key({},	  "XF86AudiMicMute", function ()
		awful.util.spawn("pactl set-source-mute 0 toggle")
		end,
			  {description = "Mute microphone", group = "control"}),

	-- Increase brightness by 5%
	awful.key({},	  "XF86MonBrightnessUp", function ()
		awful.util.spawn("brightnessctl --device='amdgpu_bl0' s +5%")
		end,
			  {description = "Increase brightness by 5%", group = "control"}),

	-- Decrease brightness by 5%
	awful.key({},	  "XF86MonBrightnessDown", function ()
		awful.util.spawn("brightnessctl --device='amdgpu_bl0' s 5%-")
		end,
			  {description = "Decrease brightness by 5%", group = "control"}),

	-- Capture screen
	awful.key({},	  "Print", function ()
		awful.util.spawn_with_shell([[scrot ~/Pictures/Screenshots/%Y-%m-%d-%T-screenshot.png; notify-send 'Scrot' 'Screen captured']])
		end,
			  {description = "Capture screen", group = "control"}),

	-- Lock screen
	awful.key({},	  "XF86Display", function () awful.util.spawn("slock") end,
			  {description = "Lock screen", group = "control"})

)

clientkeys = gears.table.join(

    -- Make current client fullscreen
    awful.key({ modkey,           }, "space", function (c) c.fullscreen = not c.fullscreen c:raise() end,
        {description = "toggle fullscreen", group = "client"}),

    -- Minimize current client
    awful.key({ modkey,           }, "m", function (c) c.minimized = true end ,
        {description = "minimize", group = "client"}),

    -- Maximize window
    awful.key({ modkey, "Shift"   }, "space", function (c) c.maximized = not c.maximized c:raise() end ,
        {description = "(un)maximize", group = "client"}),

    -- Kill window
    awful.key({ modkey,           }, "q",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),

    -- Make window float
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),

    -- Move window to master
    awful.key({ modkey, "Shift" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),

    -- Move to screen
    awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),

    -- Pin on top
    awful.key({ modkey, "Shift"   }, "t",      function (c) c.ontop = not c.ontop            end,
              {description = "toggle keep on top", group = "client"}),

	-- Unmaximize all windows
    awful.key({ modkey, "Shift"   }, "m", function ()
                  local c = awful.client.restore() if c then c:emit_signal( "request::activate", "key.unminimize", {raise = true}) end end,
              {description = "restore minimized", group = "client"}),

    -- Increase window gap
    awful.key({ modkey,           }, "]", function () awful.tag.incgap(2)                end,
              {description = "increase window gap", group = "layout"}),

    -- Decrease window gap
    awful.key({ modkey,           }, "[", function () awful.tag.incgap(-2)                end,
              {description = "decrease window gap", group = "layout"}),

    -- View previous tag
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),

    -- View next tag
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),

    -- Restore tags
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"})

)

-- Workspace mappings
for i = 1, 5 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

-- Mouse bindings
clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)
