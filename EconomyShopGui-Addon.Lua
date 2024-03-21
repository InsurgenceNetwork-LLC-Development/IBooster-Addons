import 'me.gypopo.economyshopgui.util.Transaction'

name = "EconomyShopGui-Addon"
version = "1.0.0"
author = "Hxtch"
description = {
  "This addon will add",
  "Support for EconomyShopGui boosting"
}

local NAMESPACE = "ECONOMYSHOPGUI"

utils.subscribeToEvent("me.gypopo.economyshopgui.api.events.PreTransactionEvent", function(event)
  local transactionType = event:getTransactionType()
  if string.lower(transactionType:getMode()) ~= "sold" then
    return
  end

  local amount = event:getPrice()
  if amount <= 0 then
    return
  end

  local multi = boosterUtils.getMulti(event:getPlayer(), "Sell", NAMESPACE)
  
  if multi > 0 then
    if transactionType == Transaction.Type.SELL_GUI_SCREEN or transactionType == Transaction.Type.SELL_ALL_SCREEN or transactionType == Transaction.Type.SELL_ALL_COMMAND then
        local prices = event:getPrices()
        for k, v in pairs(prices) do
            prices[k] = boosterUtils.calculateAmount(v, multi)
        end
        return
    end

    event:setPrice(boosterUtils.calculateAmount(amount, multi))
  end

end)