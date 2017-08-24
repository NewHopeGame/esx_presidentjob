require "resources/[essential]/es_extended/lib/MySQL"
MySQL:open("ip", "base", "host", "passe")

RegisterServerEvent('esx_presidentjob:requestPlayerData')
AddEventHandler('esx_presidentjob:requestPlayerData', function(reason)
	TriggerEvent('esx:getPlayerFromId', source, function(xPlayer)
		TriggerEvent('esx_skin:requestPlayerSkinInfosCb', source, function(skin, jobSkin)

			local data = {
				job       = xPlayer.job,
				inventory = xPlayer.inventory,
				skin      = skin
			}

			TriggerClientEvent('esx_presidentjob:responsePlayerData', source, data, reason)
		end)
	end)
end)

RegisterServerEvent('esx_presidentjob:requestOtherPlayerData')
AddEventHandler('esx_presidentjob:requestOtherPlayerData', function(playerId, reason)
	TriggerClientEvent('esx_presidentjob:requestPlayerWeapons', playerId, source, reason)
end)

RegisterServerEvent('esx_presidentjob:responsePlayerWeapons')
AddEventHandler('esx_presidentjob:responsePlayerWeapons', function(weapons, playerId, reason)

	TriggerEvent('esx:getPlayerFromId', source, function(xPlayer)

		local data = {
			name       = GetPlayerName(source),
			job        = xPlayer.job,
			inventory  = xPlayer.inventory,
			accounts   = xPlayer.accounts,
			weapons    = weapons
		}

		TriggerClientEvent('esx_presidentjob:responseOtherPlayerData', playerId, data, reason)

	end)
end)

RegisterServerEvent('esx_presidentjob:requestPlayerPositions')
AddEventHandler('esx_presidentjob:requestPlayerPositions', function(reason)
	
	local _source = source

	TriggerEvent('esx:getPlayers', function(xPlayers)

		local positions = {}

		for k, v in pairs(xPlayers) do
			positions[tostring(k)] = v.player.coords
		end

		TriggerClientEvent('esx_presidentjob:responsePlayerPositions', _source, positions, reason)

	end)

end)

RegisterServerEvent('esx_presidentjob:confiscatePlayerBlackMoney')
AddEventHandler('esx_presidentjob:confiscatePlayerBlackMoney', function(playerId, amount)
	TriggerEvent('esx:getPlayerFromId', playerId, function(xPlayer)
		xPlayer:removeAccountMoney('black_money', amount)
	end)
	TriggerEvent('esx:getPlayerFromId', source, function(xPlayer)
		xPlayer:addAccountMoney('black_money', amount)
	end)
end)

RegisterServerEvent('esx_presidentjob:confiscatePlayerWeapon')
AddEventHandler('esx_presidentjob:confiscatePlayerWeapon', function(playerId, weaponName)
	TriggerClientEvent('esx_presidentjob:confiscatePlayerWeapon', playerId, weaponName);
end)

RegisterServerEvent('esx_presidentjob:confiscatePlayerInventoryItem')
AddEventHandler('esx_presidentjob:confiscatePlayerInventoryItem', function(playerId, itemName, count)
	TriggerEvent('esx:getPlayerFromId', playerId, function(xPlayer)
		xPlayer:removeInventoryItem(itemName, count)
	end)
end)

RegisterServerEvent('esx_presidentjob:addPlayerInventoryItem')
AddEventHandler('esx_presidentjob:addPlayerInventoryItem', function(playerId, itemName, count)
	TriggerEvent('esx:getPlayerFromId', playerId, function(xPlayer)
		xPlayer:addInventoryItem(itemName, count)
	end)
end)

RegisterServerEvent('esx_presidentjob:handcuff')
AddEventHandler('esx_presidentjob:handcuff', function(playerId)
	TriggerClientEvent('esx_presidentjob:handcuff', playerId)
end)

RegisterServerEvent('esx_presidentjob:putInVehicle')
AddEventHandler('esx_presidentjob:putInVehicle', function(playerId)
	TriggerClientEvent('esx_presidentjob:putInVehicle', playerId)
end)

