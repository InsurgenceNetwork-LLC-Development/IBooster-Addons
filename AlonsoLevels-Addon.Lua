import 'com.alonsoaliaga.alonsolevels.api.AlonsoLevelsAPI'

name = "AlonsoLevels-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for AlonsoLevels boosting"}

local TYPE = "Levels"
local NAMESPACE = "ALONSO_LEVELS"

utils.subscribeToEvent("com.alonsoaliaga.alonsolevels.api.events.ExperienceChangeEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        AlonsoLevelsAPI:setExperience(event:getPlayer():getUniqueId(),
            event.getOldExperience() + boosterUtils.calculateAmount(difference, multi));
    end
end)