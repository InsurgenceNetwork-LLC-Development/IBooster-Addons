name = "AuraSkills-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for AuraSkills boosting"}

local TYPE = "Skills"
local NAMESPACE = "AURA_SKILLS"

utils.subscribeToEvent("dev.aurelium.auraskills.api.event.skill.XpGainEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setAmount(boosterUtils.calculateAmount(event:getAmount(), multi))
    end
end)