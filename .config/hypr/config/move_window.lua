-- After a workspace/monitor transfer, settle the source scrolling view too.
return function(options)
    return function()
        local moving = hl.get_active_window()
        if not moving then return end

        local move_options = options
        if options.monitor == "l" or options.monitor == "r" or options.monitor == "u" or options.monitor == "d" then
            local source_monitor = moving.monitor
            local source_x = source_monitor.x + source_monitor.width / 2
            local source_y = source_monitor.y + source_monitor.height / 2
            local target_monitor
            local target_distance

            for _, monitor in ipairs(hl.get_monitors()) do
                if monitor.id ~= source_monitor.id then
                    local target_x = monitor.x + monitor.width / 2
                    local target_y = monitor.y + monitor.height / 2
                    local valid = (options.monitor == "l" and target_x < source_x)
                        or (options.monitor == "r" and target_x > source_x)
                        or (options.monitor == "u" and target_y < source_y)
                        or (options.monitor == "d" and target_y > source_y)
                    local distance = (target_x - source_x) ^ 2 + (target_y - source_y) ^ 2
                    if valid and (not target_distance or distance < target_distance) then
                        target_monitor = monitor
                        target_distance = distance
                    end
                end
            end

            -- At the outer edge, silently leave the window where it is.
            if not target_monitor then return end
            move_options = { monitor = target_monitor.name }
        end

        local source = moving and moving.workspace
        local source_id = source and source.id
        local was_scrolling = moving and not moving.floating and moving.layout.name == "scrolling"
        hl.dispatch(hl.dsp.window.move(move_options))
        if not was_scrolling or not moving.workspace or moving.workspace.id == source_id then return end

        local focused = hl.get_active_window()
        local remaining
        local columns = {}
        for _, window in ipairs(hl.get_windows()) do
            if window.workspace and window.workspace.id == source_id and window.mapped and not window.hidden and not window.floating then
                local layout = window.layout
                if layout.name == "scrolling" then
                    columns[layout.column.index] = true
                    if not remaining or window.focus_history_id < remaining.focus_history_id then remaining = window end
                end
            end
        end
        if not remaining then return end

        -- Synchronous focus/center/restore also resets stale single-column offsets.
        hl.dispatch(hl.dsp.focus({ window = remaining }))
        local count = 0
        for _ in pairs(columns) do count = count + 1 end
        if count == 1 then hl.dispatch(hl.dsp.layout("center")) end
        if focused and focused.address ~= remaining.address then
            hl.dispatch(hl.dsp.focus({ window = focused }))
        end
    end
end
