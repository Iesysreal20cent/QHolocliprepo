--v2,a script specifically to manage user experience when taking yt vids.Created in honor of dear hololive members and future daily use.
--Small note about monetization.This by default will give them minimum income.If want to puts ads to support add,--include-ads 
--dependencies youtube-dl ,https://github.com/ytdl-org/youtube-dl/releases/tag/2021.03.03
	
	--dwld those short vids.https://github.com/ytdl-org/youtube-dl#options
	--no-playlist will make it attempt to download before any checking.BAD.
	--https://stackoverflow.com/questions/53535466/lua-get-date-time-in-format-yyyymmddhhmmss
	--  -f best --max-downloads 4 --abort-on-error --no-cache-dir --max-filesize 10m --datebefore "..os.date("%Y%m%d").."
	--The ideal is to check date first then size.But,The stupid parser go linear list search and will not stop.So only size filter.ASSUME 4 new vid is max per day by holo mem.
	-- --reject-title '/' will make the system ignore filesize flag.STUPID.BAD.ACTUALLY ok.SINCE we need to check FILESIZE.need info dumb me.
	--Whatever,The sequence is messed up but.IT SHOULD check file
	local function scrapeshortvids()
		local file=io.open("vidsrcchannellist", 'r')
		if(file~=nil)then
		local fileContent = {}
		for line in file:lines() do
			--process the string here
			table.insert(fileContent,line)
		end
		io.close(file)
		e=1
		while (fileContent[e]~=nil)do
			os.execute("./youtube-dl -f best --no-cache-dir --max-downloads 4 --abort-on-error --no-playlist --max-filesize 10m --abort-on-unavailable-fragment -o \"$PWD/%(title)s.%(ext)s\" \""..fileContent[e].."\"")
			e=e+1
		end
		end
	end
	
	--public static void updateviewedytvids(){}

	scrapeshortvids()
