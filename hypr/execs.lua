local cmds = {
	"qs",
	"awww-daemon",
	"hyprctl setcursor Bibata-Modern-Ice 20",
	"hypr-wellveing -d",
	"ntfy subscribe --from-config",
	SCRIPT.."battery_daemon.sh"
}

function execs()
	for _, command in pairs(cmds) do
		hl.exec_cmd(command)
	end
end

hl.on("hyprland.start", execs)
