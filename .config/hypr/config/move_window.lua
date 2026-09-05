-- After a workspace/monitor transfer, settle the source scrolling view too.
return function(options)
    return function()
        local moving = hl.get_active_window()
        local source = moving and moving.workspace
        local source_id = source and source.id
        local was_scrolling = moving and not moving.floating and moving.layout.name == "scrolling"
        hl.dispatch(hl.dsp.window.move(options))
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
