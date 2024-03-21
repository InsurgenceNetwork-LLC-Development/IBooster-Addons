name = "RivalFishingRods-Addon"
version = "1.0.0"
author = "Dragon"
description = {
  "This addon will add",
  "Support for RivalFishingRods boosting"
}

local NAMESPACE = "RIVAL_RODS"

utils.subscribeToEvent("me.rivaldev.fishingrod.rivalfishingrods.api.RodEssenceReceiveEvent", function(event)
  local multi = boosterUtils.getMulti(event:getPlayer(), "Essence", NAMESPACE)
  
  if multi > 0 then
    event:setEssence(boosterUtils.calculateAmount(event:getEssence(), multi))
  end

end)

utils.subscribeToEvent("me.rivaldev.fishingrod.rivalfishingrods.api.RodMoneyReceiveEvent", function(event)
  local multi = boosterUtils.getMulti(event:getPlayer(), "Money", NAMESPACE)
  
  if multi > 0 then
    event:setMoney(boosterUtils.calculateAmount(event:getMoney(), multi))
  end

end)

utils.subscribeToEvent("me.rivaldev.fishingrod.rivalfishingrods.api.RodXPGainEvent", function(event)
  local multi = boosterUtils.getMulti(event:getPlayer(), "XP", NAMESPACE)
  
  if multi > 0 then
    event:setXP(boosterUtils.calculateAmount(event:getXP(), multi))
  end

end)