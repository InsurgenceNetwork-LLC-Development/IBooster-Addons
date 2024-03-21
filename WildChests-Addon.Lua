name = "WildChests-Addon"
version = "1.0.0"
author = "Hxtch"
description = {
  "This addon will add",
  "Support for WildChests boosting"
}

local NAMESPACE = "WILD_CHESTS"

utils.subscribeToEvent("com.bgsoftware.wildchests.api.events.SellChestTaskEvent", function(event)
  local multi = boosterUtils.getMulti(event:getPlayer(), "Sell", NAMESPACE)
  
  if multi > 0 then
    event:setMultiplier(event:getMultiplier() + multi)
  end

end)