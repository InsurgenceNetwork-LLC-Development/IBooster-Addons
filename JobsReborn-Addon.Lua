import 'com.gamingmesh.jobs.container.CurrencyType'

name = "JobsReborn-Addon"
version = "1.0.0"
author = "Dragon"
description = {
  "This addon will add",
  "Support for JobsReborn boosting"
}

local NAMESPACE = "JOBS_REBORN"

function onAddonStart()
	subscribeAndBoost(CurrencyType.EXP)
	subscribeAndBoost(CurrencyType.MONEY)
	subscribeAndBoost(CurrencyType.POINTS)
end

function subscribeAndBoost(currencyType)
    utils.subscribeToEvent("com.gamingmesh.jobs.api.JobsPaymentEvent", function(event)
        local amount = event:getPayment():get(currencyType)
        if amount <= 0 then
            return
        end

        local multi = boosterUtils.getMulti(event:getPlayer():getPlayer(), currencyType, NAMESPACE)

        if multi > 0 then
            event:set(currencyType, boosterUtils.calculateAmount(amount, multi))
        end
    end)
end