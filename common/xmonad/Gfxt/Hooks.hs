module Gfxt.Hooks where

import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Actions.SpawnOn (spawnOn, manageSpawn)
import XMonad.Util.Run
import Gfxt.Workspace
import Gfxt.Aliases

-- Layout hook --
myLayoutHook = avoidStruts $ layoutHook xfceConfig

-- Manage hook --
myManageHook = composeAll
  [ className =? "XTerm"          --> doShift (myWorkspaces!!0)
  , className =? "URxvt"          --> doShift (myWorkspaces!!0)
  , className =? "Firefox"        --> doShift (myWorkspaces!!1)
  , className =? "Chromium"       --> doShift (myWorkspaces!!1)
  , className =? "Google Chrome"  --> doShift (myWorkspaces!!1)
  , className =? "Thunderbird"    --> doShift (myWorkspaces!!2)
  , className =? "Keepassx"       --> doShift (myWorkspaces!!3)
  , className =? "IntelliJ"       --> doShift (myWorkspaces!!4)
  , className =? "Inkscape"       --> doShift (myWorkspaces!!5)
  , className =? "Gimp"           --> doShift (myWorkspaces!!5)
  , className =? "Vlc"            --> doShift (myWorkspaces!!6)
  , title     =? "Excel Online"   --> doShift (myWorkspaces!!8)
  , title     =? "Word Online"    --> doShift (myWorkspaces!!8)
  , title     =? "PowerPoint Online" --> doShift (myWorkspaces!!8)
  , title     =? "Onenote Online" --> doShift (myWorkspaces!!8)
  , className =? "Slack"          --> doShift (myWorkspaces!!9)
  , title     =? "Gitter"         --> doShift (myWorkspaces!!10)
  , title     =? "LINE"           --> doShift (myWorkspaces!!11)
  , className =? "Skype"          --> doShift (myWorkspaces!!12)
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
  setWMName "LG3D"
  spawnOn (myWorkspaces!!0) myTerm
  spawnOn (myWorkspaces!!1) myWebBrowser
  spawnOn (myWorkspaces!!2) myMailer
  spawnOn (myWorkspaces!!9) mySlack
  spawnOn (myWorkspaces!!10) myGitter
  spawnOn (myWorkspaces!!11) myLine
  spawnOn (myWorkspaces!!12) mySkype
