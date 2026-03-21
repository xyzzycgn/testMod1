---
--- Created by xyzzycgn.
--- DateTime: 10.03.25 10:28
---
local Log = require("__log4factorio__.Log")
local sub = require("sub")

Log.setSeverityFromSettings("testmod1-logLevel")


for ndx, wcid in pairs({ defines.wire_connector_id.circuit_red, defines.wire_connector_id.circuit_green,
                         defines.wire_connector_id.combinator_input_red, defines.wire_connector_id.combinator_input_green,
                         defines.wire_connector_id.combinator_output_red, defines.wire_connector_id.combinator_output_green }) do
    Log.logBlock( { ndx = ndx, wcid = wcid }, function(m)log(m)end, Log.FINE)
end



Log.log("Test Mod 1 Log 1", function(m)log(m)end)
Log.log("Test Mod 1 Log 2", function(m)log(m)end, Log.FINE)
Log.log("Test Mod 1 Log 3", function(m)log(m)end, Log.WARN)



local function nth_tick_handler(e)
    Log.log("Test Mod 1 Log nth tick", function(m)log(m)end, Log.FINE)
end

local function nth_tick_handler2(e)
    Log.log("Test Mod 1 Log nth tick2", function(m)log(m)end)
end


script.on_nth_tick(60, nth_tick_handler)
script.on_nth_tick(180, nth_tick_handler2)

local function alterSetting(event, which, func)
    if event.setting == which then
        local new = settings.global[which].value
        Log.log('setting ' .. which .. ' changed to ' .. new, function(m)log(m)end, Log.CONFIG)
        func(new)
        return true
    end
    return false
end

local function changeSettings(e)
    -- local var to make compiler happy
    local _ =
        alterSetting(e, "testmod1-logLevel", function(newval) Log.setSeverity(Log[newval]) end)
end

script.on_event(defines.events.on_runtime_mod_setting_changed, changeSettings)