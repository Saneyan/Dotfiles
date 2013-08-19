Config {
	 font = "xft:IPAPGothic:bold:size=9:antialias=true"
       , bgColor = "black"
       , fgColor = "grey"
       , position = TopW L 90
       , commands = [
		      Run Network "eth0" ["-L", "0", "-H", "32", "--normal", "green", "--high", "red"] 10
       	 	    , Run Cpu ["-L", "3", "-H", "30", "--normal", "green", "--high", "red"] 10
       	 	    , Run Memory ["-t", "Mem: <usedratio>%"] 10
		    , Run Swap [] 10
		    , Run Date "%Y/%m/%d %a %k:%M" "date" 10
		    , Run StdinReader
		    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% : <fc=lightblue>saneyan</fc> }{ %cpu%   %memory%   %swap%   %eth0%   <fc=#a0bc61>%date%</fc>"
       }