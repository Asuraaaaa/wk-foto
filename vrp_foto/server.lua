---------------------------
--Add Permission by Wick--
---------------------------
local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_fart")

RegisterServerEvent('betalFart')
AddEventHandler('betalFart', function(tax,kmhspeed,maxspeed)
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	if vRP.hasPermission({user_id,"emservice.camera"}) then
		TriggerClientEvent("pNotify:SendNotification", source,{text = "du er i service. Ingen billet til dig!", type = "success", queue = "global", timeout = 4000, layout = "centerLeft",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
	else
	vRP.tryFullPayment({user_id,tax})
	TriggerClientEvent("pNotify:SendNotification", player, {text = "<b style='color:#ED2939'>Fartfælde</b><br /><br />Du kørte " .. kmhspeed .. "KM/T hvor du må køre "..tostring(maxspeed).." KM/T <br /><b style='color:#26ff26'>Bøde</b>: " .. tax ..",- DKK",type = "error",timeout = 8000,layout = "centerLeft",queue = "left"})
	end
end)