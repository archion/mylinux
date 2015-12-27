mp.register_event("seek", function(event)
	mp.command("script_message enable-osc")
end)
