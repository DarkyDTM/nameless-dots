require("aliases")

workrule({
	workspace = "special:special",
	gaps_out = 25
})

workrule({
	workspace = "w[1]",
	border_size = 0
})

workrule({
	workspace = "f[1]",
	border_size = 0
})

-- floating windows
winrule({
    match = {
        float = true
    },
    border_size = 1
})
winrule({
    match = {
        class = "org.gnome.clocks"
    },
    float = true
})
winrule({
    match = {
        workspace = "special:special"
    },
    border_size = 1
})
winrule({
    match = {
        class = "^(Minecraft.*)$"
    },
    fullscreen = true
})

-- term
winrule({
    match = {
        class = "kitty"
    },
    workspace = "1"
})

-- browser
winrule({
    match = {
        class = "zen"
    },
    workspace = "2"
})

-- communication
winrule({
    match = {
        class = "^(.*gram.desktop)$"
    },
    workspace = "3"
})
winrule({
    match = {
        class = "vesktop"
    },
    workspace = "3"
})

-- utilities
winrule({
    match = {
        class = "org.gnome.Nautilus"
    },
    workspace = "4"
})
winrule({
    match = {
        class = "localsend"
    },
    workspace = "4"
})
winrule({
    match = {
        class = "org.pulseaudio.pavucontrol"
    },
    workspace = "4"
})
winrule({
    match = {
        class = "io.missioncenter.MissionCenter"
    },
    workspace = "4"
})
winrule({
    match = {
        class = "gpartedbin"
    },
    workspace = "4"
})
winrule({
    match = {
        title = "Библиотека"
    },
    workspace = "4"
})

-- need in bg
winrule({
    match = {
        class = "org.qbittorrent.qBittorrent"
    },
    workspace = "5 silent"
})
winrule({
    match = {
        class = "hiddify"
    },
    workspace = "5 silent"
})

-- games
winrule({
    match = {
        class = "org.vinegarhq.Sober"
    },
    workspace = "6"
})
winrule({
    match = {
        class = "steam"
    },
    workspace = "6"
})
winrule({
    match = {
        class = "org.freesmTeam.freesmlauncher"
    },
    workspace = "6"
})
winrule({
    match = {
        class = "^(Minecraft.*)$"
    },
    workspace = "6"
})
winrule({
    match = {
        class = "gorebox.exe"
    },
    workspace = "6"
})

-- need in fullscreen
winrule({
    match = {
        class = "gimp"
    },
    workspace = "7"
})
