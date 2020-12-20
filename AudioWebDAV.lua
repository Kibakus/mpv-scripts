local utils = require 'mp.utils'

function find_and_add_entries()
	local default_audio_paths = {"", "RUS%20Sound/", "RUS%20Sounds/", "Rus%20Sound/", "Rus%20Sounds/", "Sound%20Rus/", "Sounds%20Rus/", "Sounds/", "Sound/"}
    local path = mp.get_property("path", "")
	local dir, filename = utils.split_path(path)
	local audio_filename = string.gsub(filename, "%.%w+$", ".mka")
	for i = 1,#default_audio_paths do
	mp.commandv("audio-add", dir .. default_audio_paths[i] .. audio_filename)
	end
end
mp.register_event("start-file", find_and_add_entries)