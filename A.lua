local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")

local HopAPI = {}
HopAPI.BaseURL = "http://fi7.bot-hosting.net:2022/api/"
HopAPI.APIKey = "Cat"
HopAPI.IsHopping = false
HopAPI.PlaceId = game.PlaceId

local function StringToHex(str)
    local hex = ""
    for i = 1, #str do
        hex = hex .. string.format("%02x", string.byte(str, i))
    end
    return hex
end

local function Base64Decode(input)
    input = string.gsub(input, "-", "+")
    input = string.gsub(input, "_", "/")
    
    local padding = #input % 4
    if padding > 0 then
        input = input .. string.rep("=", 4 - padding)
    end
    
    local success, result = pcall(function()
        return HttpService:Base64Decode(input)
    end)
    
    if not success then
        return false, nil
    end
    
    return true, result
end

local function DecodeCrystalID(crystalId)
    if not crystalId or type(crystalId) ~= "string" then
        return nil
    end
    
    if string.sub(crystalId, 1, 8) ~= "Crystal_" then
        return crystalId
    end
    
    local base64Part = string.sub(crystalId, 9)
    local success, decoded = Base64Decode(base64Part)
    
    if not success or not decoded then
        return nil
    end
    
    local hexString = StringToHex(decoded)
    
    if #hexString < 32 then
        hexString = hexString .. string.rep("0", 32 - #hexString)
    end
    
    hexString = string.sub(hexString, 1, 32):lower()
    
    local uuid = string.format("%s-%s-%s-%s-%s",
        string.sub(hexString, 1, 8),
        string.sub(hexString, 9, 12),
        string.sub(hexString, 13, 16),
        string.sub(hexString, 17, 20),
        string.sub(hexString, 21, 32)
    )
    
    return uuid
end

local function TeleportToJob(jobId)
    if HopAPI.IsHopping then
        return false
    end
    
    if not jobId or jobId == "" then
        return false
    end
    
    HopAPI.IsHopping = true
    
    local success1 = pcall(function()
        local serverBrowser = ReplicatedStorage:FindFirstChild("__ServerBrowser")
        if serverBrowser then
            serverBrowser:InvokeServer("teleport", jobId)
        end
    end)
    
    if success1 then
        task.wait(2)
        HopAPI.IsHopping = false
        return true
    end
    
    local success2 = pcall(function()
        TeleportService:TeleportToPlaceInstance(HopAPI.PlaceId, jobId, game.Players.LocalPlayer)
    end)
    
    task.wait(2)
    HopAPI.IsHopping = false
    return success2
end

function HopAPI:Hop(input)
    if string.sub(input, 1, 8) == "Crystal_" then
        local decodedJobId = DecodeCrystalID(input)
        if decodedJobId then
            return TeleportToJob(decodedJobId)
        end
        return false
    end
    
    local category = string.lower(input)
    
    while true do
        local url = self.BaseURL .. category .. "?api_key=" .. self.APIKey
        
        local success, response = pcall(function()
            return game:HttpGet(url, true)
        end)
        
        if success then
            local decodeSuccess, data = pcall(function()
                return HttpService:JSONDecode(response)
            end)
            
            if decodeSuccess and data and data.Amount and data.Amount > 0 and data.JobId then
                for _, job in ipairs(data.JobId) do
                    if job.Jobid then
                        local decodedJobId = DecodeCrystalID(job.Jobid)
                        if decodedJobId then
                            if TeleportToJob(decodedJobId) then
                                return true
                            end
                            task.wait(1)
                        end
                    end
                end
            end
        end
        
        task.wait(2)
    end
end

return HopAPI
