import 'org.insurgencedev.insurgenceboosters.libs.fo.Common'

name = "AllSellBoost-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for Sell boosting"}

local TYPE = "Sell"
local NAMESPACE = "GENERAL_SELL"

function onAddonStart()

    if Common:doesPluginExist("ZithiumCollector") then

        utils.subscribeToEvent("net.zithium.collectors.events.CollectorAutoSellEvent", function(event)
            local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:setTotalWorth(boosterUtils.calculateAmount(event:getTotalWorth(), multi))
            end
        end)

        utils.subscribeToEvent("net.zithium.collectors.events.CollectorSellAllEvent", function(event)
            local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:setTotalWorth(boosterUtils.calculateAmount(event:getTotalWorth(), multi))
            end
        end)

        utils.subscribeToEvent("net.zithium.collectors.events.CollectorSellEvent", function(event)
            local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:setTotalWorth(boosterUtils.calculateAmount(event:getTotalWorth(), multi))
            end
        end)

    end

    if Common:doesPluginExist("WildTools") then

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

    end

    if Common:doesPluginExist("WildChests") then

        utils.subscribeToEvent("com.bgsoftware.wildchests.api.events.SellChestTaskEvent", function(event)
            local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:setMultiplier(event:getMultiplier() + multi)
            end
        end)

    end

    if Common:doesPluginExist("VirtualSpawner") then

        utils.subscribeToEvent("net.codava.virtualspawner.api.event.PreSpawnerSellEvent", function(event)
            local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:setAmount(boosterUtils.calculateAmount(event:getAmount(), multi))
            end
        end)

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

    if Common:doesPluginExist("Sellwand") then

        utils.subscribeToEvent("me.zachary.sellwand.api.events.SellwandSellEvent", function(event)
            local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:setSellPrice(boosterUtils.calculateAmount(event:getSellPrice(), multi))
            end
        end)

    end

    if Common:doesPluginExist("ManifestCollector") then

        utils.subscribeToEvent("org.hassan.plugin.collector.event.CollectorSellEvent", function(event)
            local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:setPrice(boosterUtils.calculateAmount(event:getPrice(), multi))
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

    if Common:doesPluginExist("ChunkCollector") then

        utils.subscribeToEvent("dev.kbejj.chunkcollector.events.CollectorAutoSellEvent", function(event)
            local multi = boosterUtils.getMulti(event:getOfflinePlayer():getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:setSellPrice(boosterUtils.calculateAmount(event:getSellPrice(), multi))
            end
        end)

    end

    if Common:doesPluginExist("DeluxeSellwands") then

        utils.subscribeToEvent("dev.norska.dsw.api.DeluxeSellwandSellEvent", function(event)
            local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:setMoney(boosterUtils.calculateAmount(event:getMoney(), multi))
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
                if transactionType == Transaction.Type.SELL_GUI_SCREEN or transactionType ==
                    Transaction.Type.SELL_ALL_SCREEN or transactionType == Transaction.Type.SELL_ALL_COMMAND then
                    local prices = event:getPrices()
                    for k, v in pairs(prices) do
                        prices[k] = boosterUtils.calculateAmount(v, multi)
                    end
                    return
                end

                event:setPrice(boosterUtils.calculateAmount(amount, multi))
            end
        end)

    end

    if Common:doesPluginExist("RivalFishingRods") then

        utils.subscribeToEvent("me.rivaldev.fishingrod.rivalfishingrods.api.RodMoneyReceiveEvent", function(event)
            local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:setMoney(boosterUtils.calculateAmount(event:getMoney(), multi))
            end
        end)
      
    end

    if Common:doesPluginExist("RivalHarvesterHoes") then

        utils.subscribeToEvent("me.rivaldev.harvesterhoes.api.events.HoeMoneyReceiveEnchant", function(event)
            local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:setMoney(boosterUtils.calculateAmount(event:getMoney(), multi))
            end
        end)

    end

    if Common:doesPluginExist("RivalMobSwords") then

        utils.subscribeToEvent("me.rivaldev.mobsword.rivalmobswords.api.SwordMoneyReceiveEvent", function(event)
            local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:setMoney(boosterUtils.calculateAmount(event:getMoney(), multi))
            end

        end)

    end

    if Common:doesPluginExist("RivalPickaxes") then

        utils.subscribeToEvent("me.rivaldev.pickaxes.api.events.PickaxeMoneyReceiveEnchant", function(event)
            local multi = boosterUtils.getMulti(event:getPlayer(), TYPE, NAMESPACE)

            if multi > 0 then
                event:setMoney(boosterUtils.calculateAmount(event:getMoney(), multi))
            end
        end)

    end

end