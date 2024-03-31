name = "LevelTools-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for LevelTools boosting"}

local TYPE = "Tools"
local NAMESPACE = "LEVEL_TOOLS"

utils.subscribeToEvent("me.byteful.plugin.leveltools.api.event.LevelToolsXPIncreaseEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setNewXp(boosterUtils.calculateAmount(event:getNewXp(), multi))
    end
end)