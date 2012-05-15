module(...,package.seeall)

local tableSorter = {}
tableSorter.letterSet = {}

function tableSorter : sortByName(tableList)
	--first we sort the names in the given table 
	local    a = {}
    for k,v in ipairs(tableList) do
    	--this is specific to the list structure and what you want to sort by
    	table.insert(a, v["name"]) 
	end
    table.sort(a)
    
    local newList = {}
    -- now we create a new list for items to be added in the correct alphabetical order
    for i,j in ipairs(a) do
    	for k,v in ipairs(tableList) do
    		if v["name"] == j then
    			table.insert(newList,v)
    			break
    		end
    	end
    end
    
    
	return newList
end

function tableSorter : getLetterSet(tableList)
	--here we look for a lett and call the addToLetterSet function
	for k,v in ipairs(tableList) do
		--gets the first letter of a string
		local letter = v["name"]:sub(1,1)
		local isALetter = tableSorter:addToLetterSet(letter)				
	end
	
	table.sort(tableSorter.letterSet)
end

--Here we add the leters to a list
function tableSorter : addToLetterSet(letter)
	--make sure they're all upper cased
	letter = letter:upper()
	
	if #self.letterSet == 0 then
		table.insert(self.letterSet,letter)
		return false
	else
		--if the letter was already added, it's not added again to the list
		for k,v in ipairs(self.letterSet) do
			if letter == v then
				return true
			end
		end
		
		table.insert(self.letterSet,letter)
		return false
		
	end
		return 
end

return tableSorter