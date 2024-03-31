import 'org.insurgencedev.insurgenceboosters.libs.fo.Common'

name = "AllRivalBoost-Addon"
version = "1.0.2"
author = "Hxtch"
description = {"This addon will add", "Support for Rival plugins boosting"}

local XP_TYPE, ESSENCE_TYPE, MONEY_TYPE = "XP", "Essence", "Money"
local NAMESPACE = "RIVAL"
local GET_ESSENCE, SET_ESSENCE, GET_MONEY, SET_MONEY, GET_XP, SET_XP = "getEssence", "setEssence", "getMoney", "setMoney", "getXP", "setXP"

function onAddonStart()

    if Common:doesPluginExist("RivalFishingRods") then
        subscribeAndBoost("me.rivaldev.fishingrods.api.events.RodEssenceReceiveEnchantEvent", ESSENCE_TYPE, GET_ESSENCE, SET_ESSENCE)
        subscribeAndBoost("me.rivaldev.fishingrods.api.events.RodMoneyReceiveEnchant", MONEY_TYPE, GET_MONEY, SET_MONEY)
        subscribeAndBoost("me.rivaldev.fishingrods.api.events.RodXPGainEvent", XP_TYPE, GET_XP, SET_XP)
    end

    if Common:doesPluginExist("RivalHarveterHoes") then
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
