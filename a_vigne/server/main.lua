-----------------------------------------
-- Created and modify by L'ile Légale RP
-- SenSi and Kaminosekai
-----------------------------------------

ESX = nil
local PlayersTransforming  = {}
local PlayersSelling       = {}
local PlayersHarvesting = {}
local vine = 1
local jus = 1
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'vigne', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'vigne', _U('vigneron_client'), true, true)
TriggerEvent('esx_society:registerSociety', 'vigne', 'Vigneron', 'society_vigne', 'society_vigne', 'society_vigne', {type = 'private'})
local function Harvest(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "RaisinFarmBlanc" then
			local itemQuantity = xPlayer.getInventoryItem('raisin_blanc').count
			if itemQuantity >= 100 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place'))
				return
			else
				SetTimeout(2000, function()
					xPlayer.addInventoryItem('raisin_blanc', 1)
					Harvest(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('a_vigne:startHarvest')
AddEventHandler('a_vigne:startHarvest', function(zone)
	local _source = source
  	
	if PlayersHarvesting[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('raisin_taken_blanc'))  
		Harvest(_source,zone)
	end
end)


RegisterServerEvent('a_vigne:stopHarvest')
AddEventHandler('a_vigne:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~récolter')
		PlayersHarvesting[_source]=true
	end
end)

local function Harvest(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "RaisinFarmRouge" then
			local itemQuantity = xPlayer.getInventoryItem('raisin_rouge').count
			if itemQuantity >= 100 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place'))
				return
			else
				SetTimeout(2000, function()
					xPlayer.addInventoryItem('raisin_rouge', 1)
					Harvest(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('a_vigne:startHarvest')
AddEventHandler('a_vigne:startHarvest', function(zone)
	local _source = source
  	
	if PlayersHarvesting[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('raisin_taken_rouge'))  
		Harvest(_source,zone)
	end
end)


RegisterServerEvent('a_vigne:stopHarvest')
AddEventHandler('a_vigne:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~récolter')
		PlayersHarvesting[_source]=true
	end
end)


local function Transform(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementVinBlanc" then
			local raisinQuantity = xPlayer.getInventoryItem('raisin_blanc').count
			local levureQuantity = xPlayer.getInventoryItem('levure').count
			local waterQuantity = xPlayer.getInventoryItem('water').count
			
			if raisinQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_raisin_blanc'))
				return
			elseif levureQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_levure'))
				return
			elseif waterQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_water'))
				return
			else
				local rand = math.random(0,100)
				if (rand >= 80) then
					SetTimeout(3200, function()
						xPlayer.removeInventoryItem('raisin_blanc', 6)
						xPlayer.removeInventoryItem('levure', 2)
						xPlayer.removeInventoryItem('water', 1)
						xPlayer.addInventoryItem('grand_cru', 1)
						TriggerClientEvent('esx:showNotification', source, _U('grand_cru'))
						Transform(source, zone)
					end)
				else  
					SetTimeout(2500, function()
						xPlayer.removeInventoryItem('raisin_blanc', 3)
						xPlayer.removeInventoryItem('water', 1)
						xPlayer.addInventoryItem('vin_blanc', 1)
				
						Transform(source, zone)
					end)
				end
			end
		end
	end	
end

RegisterServerEvent('a_vigne:startTransform')
AddEventHandler('a_vigne:startTransform', function(zone)
	local _source = source
  	
	if PlayersTransforming[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersTransforming[_source]=false
	else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('transforming_in_progress')) 
		Transform(_source,zone)
	end
end)

RegisterServerEvent('a_vigne:stopTransform')
AddEventHandler('a_vigne:stopTransform', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)

local function Transform(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementVinRouge" then
			local raisinQuantity = xPlayer.getInventoryItem('raisin_rouge').count
			local waterQuantity = xPlayer.getInventoryItem('water').count
			
			if raisinQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_raisin_rouge'))
				return
			elseif waterQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_water'))
				return
			else
				local rand = math.random(0, 3)
				if (rand >= 3) then
					SetTimeout(2500, function()
						xPlayer.removeInventoryItem('raisin_rouge', 3)
						xPlayer.removeInventoryItem('water', 1)
						xPlayer.addInventoryItem('vin_rouge', 1)

						Transform(source, zone)
					end)
				else 
					SetTimeout(1250, function()
						xPlayer.removeInventoryItem('raisin_rouge', 1)
						xPlayer.removeInventoryItem('water', 1)
						xPlayer.addInventoryItem('jus_raisin', 1)
				
						Transform(source, zone)
					end)
				end
			end
		end
	end	
end

RegisterServerEvent('a_vigne:startTransform')
AddEventHandler('a_vigne:startTransform', function(zone)
	local _source = source
  	
	if PlayersTransforming[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersTransforming[_source]=false
	else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('transforming_in_progress')) 
		Transform(_source,zone)
	end
end)

RegisterServerEvent('a_vigne:stopTransform')
AddEventHandler('a_vigne:stopTransform', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)

local function Transform(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementChampagne" then
			local raisinBlancQuantity = xPlayer.getInventoryItem('raisin_blanc').count
			local levureQuantity = xPlayer.getInventoryItem('levure').count
			local waterQuantity = xPlayer.getInventoryItem('water').count
			local raisinRougeQuantity = xPlayer.getInventoryItem('raisin_rouge').count
			local barquetteQuantity = xPlayer.getInventoryItem('barquette_vide').count
			
			if raisinBlancQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_raisin_blanc'))
				return
			elseif raisinRougeQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_raisin_rouge'))
				return
			elseif levureQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_levure'))
				return
			elseif waterQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_water'))
				return
			elseif barquetteQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_barquette'))
				return
			else
				local rand = math.random(0,100)
				if (rand >= 80) then
					SetTimeout(3200, function()
						xPlayer.removeInventoryItem('raisin_blanc', 4)
						xPlayer.removeInventoryItem('levure', 1)
						xPlayer.removeInventoryItem('water', 1)
						xPlayer.addInventoryItem('champagne', 1)
						TriggerClientEvent('esx:showNotification', source, _U('champagne'))
						Transform(source, zone)
					end)
				else  
					SetTimeout(500, function()
						xPlayer.removeInventoryItem('raisin_blanc', 3)
						xPlayer.removeInventoryItem('raisin_rouge', 3)
						xPlayer.removeInventoryItem('barquette_vide', 1)
						xPlayer.addInventoryItem('barquette_raisin', 1)
				
						Transform(source, zone)
					end)
				end
			end
		end
	end	
end

RegisterServerEvent('a_vigne:startTransform')
AddEventHandler('a_vigne:startTransform', function(zone)
	local _source = source
  	
	if PlayersTransforming[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersTransforming[_source]=false
	else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('transforming_in_progress')) 
		Transform(_source,zone)
	end
end)

RegisterServerEvent('a_vigne:stopTransform')
AddEventHandler('a_vigne:stopTransform', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~transformer votre raisin')
		PlayersTransforming[_source]=true
		
	end
end)

local function Sell(source, zone)

	if PlayersSelling[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		
		if zone == 'SellFarm' then
			if xPlayer.getInventoryItem('vin_blanc').count <= 0 then
				vinewhite = 0
			else
				vinewhite = 1
			end

			if xPlayer.getInventoryItem('vin_rouge').count <= 0 then
				vinered = 0
			else
				vinered = 1
			end

			if xPlayer.getInventoryItem('champagne').count <= 0 then
				champagne = 0
			else
				champagne = 1
			end
			
			if xPlayer.getInventoryItem('jus_raisin').count <= 0 then
				jus = 0
			else
				jus = 1
			end

			if xPlayer.getInventoryItem('barquette_raisin').count <= 0 then
				barquette = 0
			else
				barquette = 1
			end
		
			if vinewhite == 0 and jus == 0 and vinered == 0  and champagne == 0 and barequette == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_product_sale'))
				return
			elseif xPlayer.getInventoryItem('vin_blanc').count <= 0 and jus == 0 and vinered == 0 and champagne == 0 and barquette == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_vin_sale_blanc'))
				vinewhite = 0
				return
			elseif xPlayer.getInventoryItem('vin_rouge').count <= 0 and jus == 0 and vinewhite == 0 and champagne == 0 and barquette == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_vin_sale_rouge'))
				vinered = 0
				return
			elseif xPlayer.getInventoryItem('jus_raisin').count <= 0 and vinered == 0 and vinewhite == 0 and champagne == 0 and barquette == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_jus_sale'))
				jus = 0
				return
			elseif xPlayer.getInventoryItem('champagne').count <= 0 and jus == 0 and vinered == 0 and vinewhite == 0 and barquette == 0 then 
				TriggerClientEvent('esx:showNotification', source, _U('no_champagne_sale'))
				champagne = 0
				return
			elseif xPlayer.getInventoryItem('barquette_raisin').count <= 0 and jus == 0 and vinered == 0 and vinewhite == 0 and champagne == 0 then
				TriggerClientEvent('esx:showNotification', xource, _U('no_barquette_sale'))
				barquette = 0 
				return
			else
				if (jus == 1) then
					SetTimeout(850, function()
						local money = math.random(5,15)
						xPlayer.removeInventoryItem('jus_raisin', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
							societyAccount = account
						end)
						if societyAccount ~= nil then
							societyAccount.addMoney(money)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. money)
						end
						Sell(source,zone)
					end)
				elseif (vinewhite == 1) then
					SetTimeout(1500, function()
						local money = math.random(25,35)
						xPlayer.removeInventoryItem('vin_blanc', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
							societyAccount = account
						end)
						if societyAccount ~= nil then
							societyAccount.addMoney(money)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. money)
						end
						Sell(source,zone)
					end)
				elseif (vinered == 1) then
					SetTimeout(1500, function()
						local money = math.random(25,35)
						xPlayer.removeInventoryItem('vin_rouge', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
							societyAccount = account
						end)
						if societyAccount ~= nil then
							societyAccount.addMoney(money)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. money)
						end
						Sell(source,zone)
					end)
				elseif (champagne == 1) then
					SetTimeout(2500, function()
						local money = math.random(50,70)
						xPlayer.removeInventoryItem('champagne', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
							societyAccount = account
						end)
						if societyAccount ~= nil then
							societyAccount.addMoney(money)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. money)
						end
						Sell(source,zone)
					end)
				elseif (barquette == 1) then
					SetTimeout(850, function()
						local money = math.random(10,20)
						xPlayer.removeInventoryItem('barquette_raisin', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_vigne', function(account)
							societyAccount = account
						end)
						if societyAccount ~= nil then
							societyAccount.addMoney(money)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. money)
						end
						Sell(source,zone)
					end)
				end
				
			end
		end
	end
end

RegisterServerEvent('a_vigne:startSell')
AddEventHandler('a_vigne:startSell', function(zone)

	local _source = source
	
	if PlayersSelling[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersSelling[_source]=false
	else
		PlayersSelling[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Sell(_source, zone)
	end

end)

RegisterServerEvent('a_vigne:stopSell')
AddEventHandler('a_vigne:stopSell', function()

	local _source = source
	
	if PlayersSelling[_source] == true then
		PlayersSelling[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
		PlayersSelling[_source]=true
	end

end)

RegisterServerEvent('a_vigne:getStockItem')
AddEventHandler('a_vigne:getStockItem', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigne', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('a_vigne:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigne', function(inventory)
		cb(inventory.items)
	end)

end)

RegisterServerEvent('a_vigne:putStockItems')
AddEventHandler('a_vigne:putStockItems', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_vigne', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

	end)
end)

ESX.RegisterServerCallback('a_vigne:getPlayerInventory', function(source, cb)

	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})

end)


ESX.RegisterUsableItem('jus_raisin', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jus_raisin', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 40000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 120000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_jus'))

end)

ESX.RegisterUsableItem('grand_cru', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('grand_cru', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 600000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 40000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_grand_cru'))

end)

ESX.RegisterUsableItem('vin_blanc', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vin_blanc', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 40000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_vin_blanc'))

end)

ESX.RegisterUsableItem('vin_rouge', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vin_rouge', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 400000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 40000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_vin_rouge'))

end)

ESX.RegisterUsableItem('champagne', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('champagne', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 600000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 40000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_champagne'))

end)

ESX.RegisterUsableItem('raisin_blanc', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('raisin_blanc', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 120000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 10000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_raisin'))

end)

ESX.RegisterUsableItem('raisin_rouge', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('raisin_rouge', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 120000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 10000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_raisin'))

end)

ESX.RegisterUsableItem('barquette_raisin', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('barquette_raisin', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 120000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 10000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_barquette_raisin'))

end)