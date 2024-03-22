import 'net.brcdev.shopgui.shop.ShopManager'
import 'net.brcdev.shopgui.shop.item.ShopItem'

name = "ShopGuiPlus-Addon"
version = "1.0.0"
author = "Dragon"
description = {
  "This addon will add",
  "Support for ShopGuiPlus boosting"
}

local NAMESPACE = "SHOPGUIPLUS"

Shop_Category_Restriction = {
  enabled = false,
  categories = { "blocks", "armor", "food" } -- list the shop categories to apply boost to
}

Shop_Item_Restriction = {
  enabled = false,
  items = { -- list the shop items to apply boost to. Format: 'category:id...'
    "blocks:1,4,5,9,10",
    "ores:3,5"
  }
}

utils.subscribeToEvent("net.brcdev.shopgui.event.ShopPreTransactionEvent", function(event)

  if event:getShopAction() == ShopManager.ShopAction.BUY then
    return
  end

  local amount = event:getPrice()
  if amount <= 0 then
    return
  end

  local multi = boosterUtils.getMulti(event:getPlayer():getPlayer(), "Sell", NAMESPACE)

  if multi > 0 and canBoost(event) then
    event:setPrice(boosterUtils.calculateAmount(amount, multi))
  end

end)

function canBoost(event)
    if not Shop_Item_Restriction.enabled and not Shop_Category_Restriction.enabled then
        return true
    end

    if Shop_Category_Restriction.enabled then
        for _, category in ipairs(Shop_Category_Restriction.categories) do
            if category == event.shopItem.shop.id then
                return true
            end
        end
    end

    if Shop_Item_Restriction.enabled then
        for _, item in ipairs(Shop_Item_Restriction.items) do
            local category, ids = item:match("([^:]+):(.+)")
            if category == event.shopItem.shop.id then
                for id in ids:gmatch("%d+") do
                    if id == event.shopItem.id then
                        return true
                    end
                end
            end
        end
    end
    return false
end