{-
 - xmonad.hs - Xmonad configuration file
 -
 - @rev     G-0.1.1
 - @update  2014-2-5
 - @author  Saneyuki Tadokoro <saneyan@mail.gfunction.com>
 -}

module Main where

import XMonad
import XMonad.StackSet
import XMonad.Prompt.Window
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Util.Paste (pasteString)
import XMonad.Actions.SpawnOn (spawnOn, manageSpawn)
import XMonad.Actions.CycleWS (nextWS, prevWS)
import XMonad.Actions.GridSelect
import XMonad.Config.Xfce
import Configs.Private (email)

{-
 - Help message
 -}

help :: String
help = unlines
  [ ""
  , "# XMonad keybindings #"
  , ""
  , "Key bindings (meta key is commnad or win):"
  , "Meta + Enter           switch focused window to master window"
  , "Meta + Shift + C       close focused window"
  , "Meta + Shift + Q       close xmonad"
  , "Meta + Shift + N       switch next workspace"
  , "Meta + Shift+ P        switch previous workspace"
  , "Meta + Shift+ L        Lock screen (Slimlock)"
  , "Meta + Shift+ Enter    start a terminal (Rxvt-unicode)"
  , "Meta + H               make a focus window smaller"
  , "Meta + L               make a focus window bigger"
  , "Meta + P               lanuch dmenu"
  , "Meta + G               lanuch GridSelect"
  , "Meta + B               start a web browser (Firefox Nightly)"
  , "Meta + S               start a client software of online strage (Wuala)"
  , "Meta + A               start a editor (GVim)"
  , "Meta + W               switch next screen"
  , "meta + E               switch previous screen"
  , "Meta + F1              paste a private email address (1)"
  , "Meta + F2              paste a private email address (2)"
  , "Meta + F3              paste a public email address"
  , "Meta + \\             open help window"
  , ""
  , "Startup programs and workspaces:"
  , "/---------------------------------------------------\\ "
  , "| Num   | ID        | Program                       |"
  , "|-------+-----------+-------------------------------|"
  , "| 1     | > term    | *Rxvt-unicode (with tmux/vim) |"
  , "| 2     | > browser | *Firefox Nightly, Chromium    |"
  , "| 3     | > mailer  | *Thunderbird                  |"
  , "| 4     | > psmgr   | KeePassX                      |"
  , "| 5     | > cashier | GnuCash                       |"
  , "| 6     | > paint   | GIMP, Inkscape                |"
  , "| 7     | > player  | VLC                           |"
  , "| 8     | > strage  | Wuala                         |"
  , "| 9     | > skype   | Skype                         |"
  , "| 10    | > office  | LibreOffice                   |"
  , "| 11~18 | > B~I     | (None)                        |"
  , "\\---------------------------------------------------/"
  , "*) These programs start after staring up xmonad" ]

{-
 - Application commands
 -}

-- Default application --
-- Double size font is IPAPGothic and starting with tmux
myTerm            = "urxvt -e tmux"
myEditor          = "urxvt -e vim"
myWebBrowser      = "firefox-nightly"
myMailer          = "thunderbird"
-- Use wuala client software in user directory
myPasswordManager = "keepassx"
myOnlineStrage    = "~/wuala/wuala"
mySkype           = "skype"
myLock            = "slimlock"
myCashier         = "gnucash"
myOffice          = "libreoffice"

{-
 - Workspaces
 -}

-- It should be like "ABC > DEF > GHI > ..."
appendIcon :: [WorkspaceId] -> [WorkspaceId]
appendIcon ws = map (++ " ") (map (" <icon=.xmonad/icons/ac.xbm/> " ++) ws)

masterWSGroup :: [WorkspaceId]
masterWSGroup = appendIcon ["term", "browser", "mailer", "psmgr", "cashier", "paint", "player", "strage", "skype"]

slaveWSGroup :: [WorkspaceId]
slaveWSGroup = appendIcon ["office", "B", "C", "D", "E", "F", "G", "H", "I"]

