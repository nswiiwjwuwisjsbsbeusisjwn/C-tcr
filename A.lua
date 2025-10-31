local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local API = {}
API.URL = "http://fi7.bot-hosting.net:21258/api/"
API.KEY = "Cat"
API.IsHopping = false

local function StringToHex(str)
    local hex = ""
    for i = 1, #str do
        hex = hex .. string.format("%02x", string.byte(str, i))
    end
    return hex
end

local function DecodeBase64(encoded)
    encoded = string.gsub(encoded, "-", "+")
    encoded = string.gsub(encoded, "_", "/")
    
    local padding = #encoded % 4
    if padding > 0 then
        encoded = encoded .. string.rep("=", 4 - padding)
    end
    
    local success, decoded = pcall(function()
        return HttpService:Base64Decode(encoded)
    end)
    
    if success then
        return decoded
    end
    
    return nil
end

local function DecodeCrystalJob(crystalJob)
    if not crystalJob or type(crystalJob) ~= "string" then
        return nil
    end
    
    if string.sub(crystalJob, 1, 8) ~= "Crystal_" then
        return crystalJob
    end
    
    local base64Part = string.sub(crystalJob, 9)
    local decoded = DecodeBase64(base64Part)
    
    if not decoded then
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
    if API.IsHopping then
        print("[HOP] Already hopping, skipping...")
        return false
    end
    
    if not jobId or type(jobId) ~= "string" then
        print("[HOP] Invalid job ID")
        return false
    end
    
    API.IsHopping = true
    
    print("[HOP] Attempting teleport...")
    
    local success, result = pcall(function()
        local serverBrowser = ReplicatedStorage:WaitForChild("__ServerBrowser", 5)
        if not serverBrowser then
            error("__ServerBrowser not found")
        end
        
        return serverBrowser:InvokeServer("teleport", jobId)
    end)
    
    if success then
        print("[HOP] Teleport successful!")
        task.wait(2)
        API.IsHopping = false
        return true
    else
        print("[HOP] Teleport error:", result)
        task.wait(1)
        API.IsHopping = false
        return false
    end
end

function API.Hop(category)
    if not category or type(category) ~= "string" then
        print("[HOP] Invalid category")
        return false
    end
    
    print("[HOP] Starting:", category)
    
    local attempts = 0
    local maxAttempts = 100
    
    while attempts < maxAttempts do
        attempts = attempts + 1
        
        local url = API.URL .. category .. "?api_key=" .. API.KEY
        print("[HOP] Fetching API... (Attempt", attempts .. ")")
        
        local success, response = pcall(function()
            return game:HttpGet(url)
        end)
        
        if not success then
            print("[HOP] API Error:", response)
            task.wait(2)
        else
            local jsonSuccess, data = pcall(function()
                return HttpService:JSONDecode(response)
            end)
            
            if not jsonSuccess then
                print("[HOP] JSON Error:", data)
                task.wait(2)
            else
                if data and data.Amount and data.Amount > 0 and data.JobId and type(data.JobId) == "table" then
                    print("[HOP] Found", data.Amount, "jobs")
                    
                    for index, job in ipairs(data.JobId) do
                        if job and job.Jobid then
                            print("[HOP] Processing job", index .. "/" .. data.Amount)
                            print("[HOP] Name:", job.name or "Unknown")
                            print("[HOP] Players:", job.Players or "Unknown")
                            print("[HOP] Crystal:", job.Jobid)
                            
                            local decodedJobId = DecodeCrystalJob(job.Jobid)
                            
                            if decodedJobId then
                                print("[HOP] Decoded:", decodedJobId)
                                
                                if TeleportToJob(decodedJobId) then
                                    print("[HOP] Success! Server hopped")
                                    return true
                                else
                                    print("[HOP] Teleport failed for this job")
                                    task.wait(1)
                                end
                            else
                                print("[HOP] Failed to decode job ID")
                            end
                        end
                    end
                    
                    print("[HOP] All jobs in this batch failed, retrying...")
                    task.wait(2)
                else
                    print("[HOP] No jobs available, waiting...")
                    task.wait(3)
                end
            end
        end
    end
    
    print("[HOP] Max attempts reached")
    return false
end

return APIlocal function DecodeCrystalJob(crystalJob)
    if not crystalJob or type(crystalJob) ~= "string" then
        return nil
    end
    
    if string.sub(crystalJob, 1, 8) ~= "Crystal_" then
        return crystalJob
    end
    
    local base64Part = string.sub(crystalJob, 9)
    local decoded = DecodeBase64(base64Part)
    
    if not decoded then
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
    if not jobId or API.IsHopping then
        return false
    end
    
    API.IsHopping = true
    
    local success, result = pcall(function()
        local serverBrowser = ReplicatedStorage:FindFirstChild("__ServerBrowser")
        if serverBrowser then
            return serverBrowser:InvokeServer("teleport", jobId)
        end
        return false
    end)
    
    task.wait(1)
    API.IsHopping = false
    
    return success and result
end

function API.Hop(category)
    if not category or type(category) ~= "string" then
        print("[HOP] Invalid category")
        return false
    end
    
    print("[HOP] Starting:", category)
    
    local retryCount = 0
    local maxRetries = 999999
    
    while retryCount < maxRetries do
        retryCount = retryCount + 1
        
        local url = API.URL .. category .. "?api_key=" .. API.KEY
        
        local success, response = pcall(function()
            return game:HttpGet(url)
        end)
        
        if not success or not response then
            print("[HOP] API Error, retry:", retryCount)
            task.wait(1)
        else
            local jsonSuccess, data = pcall(function()
                return HttpService:JSONDecode(response)
            end)
            
            if not jsonSuccess or not data then
                print("[HOP] JSON Error, retry:", retryCount)
                task.wait(1)
            else
                if data and data.Amount and data.Amount > 0 and data.JobId and type(data.JobId) == "table" then
                    print("[HOP] Found", data.Amount, "jobs")
                    
                    local foundValidJob = false
                    
                    for index, job in ipairs(data.JobId) do
                        if job and job.Jobid then
                            local decodedJobId = DecodeCrystalJob(job.Jobid)
                            
                            if decodedJobId then
                                print("[HOP] Job #" .. index)
                                print("[HOP] Category:", category)
                                print("[HOP] Name:", job.name or "Unknown")
                                print("[HOP] Players:", job.Players or "0/12")
                                
                                if job.World then
                                    print("[HOP] World:", job.World)
                                end
                                
                                print("[HOP] Crystal:", job.Jobid)
                                print("[HOP] Decoded:", decodedJobId)
                                
                                if TeleportToJob(decodedJobId) then
                                    print("[HOP] Success!")
                                    return true
                                else
                                    print("[HOP] Failed, trying next job...")
                                end
                                
                                foundValidJob = true
                            end
                        end
                    end
                    
                    if not foundValidJob then
                        print("[HOP] No valid jobs, waiting...")
                        task.wait(1)
                    end
                else
                    print("[HOP] No jobs found, waiting...")
                    task.wait(1)
                end
            end
        end
    end
    
    print("[HOP] Max retries reached")
    return false
end

return API
