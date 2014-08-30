module Gfxt.Hooks where

import XMonad
import XMonad.Config.Xfce
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
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
