--====================================================================--
-- Tutorial On Table Sorting
--====================================================================--

--[[

******************
 - Author James Timberlake
******************

  - A tutorial on list organization
  -This is a lightweight sorter that organizes your lists alphabetically

--]]

--====================================================================--
-- Credits
-- The fb json list was made by Robbie Armstrong
--====================================================================--
--first we get the jcontents we want to organize
local json = require("json")

local path = system.pathForFile( "fb.json", system.ResourceDirectory )
 
-- io.open opens a file at path. returns nil if no file found
local fh, errStr = io.open( path, "r" )

local contents 
if fh then
   -- read all contents of file into a string
    contents = fh:read( "*a" )
end

local fbList = json.decode(contents)


local listSorter = require("listSorter")

--now we pass through the list that we want to sort and it will hand us a new list fuly alhphabetized
local sortedList = listSorter:sortByName(fbList['data'])


for k,v in ipairs(sortedList) do
	print('my name is '..v["name"])
end

--in case you need letter headings for each letter type (note, this doesn't work for numbers yet)
listSorter:getLetterSet(sortedList)

for k,v in ipairs(listSorter.letterSet) do
	print('This episode of Sesame Street was brought to you by the letter '..v)---lol, its always the letter v! or its it.....
end

