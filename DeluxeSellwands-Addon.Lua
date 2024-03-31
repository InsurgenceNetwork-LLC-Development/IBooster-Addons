name = "DeluxeSellwands-Addon"
version = "1.0.2"
author = "Hxtch"
description = {"This addon will add", "Support for DeluxeSellwands boosting"}

local TYPE = "Sell"
local NAMESPACE = "DELUXE_SELLWANDS"

utils.subscribeToEvent("dev.norska.dsw.api.DeluxeSellwandSellEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setMoney(boosterUtils.calculateAmount(event:getMoney(), multi))
    end
end)