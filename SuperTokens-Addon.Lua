name = "SuperTokens-Addon"
version = "1.0.0"
author = "Hxtch"
description = {"This addon will add", "Support for SuperTokens boosting"}

local TYPE = "Tokens"
local NAMESPACE = "SUPER_TOKENS"

utils.subscribeToEvent("is.swan.tokens.events.TokensReceiveEvent", function(event)
    local multi = boosterUtils.getMulti(event:getProfile():getPlayer(), TYPE, NAMESPACE)

    if multi > 0 then
        event:setAmount(boosterUtils.calculateAmount(event:getAmount(), multi))
    end
end)