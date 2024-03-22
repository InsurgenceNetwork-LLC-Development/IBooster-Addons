name = "WildTools-Addon"
version = "1.0.0"
author = "Hxtch"
description = {
  "This addon will add",
  "Support for WildTools boosting"
}

local TYPE, NAMESPACE = "Sell", "WILD_TOOLS"

function onAddonStart()
	subscribeAndBoost("com.bgsoftware.wildtools.api.events.HarvesterHoeSellEvent")
	subscribeAndBoost("com.bgsoftware.wildtools.api.events.SellWandUseEvent")
end

function subscribeAndBoost(eventName)
    utils.subscribeToEvent(eventName, function(event)
        local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

        if multi > 0 then
            event:setPrice(event, boosterUtils.calculateAmount(event:getPrice(), multi))
        end
    end)
end