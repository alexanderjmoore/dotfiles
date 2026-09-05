local moveWindow = require("config.move_window")
-- Move horizontally without merging windows into a neighboring column.
return function(direction)
    local window = hl.get_active_window()
    if not window then return end
    local layout = window.layout
    if window.floating or not layout or layout.name ~= "scrolling" then
        hl.dispatch(moveWindow({ direction = direction }))
        return
    end

    local column = layout.column
    if #column.windows > 1 then
        -- promote inserts the focused window immediately to the right.
        hl.dispatch(hl.dsp.layout("promote"))
        if direction == "l" then
            hl.dispatch(hl.dsp.layout("swapcol l"))
        end
        return
    end

    local adjacent = column.index + (direction == "l" and -1 or 1)
    for _, other in ipairs(hl.get_windows()) do
        if other.workspace and other.workspace.id == window.workspace.id and not other.floating then
            local other_layout = other.layout
            if other_layout and other_layout.name == "scrolling" and other_layout.column.index == adjacent then
                hl.dispatch(hl.dsp.layout("swapcol " .. direction))
                return
            end
        end
    end

    -- With no adjacent column, retain movement to a neighboring monitor.
    hl.dispatch(moveWindow({ direction = direction }))
end
