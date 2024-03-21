import 'java.math.BigInteger'

name = "BattlePass-Addon"
version = "1.0.0"
author = "Hxtch"
description = {
  "This addon will add",
  "Support for BattlePass boosting"
}

local NAMESPACE = "BATTLE_PASS"

utils.subscribeToEvent("io.github.battlepass.api.events.user.UserQuestProgressionEvent", function(event)
  local multi = boosterUtils.getMulti(event:getUser():getPlayer(), "Quests", NAMESPACE)
  
  if multi > 0 then
    event:setAddedProgress(event:getAddedProgress():multiply(BigInteger(string.format(multi))))
  end

end)