RegisterServerEvent('esx_presidentjob:requestFineData')
AddEventHandler('esx_presidentjob:requestFineData', function(category)

	local executed_query = MySQL:executeQuery("SELECT * FROM fine_types WHERE category = '@category'", {['@category'] = category})
	local result         = MySQL:getResults(executed_query, {'id', 'label', 'amount', 'category'}, 'id')
	local data           = {}

	for i=1, #result, 1 do
		table.insert(data, {
			id     = result[i].id,
			label  = result[i].label,
			amount = result[i].amount
		})
	end

	TriggerClientEvent('esx_presidentjob:responseFineData', source, data)

end)

RegisterServerEvent('esx_presidentjob:applyFine')
AddEventHandler('esx_presidentjob:applyFine', function(playerId, fineId)
	
	TriggerClientEvent('esx:showNotification', source, 'Vous avez mis une ammende')

	TriggerEvent('esx:getPlayerFromId', playerId, function(xPlayer)
		MySQL:executeQuery("INSERT INTO fines (identifier, fine_id) VALUES ('@identifier', '@fine_id')", {['@identifier'] = xPlayer.identifier, ['@fine_id'] = fineId})
		TriggerClientEvent('esx:showNotification', xPlayer.player.source, 'Vous avez recu une amende')
	end)

end)

RegisterServerEvent('esx_presidentjob:requestFineList')
AddEventHandler('esx_presidentjob:requestFineList', function()
	
	local _source        = source
	local executed_query = MySQL:executeQuery("SELECT * FROM fine_types")
	local result         = MySQL:getResults(executed_query, {'id', 'label', 'amount', 'category'}, 'id')

	local fineTypes      = {}

	for i=1, #result, 1 do
		fineTypes[result[i].id] = {
			label  = result[i].label,
			amount = result[i].amount
		}
	end

	TriggerEvent('esx:getPlayerFromId', source, function(xPlayer)

		local executed_query = MySQL:executeQuery("SELECT * FROM fines WHERE identifier = '@identifier'", {['@identifier'] = xPlayer.identifier})
		local result         = MySQL:getResults(executed_query, {'id', 'fine_id'}, 'id')
		local fines          = {}

		for i=1, #result, 1 do
			table.insert(fines, {
				id     = result[i].id,
				label  = fineTypes[result[i].fine_id].label,
				amount = fineTypes[result[i].fine_id].amount
			})
		end

		TriggerClientEvent('esx_presidentjob:responseFineList', _source, fines)

	end)

end)

RegisterServerEvent('esx_presidentjob:requestPayFine')
AddEventHandler('esx_presidentjob:requestPayFine', function(fineId, amount, playerName)
	
	local _source = source

	MySQL:executeQuery("DELETE FROM fines WHERE id = '@id'", {['@id'] = fineId})

	TriggerEvent('esx:getPlayerFromId', source, function(xPlayer)
		xPlayer:removeMoney(amount)
		TriggerClientEvent('esx:showNotification', _source, 'Vous avez payé une ammende de $' .. amount)
		TriggerClientEvent('esx_presidentjob:hasPayedFine', -1, playerName, amount)
	end)
end)

TriggerEvent('esx_phone:registerCallback', 'special', function(source, phoneNumber, playerName, type, message)

	if phoneNumber == 'president' then

		TriggerEvent('esx:getPlayerFromId', source, function(xPlayer)
			TriggerEvent('esx:getPlayers', function(xPlayers)
				for k, v in pairs(xPlayers) do
					if v.job.name == 'gouvernement' then
						
						RconPrint('Message => ' .. playerName .. ' ' .. message)
						
						TriggerClientEvent('esx_phone:onMessage', v.player.source, xPlayer.phoneNumber, playerName, type, message, xPlayer.player.coords, {
							reply     = 'Répondre',
							gps       = 'GPS',
							copy_that = 'Bien reçu'
						})
						
					end
				end
			end)
		end)

	end
end)
