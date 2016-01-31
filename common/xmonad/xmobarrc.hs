Config {
  font = "xft:IPAPGothic:bold:size=8:antialias=true"
, bgColor = "black"
, fgColor = "grey"
, position = TopW L 100
, commands = [
    Run Network "enp0s25" ["-t", "<icon=.xmonad/icons/net.xbm/> <rx>KB | <tx>KB", "-L", "0", "-H", "32", "--normal", "green", "--high", "red"] 10
  , Run Network "wlp3s0" ["-t", "<icon=.xmonad/icons/net.xbm/> <rx>KB | <tx>KB", "-L", "0", "-H", "32", "--normal", "green", "--high", "red"] 10
  , Run Cpu ["-t", "<icon=.xmonad/icons/cpu.xbm/> <total>%", "-L", "3", "-H", "30", "--normal", "green", "--high", "red"] 10
  , Run Memory ["-t", "<icon=.xmonad/icons/mem.xbm/> <usedratio>%"] 10
  , Run Swap ["-t", "<icon=.xmonad/icons/swap.xbm/> <usedratio>%"] 10
  , Run Date "%Y/%m/%d %a %k:%M" "date" 10
  , Run DiskIO [("sda2", "<icon=.xmonad/icons/disk.xbm/> <total>")] [] 10
  , Run StdinReader
  ]
, sepChar = "%"
, alignSep = "}{"
, template = "%StdinReader% }{ %cpu%   %memory%   %swap%   %diskio%   %enp0s25%   %wlp3s0% : <fc=#a0bc61>%date%</fc> " }
