name = "zShop-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for zShop boosting"}

local TYPE = "Sell"
local NAMESPACE = "ZSHOP"

utils.subscribeToEvent("fr.maxlego08.zshop.api.event.events.ZShopSellEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setPrice(boosterUtils.calculateAmount(event:getPrice(), multi))
    end
end)

utils.subscribeToEvent("fr.maxlego08.zshop.api.event.events.ZShopSellAllEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        for _, action in ipairs(event:getShopActions()) do
            action:setPrice(boosterUtils:calculateAmount(action:getPrice(), multi))
        end    
    end
end)