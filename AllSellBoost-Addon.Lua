import 'org.insurgencedev.insurgenceboosters.libs.fo.Common'

name = "AllSellBoost-Addon"
version = "1.0.2"
author = "Hxtch"
description = {"This addon will add", "Support for Sell boosting"}

local TYPE = "Sell"
local NAMESPACE = "GENERAL_SELL"

function onAddonStart()

    if Common:doesPluginExist("ZithiumCollector") then
        subscribeAndBoost("com.zithium.collector.api.events.CollectorSellEvent", "getPrice", "setPrice")
        subscribeAndBoost("com.zithium.collector.api.events.CollectorSellAllEvent", "getTotalWorth", "setTotalWorth")
        subscribeAndBoost("com.zithium.collector.api.events.CollectorAutoSellEvent", "getTotalWorth", "setTotalWorth")
    end

    if Common:doesPluginExist("WildTools") then
        subscribeAndBoost("com.bgsoftware.wildtools.api.events.HarvesterHoeSellEvent", "getPrice", "setPrice")
        subscribeAndBoost("com.bgsoftware.wildtools.api.events.SellWandUseEvent", "getPrice", "setPrice")
    end

    if Common:doesPluginExist("WildChests") then
        subscribeAndBoost("com.bgsoftware.wildchests.api.events.SellChestTaskEvent", "getMultiplier", "setMultiplier")
    end

    if Common:doesPluginExist("VirtualSpawner") then
        subscribeAndBoost("net.codava.virtualspawner.api.event.PreSpawnerSellEvent", "getAmount", "setAmount")
    end

    if Common:doesPluginExist("ManifestCollector") then
        subscribeAndBoost("com.bgsoftware.manifestcollector.api.events.CollectorSellEvent", "getPrice", "setPrice")
    end

    if Common:doesPluginExist("Sellwand") then
        subscribeAndBoost("me.zachary.sellwand.api.events.SellwandSellEvent", "getSellPrice", "setSellPrice")
    end

    if Common:doesPluginExist("ChunkCollector") then
        subscribeAndBoost("dev.kbejj.chunkcollector.events.CollectorSellEvent", "getSellPrice", "setSellPrice")
    end

    if Common:doesPluginExist("DeluxeSellwands") then
        subscribeAndBoost("dev.norska.dsw.api.DeluxeSellwandSellEvent", "getMoney", "setMoney")
    end

    if Common:doesPluginExist("RivalFishingRods") then
        subscribeAndBoost("me.rivaldev.fishingrod.rivalfishingrods.api.RodMoneyReceiveEvent", "getMoney","setMoney")
    end

    if Common:doesPluginExist("RivalHarvesterHoes") then
        subscribeAndBoost("me.rivaldev.harvesterhoes.api.events.HoeMoneyReceiveEnchant", "getMoney","setMoney")
    end

    if Common:doesPluginExist("RivalMobSwords") then
        subscribeAndBoost("me.rivaldev.mobsword.rivalmobswords.api.SwordMoneyReceiveEvent", "getMoney","setMoney")
    end

    if Common:doesPluginExist("RivalPickaxes") then
        subscribeAndBoost("me.rivaldev.pickaxes.api.events.PickaxeMoneyReceiveEnchant", "getMoney","setMoney")
    end

    if Common:doesPluginExist("ShopGUIPlus") then

        import 'net.brcdev.shopgui.shop.ShopManager'
        import 'net.brcdev.shopgui.shop.item.ShopItem'

        utils.subscribeToEvent("net.brcdev.shopgui.event.ShopPreTransactionEvent", function(event)

            if event:getShopAction() == ShopManager.ShopAction.BUY then
                return
            end

            local amount = event:getPrice()
            if amount <= 0 then
                return
            end

            local multi = boosterUtils.getMulti(event:getPlayer():getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:setPrice(boosterUtils.calculateAmount(amount, multi))
            end
        end)

    end

    if Common:doesPluginExist("JobsReborn") then

        import 'com.gamingmesh.jobs.container.CurrencyType'

        utils.subscribeToEvent("com.gamingmesh.jobs.api.JobsPaymentEvent", function(event)
            local amount = event:getPayment():get(CurrencyType.MONEY)
            if amount <= 0 then
                return
            end

            local multi = boosterUtils.getMulti(event:getPlayer():getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:set(CurrencyType.MONEY, boosterUtils.calculateAmount(amount, multi))
            end
        end)

    end

    if Common:doesPluginExist("EconomyShopGUI") or Common:doesPluginExist("EconomyShopGUI-Premium") then

        import 'me.gypopo.economyshopgui.util.Transaction'

        utils.subscribeToEvent("me.gypopo.economyshopgui.api.events.PreTransactionEvent", function(event)
            local transactionType = event:getTransactionType()
            if string.lower(transactionType:getMode()) ~= "sold" then
                return
            end

            local amount = event:getPrice()
            if amount <= 0 then
                return
            end

            local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                if transactionType == Transaction.Type.SELL_GUI_SCREEN or transactionType == Transaction.Type.SELL_ALL_SCREEN or transactionType == Transaction.Type.SELL_ALL_COMMAND then
                    local prices = event:getPrices()
                    local keys = prices:getKeys()
                    for i = 1, #keys do
                      local key = keys[i]
                      local originalPrice = prices:get(key)
                      boosterUtils.calculateAmount(originalPrice, multi)
                      prices:put(key, newPrice)
                    end
                    return
                end

                event:setPrice(boosterUtils.calculateAmount(amount, multi))
            end
        end)

    end

end

function subscribeAndBoost(eventName, getType, setType)
    utils.subscribeToEvent(eventName, function(event)
        local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

        if multi > 0 then
            event[setType](event, boosterUtils.calculateAmount(event[getType](event), multi))
        end
    end)
end
