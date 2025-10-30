local a = game:GetService("HttpService")
local b = game:GetService("ReplicatedStorage")

local c = {
    d = "http://fi7.bot-hosting.net:21258/api/",
    e = "Cat",
    f = false
}

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
    
    return n, o
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
