def fib(n)
    #gives nth fibonacci number
    num = 0
    nextNum = 1
    fibArr = []
    for i in 0...n do
        fibArr << num
        numHolder = num
        num = nextNum
        nextNum += numHolder
    end
    return fibArr
end

def isPalindrome(n)
    #determines if a number is a palindrome
    nString = n.to_s
    nChars = nString.chars
    newArr = []
    for i in 0...nChars.length do
        newArr << nChars[-1 * (i + 1)]
    end
    if newArr == nChars
       return true
    else
        return false
    end
end

def nthmax(n, a)
    #returns nth largest value in array a
    numArray = a.sort
    begin
        return numArray[-1 * (n+1)]
    rescue
        return nil
    end

end

def freq(s)
    #returns char with highest frequency in a string
    charArr = s.chars
    charHash = {}
    charArr.each do |char|
        if charHash.has_key?(char)
            charHash[char] += 1
        else
            charHash[char] = 1
        end
    end
    sortedCharArr = charHash.sort_by {|k, v| v}
    if sortedCharArr.empty?
        return ""
    else
        return sortedCharArr[-1][0]
    end
end

def zipHash(arr1, arr2)
    #creates a hash map where keys are elements from array arr1 and
    #values are elements from array arr2; nil if different lengths
    arrHash = {}
    if arr1.length == arr2.length
        arr1.each do |i|
            arrHash[i] = arr2[arr1.index(i)]
        end
    else
        return nil
    end
    return arrHash
end

def hashToArray(hash)
    #turns hash map into array of pair arrays (key and value)
    hashArray = []
    for i in 0...hash.length do
        hashArray << hash.to_a[i]
    end
    return hashArray
end
