--[[

     nightfall Awesome WM theme v2.4
     Based on Steamburn theme from lain/awesome-copycats
     
     required dependencies of this theme file: SF Pro Text & SF Mono (fonts), Droid Sans Mono Nerd Font (font), lain, awesome-copycats
     optional dependencies: Roboto Condensed (font)
     
--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.zenburn_dir                               = require("awful.util").get_themes_dir() .. "zenburn"
theme.dir                                       = os.getenv("HOME") .. "/.config/awesome/themes/nightfall-v2"
theme.wallpaper                                 = theme.dir .. "/wall.jpg"
theme.font                                      = "SF Pro Text 9"
--theme.font                                      = "Roboto Condensed 10"

-- colors
theme.bg_normal     = "#1a1a1a"
theme.bg_focus      = "#1a1a1a"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#1a1a1a"
theme.bg_systray    = theme.bg_normal
theme.fg_normal     = "#ffffff"
theme.fg_focus      = "#eca4c4"
--theme.fg_focus      = "#a76cac"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"
theme.border_normal = "#1a1a1a"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

theme.border_width                              = 1
--theme.taglist_squares_sel                       = theme.dir .. "/icons/square_sel.png"
--theme.taglist_squares_unsel                     = theme.dir .. "/icons/square_unsel.png"
theme.menu_height                               = 16
theme.menu_width                                = 140
theme.awesome_icon                              = theme.dir .."/icons/awesome.png"
theme.menu_submenu_icon                         = theme.dir .. "/icons/submenu.png"
theme.layout_txt_tile                           = "[ t ]"
theme.layout_txt_tileleft                       = "[ l ]"
theme.layout_txt_tilebottom                     = "[ b ]"
theme.layout_txt_tiletop                        = "[ tt ]"
theme.layout_txt_fairv                          = "[ fv ]"
theme.layout_txt_fairh                          = "[ fh ]"
theme.layout_txt_spiral                         = "[ s ]"
theme.layout_txt_dwindle                        = "[ d ]"
theme.layout_txt_max                            = "[ m ]"
theme.layout_txt_fullscreen                     = "[ F ]"
theme.layout_txt_magnifier                      = "[ M ]"
theme.layout_txt_floating                       = "[ f ]"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 4
theme.titlebar_close_button_normal              = theme.zenburn_dir.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.zenburn_dir.."/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.zenburn_dir.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.zenburn_dir.."/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.zenburn_dir.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.zenburn_dir.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.zenburn_dir.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.zenburn_dir.."/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.zenburn_dir.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.zenburn_dir.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.zenburn_dir.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.zenburn_dir.."/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.zenburn_dir.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.zenburn_dir.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.zenburn_dir.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.zenburn_dir.."/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.zenburn_dir.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.zenburn_dir.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.zenburn_dir.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.zenburn_dir.."/titlebar/maximized_focus_active.png"

-- lain related
theme.layout_txt_termfair                       = "[termfair]"
theme.layout_txt_centerfair                     = "[centerfair]"

local markup = lain.util.markup
local gray   = "#94928F"

-- Textclock
local mytextclock = wibox.widget.textclock(" %H:%M ")
mytextclock.font = theme.font

-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
	 	font = "SF Mono  9", -- use generic "Monospace" if you don't have SF Mono installed
    	fg   = theme.fg_normal,
    	bg   = theme.bg_normal
    }
})

-- Mail IMAP check
--[[ commented because it needs to be set before use
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        mail  = ""
        count = ""

        if mailcount > 0 then
            mail = "Mail "
            count = mailcount .. " "
        end

        widget:set_markup(markup(gray, mail) .. count)
    end
})
--]]

--  MPD
local mpdicon = wibox.widget.textbox()
theme.mpd = lain.widget.mpd({
     settings = function()
         if mpd_now.state == "play" then
             artist = " " .. mpd_now.artist .. " - "
             title  = mpd_now.title
             widget:set_markup(markup.fontfg(theme.font, "#ce5666" , artist .. title ))
				 mpdicon.markup = '<span font ="DroidSansMono Nerd Font 11" fgcolor="#ce5666"> </span>'  
         elseif mpd_now.state == "pause" then
         	 widget:set_markup(markup.fontfg(theme.font, "#b4b4b4", ""))
				 mpdicon.markup = '<span font ="DroidSansMono Nerd Font 11" fgcolor="#ce5666"></span>'  
         else
         	 widget:set_markup(markup.fontfg(theme.font, "#b4b4b4", ""))
				 mpdicon.markup = '<span font ="DroidSansMono Nerd Font 11" fgcolor="#ce5666"></span>'  
         end
     end
})

