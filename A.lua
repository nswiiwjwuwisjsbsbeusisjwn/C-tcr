local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Module = {}
Module.API_URL = "http://fi7.bot-hosting.net:21258/api/"
Module.API_KEY = "Cat"
Module.isTeleporting = false

local function stringToHex(str)
    local hex = ""
    for i = 1, #str do
        hex = hex .. string.format("%02x", string.byte(str, i))
    end
    return hex
end

local function decodeBase64WithPadding(encoded)
    encoded = string.gsub(encoded, "-", "+")
    encoded = string.gsub(encoded, "_", "/")
    
    local padding = #encoded % 4
    if padding > 0 then
        encoded = encoded .. string.rep("=", 4 - padding)
    end
    
    local success, decoded = pcall(function()
        return HttpService:Base64Decode(encoded)
    end)
    
    if not success then
        return false, nil
    end
    
    return true, decoded
end

local function decodeCrystalJob(crystalJob)
    if string.sub(crystalJob, 1, 8) ~= "Crystal_" then
        return crystalJob
    end
    
    local base64Part = string.sub(crystalJob, 9)
    local success, decoded = decodeBase64WithPadding(base64Part)
    
    if not success then
        return nil
    end
    
    local hexString = stringToHex(decoded)
    
    if #hexString < 32 then
        hexString = hexString .. string.rep("0", 32 - #hexString)
    end
    
    hexString = string.sub(hexString, 1, 32)
    
    local uuid = string.format("%s-%s-%s-%s-%s",
        string.sub(hexString, 1, 8),
        string.sub(hexString, 9, 12),
        string.sub(hexString, 13, 16),
        string.sub(hexString, 17, 20),
        string.sub(hexString, 21, 32)
    )
    
    return uuid
end

local function teleportToJob(jobId)
    if Module.isTeleporting then
        return false
    end
    
    Module.isTeleporting = true
    
    local success = pcall(function()
        local serverBrowser = ReplicatedStorage:FindFirstChild("__ServerBrowser")
        if serverBrowser then
            serverBrowser:InvokeServer("teleport", jobId)
        end
    end)
    
    task.wait(1)
    Module.isTeleporting = false
    
    return success
end

function Module.k(category)
    print("[HOP] Starting search for:", category)
    
    while true do
        local url = Module.API_URL .. category .. "?api_key=" .. Module.API_KEY
        
        local success, response = pcall(function()
            return game:HttpGet(url)
        end)
        
        if not success then
            print("[HOP] API Error, retrying...")
            task.wait(1)
            continue
        end
        
        local jsonSuccess, data = pcall(function()
            return HttpService:JSONDecode(response)
        end)
        
        if not jsonSuccess then
            print("[HOP] JSON Error, retrying...")
            task.wait(1)
            continue
        end
        
        if data and data.Amount and data.Amount > 0 and data.JobId then
            print("[HOP] Found", data.Amount, "jobs in", category)
            
            for _, job in ipairs(data.JobId) do
                if job.Jobid then
                    local decodedJobId = decodeCrystalJob(job.Jobid)
                    
                    if decodedJobId then
                        print("[HOP] Category:", category)
                        print("[HOP] Crystal:", job.Jobid)
                        print("[HOP] Decoded:", decodedJobId)
                        print("[HOP] Players:", job.Players or "Unknown")
                        
                        if teleportToJob(decodedJobId) then
                            print("[HOP] Success!")
                            return true
                        else
                            print("[HOP] Failed, trying next job...")
                        end
                    end
                end
            end
        else
            print("[HOP] No jobs found, waiting 1s...")
        end
        
        task.wait(1)
    end
end

return Modulelocal function p(q)
    if string.sub(q, 1, 8) ~= "Crystal_" then
        return q
    end
    
    local r = string.sub(q, 9)
    local n, s = k(r)
    
    if not n then
        return nil
    end
    
    local t = g(s)
    
    if #t < 32 then
        t = t .. string.rep("0", 32 - #t)
    end
    
    t = string.sub(t, 1, 32)
    
    local u = string.format("%s-%s-%s-%s-%s",
        string.sub(t, 1, 8),
        string.sub(t, 9, 12),
        string.sub(t, 13, 16),
        string.sub(t, 17, 20),
        string.sub(t, 21, 32)
    )
    
    return u
end

local function v(w)
    if c.f then
        return false
    end
    
    c.f = true
    
    local n = pcall(function()
        b:FindFirstChild("__ServerBrowser"):InvokeServer("teleport", w)
    end)
    
    task.wait(1)
    c.f = false
    
    return n
end

function c:k(x)
    print("[HOP] Starting search for:", x)
    
    while true do
        local y = self.d .. x .. "?api_key=" .. self.e
        
        local n, z = pcall(function()
            return game:HttpGet(y)
        end)
        
        if not n then
            print("[HOP] API Error, retrying...")
            task.wait(1)
            continue
        end
        
        local success, A = pcall(function()
            return a:JSONDecode(z)
        end)
        
        if not success then
            print("[HOP] JSON Error, retrying...")
            task.wait(1)
            continue
        end
        
        if A and A.Amount and A.Amount > 0 and A.JobId then
            print("[HOP] Found", A.Amount, "jobs in", x)
            
            for _, B in ipairs(A.JobId) do
                if B.Jobid then
                    local C = p(B.Jobid)
                    
                    if C then
                        print("[HOP] Category:", x)
                        print("[HOP] Crystal:", B.Jobid)
                        print("[HOP] Decoded:", C)
                        print("[HOP] Players:", B.Players or "Unknown")
                        
                        if v(C) then
                            print("[HOP] Success!")
                            return true
                        else
                            print("[HOP] Failed, trying next job...")
                        end
                    end
                end
            end
        else
            print("[HOP] No jobs found, waiting 1s...")
        end
        
        task.wait(1)
    end
end

return c    end
    
    local r = string.sub(q, 9)
    local n, s = k(r)
    
    if not n then
        return nil
    end
    
    local t = g(s)
    
    if #t < 32 then
        t = t .. string.rep("0", 32 - #t)
    end
    
    t = string.sub(t, 1, 32)
    
    local u = string.format("%s-%s-%s-%s-%s",
        string.sub(t, 1, 8),
        string.sub(t, 9, 12),
        string.sub(t, 13, 16),
        string.sub(t, 17, 20),
        string.sub(t, 21, 32)
    )
    
    return u
end

local function v(w)
    if c.f then
        return false
    end
    
    c.f = true
    
    local n = pcall(function()
        b.__ServerBrowser:InvokeServer("teleport", w)
    end)
    
    task.wait(1)
    c.f = false
    
    return n
end

function c.k(x)
    while true do
        local y = c.d .. x .. "?api_key=" .. c.e
        
        local n, z = pcall(function()
            return game:HttpGet(y)
        end)
        
        if not n then
            task.wait(1)
            continue
        end
        
        local A = a:JSONDecode(z)
        
        if A and A.Amount and A.Amount > 0 and A.JobId then
            for _, B in ipairs(A.JobId) do
                if B.Jobid then
                    local C = p(B.Jobid)
                    
                    if C then
                        print("[HOP] Category:", x)
                        print("[HOP] Crystal:", B.Jobid)
                        print("[HOP] Decoded:", C)
                        print("[HOP] Players:", B.Players or "Unknown")
                        
                        if v(C) then
                            print("[HOP] Success!")
                            return true
                        end
                    end
                end
            end
        end
        
        task.wait(1)
    end
end

return c            d = string.gsub(d, "-", "+")
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
