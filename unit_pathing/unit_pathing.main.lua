function DrawSelectedUnitPath()
    local player = GetAssignedPlayer()
    if not player then return end

    local unit = player:GetSelectedObject()
    if not unit or not unit:IsAlive() then return end

    local target = unit:GetTargetPosition()
    local unitPos = unit:GetPosition()
    if (target - unitPos):Length() < 0.5 then return end
    local path = unit:GetPath()
    if not path or #path == 0 then return end

    local lineColor = Color(64, 220, 255, 255)
    local pointColor = Color(255, 220, 64, 255)

    RenderWorldCircleFilled(target, 0.2, pointColor, 6)

    prev = path[1]
    for i = 2, #path do
        local p = path[i]
        RenderWorldLine(prev, p, lineColor, 2.0)
        RenderWorldCircleFilled(p, 0.12, pointColor, 6)
        prev = p
    end
end

function Render()
    DrawSelectedUnitPath()
end