-- CPU
local cpuicon = wibox.widget.textbox()
cpuicon.markup = '<span font ="DroidSansMono Nerd Font 11" fgcolor="#ce5666"></span>'  
local cpu = lain.widget.cpu({
    settings = function()
	     widget:set_markup(markup.fontfg(theme.font, "#ce5666", " " .. cpu_now.usage .. "%"))
    end
})

-- Coretemp
local tempicon = wibox.widget.textbox()
tempicon.markup = '<span font ="DroidSansMono Nerd Font 8" fgcolor="#f1af5f"></span>'  
local temp = lain.widget.temp({
	 tempfile = "/sys/class/hwmon/hwmon1/temp1_input", -- default is /sys/class/thermal/thermal_zone0/temp, your location may vary
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#f1af5f", " " .. coretemp_now .. "°C"))
    end
})

-- MEM
local memicon = wibox.widget.textbox()
memicon.markup = '<span font ="DroidSansMono Nerd Font 10" fgcolor="#eca4c4"></span>'  
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#eca4c4", " " .. mem_now.used .. "M"))
    end
})

-- Battery
local baticon = wibox.widget.textbox()
baticon.markup = '<span font ="DroidSansMono Nerd Font 8" fgcolor="#969176"></span>'  
local bat = lain.widget.bat({
    settings = function()
        local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc

        if bat_now.ac_status == 1 then
            perc = " " .. perc .. "AC"
        end
        
        widget:set_markup(markup.fontfg(theme.font, "#969176", " " .. perc .. "  "))
    end
})

-- Net checker
local net = lain.widget.net({
    settings = function()
        if net_now.state == "up" then net_state = "On"
        else net_state = "Off" end
        widget:set_markup(markup.font(theme.font, markup(gray, " Net ") .. net_state .. " "))
    end
})

-- ALSA volume
local volicon = wibox.widget.textbox()
volicon.markup = '<span font ="DroidSansMono Nerd Font 9" fgcolor="#83a3be"></span>'  
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
--            volume_now.level = "M"
            widget:set_markup(markup.fontfg(theme.font, "#83a3be", " " .. "M"))
--        end
		  else
            widget:set_markup(markup.fontfg(theme.font, "#83a3be", " " .. volume_now.level .. "%"))
        end
    end
})

-- Weather
local weathericon = wibox.widget.textbox()
weathericon.markup = '<span font ="DroidSansMono Nerd Font 9" fgcolor="#bba9cf"></span>'  
theme.weather = lain.widget.weather({
    city_id = 4235193, -- replace with your own
    notification_preset = { font = theme.font, fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font, "#bba9cf", " " .. "N/A"),
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
--        widget:set_markup(markup.fontfg(theme.font, "#eca4c4", descr .. " @ " .. units .. "°C "))
        widget:set_markup(markup.fontfg(theme.font, "#bba9cf", " " ..  units .. "°C"))
    end
})

-- Separators
local first = wibox.widget.textbox(markup.font("Misc Tamsyn 4", " "))
local spr   = wibox.widget.textbox(' ')
local doublespr = wibox.widget.textbox("   ")

local function update_txt_layoutbox(s)
    -- Writes a string representation of the current layout in a textbox widget
    local txt_l = theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))] or ""
    s.mytxtlayoutbox:set_text(txt_l)
end

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Textual layoutbox
    s.mytxtlayoutbox = wibox.widget.textbox(theme["layout_txt_" .. awful.layout.getname(awful.layout.get(s))])
    awful.tag.attached_connect_signal(s, "property::selected", function () update_txt_layoutbox(s) end)
    awful.tag.attached_connect_signal(s, "property::layout", function () update_txt_layoutbox(s) end)
    s.mytxtlayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function() awful.layout.inc(1) end),
                           -- awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 2, function() awful.layout.set(-1) end),
                           awful.button({}, 3, function() awful.layout.inc(1) end),
                           awful.button({}, 4, function() awful.layout.inc(-1) end),
                           awful.button({}, 5, function() awful.layout.inc(1) end)))

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = 25 })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            first,
            s.mytaglist,
            spr,
            s.mytxtlayoutbox,
            --spr,
            s.mypromptbox,
            spr,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            -- spr,
            -- theme.mail.widget,
	         mpdicon,
	    	   theme.mpd.widget,
				doublespr,
            weathericon,
            theme.weather.widget,
				doublespr,
            cpuicon,
            cpu.widget,
				doublespr,
	    	   memicon,
	    	   memory.widget,
				doublespr,
	    	   tempicon,
	    	   temp.widget,
				doublespr,
            volicon,
            theme.volume.widget,
				doublespr,
            baticon,
            bat.widget,
            -- net.widget,
				-- doublespr,
            mytextclock,
        },
    }
end

return theme
