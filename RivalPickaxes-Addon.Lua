name = "RivalPickaxes-Addon"
version = "1.0.0"
author = "Dragon"
description = {"This addon will add", "Support for RivalPickaxes boosting"}

local NAMESPACE = "RIVAL_PICKAXES"

function onAddonStart()
    subscribeAndBoost("me.rivaldev.pickaxes.api.events.PickaxeMoneyReceiveEnchant", "Money", "getMoney", "setMoney")
    subscribeAndBoost("me.rivaldev.pickaxes.api.events.PickaxeEssenceReceiveEnchantEvent", "Essence", "getEssence", "setEssence")
    subscribeAndBoost("me.rivaldev.pickaxes.api.events.PickaxeXPGainEvent", "XP", "getXP", "setXP")
end

function subscribeAndBoost(eventName, currencyType, getMethod, setMethod)
    utils.subscribeToEvent(eventName, function(event)
        local multi = boosterUtils.getMulti(event:getPlayer(), currencyType, NAMESPACE)

        if multi > 0 then
            event[setMethod](event, boosterUtils.calculateAmount(amount, multi))
        end
    end)
end