name = "OptimalSkills-Addon"
version = "1.0.2"
author = "Hxtch"
description = {"This addon will add", "Support for OptimalSkills boosting"}

local TYPE = "Skills"
local NAMESPACE = "OPTIMAL_SKILLS"

utils.subscribeToEvent("gg.optimalgames.skills.api.events.SkillExperienceGainEvent", function(event)
    local multi = boosterUtils.getMulti(event:getSkillProfile():getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setExperience(boosterUtils.calculateAmount(event:getExperience(), multi))
    end
end)