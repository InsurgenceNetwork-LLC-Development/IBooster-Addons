name = "RivalHarvesterHoes-Addon"
version = "1.0.2"
author = "Dragon"
description = {"This addon will add", "Support for RivalHarvesterHoes boosting"}

local NAMESPACE = "RIVAL_HOES"

function onAddonStart()
    subscribeAndBoost("me.rivaldev.harvesterhoes.api.events.HoeMoneyReceiveEnchant", "Money", "getMoney", "setMoney")
    subscribeAndBoost("me.rivaldev.harvesterhoes.api.events.HoeEssenceReceivePreEnchantEvent", "Essence", "getEssence", "setEssence")
    subscribeAndBoost("me.rivaldev.harvesterhoes.api.events.HoeXPGainEvent", "XP", "getXP", "setXP")
end

function subscribeAndBoost(eventName, currencyType, getMethod, setMethod)
    utils.subscribeToEvent(eventName, function(event)
        local multi = boosterUtils.getMulti(event:getPlayer(), currencyType, NAMESPACE)

        if multi > 0 then
            event[setMethod](event, boosterUtils.calculateAmount(amount, multi))
        end
    end)
end
