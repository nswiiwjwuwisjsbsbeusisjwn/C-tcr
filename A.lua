local z = {
    usedJobs = {}
}

function z.loadUsedJobs()
    if isfile("used_jobs.json") then
        local a, b = pcall(function()
            return game:GetService("HttpService"):JSONDecode(readfile("used_jobs.json"))
        end)
        if a and type(b) == "table" then
            z.usedJobs = b
        end
    end
end

function z.saveUsedJobs()
    pcall(function()
        writefile("used_jobs.json", game:GetService("HttpService"):JSONEncode(z.usedJobs))
    end)
end

function z.isJobUsed(c)
    return z.usedJobs[c] == true
end

function z.markJobUsed(c)
    z.usedJobs[c] = true
    z.saveUsedJobs()
end

z.loadUsedJobs()

local y = {
    ["Decode"] = function(c)
        if string.sub(c, 1, 8) == "Crystal_" then
            local d = string.sub(c, 9)
            d = string.gsub(d, "-", "+")
            d = string.gsub(d, "_", "/")
            
            local e = #d % 4
            if e > 0 then
                d = d .. string.rep("=", 4 - e)
            end
            
            local a, b = pcall(function()
                return game:GetService("HttpService"):Base64Decode(d)
            end)
            
            if a then
                local f = string.gsub(b, "[^%x]", "")
                if #f >= 32 then
                    local g = string.sub(f, 1, 32)
                    return string.format("%s-%s-%s-%s-%s",
                        string.sub(g, 1, 8),
                        string.sub(g, 9, 12), 
                        string.sub(g, 13, 16),
                        string.sub(g, 17, 20),
                        string.sub(g, 21, 32)
                    )
                end
            end
        end
        return c
    end
}

return {
    y = y,
    z = z
}
