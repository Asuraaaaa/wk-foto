local Proxy = module("vrp", "lib/Proxy")
local Tunnel = module("vrp", "lib/Tunnel")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","wk-fotovogn")

local defaultcars = {
   
}
local fotovogne = {

}

local basiccost = 5000

RegisterServerEvent('wk-fotovogn:betal')
AddEventHandler('wk-fotovogn:betal', function(speed,limit,veh)
	local source = source
	local user_id = vRP.getUserId({source})
	local percent = speed/limit
	local tax = basiccost * percent
    if percent > 1.3 then
        tax = tax*1.5
    end
    tax = math.floor(tax)
    if vRP.tryFullPayment({user_id,tax}) then
	TriggerClientEvent("pNotify:SendNotification", source,{text = "<b style='color:#ED2939'>Fotovogn</b><br /><br />Du kørte " .. speed .. "km/t hvor du må køre "..limit.." km/t <br /><b style='color:#26ff26'>Bøde</b>: " .. tax .." DKK", type = "error", queue = "fart", timeout = 8000, layout = "centerRight",animation = {open = "gta_effects_open", close = "gta_effects_close"}})
		if veh ~= false then
			TriggerClientEvent("wk-fotovogn:sendalert",-1,veh,tax,speed)
		end
	end
end)

RegisterServerEvent('wk-fotovogn:sendvogn')
AddEventHandler('wk-fotovogn:sendvogn', function(veh,list)
	fotovogne[veh] = list
	TriggerClientEvent("wk-fotovogn:sendvogn",-1,fotovogne)
end)

RegisterServerEvent('wk-fotovogn:removevogn')
AddEventHandler('wk-fotovogn:removevogn', function(veh)
    fotovogne[veh] = nil
    TriggerClientEvent("wk-fotovogn:sendvogn",-1,fotovogne)
end)

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if first_spawn then
        TriggerClientEvent('wk-fotovogn:createdefault', source, defaultcars,fotovogne)
	end
end)

function format_thousands(v)
    local s = string.format("%d", math.floor(v))
    local pos = string.len(s) % 3
    if pos == 0 then pos = 3 end
    return string.sub(s, 1, pos)
            .. string.gsub(string.sub(s, pos+1), "(...)", ".%1")
end

