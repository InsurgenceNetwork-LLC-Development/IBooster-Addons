name = "RivalMobSwords-Addon"
version = "1.0.0"
author = "Dragon"
description = {
  "This addon will add",
  "Support for RivalMobSwords boosting"
}

local NAMESPACE = "RIVAL_SWORDS"

utils.subscribeToEvent("me.rivaldev.mobsword.rivalmobswords.api.SwordEssenceReceiveEnchantEvent", function(event)
  local multi = boosterUtils.getMulti(event:getPlayer(), "Essence", NAMESPACE)
  
  if multi > 0 then
    event:setEssence(boosterUtils.calculateAmount(event:getEssence(), multi))
  end

end)

utils.subscribeToEvent("me.rivaldev.mobsword.rivalmobswords.api.SwordMoneyReceiveEvent", function(event)
  local multi = boosterUtils.getMulti(event:getPlayer(), "Money", NAMESPACE)
  
  if multi > 0 then
    event:setMoney(boosterUtils.calculateAmount(event:getMoney(), multi))
  end

end)

utils.subscribeToEvent("me.rivaldev.mobsword.rivalmobswords.api.SwordXPGainEvent", function(event)
  local multi = boosterUtils.getMulti(event:getPlayer(), "XP", NAMESPACE)
  
  if multi > 0 then
    event:setXP(boosterUtils.calculateAmount(event:getXP(), multi))
  end

end)