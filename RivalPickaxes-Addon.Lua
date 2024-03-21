name = "RivalPickaxes-Addon"
version = "1.0.0"
author = "Dragon"
description = {
  "This addon will add",
  "Support for RivalPickaxes boosting"
}

local NAMESPACE = "RIVAL_PICKAXES"

utils.subscribeToEvent("me.rivaldev.pickaxes.api.events.PickaxeEssenceReceiveEnchantEvent", function(event)
  local multi = boosterUtils.getMulti(event:getPlayer(), "Essence", NAMESPACE)
  
  if multi > 0 then
    event:setEssence(boosterUtils.calculateAmount(event:getEssence(), multi))
  end

end)

utils.subscribeToEvent("me.rivaldev.pickaxes.api.events.PickaxeMoneyReceiveEnchant", function(event)
  local multi = boosterUtils.getMulti(event:getPlayer(), "Money", NAMESPACE)
  
  if multi > 0 then
    event:setMoney(boosterUtils.calculateAmount(event:getMoney(), multi))
  end

end)

utils.subscribeToEvent("me.rivaldev.pickaxes.api.events.PickaxeXPGainEvent", function(event)
  local multi = boosterUtils.getMulti(event:getPlayer(), "XP", NAMESPACE)
  
  if multi > 0 then
    event:setXP(boosterUtils.calculateAmount(event:getXP(), multi))
  end

end)