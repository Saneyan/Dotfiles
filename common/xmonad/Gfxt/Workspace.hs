module Gfxt.Workspace where

import XMonad

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
