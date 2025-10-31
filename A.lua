local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local HopAPI = {}
HopAPI.BaseURL = "http://fi7.bot-hosting.net:21258/api/"
HopAPI.APIKey = "Crystal_838nejdi2"
HopAPI.IsHopping = false
HopAPI.PlaceId = game.PlaceId

-- Base64 decode helper
local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local b64lookup = {}
for i = 1, #b64chars do
    b64lookup[string.sub(b64chars, i, i)] = i - 1
end
b64lookup['-'] = 62  -- URL-safe
b64lookup['_'] = 63  -- URL-safe

local function base64Decode(data)
    data = string.gsub(data, '[^'..b64chars..'=-_]', '')
    local str = ""
    local n = 0
    local bits = 0
    
    for i = 1, #data do
        local c = string.sub(data, i, i)
        if c == '=' then break end
        
        local v = b64lookup[c]
        if v then
            bits = bits * 64 + v
            n = n + 6
            
            if n >= 8 then
                n = n - 8
                local byte = math.floor(bits / (2^n)) % 256
                str = str .. string.char(byte)
            end
        end
    end
    
    return str
end

-- Decode Crystal ID to Job ID (UUID hex format)
local function decodeCrystalID(crystalId)
    if not crystalId or type(crystalId) ~= "string" then
        warn("[HopAPI] Invalid Crystal ID")
        return nil
    end
    
    -- Remove Crystal_ prefix
    if string.find(crystalId, "Crystal_") then
        local base64Part = string.gsub(crystalId, "Crystal_", "")
        
        -- Decode from base64
        local decoded = base64Decode(base64Part)
        
        -- Convert to hex string (UUID format)
        local hexStr = ""
        for i = 1, #decoded do
            hexStr = hexStr .. string.format("%02x", string.byte(decoded, i))
        end
        
        -- Format as UUID: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
        if #hexStr >= 32 then
            local uuid = string.sub(hexStr, 1, 8) .. "-" ..
                        string.sub(hexStr, 9, 12) .. "-" ..
                        string.sub(hexStr, 13, 16) .. "-" ..
                        string.sub(hexStr, 17, 20) .. "-" ..
                        string.sub(hexStr, 21, 32)
            
            print("[HopAPI] Decoded Job ID: " .. uuid)
            return uuid
        else
            warn("[HopAPI] Invalid decoded length: " .. #hexStr)
        end
    end
    
    return crystalId
end

-- Teleport to Job ID
local function teleportToJob(jobId)
    if HopAPI.IsHopping then
        warn("[HopAPI] Already hopping, please wait...")
        return false
    end
    
    if not jobId or jobId == "" then
        warn("[HopAPI] No Job ID provided")
        return false
    end
    
    print("[HopAPI] Attempting teleport to: " .. jobId)
    HopAPI.IsHopping = true
    
    local success, err = pcall(function()
        TeleportService:TeleportToPlaceInstance(HopAPI.PlaceId, jobId, Players.LocalPlayer)
    end)
    
    if not success then
        warn("[HopAPI] Teleport failed: " .. tostring(err))
    end
    
    task.wait(3)
    HopAPI.IsHopping = false
    return success
end

-- Main Hop Function
function HopAPI:Hop(input)
    if not input or input == "" then
        warn("[HopAPI] No input provided")
        return false
    end
    
    print("[HopAPI] Starting hop with input: " .. input)
    
    -- Nếu là Crystal ID trực tiếp
    if string.find(input, "Crystal_") then
        local decodedJobId = decodeCrystalID(input)
        if decodedJobId then
            return teleportToJob(decodedJobId)
        end
        return false
    end
    
    -- Nếu là category (fullmoon, mirage, etc)
    local category = string.lower(input)
    local attempts = 0
    local maxAttempts = 10
    
    while attempts < maxAttempts do
        attempts = attempts + 1
        print("[HopAPI] Attempt " .. attempts .. "/" .. maxAttempts)
        
        -- Call API với category
        local url = self.BaseURL .. category .. "?api_key=" .. self.APIKey
        
        local success, response = pcall(function()
            return game:HttpGet(url, true)
        end)
        
        if success then
            local decodeSuccess, data = pcall(function()
                return HttpService:JSONDecode(response)
            end)
            
            if decodeSuccess and data then
                print("[HopAPI] API Response: Amount = " .. tostring(data.Amount))
                
                if data.Amount and data.Amount > 0 and data.JobId then
                    -- Loop qua tất cả JobId
                    for index, job in ipairs(data.JobId) do
                        if job.Jobid then
                            print("[HopAPI] Processing job " .. index .. "/" .. #data.JobId)
                            print("[HopAPI] Crystal ID: " .. job.Jobid)
                            
                            -- Decode Crystal ID
                            local decodedJobId = decodeCrystalID(job.Jobid)
                            
                            if decodedJobId then
                                -- Teleport
                                if teleportToJob(decodedJobId) then
                                    return true
                                end
                                task.wait(2)
                            end
                        end
                    end
                else
                    print("[HopAPI] No jobs available, waiting...")
                end
            else
                warn("[HopAPI] Failed to decode JSON")
            end
        else
            warn("[HopAPI] HTTP request failed: " .. tostring(response))
        end
        
        task.wait(5)
    end
    
    warn("[HopAPI] Max attempts reached, giving up")
    return false
end

-- Test function
function HopAPI:Test(crystalId)
    print("[HopAPI] === Testing Crystal ID Decode ===")
    local decoded = decodeCrystalID(crystalId)
    print("[HopAPI] Result: " .. tostring(decoded))
    return decoded
end

return HopAPI
