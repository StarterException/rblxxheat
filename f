--// Advanced Secure Obfuscator for Roblox (Roblox-compatible)
function advancedObfuscate(source, VarName, WaterMark)
    warn("Started advanced ultra secure obfuscation")

    -- Customizable variables and default values
    local Variable = VarName or "Taurus_"
    local WM = WaterMark or "WaterMark | Secure by RBLXXHEATER"

    -- Default source if none provided
    if source == nil then
        source = [[print("Hello World!")]]
    end

    -- Time measurement
    local ticks = tick()

    -- Generate watermark
    WM = "--[[".."\n".. tostring(WM) .."\n".."]]--".."\n\n"

    -- Random name generator
    local randomName = function(length)
        local letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        local name = ""
        for i = 1, length do
            local randChar = letters:sub(math.random(1, #letters), math.random(1, #letters))
            name = name .. randChar
        end
        return name
    end

    -- Generate random numbers for obfuscation
    local generateRandomNumbers = function()
        local randomNumber = ""
        for i = 1, math.random(10, 20) do
            randomNumber = randomNumber .. tostring(math.random(0, 9))
        end
        return randomNumber
    end

    -- Random binary data generator with numbers
    local add_binary = function(number, s)
        local numbers = {
            generateRandomNumbers(),
            generateRandomNumbers(),
            generateRandomNumbers(),
            generateRandomNumbers(),
            generateRandomNumbers(),
        }

        for i = 1, number do
            local randNumber = numbers[math.random(1, #numbers)]
            s = s .. "local " .. Variable .. randomName(10) .. " = '" .. randNumber .. "'; "
        end

        return s
    end

    -- Simple byte obfuscation (Roblox-compatible)
    local obfuscateSource = function(source)
        local obfuscatedSource = ""
        for i = 1, #source do
            obfuscatedSource = obfuscatedSource .. "\\" .. string.byte(source:sub(i, i))
        end
        return obfuscatedSource
    end

    -- Add random loops and statements to slow down reverse engineering
    local addUselessLoops = function(num)
        local loops = ""
        for i = 1, num do
            local fakeLoopVar = Variable .. randomName(math.random(8, 12))
            local fakeLoopLimit = math.random(1000, 5000)
            loops = loops .. "for " .. fakeLoopVar .. " = 1, " .. fakeLoopLimit .. " do end; "
        end
        return loops
    end

    -- Add random meaningless if-statements and logic
    local addRandomIfStatements = function(num)
        local fakeIfCode = ""
        for i = 1, num do
            local fakeVar1 = Variable .. randomName(math.random(8, 12))
            local fakeVar2 = Variable .. randomName(math.random(8, 12))
            fakeIfCode = fakeIfCode .. "local " .. fakeVar1 .. " = " .. tostring(math.random(1, 100)) .. "; "
            fakeIfCode = fakeIfCode .. "local " .. fakeVar2 .. " = " .. tostring(math.random(1, 100)) .. "; "
            fakeIfCode = fakeIfCode .. "if " .. fakeVar1 .. " == " .. fakeVar2 .. " then end; "
        end
        return fakeIfCode
    end

    -- Recursively add functions that call each other (simple recursion for Roblox compatibility)
    local addRecursiveFunctions = function(num)
        local recursiveCode = ""
        for i = 1, num do
            local funcName = Variable .. randomName(math.random(8, 12))
            local funcCall = Variable .. randomName(math.random(8, 12))
            recursiveCode = recursiveCode .. "function " .. funcName .. "() " .. funcCall .. "(); end; "
            recursiveCode = recursiveCode .. "function " .. funcCall .. "() " .. funcName .. "(); end; "
        end
        return recursiveCode
    end

    -- Generate random fake functions and variables for obfuscation
    local generateFakeCode = function(num)
        local fakeCode = ""
        for i = 1, num do
            local fakeVar = Variable .. randomName(math.random(8, 12))
            local fakeFunc = Variable .. randomName(math.random(8, 12))
            fakeCode = fakeCode .. "local " .. fakeVar .. " = " .. tostring(math.random()) .. "; "
            fakeCode = fakeCode .. "function " .. fakeFunc .. "() return " .. tostring(math.random(1, 1000)) .. " end; "
        end
        return fakeCode
    end

    -- Add deep nested tables to increase complexity
    local addNestedTables = function(depth)
        local nestedTables = ""
        for i = 1, depth do
            local fakeTable = Variable .. randomName(math.random(8, 12))
            nestedTables = nestedTables .. "local " .. fakeTable .. " = {" .. randomName(math.random(10, 20)) .. " = {}}; "
        end
        return nestedTables
    end

    -- Encrypt the source code into byte sequence
    local encryptedSource = obfuscateSource(source)

    -- Generate obfuscated source code
    local SourceByte = [[local ]]..Variable..randomName(15)..[[ = "]]..encryptedSource..[["]]
    local Loadstring = [[local ]]..Variable..randomName(15)..[[ = loadstring("]]..encryptedSource..[[")()]]

    -- Final obfuscated code with multiple protection layers (Roblox-compatible)
    local obfuscated = WM
        .. Loadstring
        .. "; "
        .. add_binary(math.random(30, 50), "")
        .. SourceByte
        .. "; "
        .. generateFakeCode(math.random(5, 10))
        .. addRecursiveFunctions(math.random(3, 5))
        .. addUselessLoops(math.random(2, 4))
        .. addRandomIfStatements(math.random(5, 10))
        .. addNestedTables(math.random(5, 10))

    -- Copy the obfuscated code to clipboard
    setclipboard(obfuscated)

    -- Output the time taken for obfuscation
    warn("Done obfuscating in " .. tostring(tick() - ticks) .. " seconds")

    return obfuscated
end

--// Module wrapper
return function(source, CustomVarName, WaterMark)
    task.spawn(function()
        advancedObfuscate(source, CustomVarName, WaterMark)
    end)
end
