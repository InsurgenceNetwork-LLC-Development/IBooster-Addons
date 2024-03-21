import 'com.gamingmesh.jobs.container.CurrencyType'

name = "JobsReborn-Addon"
version = "1.0.0"
author = "Dragon"
description = {
  "This addon will add",
  "Support for JobsReborn boosting"
}

local NAMESPACE = "JOBS_REBORN"

utils.subscribeToEvent("com.gamingmesh.jobs.api.JobsPaymentEvent", function(event)
  local amount = event:getPayment():get(CurrencyType.EXP)
  if amount <= 0 then
    return
  end

  local multi = boosterUtils.getMulti(event:getPlayer():getPlayer(), "Exp", NAMESPACE)
  
  if multi > 0 then
    event:set(CurrencyType.EXP, boosterUtils.calculateAmount(amount, multi))
  end

end)

utils.subscribeToEvent("com.gamingmesh.jobs.api.JobsPaymentEvent", function(event)
  local amount = event:getPayment():get(CurrencyType.MONEY)
  if amount <= 0 then
    return
  end

  local multi = boosterUtils.getMulti(event:getPlayer():getPlayer(), "Money", NAMESPACE)
  
  if multi > 0 then
    event:set(CurrencyType.MONEY, boosterUtils.calculateAmount(amount, multi))
  end

end)

utils.subscribeToEvent("com.gamingmesh.jobs.api.JobsPaymentEvent", function(event)
  local amount = event:getPayment():get(CurrencyType.POINTS)
  if amount <= 0 then
    return
  end

  local multi = boosterUtils.getMulti(event:getPlayer():getPlayer(), "Points", NAMESPACE)
  
  if multi > 0 then
    event:set(CurrencyType.POINTS, boosterUtils.calculateAmount(amount, multi))
  end

end)