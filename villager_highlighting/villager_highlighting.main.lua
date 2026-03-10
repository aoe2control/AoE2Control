function Load()
    Settings.AddColor("Villager Color", Color.new(0, 255, 0))
end

function Render()
    local villagerColor = Settings.GetColor("Villager Color", Color.new(0, 255, 0))

    local objects = GetObjectsByClass(UnitClass.VILLAGER)
    for i = 1, #objects do
        RenderObjectBoundsFilled(objects[i], villagerColor)
    end
end