name = "WildTools-Addon"
version = "1.0.0"
author = "Hxtch"
description = {
  "This addon will add",
  "Support for WildTools boosting"
}

local TYPE, NAMESPACE = "Sell", "WILD_TOOLS"

utils.subscribeToEvent("com.bgsoftware.wildtools.api.events.HarvesterHoeSellEvent", function(event)
  local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)
  
  if multi > 0 then
    event:setPrice(boosterUtils.calculateAmount(event:getPrice(), multi))
  end

end)

utils.subscribeToEvent("com.bgsoftware.wildtools.api.events.SellWandUseEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)
    
    if multi > 0 then
      event:setPrice(boosterUtils.calculateAmount(event:getPrice(), multi))
    end
  
end)