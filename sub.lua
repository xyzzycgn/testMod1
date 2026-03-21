---
--- Created by xyzzycgn.
--- DateTime: 10.03.25 12:27
---

local Log = require("__log4factorio__.Log")
Log.setSeverity(Log.FINE)

local function nth_tick_handler(e)
    Log.log("Test Mod 1 Log nth tick in sub", function(m)log(m)end, Log.FINE)
end


script.on_nth_tick(240, nth_tick_handler)
