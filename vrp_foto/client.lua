-----------------------------------------------------------------------------
-- Fartfælde customized fra vrp_stationaryRadars
-----------------------------------------------------------------------------
field = ""

local radar1 = { -- Punkter for Radar 1
	{x = 511.88848876953, y = -1041.5057373047, z = 36.734352111816}, -- PD
    {x = 316.88000488281, y = -799.82385253906, z = 29.332088470459}, -- Mod Motorvej fra midtby
    {x = -424.99047851563, y = -206.42329406738, z = 36.261260986328}, -- Mod basishus 1

}

local radar2 = { -- Punkter for Radar 2
    {x = 325.55822753906, y = -752.51623535156, z = 29.342294692993}, -- Mod motorvej
    {x = 228.41403198242, y = -667.62060546875, z = 37.90950012207}, -- Mod hospital
    {x = 137.63882446289, y = -913.32043457031, z = 30.333566665649}, -- Mod Bilforhandler
	{x = 216.3868560791, y = -1183.7169189453, z = 29.34515953064}, -- Mod Bilforhandler
}

local radar3 = { -- Punkter for Radar 3
	{x = 1693.8114013672, y = 1468.6546630859, z = 85.299354553223},
    {x = 2160.1149902344, y = 2683.041015625, z = 48.931442260742},
    {x = 2152.0427246094, y = 2692.1550292969, z = 48.933853149414},
}

local ignorecars = {
   
}

Citizen.CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(radar1) do
            local player = GetPlayerPed(-1)
            local coords = GetEntityCoords(player, true)
            if Vdist2(radar1[k].x, radar1[k].y, radar1[k].z, coords["x"], coords["y"], coords["z"]) < 12 then
                field = "1"
                checkSpeed()
                break
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(radar2) do
            local player = GetPlayerPed(-1)
            local coords = GetEntityCoords(player, true)
            if Vdist2(radar2[k].x, radar2[k].y, radar2[k].z, coords["x"], coords["y"], coords["z"]) < 34 then
                field = "2"
                checkSpeed()
                break
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(radar3) do
            local player = GetPlayerPed(-1)
            local coords = GetEntityCoords(player, true)
            if Vdist2(radar3[k].x, radar3[k].y, radar3[k].z, coords["x"], coords["y"], coords["z"]) < 13 then
                field = "3"
                checkSpeed()
                break
            end
        end
    end
end)
local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

function action(tax,kmhspeed,maxspeed)
    TriggerServerEvent('betalFart',tax,kmhspeed,maxspeed)
    Wait(1000)
    StartScreenEffect("DeathFailMPDark", 100, 0)
    TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 50, "fartflde", 2)
	--exports.pNotify:SendNotification({text = "<b style='color:#ED2939'>Fartfælde</b><br /><br />Du kørte " .. kmhspeed .. "KM/T hvor du må køre "..tostring(maxspeed).." KM/T <br /><b style='color:#26ff26'>Bøde</b>: " .. tax ..",- DKK",type = "success",timeout = (3000),layout = "centerLeft",queue = "fart",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},sounds = {sources = {"fartflde.mp3"},volume = 0.8,conditions = {"docVisible"}}})
    
end

