local a = game:GetService("HttpService")
local b = game:GetService("ReplicatedStorage")

local c = {}
c.d = "http://fi7.bot-hosting.net:21258/api/"
c.e = "Cat"
c.f = false

local function g(h)
    local i = ""
    for j = 1, #h do
        i = i .. string.format("%02x", string.byte(h, j))
    end
    return i
end

local function k(l)
    l = string.gsub(l, "-", "+")
    l = string.gsub(l, "_", "/")
    
    local m = #l % 4
    if m > 0 then
        l = l .. string.rep("=", 4 - m)
    end
    
    local n, o = pcall(function()
        return a:Base64Decode(l)
    end)
    
    if not n then
        return false, nil
    end
    
    return true, o
end

local function p(q)
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

return c
