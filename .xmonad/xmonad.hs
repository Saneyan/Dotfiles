import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run

-- Start
main = do
     xmproc <- spawnPipe "/usr/bin/xmobar /home/saneyan/.xmonad/xmobarrc.hs"
     xmonad $ defaultConfig {
     	    modMask = mod4Mask
	  , layoutHook = avoidStruts $ layoutHook defaultConfig
	  , manageHook = manageDocks <+> manageHook defaultConfig
	  , logHook = dynamicLogWithPP xmobarPP {
	    	    ppOutput = hPutStrLn xmproc
		  , ppTitle = xmobarColor "#a0bc61" "" . shorten 50
	    }
	  , borderWidth = 2
	  , normalBorderColor = "#52799e"
	  , focusedBorderColor = "#a0bc61"
     }