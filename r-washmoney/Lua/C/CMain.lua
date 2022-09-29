local QBCore = exports['qb-core']:GetCoreObject()


CreateThread(function()
    while true do
        local _s = 1000
        local player = PlayerPedId()
        local ppos = GetEntityCoords(player)
        for k, v in pairs(Config.Points["washloc"]) do
            _s = 1
            if #(ppos - v) < 2 then
                DrawMarker(2, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.25, 0.2, 0.2, 0, 0, 0, 350, 0, 0, 0, 12, 0, 0, 0)
                Help(Lang:t("helptext.lab"), v)
                if IsControlJustReleased(0, 58) then
                    lab()
                end
            end
        end
        Wait(_s)
    end
end)

function lab()
    CreateThread(function(ammount)
      if QBCore.Functions.HasItem(Config.Points["blackmoney"], Config.Necesita) then
        QBCore.Functions.Progressbar('reysel',  Lang:t("proggress.washing"), 5000, false, false, { -- Name | Label | Time | useWhileDead | canCancel
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
        }, {}, {}, function()  
            TriggerServerEvent('r-washmoney:wash')
            QBCore.Functions.Notify(Lang:t("success.washnoty"))
        end)
      else 
        QBCore.Functions.Notify(Lang:t("error.error"))
      end   
    end)
end
function Help(msg, coords)
    AddTextEntry('ShowFloatingHelpNotification', msg)
    SetFloatingHelpTextWorldPosition(1, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('ShowFloatingHelpNotification')
    EndTextCommandDisplayHelp(2, false, false, -1)
end
Citizen.CreateThread(function()
	if Config.EnableNpc then
		for _, item in pairs(Config.Ped) do
			local npc = CreatePed(4, Config.Model, item.x, item.y, item.z, item.heading, false, true)
			SetEntityHeading(npc, item.heading)
			FreezeEntityPosition(npc, true)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
		end
	end
end)