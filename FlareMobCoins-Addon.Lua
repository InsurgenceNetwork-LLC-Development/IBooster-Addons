name = "FlareMobCoins-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for FlareMobCoins boosting"}

local TYPE = "Mobcoins"
local NAMESPACE = "FLARE_MOBCOINS"

utils.subscribeToEvent("net.devtm.tmmobcoins.API.MobCoinReceiveEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setDropAmount(boosterUtils.calculateAmount(event:getObtainedAmount(), multi))
    end
end)