RegisterNetEvent('esx:playerLoaded') -- When a player loads in, we can store some basic information about them locally
AddEventHandler('esx:playerLoaded', function(playerId, xPlayer, isNew)
	ESX.Players[playerId] = xPlayer.job.name
end)

RegisterNetEvent('esx:setJob') -- When a player loads in, we can store some basic information about them locally
AddEventHandler('esx:setJob', function(playerId, job, lastJob)
	ESX.Players[playerId] = job.name
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)	-- Remove the data once the player no longer exists
	ESX.Players[playerId] = nil
end)

AddEventHandler('onResourceStart', function(resourceName) -- The resource just restarted so we actually have a fresh copy of ESX.Players from the framework
	if (GetCurrentResourceName() == resourceName) then -- Useful if we need to run functions or send events after a restart
		for playerId, xPlayer in pairs(ESX.Players) do
			print( ('%s %s is online with player id %s'):format(xPlayer.job.grade_label, xPlayer.name, playerId) )
		end
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	local xPlayers = ESX.GetExtendedPlayers('job', 'police') -- New hitchless xPlayer loop, with the ability to only return players with specific data
	for _, xPlayer in pairs(xPlayers) do
		print(xPlayer.source, xPlayer.job.grade_label, xPlayer.name)
	end
end)