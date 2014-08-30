{-
 - xmonad.hs - XMonad configuration file
 -
 - @rev     G-0.1.2
 - @update  2014-3-3
 - @author  Saneyuki Tadokoro <saneyan@mail.gfunction.com>
 -}

module Main where

import XMonad
import XMonad.Config.Xfce
import XMonad.Util.Run
import XMonad.Util.EZConfig (additionalKeys)
import Gfxt.Workspace
import Gfxt.Hooks
import Gfxt.Bindings

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
    , XMonad.borderWidth        = 5
    , XMonad.normalBorderColor  = "#9c2c17"
    , XMonad.focusedBorderColor = "#1e5ad7"
    , XMonad.focusFollowsMouse  = False }
    `additionalKeys` myAdditionalKeys