myWorkspaces :: [WorkspaceId]
myWorkspaces = masterWSGroup ++ slaveWSGroup

{-
 - Hooks 
 -}

-- Layout hook --
myLayoutHook = avoidStruts $ layoutHook xfceConfig

-- Manage hook --
myManageHook = composeAll
  [ className =? "XTerm"          --> doShift (myWorkspaces!!0)
  , className =? "URxvt"          --> doShift (myWorkspaces!!0)
  , className =? "Firefox"        --> doShift (myWorkspaces!!1)
  , className =? "Chromium"       --> doShift (myWorkspaces!!1)
  , className =? "Thunderbird"    --> doShift (myWorkspaces!!2)
  , className =? "Keepassx"       --> doShift (myWorkspaces!!3)
  , className =? "Gnucash"        --> doShift (myWorkspaces!!4)
  , className =? "Inkscape"       --> doShift (myWorkspaces!!5)
  , className =? "Gimp"           --> doShift (myWorkspaces!!5)
  , className =? "Vlc"            --> doShift (myWorkspaces!!6)
  , className =? "Wuala"          --> doShift (myWorkspaces!!7)
  , className =? "Skype"          --> doShift (myWorkspaces!!8)
  , manageSpawn
  , manageDocks
  , manageHook xfceConfig ]

  -- Log hook --
myLogHook h = logHook xfceConfig <+> dynamicLogWithPP xmobarPP
  { ppOutput = hPutStrLn h
  , ppTitle = xmobarColor "#a0bc61" "" . shorten 60 }

-- Startup hook --
myStartupHook :: X ()
myStartupHook = do
  spawnOn (myWorkspaces!!0) myTerm
  spawnOn (myWorkspaces!!1) myWebBrowser
  spawnOn (myWorkspaces!!2) myMailer
  spawnOn (myWorkspaces!!8) mySkype

{-
 - Key bindings
 -}

-- Prefix key --
myModMask = mod1Mask
mySubModMask = mod4Mask
myMSMask  = myModMask .|. shiftMask

(@+) ks (d, ws) =
  ks ++ [ ((m .|. d, k), windows $ f i)
  | (i, k) <- zip ws [xK_1 .. xK_9]
  , (f, m) <- [(greedyView, 0), (shift, shiftMask)] ]

-- Additional keys --
myAdditionalKeys =
  [ ((myModMask, xK_g)        , goToSelected defaultGSConfig)
  , ((myModMask, xK_b)        , spawn myWebBrowser)
  , ((myModMask, xK_s)        , spawn myOnlineStrage)
  , ((myModMask, xK_a)        , spawn myEditor)
  , ((myModMask, xK_backslash), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
  , ((myModMask, xK_F1)       , pasteString $ email "private")
  , ((myModMask, xK_F2)       , pasteString $ email "service")
  , ((myModMask, xK_F3)       , pasteString $ email "public")
  , ((myMSMask, xK_n)         , nextWS)
  , ((myMSMask, xK_p)         , prevWS)
  , ((myMSMask, xK_l)         , spawn myLock)
  , ((myMSMask, xK_Return)    , spawn myTerm) ]
  @+ (myModMask, masterWSGroup)
  @+ (mySubModMask, slaveWSGroup)

{-
 - Main
 -}

main :: IO ()
main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmonad/xmobarrc.hs"
  xmonad $ xfceConfig
    { XMonad.modMask            = myModMask
    , XMonad.workspaces         = myWorkspaces
    , XMonad.layoutHook         = myLayoutHook
    , XMonad.manageHook         = myManageHook
    , XMonad.logHook            = myLogHook xmproc
    , XMonad.startupHook        = myStartupHook
    , XMonad.borderWidth        = 2
    , XMonad.normalBorderColor  = "#52799e"
    , XMonad.focusedBorderColor = "#a0bc61"
    , XMonad.focusFollowsMouse  = False }
      `additionalKeys` myAdditionalKeys
