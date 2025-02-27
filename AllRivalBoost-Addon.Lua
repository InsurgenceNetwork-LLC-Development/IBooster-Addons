local IMPORT_FROM = { --Importing required classes from our plugins, dont put your imports here put them outside
    ["IBooster"] = function() import('org.insurgencedev.insurgenceboosters.libs.fo.Common') end,
    ["ISets"] = function() import('org.insurgencedev.insurgencesets.libs.fo.Common') end
}
IMPORT_FROM[plugin]()

name = "AllRivalBoost-Addon"
version = "1.0.2"
author = "Hxtch"
description = {"This addon will add", "Support for Rival plugins boosting"}

local XP_TYPE, ESSENCE_TYPE, MONEY_TYPE = "XP", "Essence", "Money"
local NAMESPACE = "RIVAL"
local GET_ESSENCE, SET_ESSENCE, GET_MONEY, SET_MONEY, GET_XP, SET_XP = "getEssence", "setEssence", "getMoney", "setMoney", "getXP", "setXP"

function onAddonStart()

    if Common:doesPluginExist("RivalFishingRods") then
        subscribeAndBoost("me.rivaldev.fishingrod.rivalfishingrods.api.RodEssenceReceiveEvent", ESSENCE_TYPE, GET_ESSENCE, SET_ESSENCE)
        subscribeAndBoost("me.rivaldev.fishingrod.rivalfishingrods.api.RodMoneyReceiveEvent", MONEY_TYPE, GET_MONEY, SET_MONEY)
        subscribeAndBoost("me.rivaldev.fishingrod.rivalfishingrods.api.RodXPGainEvent", XP_TYPE, GET_XP, SET_XP)
    end

    if Common:doesPluginExist("RivalHarvesterHoes") then
        subscribeAndBoost("me.rivaldev.harvesterhoes.api.events.HoeEssenceReceiveEnchantEvent", ESSENCE_TYPE, GET_ESSENCE, SET_ESSENCE)
        subscribeAndBoost("me.rivaldev.harvesterhoes.api.events.HoeMoneyReceiveEnchant", MONEY_TYPE, GET_MONEY, SET_MONEY)
        subscribeAndBoost("me.rivaldev.harvesterhoes.api.events.HoeXPGainEvent", XP_TYPE, GET_XP, SET_XP)
    end

    if Common:doesPluginExist("RivalMobSwords") then
        subscribeAndBoost("me.rivaldev.mobsword.rivalmobswords.api.SwordEssenceReceiveEnchantEvent", ESSENCE_TYPE, GET_ESSENCE, SET_ESSENCE)
        subscribeAndBoost("me.rivaldev.mobsword.rivalmobswords.api.SwordMoneyReceiveEvent", MONEY_TYPE, GET_MONEY, SET_MONEY)
        subscribeAndBoost("me.rivaldev.mobsword.rivalmobswords.api.SwordXPGainEvent", XP_TYPE, GET_XP, SET_XP)
    end

    if Common:doesPluginExist("RivalPickaxes") then
        subscribeAndBoost("me.rivaldev.pickaxes.api.events.PickaxeEssenceReceiveEnchantEvent", ESSENCE_TYPE, GET_ESSENCE, SET_ESSENCE)
        subscribeAndBoost("me.rivaldev.pickaxes.api.events.PickaxeMoneyReceiveEnchant", MONEY_TYPE, GET_MONEY, SET_MONEY)
        subscribeAndBoost("me.rivaldev.pickaxes.api.events.PickaxeXPGainEvent", XP_TYPE, GET_XP, SET_XP)
    end

end

function subscribeAndBoost(eventName, type, getType, setType)
    utils.subscribeToEvent(eventName, function(event)
        local multi = boosterUtils.getMulti(event:getPlayer(), type, NAMESPACE)

        if multi > 0 then
            event[setType](event, boosterUtils.calculateAmount(event[getType](event), multi))
        end
    end)
end
