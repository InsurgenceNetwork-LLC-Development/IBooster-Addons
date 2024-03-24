import 'org.bukkit.Bukkit'

name = "EdPrison-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for EdPrison boosting"}

local CURRENCY_NAMESPACE, ENCHANT_NAMESPACE = "EDP_CURRENCY", "EDP_ENCHANT"

utils.subscribeToEvent("com.edwardbelt.edprison.events.EdPrisonAddMultiplierCurrency", function(event)
    local multi = boosterUtils.getMulti(Bukkit:getPlayer(event:getUUID()), event:getCurrency(), CURRENCY_NAMESPACE)

    if multi > 0 then
        event:addMultiplier(multi)
    end

end)

utils.subscribeToEvent("com.edwardbelt.edprison.events.EdPrisonPossibleEnchantTriggerEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), event:getEnchant(), ENCHANT_NAMESPACE)

    if multi > 0 then
        event:addPercent(event:getPercent() * multi)
    end

end)