local ec = EventCallback

local config = {
    anonymous = false,
    hiddenAccess = 3,
    messageType = MESSAGE_STATUS_DEFAULT
}

ec.onLook = function(cid, thing, position, distance, description)
    if (thing:isPlayer() and getPlayerAccess(cid) < config.hiddenAccess) then
        doPlayerSendTextMessage(thing:getId(), config.messageType,
            config.anonymous and 'Someone' or getPlayerName(cid) .. ' looking to you!')
    end

    return true
end

ec:register()