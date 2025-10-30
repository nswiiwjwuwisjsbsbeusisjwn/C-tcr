local Crystal2 = {
    usedJobs = {}
}

function Crystal2.loadUsedJobs()
    if isfile("used_jobs.json") then
        local a, b = pcall(function()
            return game:GetService("HttpService"):JSONDecode(readfile("used_jobs.json"))
        end)
        if a and type(b) == "table" then
            Crystal2.usedJobs = b
        end
    end
end

function Crystal2.saveUsedJobs()
    pcall(function()
        writefile("used_jobs.json", game:GetService("HttpService"):JSONEncode(Crystal2.usedJobs))
    end)
end

function Crystal2.isJobUsed(c)
    return Crystal2.usedJobs[c] == true
end

function Crystal2.markJobUsed(c)
    Crystal2.usedJobs[c] = true
    Crystal2.saveUsedJobs()
end

Crystal2.loadUsedJobs()

local Crystal1 = {
    ["Decode"] = function(c)
        if string.sub(c, 1, 8) == "Crystal_" then
            local crystall001 = string.sub(c, 9)
            crystall001 = string.gsub(crystall001, "-", "+")
            crystall001 = string.gsub(crystall001, "_", "/")
            
            local d = #crystall001 % 4
            if d > 0 then
                crystall001 = crystall001 .. string.rep("=", 4 - d)
            end
            
            local a, b = pcall(function()
                return game:GetService("HttpService"):Base64Decode(crystall001)
            end)
            
            if a then
                local e = string.gsub(b, "[^%x]", "")
                if #e >= 32 then
                    return string.sub(e, 1, 32)
                end
            end
        end
        return c
    end
}

return {
    Crystal1 = Crystal1,
    Crystal2 = Crystal2
}
