

// -- CONFIG HERE
// Price for the Message
// ConCommand = core_chatprice_anon <price> 
// core_chatprice_adverse <price>
CreateConVar( 'core_chatprice_anon', 600 )  
CreateConVar( 'core_chatprice_adverse', 600 ) 
//
// -- CONFIG STOPS HERE


local function Anonymous(ply, args) 
	local costanon = GetConVarNumber( 'core_chatprice_anon' )
	if args == "" then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
        return ""
    end
	if !ply:canAfford(costanon) then return DarkRP.notify(ply, 1, 4, "You can't afford ".. costanon.."$ for an anonymous message!") end
	ply:addMoney(-costanon)
	DarkRP.notify(ply, 1, 4, "You've paid ".. costanon.."$ for an anonymous message!")
    local DoSay = function(text)
        if text == "" then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
            return
        end
        for k,v in pairs(player.GetAll()) do
            local col = Color(255,255,255)
            DarkRP.talkToPerson(v, col,  "Anonymous", Color(255, 0, 0, 255), text, ply)
        end
    end
    return args, DoSay
end
DarkRP.defineChatCommand("anonymous", Anonymous)
DarkRP.defineChatCommand("anon", Anonymous)
DarkRP.defineChatCommand("hidden", Anonymous)

local function PlayerAdvertise(ply, args)
	local costadverse = GetConVarNumber( 'core_chatprice_adverse' )
    if args == "" then
        DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
        return ""
    end
	if !ply:canAfford(costadverse) then return DarkRP.notify(ply, 1, 4, "You can't afford ".. costadverse.."$ for an anonymous message!") end
	ply:addMoney(-costadverse)
	DarkRP.notify(ply, 1, 4, "You've paid ".. costadverse.. "$ for an anonymous message!")
    local DoSay = function(text)
        if text == "" then
            DarkRP.notify(ply, 1, 4, DarkRP.getPhrase("invalid_x", "argument", ""))
            return
        end
        for k,v in pairs(player.GetAll()) do
            local col = team.GetColor(ply:Team())
            DarkRP.talkToPerson(v, col, DarkRP.getPhrase("advert") .. " " .. ply:Nick(), Color(255, 255, 0, 255), text, ply)
        end
    end
    return args, DoSay
end
DarkRP.defineChatCommand("advert", PlayerAdvertise, 1.5)
