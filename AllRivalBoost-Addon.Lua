name = "AllRivalBoost-Addon"
version = "1.0.0"
author = "Hxtch"
description = {
  "This addon will add",
  "Support for Rival plugins boosting"
}

local XP_TYPE, ESSENCE_TYPE, MONEY_TYPE = "XP", "Essence", "Money"
local NAMESPACE = "RIVAL"

utils.subscribeToEvent("me.rivaldev.fishingrod.rivalfishingrods.api.RodEssenceReceiveEvent", 
function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), ESSENCE_TYPE, NAMESPACE)
    
    if multi > 0 then
      event:setEssence(boosterUtils.calculateAmount(event:getEssence(), multi))
    end
  
end)

utils.subscribeToEvent("me.rivaldev.harvesterhoes.api.events.HoeEssenceReceivePreEnchantEvent", 
function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), ESSENCE_TYPE, NAMESPACE)
    
    if multi > 0 then
      event:setEssence(boosterUtils.calculateAmount(event:getEssence(), multi))
    end
end)

utils.subscribeToEvent("me.rivaldev.mobsword.rivalmobswords.api.SwordEssenceReceiveEnchantEvent", 
function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), ESSENCE_TYPE, NAMESPACE)
    
    if multi > 0 then
      event:setEssence(boosterUtils.calculateAmount(event:getEssence(), multi))
    end
  
end)

utils.subscribeToEvent("me.rivaldev.pickaxes.api.events.PickaxeEssenceReceiveEnchantEvent", 
function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), ESSENCE_TYPE, NAMESPACE)
    
    if multi > 0 then
      event:setEssence(boosterUtils.calculateAmount(event:getEssence(), multi))
    end
  
end)

utils.subscribeToEvent("me.rivaldev.fishingrod.rivalfishingrods.api.RodMoneyReceiveEvent", 
function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), MONEY_TYPE, NAMESPACE)
    
    if multi > 0 then
      event:setMoney(boosterUtils.calculateAmount(event:getMoney(), multi))
    end
  
end)

utils.subscribeToEvent("me.rivaldev.harvesterhoes.api.events.HoeMoneyReceiveEnchant", 
function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), MONEY_TYPE, NAMESPACE)
    
    if multi > 0 then
      event:setMoney(boosterUtils.calculateAmount(event:getMoney(), multi))
    end
    
end)

utils.subscribeToEvent("me.rivaldev.mobsword.rivalmobswords.api.SwordMoneyReceiveEvent", 
function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), MONEY_TYPE, NAMESPACE)
    
    if multi > 0 then
      event:setMoney(boosterUtils.calculateAmount(event:getMoney(), multi))
    end
  
end)

utils.subscribeToEvent("me.rivaldev.pickaxes.api.events.PickaxeMoneyReceiveEnchant", 
function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), MONEY_TYPE, NAMESPACE)
    
    if multi > 0 then
      event:setMoney(boosterUtils.calculateAmount(event:getMoney(), multi))
    end
  
end)

utils.subscribeToEvent("me.rivaldev.fishingrod.rivalfishingrods.api.RodXPGainEvent", 
function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), XP_TYPE, NAMESPACE)
    
    if multi > 0 then
      event:setXP(boosterUtils.calculateAmount(event:getXP(), multi))
    end
  
end)

utils.subscribeToEvent("me.rivaldev.harvesterhoes.api.events.HoeXPGainEvent", 
function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), XP_TYPE, NAMESPACE)
    
    if multi > 0 then
      event:setXP(boosterUtils.calculateAmount(event:getXP(), multi))
    end
    
end)

utils.subscribeToEvent("me.rivaldev.mobsword.rivalmobswords.api.SwordXPGainEvent", 
function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), XP_TYPE, NAMESPACE)
    
    if multi > 0 then
      event:setXP(boosterUtils.calculateAmount(event:getXP(), multi))
    end
  
end)

utils.subscribeToEvent("me.rivaldev.pickaxes.api.events.PickaxeXPGainEvent", 
function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), XP_TYPE, NAMESPACE)
    
    if multi > 0 then
      event:setXP(boosterUtils.calculateAmount(event:getXP(), multi))
    end
  
end)