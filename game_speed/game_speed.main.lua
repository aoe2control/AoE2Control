function Load()
    Settings.AddKeybind("Increase Game Speed", Key.Add)
end

function Render()
    local gameSpeedKey = Settings.GetKeybind("Increase Game Speed", Key.Add)

    if IsKeyPressed(gameSpeedKey) then
        SetGameSpeedMultiplier(30)
    else
        SetGameSpeedMultiplier(1.5)
    end
end