name = "EcoSkills-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for EcoSkills boosting"}

local TYPE = "Skills"
local NAMESPACE = "ECO_SKILLS"

utils.subscribeToEvent("com.willfp.ecoskills.api.event.PlayerSkillXPGainEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setAmount(boosterUtils.calculateAmount(event:getAmount(), multi))
    end

end)