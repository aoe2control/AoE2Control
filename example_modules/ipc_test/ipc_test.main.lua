local pipeName = "AoE_ML_Pipe"

function Init()
    IPC.StartServer(pipeName)
    ChatMessage("IPC online for player " .. tostring(GetAssignedPlayerId()))
end

function Update()
    if not IPC.HasMessages() then
        return
    end

    for _, raw in ipairs(IPC.GetMessages()) do
        local msg = ParseJSON(raw)
        if msg and msg.action == "ping" then
            IPC.Send({
                action = "pong",
                assignedPlayerId = GetAssignedPlayerId(),
                time = GetGameTime()
            })
        end
    end
end

function End()
    IPC.StopServer()
end

function Unload()
    IPC.StopServer()
end