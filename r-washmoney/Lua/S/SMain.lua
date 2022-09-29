local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('r-washmoney:wash')
AddEventHandler('r-washmoney:wash', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(tonumber(source))
         Player.Functions.RemoveItem("markedbills", Config.Necesita)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "remove")
    Player.Functions.AddMoney("cash", Config.Add)
end)
