name = "VirtualSpawner-Addon"
version = "1.0.0"
author = "Hxtch"
description = {
  "This addon will add",
  "Support for VirtualSpawner boosting"
}

local NAMESPACE = "VIRTUAL_SPAWNER"

utils.subscribeToEvent("net.codava.virtualspawner.api.event.PreSpawnerSellEvent", function(event)
  local multi = boosterUtils.getMulti(event:getPlayer(), "Sell", NAMESPACE)
  
  if multi > 0 then
    event:setAmount(boosterUtils.calculateAmount(event:getAmount(), multi))
  end

end)