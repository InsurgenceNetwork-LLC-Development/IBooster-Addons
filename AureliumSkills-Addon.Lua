name = "AureliumSkills-Addon"
version = "1.0.0"
author = "Hxtch"
description = {
  "This addon will add",
  "Support for AureliumSkills boosting"
}

local NAMESPACE = "AURELIUM_SKILLS"

utils.subscribeToEvent("com.archyx.aureliumskills.api.event.XpGainEvent", function(event)
  local multi = boosterUtils.getMulti(event:getPlayer(), "Skills", NAMESPACE)
  
  if multi > 0 then
    event:setAmount(boosterUtils.calculateAmount(event:getAmount(), multi))
  end

end)