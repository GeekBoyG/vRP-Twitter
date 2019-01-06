local charLimit = GetConvarInt('twitter:charLimit', 280)


RegisterCommand("tweet", function(source, args, rawCommand)
    name = (source == 0) and 'console' or GetPlayerName(source)

    tweet = table.concat(args, " ")


    if (tweet == "") then
        errorMessage("You can't post an empty tweet", source)
    elseif (tweet:len() >= charLimit) then
        errorMessage("Your tweet exceeded the character limit of " .. charLimit, source)
    else
        announcetweet(name, tweet)
        
    end

end, false)

function errorMessage(message, id)
    TriggerClientEvent('chatMessage', id, "^8" .. message)
end

function announcetweet(name, tweet)
    TriggerClientEvent('chatMessage', -1, "[^4Twitter^4]", {30, 144, 255}, "^4@" .. name .."^4 " .. tweet )
end
