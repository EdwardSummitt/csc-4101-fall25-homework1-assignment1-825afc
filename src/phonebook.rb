class PhoneBook
    def initialize(arr = [])
        #checks to see if initial entries are valid and creates phonebook
        #with said entries if so
        @infoArr = []
        for i in 0...arr.length do
            if arr[i].is_a?(Array)
                if arr[i][0].is_a?(String) && arr[i][1].is_a?(String) && arr[i][1] =~ /^\d{3}-\d{3}-\d{4}$/ && (is_listed.is_a?(TrueClass) || is_listed.is_a?(FalseClass))
                    if arr[i].length == 3
                        @infoArr << arr[i]
                    end
                end
            end
        end
    end

    def add(name, number, is_listed)
        #adds entry consisting of name, number, and listed status
        #no name duplicates, num format nnn-nnn-nnnn, num duplicates
        #allowed but can only be listed once
        foundListedDuplicate = false
        if name.is_a?(String) && number.is_a?(String) && number =~ /^\d{3}-\d{3}-\d{4}$/ && !@infoArr.flatten.include?(name) && (is_listed.is_a?(TrueClass) || is_listed.is_a?(FalseClass))
            for i in 0...@infoArr.length do
                if @infoArr[i].include?(number) && @infoArr[i][2]
                    foundListedDuplicate = true
                end
                if foundListedDuplicate
                    break
                end
            end
            if !foundListedDuplicate
                @infoArr << [name, number, is_listed]
                return true
            else
                return false
            end
        end
        if !name.is_a?(String)
            puts "Please enter name as string"
            return false
        end
        if !number.is_a?(String)
            puts "Please enter number as string"
            return false
        end
        if !number !~ /^\d{3}-\d{3}-\d{4}$/
            puts "Please enter number in this format: nnn-nnn-nnnn"
            return false
        end
        if @infoArr.flatten.include?(name)
            puts "Name already in phone book"
            return false
        end
        if !(is_listed.is_a?(TrueClass) || is_listed.is_a?(FalseClass))
            puts "Please enter listed state as boolean"
            return false
        end
    end

    def lookup(name)
        #Looks up name in the PhoneBook and returns the corresponding
        #phone number in the format NNN-NNN-NNNN ONLY !f the entry is
        #listed. Otherwise, return nil.
        for i in 0...@infoArr.length do
            if @infoArr[i][0] == name && @infoArr[i][2]
                return @infoArr[i][1]
            end
        end
        return nil
    end

    def lookupByNum(number)
        #returns name given corresponding number if listed
        for i in 0...@infoArr.length do
            if @infoArr[i][1] == number && @infoArr[i][2]
                return @infoArr[i][0]
            end
        end
        return nil
    end

    def namesByAc(areaCode)
        #returns all numbers with given area code areaCode
        numArr = []
        for i in 0...@infoArr.length do
            if @infoArr[i][1] =~ /^#{areaCode}-\d{3}-\d{4}$/
                numArr << @infoArr[i][0]
            end
        end
        return numArr
    end
end

