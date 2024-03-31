name = "SuperMobcoins-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for SuperMobcoins boosting"}

local TYPE = "Mobcoins"
local NAMESPACE = "SUPER_MOBCOINS"

utils.subscribeToEvent("me.swanis.mobcoins.events.MobCoinsReceiveEvent", function(event)
    local multi = boosterUtils.getMulti(event:getProfile():getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setAmount(boosterUtils.calculateAmount(event:getAmount(), multi))
    end
end)