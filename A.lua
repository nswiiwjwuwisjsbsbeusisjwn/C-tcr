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
    print("[Crystal Hop] Starting search for:", category)
    
    while true do
        local url = self.BaseURL .. category .. "?api_key=" .. self.APIKey
        
        local success, response = pcall(function()
            return game:HttpGet(url)
        end)
        
        if not success then
            print("[Crystal Hop] API Error, retrying in 1s...")
            task.wait(1)
            continue
        end
        
        local decodeSuccess, data = pcall(function()
            return HttpService:JSONDecode(response)
        end)
        
        if not decodeSuccess then
            print("[Crystal Hop] JSON Error, retrying in 1s...")
            task.wait(1)
            continue
        end
        
        if data and data.Amount and data.Amount > 0 and data.Jobs then
            print("[Crystal Hop] Found", data.Amount, "jobs in", category)
            
            for _, job in ipairs(data.Jobs) do
                if job.Jobid then
                    local decodedJobId = DecodeCrystalID(job.Jobid)
                    
                    if decodedJobId then
                        print("[Crystal Hop] ================")
                        print("[Crystal Hop] Category:", job.name or category)
                        print("[Crystal Hop] Players:", job.Players or "Unknown")
                        print("[Crystal Hop] Crystal ID:", job.Jobid)
                        print("[Crystal Hop] Decoded UUID:", decodedJobId)
                        print("[Crystal Hop] ================")
                        
                        if TeleportToJob(decodedJobId) then
                            print("[Crystal Hop] ✓ Teleport Success!")
                            return true
                        else
                            print("[Crystal Hop] ✗ Teleport Failed, trying next job...")
                        end
                    else
                        print("[Crystal Hop] ✗ Failed to decode:", job.Jobid)
                    end
                end
            end
        else
            print("[Crystal Hop] No jobs available, waiting 2s...")
        end
        
        task.wait(2)
    end
end

function HopAPI:HopLatest(category)
    print("[Crystal Hop] Getting latest job for:", category)
    
    while true do
        local url = self.BaseURL .. category .. "/latest?api_key=" .. self.APIKey
        
        local success, response = pcall(function()
            return game:HttpGet(url)
        end)
        
        if not success then
            print("[Crystal Hop] API Error, retrying in 1s...")
            task.wait(1)
            continue
        end
        
        local decodeSuccess, data = pcall(function()
            return HttpService:JSONDecode(response)
        end)
        
        if not decodeSuccess then
            print("[Crystal Hop] JSON Error, retrying in 1s...")
            task.wait(1)
            continue
        end
        
        if data and data.Jobs and #data.Jobs > 0 then
            local job = data.Jobs[1]
            
            if job.Jobid then
                local decodedJobId = DecodeCrystalID(job.Jobid)
                
                if decodedJobId then
                    print("[Crystal Hop] ================")
                    print("[Crystal Hop] Latest Job Found!")
                    print("[Crystal Hop] Category:", job.name or category)
                    print("[Crystal Hop] Players:", job.Players or "Unknown")
                    print("[Crystal Hop] Crystal ID:", job.Jobid)
                    print("[Crystal Hop] Decoded UUID:", decodedJobId)
                    print("[Crystal Hop] ================")
                    
                    if TeleportToJob(decodedJobId) then
                        print("[Crystal Hop] ✓ Teleport Success!")
                        return true
                    else
                        print("[Crystal Hop] ✗ Teleport Failed, retrying...")
                    end
                else
                    print("[Crystal Hop] ✗ Failed to decode:", job.Jobid)
                end
            end
        else
            print("[Crystal Hop] No jobs available, waiting 2s...")
        end
        
        task.wait(2)
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

return HopAPIlocal function DecodeCrystalJob(crystalJob)
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
