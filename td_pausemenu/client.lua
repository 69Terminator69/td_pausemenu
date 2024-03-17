ESX = exports["es_extended"]:getSharedObject()

local open = false
CreateThread(function()
    while true do
        if IsControlJustPressed(0, 322) or IsControlJustPressed(0, 199) then 
            if open == false then 
                open = true
                ESX.TriggerServerCallback('td_pausemenu:server:getPlayerInfo', function(playerInfo) 
                    SendNUIMessage({
                        action = 'show';
                        police = playerInfo.Police;
                        imagen = exports["MugShotBase64"]:GetMugShotBase64(PlayerPedId(),false);
                        name = playerInfo.name..' | ID: '..GetPlayerServerId(PlayerId());
                        job = playerInfo.job.label..' - '..playerInfo.job.grade_label;
                        money = 'EFECTIVO: $'..playerInfo.money,
                        bank = 'BANCO: $'..playerInfo.bank.money,
                        players = playerInfo.TotalPlayers;
                        
                    })
                    SetNuiFocus(true,true)
                end, nil)
            else
                open = false
                SendNUIMessage({
                    action = 'hide';
                })
                SetNuiFocus(false,false)
            end
        end
        SetPauseMenuActive(false) 
        Wait(10)
    end
end)

RegisterNUICallback('exit', function()
    SendNUIMessage({
        action = 'hide';
    })
    SetNuiFocus(false,false)
    open = false
end)

RegisterNUICallback('open_map', function()
    SendNUIMessage({
        action = 'hide';
    })
    SetNuiFocus(false,false)
    open = false
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,-1) 
end)

RegisterNUICallback('open_settings', function()
    SendNUIMessage({
        action = 'hide';
    })
    SetNuiFocus(false,false)
    open = false
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1) 
end)