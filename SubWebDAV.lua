local utils = require 'mp.utils'

function find_and_add_entries()
	local default_audio_paths = {"", "RUS%20Subs/", "Rus%20Subs/", "SUBS/", "Subs/", "subs/", "Sub/", "Rus%20Sub/"}
    local path = mp.get_property("path", "")
	local dir, filename = utils.split_path(path)
	local audio_filename = string.gsub(filename, "%.%w+$", ".srt")
	for i = 1,#default_audio_paths do
	mp.commandv("sub-add", dir .. default_audio_paths[i] .. audio_filename)
	end
end
mp.register_event("start-file", find_and_add_entries)

