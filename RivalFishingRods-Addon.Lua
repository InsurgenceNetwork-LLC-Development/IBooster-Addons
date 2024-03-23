name = "RivalFishingRods-Addon"
version = "1.0.0"
author = "Dragon"
description = {
  "This addon will add",
  "Support for RivalFishingRods boosting"
}

local NAMESPACE = "RIVAL_RODS"

function onAddonStart()
    subscribeAndBoost("me.rivaldev.fishingrod.rivalfishingrods.api.RodEssenceReceiveEvent", "Essence", "getEssence", "setEssence")
    subscribeAndBoost("me.rivaldev.fishingrod.rivalfishingrods.api.RodMoneyReceiveEvent", "Money", "getMoney", "setMoney")
    subscribeAndBoost("me.rivaldev.fishingrod.rivalfishingrods.api.RodXPGainEvent", "XP", "getXP", "setXP")
end


function subscribeAndBoost(eventName, currencyType, getMethod, setMethod)
    utils.subscribeToEvent(eventName, function(event)
        local multi = boosterUtils.getMulti(event:getPlayer(), currencyType, NAMESPACE)

        if multi > 0 then
            event[setMethod](event, boosterUtils.calculateAmount(amount, multi))
        end
    end)
end
