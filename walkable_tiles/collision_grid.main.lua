local fill_color = Color.new(64, 224, 96, 72)
local border_color = Color.new(96, 255, 128, 128)
local text_color = Color.new(30, 255, 30, 255)

local function clamp(value, min_value, max_value)
    if value < min_value then
        return min_value
    end
    if value > max_value then
        return max_value
    end
    return value
end

function Render()
    local map_width = GetMapWidth()
    local map_height = GetMapHeight()
    if map_width <= 0 or map_height <= 0 then
        return
    end

    local zoom = GetZoom()
    local camera = GetCameraPosition()
    local draw_radius = math.floor(70 / math.max(zoom, 0.15)) + 24

    local min_x = clamp(math.floor(camera.x) - draw_radius, 0, map_width - 1)
    local max_x = clamp(math.floor(camera.x) + draw_radius, 0, map_width - 1)
    local min_y = clamp(math.floor(camera.y) - draw_radius, 0, map_height - 1)
    local max_y = clamp(math.floor(camera.y) + draw_radius, 0, map_height - 1)

    local rendered_tiles = 0

    for y = min_y, max_y do
        for x = min_x, max_x do
            local tile = GetMapTile(x, y)
            if tile ~= nil and tile:IsWalkable() then
                local world_pos = Vector3.new(x + 0.5, y + 0.5, 0.0)
                if IsWorldPosOnScreen(world_pos) then
                    RenderWorldRectFilled(world_pos, 1.0, 1.0, fill_color)
                    RenderWorldRect(world_pos, 1.0, 1.0, border_color, 1.0)
                    rendered_tiles = rendered_tiles + 1
                end
            end
        end
    end

    RenderText(
        "Walkable tiles: " .. tostring(rendered_tiles),
        Vector2.new(140, 140),
        30.0,
        text_color,
        false
    )
end