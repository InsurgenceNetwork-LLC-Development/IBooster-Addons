name = "RivalMobSwords-Addon"
version = "1.0.0"
author = "Dragon"
description = {"This addon will add", "Support for RivalMobSwords boosting"}

local NAMESPACE = "RIVAL_SWORDS"

function onAddonStart()
    subscribeAndBoost("me.rivaldev.mobsword.rivalmobswords.api.SwordMoneyReceiveEvent", "Money", "getMoney", "setMoney")
    subscribeAndBoost("me.rivaldev.mobsword.rivalmobswords.api.SwordEssenceReceiveEnchantEvent", "Essence", "getEssence", "setEssence")
    subscribeAndBoost("me.rivaldev.mobsword.rivalmobswords.api.SwordXPGainEvent", "XP", "getXP", "setXP")
end

function subscribeAndBoost(eventName, currencyType, getMethod, setMethod)
    utils.subscribeToEvent(eventName, function(event)
        local multi = boosterUtils.getMulti(event:getPlayer(), currencyType, NAMESPACE)

        if multi > 0 then
            event[setMethod](event, boosterUtils.calculateAmount(amount, multi))
        end
    end)
end