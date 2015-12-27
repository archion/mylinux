--makes mpv disable ontop when pausing and re-enable it again when resuming playback
--please note that this won't do anything if ontop was not enabled before pausing

mp.observe_property("pause", "bool", function(name, value)
	if value then
		mp.set_property_native("ontop", false)
    else
		mp.set_property_native("ontop", true)
    end
end)
