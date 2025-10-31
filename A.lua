local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HopAPI = {}
HopAPI.BaseURL = "http://fi7.bot-hosting.net:2022/api/"
HopAPI.APIKey = "Cat"
HopAPI.IsHopping = false

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
    if string.sub(crystalId, 1, 8) ~= "Crystal_" then
        return crystalId
    end
    
    local base64Part = string.sub(crystalId, 9)
    local success, decoded = Base64Decode(base64Part)
    
    if not success then
        return nil
    end
    
    local hexString = StringToHex(decoded)
    
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

local function TeleportToJob(jobId)
    if HopAPI.IsHopping then
        return false
    end
    
    HopAPI.IsHopping = true
    
    local success = pcall(function()
        ReplicatedStorage:FindFirstChild("__ServerBrowser"):InvokeServer("teleport", jobId)
    end)
    
    task.wait(1)
    HopAPI.IsHopping = false
    
    return success
end

function HopAPI:Hop(category)
    while true do
        local url = self.BaseURL .. category .. "?api_key=" .. self.APIKey
        
        local success, response = pcall(function()
            return game:HttpGet(url)
        end)
        
        if not success then
            task.wait(2)
        else
            local decodeSuccess, data = pcall(function()
                return HttpService:JSONDecode(response)
            end)
            
            if not decodeSuccess then
                task.wait(2)
            else
                if data and data.Amount and data.Amount > 0 and data.Jobs then
                    for _, job in ipairs(data.Jobs) do
                        if job.Jobid then
                            local decodedJobId = DecodeCrystalID(job.Jobid)
                            
                            if decodedJobId then
                                print("[Crystal Hop] Players:", job.Players or "?/12")
                                print("[Crystal Hop] Jobid:", decodedJobId)
                                
                                if TeleportToJob(decodedJobId) then
                                    return true
                                end
                            end
                        end
                    end
                end
                
                task.wait(2)
            end
        end
    end
end

function HopAPI:HopLatest(category)
    while true do
        local url = self.BaseURL .. category .. "/latest?api_key=" .. self.APIKey
        
        local success, response = pcall(function()
            return game:HttpGet(url)
        end)
        
        if not success then
            task.wait(2)
        else
            local decodeSuccess, data = pcall(function()
                return HttpService:JSONDecode(response)
            end)
            
            if not decodeSuccess then
                task.wait(2)
            else
                if data and data.Jobs and #data.Jobs > 0 then
                    local job = data.Jobs[1]
                    
                    if job.Jobid then
                        local decodedJobId = DecodeCrystalID(job.Jobid)
                        
                        if decodedJobId then
                            print("[Crystal Hop] Players:", job.Players or "?/12")
                            print("[Crystal Hop] Jobid:", decodedJobId)
                            
                            if TeleportToJob(decodedJobId) then
                                return true
                            end
                        end
                    end
                end
                
                task.wait(2)
            end
        end
    end
end

function HopAPI:GetJobs(category)
    local url = self.BaseURL .. category .. "?api_key=" .. self.APIKey
    
    local success, response = pcall(function()
        return game:HttpGet(url)
    end)
    
    if not success then
        return nil
    end
    
    local decodeSuccess, data = pcall(function()
        return HttpService:JSONDecode(response)
    end)
    
    if not decodeSuccess then
        return nil
    end
    
    return data
end

return HopAPI