local maxspeed = 0
function checkSpeed()
    local pP = GetPlayerPed(-1)
    local speed = GetEntitySpeed(pP)
    local vehicle = GetVehiclePedIsIn(pP, false)
    --if has_value(ignorecars, GetEntityModel(GetVehiclePedIsIn(pP, true))) then
    --    return false
    --end
    local driver = GetPedInVehicleSeat(vehicle, -1)
    local kmhspeed = math.ceil(speed*3.6)
    if kmhspeed > 55 and kmhspeed <= 65 and field == "1" and driver == pP then --[[50 km/t]]--
        tax = 4000
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 66 and kmhspeed <= 80 and field == "1" and driver == pP then
        tax = 6500
        maxspeed = 50
		action(tax,kmhspeed,maxspeed)       
	elseif kmhspeed > 81 and kmhspeed <= 100 and field == "1" and driver == pP then
        tax = 9000
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 101 and kmhspeed <= 121 and field == "1" and driver == pP then
        tax = 12500
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 122 and kmhspeed <= 142 and field == "1" and driver == pP then
        tax = 15000
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 143 and kmhspeed <= 163 and field == "1" and driver == pP then
        tax = 17500
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 164 and kmhspeed <= 184 and field == "1" and driver == pP then
        tax = 20000
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 185 and kmhspeed <= 205 and field == "1" and driver == pP then
        tax = 22500
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 206 and kmhspeed <= 226 and field == "1" and driver == pP then
        tax = 30000
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 227 and kmhspeed <= 247 and field == "1" and driver == pP then
        tax = 32500
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 248 and kmhspeed <= 268 and field == "1" and driver == pP then
        tax = 35000
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 269 and kmhspeed <= 289 and field == "1" and driver == pP then
        tax = 37500
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 290 and kmhspeed <= 310 and field == "1" and driver == pP then
        tax = 40000
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 311 and kmhspeed <= 331 and field == "1" and driver == pP then
        tax = 42500
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 332 and kmhspeed <= 352 and field == "1" and driver == pP then
        tax = 45000
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 353 and kmhspeed <= 373 and field == "1" and driver == pP then
        tax = 47500
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 374 and kmhspeed <= 394 and field == "1" and driver == pP then
        tax = 50000
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 395 and kmhspeed <= 550 and field == "1" and driver == pP then
        tax = 52500
        maxspeed = 50
		action(tax,kmhspeed,maxspeed) 
	elseif kmhspeed > 90 and kmhspeed <= 104 and field == "2" and driver == pP then	--[[80 km/t]]--
        tax = 6000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 105 and kmhspeed <= 128 and field == "2" and driver == pP then
        tax = 10000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 129 and kmhspeed <= 160 and field == "2" and driver == pP then
        tax = 12000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 161 and kmhspeed <= 181 and field == "2" and driver == pP then
        tax = 15000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 182 and kmhspeed <= 202 and field == "2" and driver == pP then
        tax = 20000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 203 and kmhspeed <= 223 and field == "2" and driver == pP then
        tax = 22000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 224 and kmhspeed <= 244 and field == "2" and driver == pP then
        tax = 25000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 245 and kmhspeed <= 265 and field == "2" and driver == pP then
        tax = 30000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 266 and kmhspeed <= 286 and field == "2" and driver == pP then
        tax = 32000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 287 and kmhspeed <= 307 and field == "2" and driver == pP then
        tax = 35000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 308 and kmhspeed <= 328 and field == "2" and driver == pP then
        tax = 35000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 329 and kmhspeed <= 349 and field == "2" and driver == pP then
        tax = 35000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 350 and kmhspeed <= 370 and field == "2" and driver == pP then
        tax = 35000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 371 and kmhspeed <= 391 and field == "2" and driver == pP then
        tax = 35000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 392 and kmhspeed <= 412 and field == "2" and driver == pP then
        tax = 40000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 413 and kmhspeed <= 433 and field == "2" and driver == pP then
        tax = 40000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 434 and kmhspeed <= 550 and field == "2" and driver == pP then
        tax = 40000
        maxspeed = 80
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 135 and kmhspeed <= 159 and field == "3" and driver == pP then --[[130 km/t]]--
        tax = 7500
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 135 and kmhspeed <= 159 and field == "3" and driver == pP then
        tax = 6000
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 160 and kmhspeed <= 180 and field == "3" and driver == pP then
        tax = 10000
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 181 and kmhspeed <= 201 and field == "3" and driver == pP then
        tax = 15000
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 202 and kmhspeed <= 222 and field == "3" and driver == pP then
        tax = 18000
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 223 and kmhspeed <= 243 and field == "3" and driver == pP then
        tax = 20000
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 244 and kmhspeed <= 264 and field == "3" and driver == pP then
        tax = 22000
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 265 and kmhspeed <= 285 and field == "3" and driver == pP then
        tax = 24000
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 286 and kmhspeed <= 306 and field == "3" and driver == pP then
        tax = 26000
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 307 and kmhspeed <= 327 and field == "3" and driver == pP then
        tax = 30000
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 328 and kmhspeed <= 348 and field == "3" and driver == pP then
        tax = 32500
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 349 and kmhspeed <= 369 and field == "3" and driver == pP then
        tax = 42500
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 370 and kmhspeed <= 390 and field == "3" and driver == pP then
        tax = 45000
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 391 and kmhspeed <= 411 and field == "3" and driver == pP then
        tax = 47500
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    elseif kmhspeed > 412 and kmhspeed <= 550 and field == "3" and driver == pP then
        tax = 50000
        maxspeed = 130
		action(tax,kmhspeed,maxspeed) 
    end
end