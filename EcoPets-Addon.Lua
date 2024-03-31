name = "EcoPets-Addon"
version = "1.0.2"
author = "Hxtch"
description = {"This addon will add", "Support for EcoPets boosting"}

local TYPE = "Pets"
local NAMESPACE = "ECO_PETS"

utils.subscribeToEvent("com.willfp.ecopets.api.event.PlayerPetExpGainEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setAmount(boosterUtils.calculateAmount(event:getAmount(), multi))
    end
end)