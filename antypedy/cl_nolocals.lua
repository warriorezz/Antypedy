local gowno=500.0

Citizen.CreateThread(function()
    for i = 1, 12 do
        EnableDispatchService(i, false)
    end
    
    SetPedPopulationBudget(0)
    SetVehiclePopulationBudget(0)
    
    local playerPed = PlayerPedId()
    SetPoliceIgnorePlayer(playerPed, true)
    SetDispatchCopsForPlayer(playerPed, false)
end)

Citizen.CreateThread(function()
    while true do
        SetPedDensityMultiplierThisFrame(0)
        SetScenarioPedDensityMultiplierThisFrame(0, 0)
        SetVehicleDensityMultiplierThisFrame(0)
        SetRandomVehicleDensityMultiplierThisFrame(0)
        SetParkedVehicleDensityMultiplierThisFrame(0)
        
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerId = PlayerId()
        local pos = GetEntityCoords(playerPed)

        RemoveVehiclesFromGeneratorsInArea(
            pos.x - gowno,
            pos.y - gowno,
            pos.z - gowno,
            pos.x + gowno,
            pos.y + gowno,
            pos.z + gowno
        )

        if GetPlayerWantedLevel(playerId) > 0 then
            SetPlayerWantedLevel(playerId, 0, false)
            SetPlayerWantedLevelNow(playerId, false)
        end

        Citizen.Wait(500)
    end
end)
