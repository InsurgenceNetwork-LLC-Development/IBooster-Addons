import 'com.georgev22.voidchest.api.VoidChestAPI'
import 'com.georgev22.voidchest.api.storage.data.IPlayerData'

name = "VoidChest-Addon"
version = "1.0.2"
author = "girlydragon"
description = {"This addon will add", "Support for VoidChest boosting"}

local TYPE = "Sell"
local NAMESPACE = "VOID-CHEST"

utils.subscribeToEvent("org.insurgencedev.insurgenceboosters.events.IBoosterStartEvent", function(event)
    local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)
    if multi > 0 then
        local uuid = event:getPlayer():getUniqueId()
        local playerData = VoidChestAPI:getInstance():playerManager():getEntity(uuid, true)
        local result = os.time() * 1000 + (1000 * event:getBoosterData():getTimeLeft())
        playerData:booster():boostTime(result)
        playerData:booster():booster(multi)
    end
end)