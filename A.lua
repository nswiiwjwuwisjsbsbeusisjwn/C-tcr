local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local HopAPI = {}
HopAPI.BaseURL = "http://fi7.bot-hosting.net:21258/api/"
HopAPI.APIKey = "Crystal_838nejdi2"
HopAPI.IsHopping = false
HopAPI.PlaceId = game.PlaceId

-- Decode Crystal ID to Job ID
local function decodeCrystalID(crystalId)
    if not crystalId or type(crystalId) ~= "string" then
        return nil
    end
    
    -- Remove Crystal_ prefix
    if string.find(crystalId, "Crystal_") then
        local hexPart = string.gsub(crystalId, "Crystal_", "")
        
        -- Convert hex to ASCII (Job ID)
        local ascii = ""
        for i = 1, #hexPart, 2 do
            local hexByte = string.sub(hexPart, i, i + 1)
            local byte = tonumber(hexByte, 16)
            if byte then
                ascii = ascii .. string.char(byte)
            end
        end
        
        return ascii
    end
    
    return crystalId
end

-- Teleport to Job ID
local function teleportToJob(jobId)
    if HopAPI.IsHopping then
        return false
    end
    
    if not jobId or jobId == "" then
        return false
    end
    
    HopAPI.IsHopping = true
    
    local success = pcall(function()
        TeleportService:TeleportToPlaceInstance(HopAPI.PlaceId, jobId, Players.LocalPlayer)
    end)
    
    task.wait(2)
    HopAPI.IsHopping = false
    return success
end

-- Main Hop Function
function HopAPI:Hop(input)
    if not input or input == "" then
        return false
    end
    
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
    
    while true do
        -- Call API với category
        local url = self.BaseURL .. category .. "?api_key=" .. self.APIKey
        
        local success, response = pcall(function()
            return game:HttpGet(url, true)
        end)
        
        if success then
            local decodeSuccess, data = pcall(function()
                return HttpService:JSONDecode(response)
            end)
            
            if decodeSuccess and data and data.Amount and data.Amount > 0 and data.JobId then
                -- Loop qua tất cả JobId
                for _, job in ipairs(data.JobId) do
                    if job.Jobid then
                        -- Decode Crystal ID
                        local decodedJobId = decodeCrystalID(job.Jobid)
                        
                        if decodedJobId then
                            -- Teleport
                            if teleportToJob(decodedJobId) then
                                return true
                            end
                            task.wait(1)
                        end
                    end
                end
            end
        end
        
        task.wait(5)
    end
end

return HopAPI
