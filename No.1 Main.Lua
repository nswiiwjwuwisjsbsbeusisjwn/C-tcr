---// Crystal Main
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local VirtualInputManager = game:GetService("VirtualInputManager")
local TweenService = game:GetService("TweenService")
local CollectionService = game:GetService("CollectionService")
local TeleportService = game:GetService("TeleportService")

local LocalPlayer = Players.LocalPlayer
local player = LocalPlayer
local plr = LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
World1 = game.PlaceId == 2753915549
	World2 = game.PlaceId == 4442272183
	World3 = game.PlaceId == 7449423635
	if getgenv().Team == "Marines" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
elseif getgenv().Team == "Pirates" then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
end
repeat
    task.wait(1)
    if
        game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ChooseTeam", true) and
            game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ChooseTeam", true).Visible and
            game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("UIController", true)
     then
        for b, c in pairs(getgc(true)) do
            if
                type(c) == "function" and
                    getfenv(c).script ==
                        game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild(
                            "UIController",
                            true
                        )
             then
                local d = getconstants(c)
                pcall(
                    function()
                        if (d[1] == "Pirates" or d[1] == "Marines") and #d == 1 then
                            if d[1] == getgenv().Team then
                                c(getgenv().Team)
                            end
                        end
                    end
                )
            end
        end
    end
until game:GetService("Players").LocalPlayer.Team
getgenv().Crystal = getgenv().Crystal or {}
local Cat = loadstring(game:HttpGet("https://raw.githubusercontent.com/nswiiwjwuwisjsbsbeusisjwn/C-tcr/refs/heads/main/Ch%C6%B0a%20%C4%91%E1%BB%81.txt"))()
local Banner = {
	['Genral'] = 101849161408766,
	['Auto'] = 110162136250435,
	['Setting'] = 72210587662292,
	['Misc'] = 84034775913393,
	['Items'] = 98574803492996,
	['Shop'] = 74630923244478,
	['Teleport'] = 137847566773112,
	['Visual'] = 123257335719276,
	['Combat'] = 112935442242481,
	['Update'] = 86844430363710,
}
local TitleHub = "No.1 Hub"
local DescHub = "Remake Catdzs1vn"
local Window = Cat:Window({
	Title = TitleHub,
	Desc = DescHub,
	IconTile = "111115552352248",
	SizeUi = "520,340",
	Theme = "104493731273844"
})
local S = Window:Add({
	Title = "Tab Settings",
	Desc = "Setting Tab",
	Banner = Banner.Update,
	Columns = 2
})
local MF = Window:Add({
	Title = "Tab Main Farming",
	Desc = "Farm Bone,Level,...",
	Banner = Banner.Update,
	Columns = 1
})
getgenv().CrystalCfg = {
    -- Weapon Settings
    ["Select Weapon"] = "Melee",
    
    -- Combat Settings
    ["Fast Attack"] = true,
    ["Attack Player"] = true,
    ["Attack Mobs"] = true,
    ["Bring Mob"] = true,
    ["Turn On Haki"] = true,
    ["Turn on Race V3"] = false,
    ["Turn on Race V4"] = false,
    
    -- Farming Settings
    ["Select Farm"] = "Level",
    ["Start Farm method"] = false,
    ["Select Mon"] = "",
    ["Auto Quest Mon"] = false,
    ["Start Kill Mon"] = false,
    ["Set Farm Near"] = 100,
    ["Select Material"] = "",
    ["Auto Quest Material"] = false,
    ["Start Farm Material"] = false,
    ["Select Boss"] = "",
    ["Quest Boss"] = false,
    ["Start Kill Boss"] = false,
}

getgenv().Crystal = {
    ["Accept Quest"] = true,
}

getgenv().Team = "Pirates"

getgenv().SpinPos = false

getgenv().NotAutoEquip = false

getgenv().noclip = false

getgenv().noclipsetup = false
            function CheckQuest()
    local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
    local team = tostring(game.Players.LocalPlayer.Team)
    local SelectMonster = getgenv().CrystalCfg["Select Mon"] or ""
            if World1 then
            if (MyLevel >= 1 and MyLevel <= 9) or SelectMonster == "Bandit" or SelectMonster == "Trainee" then
            if team == "Marines" then
            Mon = "Trainee"
            LevelQuest = 1
            NameQuest = "MarineQuest"
            NameMon = "Trainee"
            CFrameQuest = CFrame.new(-2699.69, 19.35, 2083.19)
            CFrameMon   = CFrame.new(-2709.67, 24.52, 2104.24)
            elseif team == "Pirates" then
            Mon = "Bandit"
            LevelQuest = 1
            NameQuest = "BanditQuest1"
            NameMon = "Bandit"
            CFrameQuest = CFrame.new(1059.37, 15.45, 1550.42)
            CFrameMon   = CFrame.new(1045.96, 27.00, 1560.82)
            end
            elseif (MyLevel >= 10 and MyLevel <= 14) or SelectMonster == "Monkey" then
            Mon = "Monkey"
            LevelQuest = 1
            NameQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.09, 35.55, 153.38)
            CFrameMon   = CFrame.new(-1448.52, 67.85, 11.47)
        elseif (MyLevel >= 15 and MyLevel <= 29) or SelectMonster == "Gorilla" then
            Mon = "Gorilla"
            LevelQuest = 2
            NameQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.09, 35.55, 153.38)
            CFrameMon   = CFrame.new(-1249.19, 8.23, -456.19)
        elseif (MyLevel >= 30 and MyLevel <= 39) or SelectMonster == "Pirate" then
            Mon = "Pirate"
            LevelQuest = 1
            NameQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07, 4.10, 3831.55)
            CFrameMon   = CFrame.new(-1103.51, 13.75, 3896.09)
        elseif (MyLevel >= 40 and MyLevel <= 59) or SelectMonster == "Brute" then
            Mon = "Brute"
            LevelQuest = 2
            NameQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07, 4.10, 3831.55)
            CFrameMon   = CFrame.new(-1145.06, 15.98, 4280.31)
			 elseif (MyLevel >= 60 and MyLevel <= 74) or SelectMonster == "Desert Bandit" then
			 Mon = "Desert Bandit"
			 LevelQuest = 1
			 NameQuest = "DesertQuest"
			 NameMon = "Desert Bandit"
			 CFrameQuest = CFrame.new(894.49, 5.14, 4392.43)
			 CFrameMon = CFrame.new(924.80, 6.45, 4481.59)
			 elseif (MyLevel >= 75 and MyLevel <= 89) or SelectMonster == "Desert Officer" then
			 Mon = "Desert Officer"
			 LevelQuest = 2
			 NameQuest = "DesertQuest"
			 NameMon = "Desert Officer"
			 CFrameQuest = CFrame.new(894.49, 5.14, 4392.43)
			 CFrameMon = CFrame.new(1608.28, 8.61, 4371.01)
			 elseif (MyLevel >= 90 and MyLevel <= 99) or SelectMonster == "Snow Bandit" then
			 Mon = "Snow Bandit"
			 LevelQuest = 1
			 NameQuest = "SnowQuest"
			 NameMon = "Snow Bandit"
			 CFrameQuest = CFrame.new(1389.74, 88.15, -1298.91)
			 CFrameMon = CFrame.new(1354.35, 87.27, -1393.95)
			 elseif (MyLevel >= 100 and MyLevel <= 119) or SelectMonster == "Snowman" then
			 Mon = "Snowman"
			 LevelQuest = 2
			 NameQuest = "SnowQuest"
			 NameMon = "Snowman"
			 CFrameQuest = CFrame.new(1389.74, 88.15, -1298.91)
			 CFrameMon = CFrame.new(1201.64, 144.58, -1550.07)
			 elseif (MyLevel >= 120 and MyLevel <= 149) or SelectMonster == "Chief Petty Officer" then
			 Mon = "Chief Petty Officer"
			 LevelQuest = 1
			 NameQuest = "MarineQuest2"
			 NameMon = "Chief Petty Officer"
			 CFrameQuest = CFrame.new(-5039.59, 27.35, 4324.68)
			 CFrameMon = CFrame.new(-4881.23, 22.65, 4273.75)
			 elseif (MyLevel >= 150 and MyLevel <= 174) or SelectMonster == "Sky Bandit" then
			 Mon = "Sky Bandit"
			 LevelQuest = 1
			 NameQuest = "SkyQuest"
			 NameMon = "Sky Bandit"
			 CFrameQuest = CFrame.new(-4839.53, 716.37, -2619.44)
			 CFrameMon = CFrame.new(-4953.21, 295.74, -2899.23)
			 elseif (MyLevel >= 175 and MyLevel <= 189) or SelectMonster == "Dark Master" then
			 Mon = "Dark Master"
			 LevelQuest = 2
			 NameQuest = "SkyQuest"
			 NameMon = "Dark Master"
			 CFrameQuest = CFrame.new(-4839.53, 716.37, -2619.44)
			 CFrameMon = CFrame.new(-5259.84, 391.40, -2229.04)
			 elseif (MyLevel >= 190 and MyLevel <= 209) or SelectMonster == "Prisoner" then
			 Mon = "Prisoner"
			 LevelQuest = 1
			 NameQuest = "PrisonerQuest"
			 NameMon = "Prisoner"
			 CFrameQuest = CFrame.new(5308.93, 1.66, 475.12)
			 CFrameMon = CFrame.new(5098.97, -0.32, 474.24)
			 elseif (MyLevel >= 210 and MyLevel <= 249) or SelectMonster == "Dangerous Prisoner" then
			 Mon = "Dangerous Prisoner"
			 LevelQuest = 2
			 NameQuest = "PrisonerQuest"
			 NameMon = "Dangerous Prisoner"
			 CFrameQuest = CFrame.new(5308.93, 1.66, 475.12)
			 CFrameMon = CFrame.new(5654.56, 15.63, 866.30)
			 elseif (MyLevel >= 250 and MyLevel <= 274) or SelectMonster == "Toga Warrior" then
			 Mon = "Toga Warrior"
			 LevelQuest = 1
			 NameQuest = "ColosseumQuest"
			 NameMon = "Toga Warrior"
			 CFrameQuest = CFrame.new(-1580.05, 6.35, -2986.48)
			 CFrameMon = CFrame.new(-1820.21, 51.68, -2740.67)
			 elseif (MyLevel >= 275 and MyLevel <= 299) or SelectMonster == "Gladiator" then
			 Mon = "Gladiator"
			 LevelQuest = 2
			 NameQuest = "ColosseumQuest"
			 NameMon = "Gladiator"
			 CFrameQuest = CFrame.new(-1580.05, 6.35, -2986.48)
			 CFrameMon = CFrame.new(-1292.84, 56.38, -3339.03)
			 elseif (MyLevel >= 300 and MyLevel <= 324) or SelectMonster == "Military Soldier" then
			 Mon = "Military Soldier"
			 LevelQuest = 1
			 NameQuest = "MagmaQuest"
			 NameMon = "Military Soldier"
			 CFrameQuest = CFrame.new(-5313.37, 10.95, 8515.29)
			 CFrameMon = CFrame.new(-5411.16, 11.08, 8454.29)
			 elseif (MyLevel >= 325 and MyLevel <= 374) or SelectMonster == "Military Spy" then
			 Mon = "Military Spy"
			 LevelQuest = 2
			 NameQuest = "MagmaQuest"
			 NameMon = "Military Spy"
			 CFrameQuest = CFrame.new(-5313.37, 10.95, 8515.29)
			 CFrameMon = CFrame.new(-5802.87, 86.26, 8828.86)
			 elseif (MyLevel >= 375 and MyLevel <= 399) or SelectMonster == "Fishman Warrior" then
			 Mon = "Fishman Warrior"
			 LevelQuest = 1
			 NameQuest = "FishmanQuest"
			 NameMon = "Fishman Warrior"
			 CFrameQuest = CFrame.new(61122.65, 18.50, 1569.40)
			 CFrameMon = CFrame.new(60878.30, 18.48, 1543.76)
			 if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
			 game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.85, 11.68, 1819.78))
			 end
			 elseif (MyLevel >= 400 and MyLevel <= 449) or SelectMonster == "Fishman Commando" then
			 Mon = "Fishman Commando"
			 LevelQuest = 2
			 NameQuest = "FishmanQuest"
			 NameMon = "Fishman Commando"
			 CFrameQuest = CFrame.new(61122.65, 18.50, 1569.40)
			 CFrameMon = CFrame.new(61922.63, 18.48, 1493.93)
			 if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
			 game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(61163.85, 11.68, 1819.78))
			 end
			 elseif (MyLevel >= 450 and MyLevel <= 474) or SelectMonster == "God's Guard" then
			 Mon = "God's Guard"
			 LevelQuest = 1
			 NameQuest = "SkyExp1Quest"
			 NameMon = "God's Guard"
			 CFrameQuest = CFrame.new(-4721.89, 843.87, -1949.97)
			 CFrameMon = CFrame.new(-4710.04, 845.28, -1927.31)
			 if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
			 game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-4607.82, 872.54, -1667.56))
			 end
			 elseif (MyLevel >= 475 and MyLevel <= 524) or SelectMonster == "Shanda" then
			 Mon = "Shanda"
			 LevelQuest = 2
			 NameQuest = "SkyExp1Quest"
			 NameMon = "Shanda"
			 CFrameQuest = CFrame.new(-7859.10, 5544.19, -381.48)
			 CFrameMon = CFrame.new(-7678.49, 5566.40, -497.22)
			 if getgenv().AutoFarm and (CFrameQuest.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 10000 then
			 game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(-7894.62, 5547.14, -380.29))
			 end
			 elseif (MyLevel >= 525 and MyLevel <= 549) or SelectMonster == "Royal Squad" then
			 Mon = "Royal Squad"
			 LevelQuest = 1
			 NameQuest = "SkyExp2Quest"
			 NameMon = "Royal Squad"
			 CFrameQuest = CFrame.new(-7906.82, 5634.66, -1411.99)
			 CFrameMon = CFrame.new(-7624.25, 5658.13, -1467.35)
			 elseif (MyLevel >= 550 and MyLevel <= 624) or SelectMonster == "Royal Soldier" then
			 Mon = "Royal Soldier"
			 LevelQuest = 2
			 NameQuest = "SkyExp2Quest"
			 NameMon = "Royal Soldier"
			 CFrameQuest = CFrame.new(-7906.82, 5634.66, -1411.99)
			 CFrameMon = CFrame.new(-7836.75, 5645.66, -1790.62)
			 elseif (MyLevel >= 625 and MyLevel <= 649) or SelectMonster == "Galley Pirate" then
			 Mon = "Galley Pirate"
			 LevelQuest = 1
			 NameQuest = "FountainQuest"
			 NameMon = "Galley Pirate"
			 CFrameQuest = CFrame.new(5259.82, 37.35, 4050.03)
			 CFrameMon = CFrame.new(5551.02, 78.90, 3930.41)
			 elseif MyLevel >= 650 or SelectMonster == "Galley Captain" then
			 Mon = "Galley Captain"
			 LevelQuest = 2
			 NameQuest = "FountainQuest"
			 NameMon = "Galley Captain"
			 CFrameQuest = CFrame.new(5259.82, 37.35, 4050.03)
			 CFrameMon = CFrame.new(5441.95, 42.50, 4950.09)
			 end
			 elseif World2 then
			 if (MyLevel >= 700 and MyLevel <= 724) or SelectMonster == "Raider" then
			 Mon = "Raider"
			 LevelQuest = 1
			 NameQuest = "Area1Quest"
			 NameMon = "Raider"
			 CFrameQuest = CFrame.new(-429.54, 71.77, 1836.18)
			 CFrameMon = CFrame.new(-728.33, 52.78, 2345.77)
			 elseif (MyLevel >= 725 and MyLevel <= 774) or SelectMonster == "Mercenary" then
			 Mon = "Mercenary"
			 LevelQuest = 2
			 NameQuest = "Area1Quest"
			 NameMon = "Mercenary"
			 CFrameQuest = CFrame.new(-429.54, 71.77, 1836.18)
			 CFrameMon = CFrame.new(-1004.32, 80.16, 1424.62)
			 elseif (MyLevel >= 775 and MyLevel <= 799) or SelectMonster == "Swan Pirate" then
			 Mon = "Swan Pirate"
			 LevelQuest = 1
			 NameQuest = "Area2Quest"
			 NameMon = "Swan Pirate"
			 CFrameQuest = CFrame.new(638.44, 71.77, 918.28)
			 CFrameMon = CFrame.new(1068.66, 137.61, 1322.11)
			 elseif (MyLevel >= 800 and MyLevel <= 874) or SelectMonster == "Factory Staff" then
			 Mon = "Factory Staff"
			 LevelQuest = 2
			 NameQuest = "Area2Quest"
			 NameMon = "Factory Staff"
			 CFrameQuest = CFrame.new(632.70, 73.11, 918.67)
			 CFrameMon = CFrame.new(73.08, 81.86, -27.47)
			 elseif (MyLevel >= 875 and MyLevel <= 899) or SelectMonster == "Marine Lieutenant" then
			 Mon = "Marine Lieutenant"
			 LevelQuest = 1
			 NameQuest = "MarineQuest3"
			 NameMon = "Marine Lieutenant"
			 CFrameQuest = CFrame.new(-2440.80, 71.71, -3216.07)
			 CFrameMon = CFrame.new(-2821.37, 75.90, -3070.09)
			 elseif (MyLevel >= 900 and MyLevel <= 949) or SelectMonster == "Marine Captain" then
			 Mon = "Marine Captain"
			 LevelQuest = 2
			 NameQuest = "MarineQuest3"
			 NameMon = "Marine Captain"
			 CFrameQuest = CFrame.new(-2440.80, 71.71, -3216.07)
			 CFrameMon = CFrame.new(-1861.23, 80.18, -3254.70)
			 elseif (MyLevel >= 950 and MyLevel <= 974) or SelectMonster == "Zombie" then
			 Mon = "Zombie"
			 LevelQuest = 1
			 NameQuest = "ZombieQuest"
			 NameMon = "Zombie"
			 CFrameQuest = CFrame.new(-5497.06, 47.59, -795.24)
			 CFrameMon = CFrame.new(-5657.78, 78.97, -928.69)
			 elseif (MyLevel >= 975 and MyLevel <= 999) or SelectMonster == "Vampire" then
			 Mon = "Vampire"
			 LevelQuest = 2
			 NameQuest = "ZombieQuest"
			 NameMon = "Vampire"
			 CFrameQuest = CFrame.new(-5497.06, 47.59, -795.24)
			 CFrameMon = CFrame.new(-6037.67, 32.18, -1340.66)
			 elseif (MyLevel >= 1000 and MyLevel <= 1049) or SelectMonster == "Snow Trooper" then
			 Mon = "Snow Trooper"
			 LevelQuest = 1
			 NameQuest = "SnowMountainQuest"
			 NameMon = "Snow Trooper"
			 CFrameQuest = CFrame.new(609.86, 400.12, -5372.26)
			 CFrameMon = CFrame.new(549.15, 427.39, -5563.70)
			 elseif (MyLevel >= 1050 and MyLevel <= 1099) or SelectMonster == "Winter Warrior" then
			 Mon = "Winter Warrior"
			 LevelQuest = 2
			 NameQuest = "SnowMountainQuest"
			 NameMon = "Winter Warrior"
			 CFrameQuest = CFrame.new(609.86, 400.12, -5372.26)
			 CFrameMon = CFrame.new(1142.75, 475.64, -5199.42)
			 elseif (MyLevel >= 1100 and MyLevel <= 1124) or SelectMonster == "Lab Subordinate" then
			 Mon = "Lab Subordinate"
			 LevelQuest = 1
			 NameQuest = "IceSideQuest"
			 NameMon = "Lab Subordinate"
			 CFrameQuest = CFrame.new(-6064.07, 15.24, -4902.98)
			 CFrameMon = CFrame.new(-5707.47, 15.95, -4513.39)
			 elseif (MyLevel >= 1125 and MyLevel <= 1174) or SelectMonster == "Horned Warrior" then
			 Mon = "Horned Warrior"
			 LevelQuest = 2
			 NameQuest = "IceSideQuest"
			 NameMon = "Horned Warrior"
			 CFrameQuest = CFrame.new(-6064.07, 15.24, -4902.98)
			 CFrameMon = CFrame.new(-6341.37, 15.95, -5723.16)
			 elseif (MyLevel >= 1175 and MyLevel <= 1199) or SelectMonster == "Magma Ninja" then
			 Mon = "Magma Ninja"
			 LevelQuest = 1
			 NameQuest = "FireSideQuest"
			 NameMon = "Magma Ninja"
			 CFrameQuest = CFrame.new(-5428.03, 15.06, -5299.43)
			 CFrameMon = CFrame.new(-5449.67, 76.66, -5808.20)
			 elseif (MyLevel >= 1200 and MyLevel <= 1249) or SelectMonster == "Lava Pirate" then
			 Mon = "Lava Pirate"
			 LevelQuest = 2
			 NameQuest = "FireSideQuest"
			 NameMon = "Lava Pirate"
			 CFrameQuest = CFrame.new(-5428.03, 15.06, -5299.43)
			 CFrameMon = CFrame.new(-5213.33, 49.74, -4701.45)
			 elseif (MyLevel >= 1250 and MyLevel <= 1274) or SelectMonster == "Ship Deckhand" then
			 Mon = "Ship Deckhand"
			 LevelQuest = 1
			 NameQuest = "ShipQuest1"
			 NameMon = "Ship Deckhand"
			 CFrameQuest = CFrame.new(1037.80, 125.09, 32911.60)
			 CFrameMon = CFrame.new(1212.01, 150.79, 33059.25)
			 elseif (MyLevel >= 1275 and MyLevel <= 1299) or SelectMonster == "Ship Engineer" then
			 Mon = "Ship Engineer"
			 LevelQuest = 2
			 NameQuest = "ShipQuest1"
			 NameMon = "Ship Engineer"
			 CFrameQuest = CFrame.new(1037.80, 125.09, 32911.60)
			 CFrameMon = CFrame.new(919.48, 43.54, 32779.97)
			 elseif (MyLevel >= 1300 and MyLevel <= 1324) or SelectMonster == "Ship Steward" then
			 Mon = "Ship Steward"
			 LevelQuest = 1
			 NameQuest = "ShipQuest2"
			 NameMon = "Ship Steward"
			 CFrameQuest = CFrame.new(968.81, 125.09, 33244.13)
			 CFrameMon = CFrame.new(919.44, 129.56, 33436.04)
			 elseif (MyLevel >= 1325 and MyLevel <= 1349) or SelectMonster == "Ship Officer" then
			 Mon = "Ship Officer"
			 LevelQuest = 2
			 NameQuest = "ShipQuest2"
			 NameMon = "Ship Officer"
			 CFrameQuest = CFrame.new(968.81, 125.09, 33244.13)
			 CFrameMon = CFrame.new(1036.02, 181.44, 33315.73)
			 elseif (MyLevel >= 1350 and MyLevel <= 1374) or SelectMonster == "Arctic Warrior" then
			 Mon = "Arctic Warrior"
			 LevelQuest = 1
			 NameQuest = "FrostQuest"
			 NameMon = "Arctic Warrior"
			 CFrameQuest = CFrame.new(5667.66, 26.80, -6486.09)
			 CFrameMon = CFrame.new(5966.25, 62.97, -6179.38)
			 elseif (MyLevel >= 1375 and MyLevel <= 1424) or SelectMonster == "Snow Lurker" then
			 Mon = "Snow Lurker"
			 LevelQuest = 2
			 NameQuest = "FrostQuest"
			 NameMon = "Snow Lurker"
			 CFrameQuest = CFrame.new(5667.66, 26.80, -6486.09)
			 CFrameMon = CFrame.new(5407.07, 69.19, -6880.88)
			 elseif (MyLevel >= 1425 and MyLevel <= 1449) or SelectMonster == "Sea Soldier" then
			 Mon = "Sea Soldier"
			 LevelQuest = 1
			 NameQuest = "ForgottenQuest"
			 NameMon = "Sea Soldier"
			 CFrameQuest = CFrame.new(-3054.44, 235.54, -10142.82)
			 CFrameMon = CFrame.new(-3028.22, 64.67, -9775.43)
			 elseif MyLevel >= 1450 or SelectMonster == "Water Fighter" then
			 Mon = "Water Fighter"
			 LevelQuest = 2
			 NameQuest = "ForgottenQuest"
			 NameMon = "Water Fighter"
			 CFrameQuest = CFrame.new(-3054.44, 235.54, -10142.82)
			 CFrameMon = CFrame.new(-3352.90, 285.02, -10534.84)
			 end
			 elseif World3 then
			 if (MyLevel >= 1500 and MyLevel <= 1524) or SelectMonster == "Pirate Millionaire" then
			 Mon = "Pirate Millionaire"
			 LevelQuest = 1
			 NameQuest = "PiratePortQuest"
			 NameMon = "Pirate Millionaire"
			 CFrameQuest = CFrame.new(-450.10, 107.68, 5950.73)
			 CFrameMon = CFrame.new(-245.99, 47.31, 5584.10)
			 elseif (MyLevel >= 1525 and MyLevel <= 1574) or SelectMonster == "Pistol Billionaire" then
			 Mon = "Pistol Billionaire"
			 LevelQuest = 2
			 NameQuest = "PiratePortQuest"
			 NameMon = "Pistol Billionaire"
			 CFrameQuest = CFrame.new(-450.10, 107.68, 5950.73)
			 CFrameMon = CFrame.new(-54.81, 83.77, 5947.84)
			 elseif (MyLevel >= 1575 and MyLevel <= 1599) or SelectMonster == "Dragon Crew Warrior" then
			 Mon = "Dragon Crew Warrior"
			 LevelQuest = 1
			 NameQuest = "DragonCrewQuest"
			 NameMon = "Dragon Crew Warrior"
			 CFrameQuest = CFrame.new(6750.49, 127.45, -711.03)
			 CFrameMon = CFrame.new(6709.76, 52.34, -1139.03)
			 elseif (MyLevel >= 1600 and MyLevel <= 1624) or SelectMonster == "Dragon Crew Archer" then
			 Mon = "Dragon Crew Archer"
			 LevelQuest = 2
			 NameQuest = "DragonCrewQuest"
			 NameMon = "Dragon Crew Archer"
			 CFrameQuest = CFrame.new(6750.49, 127.45, -711.03)
			 CFrameMon = CFrame.new(6668.76, 481.38, 329.12)
			 elseif (MyLevel >= 1625 and MyLevel <= 1649) or SelectMonster == "Hydra Enforcer" then
			 Mon = "Hydra Enforcer"
			 LevelQuest = 1
			 NameQuest = "VenomCrewQuest"
			 NameMon = "Hydra Enforcer"
			 CFrameQuest = CFrame.new(5206.40, 1004.10, 748.35)
			 CFrameMon = CFrame.new(4547.12, 1003.10, 334.19)
			 elseif (MyLevel >= 1650 and MyLevel <= 1699) or SelectMonster == "Venomous Assailant" then
			 Mon = "Venomous Assailant"
			 LevelQuest = 2
			 NameQuest = "VenomCrewQuest"
			 NameMon = "Venomous Assailant"
			 CFrameQuest = CFrame.new(5206.40, 1004.10, 748.35)
			 CFrameMon = CFrame.new(4674.93, 1134.83, 996.31)
			 elseif (MyLevel >= 1700 and MyLevel <= 1724) or SelectMonster == "Marine Commodore" then
			 Mon = "Marine Commodore"
			 LevelQuest = 1
			 NameQuest = "MarineTreeIsland"
			 NameMon = "Marine Commodore"
			 CFrameQuest = CFrame.new(2481.09, 74.27, -6779.64)
			 CFrameMon = CFrame.new(2577.25, 75.61, -7739.87)
			 elseif (MyLevel >= 1725 and MyLevel <= 1774) or SelectMonster == "Marine Rear Admiral" then
			 Mon = "Marine Rear Admiral"
			 LevelQuest = 2
			 NameQuest = "MarineTreeIsland"
			 NameMon = "Marine Rear Admiral"
			 CFrameQuest = CFrame.new(2481.09, 74.27, -6779.64)
			 CFrameMon = CFrame.new(3761.81, 123.91, -6823.52)
			 elseif (MyLevel >= 1775 and MyLevel <= 1799) or SelectMonster == "Fishman Raider" then
			 Mon = "Fishman Raider"
			 LevelQuest = 1
			 NameQuest = "DeepForestIsland3"
			 NameMon = "Fishman Raider"
			 CFrameQuest = CFrame.new(-10581.66, 330.87, -8761.19)
			 CFrameMon = CFrame.new(-10407.53, 331.76, -8368.52)
			 elseif (MyLevel >= 1800 and MyLevel <= 1824) or SelectMonster == "Fishman Captain" then
			 Mon = "Fishman Captain"
			 LevelQuest = 2
			 NameQuest = "DeepForestIsland3"
			 NameMon = "Fishman Captain"
			 CFrameQuest = CFrame.new(-10581.66, 330.87, -8761.19)
			 CFrameMon = CFrame.new(-10994.70, 352.38, -9002.11)
			 elseif (MyLevel >= 1825 and MyLevel <= 1849) or SelectMonster == "Forest Pirate" then
			 Mon = "Forest Pirate"
			 LevelQuest = 1
			 NameQuest = "DeepForestIsland"
			 NameMon = "Forest Pirate"
			 CFrameQuest = CFrame.new(-13234.04, 331.49, -7625.40)
			 CFrameMon = CFrame.new(-13274.48, 332.38, -7769.58)
			 elseif (MyLevel >= 1850 and MyLevel <= 1899) or SelectMonster == "Mythological Pirate" then
			 Mon = "Mythological Pirate"
			 LevelQuest = 2
			 NameQuest = "DeepForestIsland"
			 NameMon = "Mythological Pirate"
			 CFrameQuest = CFrame.new(-13234.04, 331.49, -7625.40)
			 CFrameMon = CFrame.new(-13680.61, 501.08, -6991.19)
			 elseif (MyLevel >= 1900 and MyLevel <= 1924) or SelectMonster == "Jungle Pirate" then
			 Mon = "Jungle Pirate"
			 LevelQuest = 1
			 NameQuest = "DeepForestIsland2"
			 NameMon = "Jungle Pirate"
			 CFrameQuest = CFrame.new(-12680.38, 389.97, -9902.02)
			 CFrameMon = CFrame.new(-12256.16, 331.74, -10485.84)
			 elseif (MyLevel >= 1925 and MyLevel <= 1974) or SelectMonster == "Musketeer Pirate" then
			 Mon = "Musketeer Pirate"
			 LevelQuest = 2
			 NameQuest = "DeepForestIsland2"
			 NameMon = "Musketeer Pirate"
			 CFrameQuest = CFrame.new(-12680.38, 389.97, -9902.02)
			 CFrameMon = CFrame.new(-13457.90, 391.55, -9859.18)
			 elseif (MyLevel >= 1975 and MyLevel <= 1999) or SelectMonster == "Reborn Skeleton" then
			 Mon = "Reborn Skeleton"
			 LevelQuest = 1
			 NameQuest = "HauntedQuest1"
			 NameMon = "Reborn Skeleton"
			 CFrameQuest = CFrame.new(-9479.22, 141.22, 5566.09)
			 CFrameMon = CFrame.new(-8763.72, 165.72, 6159.86)
			 elseif (MyLevel >= 2000 and MyLevel <= 2024) or SelectMonster == "Living Zombie" then
			 Mon = "Living Zombie"
			 LevelQuest = 2
			 NameQuest = "HauntedQuest1"
			 NameMon = "Living Zombie"
			 CFrameQuest = CFrame.new(-9479.22, 141.22, 5566.09)
			 CFrameMon = CFrame.new(-10144.13, 138.63, 5838.09)
			 elseif (MyLevel >= 2025 and MyLevel <= 2049) or SelectMonster == "Demonic Soul" then
			 Mon = "Demonic Soul"
			 LevelQuest = 1
			 NameQuest = "HauntedQuest2"
			 NameMon = "Demonic Soul"
			 CFrameQuest = CFrame.new(-9516.99, 172.02, 6078.47)
			 CFrameMon = CFrame.new(-9505.87, 172.10, 6158.99)
			 elseif (MyLevel >= 2050 and MyLevel <= 2074) or SelectMonster == "Posessed Mummy" then
			 Mon = "Posessed Mummy"
			 LevelQuest = 2
			 NameQuest = "HauntedQuest2"
			 NameMon = "Posessed Mummy"
			 CFrameQuest = CFrame.new(-9516.99, 172.02, 6078.47)
			 CFrameMon = CFrame.new(-9582.02, 6.25, 6205.48)
			 elseif (MyLevel >= 2075 and MyLevel <= 2099) or SelectMonster == "Peanut Scout" then
			 Mon = "Peanut Scout"
			 LevelQuest = 1
			 NameQuest = "NutsIslandQuest"
			 NameMon = "Peanut Scout"
			 CFrameQuest = CFrame.new(-2104.39, 38.10, -10194.22)
			 CFrameMon = CFrame.new(-2143.24, 47.72, -10029.99)
			 elseif (MyLevel >= 2100 and MyLevel <= 2124) or SelectMonster == "Peanut President" then
			 Mon = "Peanut President"
			 LevelQuest = 2
			 NameQuest = "NutsIslandQuest"
			 NameMon = "Peanut President"
			 CFrameQuest = CFrame.new(-2104.39, 38.10, -10194.22)
			 CFrameMon = CFrame.new(-1859.35, 38.10, -10422.43)
			 elseif (MyLevel >= 2125 and MyLevel <= 2149) or SelectMonster == "Ice Cream Chef" then
			 Mon = "Ice Cream Chef"
			 LevelQuest = 1
			 NameQuest = "IceCreamIslandQuest"
			 NameMon = "Ice Cream Chef"
			 CFrameQuest = CFrame.new(-820.65, 65.82, -10965.80)
			 CFrameMon = CFrame.new(-872.25, 65.82, -10919.96)
			 elseif (MyLevel >= 2150 and MyLevel <= 2199) or SelectMonster == "Ice Cream Commander" then
			 Mon = "Ice Cream Commander"
			 LevelQuest = 2
			 NameQuest = "IceCreamIslandQuest"
			 NameMon = "Ice Cream Commander"
			 CFrameQuest = CFrame.new(-820.65, 65.82, -10965.80)
			 CFrameMon = CFrame.new(-558.06, 112.05, -11290.77)
			 elseif (MyLevel >= 2200 and MyLevel <= 2224) or SelectMonster == "Cookie Crafter" then
			 Mon = "Cookie Crafter"
			 LevelQuest = 1
			 NameQuest = "CakeQuest1"
			 NameMon = "Cookie Crafter"
			 CFrameQuest = CFrame.new(-2021.32, 37.80, -12028.73)
			 CFrameMon = CFrame.new(-2374.14, 37.80, -12125.31)
			 elseif (MyLevel >= 2225 and MyLevel <= 2249) or SelectMonster == "Cake Guard" then
			 Mon = "Cake Guard"
			 LevelQuest = 2
			 NameQuest = "CakeQuest1"
			 NameMon = "Cake Guard"
			 CFrameQuest = CFrame.new(-2021.32, 37.80, -12028.73)
			 CFrameMon = CFrame.new(-1598.31, 43.77, -12244.58)
			 elseif (MyLevel >= 2250 and MyLevel <= 2274) or SelectMonster == "Baking Staff" then
			 Mon = "Baking Staff"
			 LevelQuest = 1
			 NameQuest = "CakeQuest2"
			 NameMon = "Baking Staff"
			 CFrameQuest = CFrame.new(-1927.92, 37.80, -12842.54)
			 CFrameMon = CFrame.new(-1887.81, 77.62, -12998.35)
			 elseif (MyLevel >= 2275 and MyLevel <= 2299) or SelectMonster == "Head Baker" then
			 Mon = "Head Baker"
			 LevelQuest = 2
			 NameQuest = "CakeQuest2"
			 NameMon = "Head Baker"
			 CFrameQuest = CFrame.new(-1927.92, 37.80, -12842.54)
			 CFrameMon = CFrame.new(-2216.19, 82.88, -12869.29)
			 elseif (MyLevel >= 2300 and MyLevel <= 2324) or SelectMonster == "Cocoa Warrior" then
			 Mon = "Cocoa Warrior"
			 LevelQuest = 1
			 NameQuest = "ChocQuest1"
			 NameMon = "Cocoa Warrior"
			 CFrameQuest = CFrame.new(233.23, 29.88, -12201.23)
			 CFrameMon = CFrame.new(-21.55, 80.57, -12352.39)
			 elseif (MyLevel >= 2325 and MyLevel <= 2349) or SelectMonster == "Chocolate Bar Battler" then
			 Mon = "Chocolate Bar Battler"
			 LevelQuest = 2
			 NameQuest = "ChocQuest1"
			 NameMon = "Chocolate Bar Battler"
			 CFrameQuest = CFrame.new(233.23, 29.88, -12201.23)
			 CFrameMon = CFrame.new(582.59, 77.19, -12463.16)
			 elseif (MyLevel >= 2350 and MyLevel <= 2374) or SelectMonster == "Sweet Thief" then
			 Mon = "Sweet Thief"
			 LevelQuest = 1
			 NameQuest = "ChocQuest2"
			 NameMon = "Sweet Thief"
			 CFrameQuest = CFrame.new(150.51, 30.69, -12774.50)
			 CFrameMon = CFrame.new(165.19, 76.06, -12600.84)
			 elseif (MyLevel >= 2375 and MyLevel <= 2399) or SelectMonster == "Candy Rebel" then
			 Mon = "Candy Rebel"
			 LevelQuest = 2
			 NameQuest = "ChocQuest2"
			 NameMon = "Candy Rebel"
			 CFrameQuest = CFrame.new(150.51, 30.69, -12774.50)
			 CFrameMon = CFrame.new(134.87, 77.25, -12876.55)
			 elseif (MyLevel >= 2400 and MyLevel <= 2424) or SelectMonster == "Candy Pirate" then
			 Mon = "Candy Pirate"
			 LevelQuest = 1
			 NameQuest = "CandyQuest1"
			 NameMon = "Candy Pirate"
			 CFrameQuest = CFrame.new(-1150.04, 20.38, -14446.33)
			 CFrameMon = CFrame.new(-1310.50, 26.02, -14562.40)
			 elseif (MyLevel >= 2425 and MyLevel <= 2449) or SelectMonster == "Snow Demon" then
			 Mon = "Snow Demon"
			 LevelQuest = 2
			 NameQuest = "CandyQuest1"
			 NameMon = "Snow Demon"
			 CFrameQuest = CFrame.new(-1150.04, 20.38, -14446.33)
			 CFrameMon = CFrame.new(-880.20, 71.25, -14538.61)
			 elseif (MyLevel >= 2450 and MyLevel <= 2474) or SelectMonster == "Isle Outlaw" then
			 Mon = "Isle Outlaw"
			 LevelQuest = 1
			 NameQuest = "TikiQuest1"
			 NameMon = "Isle Outlaw"
			 CFrameQuest = CFrame.new(-16547.75, 61.14, -173.41)
			 CFrameMon = CFrame.new(-16442.81, 116.14, -264.46)
			 elseif (MyLevel >= 2475 and MyLevel <= 2524) or SelectMonster == "Island Boy" then
			 Mon = "Island Boy"
			 LevelQuest = 2
			 NameQuest = "TikiQuest1"
			 NameMon = "Island Boy"
			 CFrameQuest = CFrame.new(-16547.75, 61.14, -173.41)
			 CFrameMon = CFrame.new(-16901.26, 84.07, -192.89)
			 elseif (MyLevel >= 2525 and MyLevel <= 2550) or SelectMonster == "Isle Champion" then
			 Mon = "Isle Champion"
			 LevelQuest = 2
			 NameQuest = "TikiQuest2"
			 NameMon = "Isle Champion"
			 CFrameQuest = CFrame.new(-16539.08, 55.69, 1051.57)
			 CFrameMon = CFrame.new(-16641.68, 235.78, 1031.28)
			 elseif (MyLevel >= 2550 and MyLevel <= 2574) or SelectMonster == "Serpent Hunter" then
			 Mon = "Serpent Hunter"
			 LevelQuest = 1
			 NameQuest = "TikiQuest3"
			 NameMon = "Serpent Hunter"
			 CFrameQuest = CFrame.new(-16665.19, 104.60, 1579.69)
			 CFrameMon = CFrame.new(-16521.06, 106.09, 1488.78)
			 elseif (MyLevel >= 2575 and MyLevel <= 2599) or SelectMonster == "Skull Slayer" then
			 Mon = "Skull Slayer"
			 LevelQuest = 2
			 NameQuest = "TikiQuest3"
			 NameMon = "Skull Slayer"
			 CFrameQuest = CFrame.new(-16665.19, 104.60, 1579.69)
			 CFrameMon = CFrame.new(-16855.04, 122.46, 1478.15)
			 elseif (MyLevel >= 2600 and MyLevel <= 2624) or SelectMonster == "Reef Bandit" then		 
			 Mon = "Reef Bandit"
			 LevelQuest = 1
			 NameQuest = "SubmergedQuest1"
			 NameMon = "Reef Bandit"            
			 CFrameQuest = CFrame.new(10780.739, -2088.410, 9260.411)
			 CFrameMon = CFrame.new(10899.859, -2145.235, 9279.294) 
			 elseif (MyLevel >= 2625 and MyLevel <= 2649) or SelectMonster == "Coral Pirate" then			 
			 Mon = "Coral Pirate"
			 LevelQuest = 2
			 NameQuest = "SubmergedQuest1"
			 NameMon = "Coral Pirate"            
			 CFrameQuest = CFrame.new(10780.739, -2088.410, 9260.411)	
			 CFrameMon = CFrame.new(10824.544, -2087.295, 9357.231)
    	     elseif (MyLevel >= 2650 and MyLevel <= 2674) or SelectMonster == "Sea Chanter" then
			 Mon = "Sea Chanter"
			 LevelQuest = 1
			 NameQuest = "SubmergedQuest2"
			 NameMon = "Sea Chanter"            
			 CFrameQuest = CFrame.new(10883.599, -2086.885, 10034.020)
			 CFrameMon = CFrame.new(10786.387, -2087.373, 10105.262)
			 elseif (MyLevel >= 2675 and MyLevel <= 2699) or SelectMonster == "Ocean Prophet" then
			 Mon = "Ocean Prophet"
			 LevelQuest = 2
			 NameQuest = "SubmergedQuest2"
			 NameMon = "Ocean Prophet"            
			 CFrameQuest = CFrame.new(10883.599, -2086.885, 10034.020)
			 CFrameMon = CFrame.new(11003.326, -2007.026, 10225.063)
             elseif (MyLevel >= 2700 and MyLevel <= 2724) or SelectMonster == "High Disciple" then
             Mon = "High Disciple"			 
			 LevelQuest = 1             
			 NameQuest = "SubmergedQuest3"			 
			 NameMon = "High Disciple"            
			 CFrameQuest = CFrame.new(9637.29395, -1993.13159, 9616.30176)	 
			 CFrameMon = CFrame.new(9835.43555, -1995.08801, 9533.9375)
		     elseif (MyLevel >= 2725) or SelectMonster == "Grand Devotee" then
			 Mon = "Grand Devotee"
			 LevelQuest = 2
			 NameQuest = "SubmergedQuest3"
			 NameMon = "Grand Devotee"            
			 CFrameQuest = CFrame.new(9637.29395, -1993.13159, 9616.30176)
			 CFrameMon = CFrame.new(9559.19434, -1994.39734, 9798.66504)
			 end
			 end
			 end
			
function getConfigMaterial(Material)
    if Material == "Radioactive" and World2 then
        MaterialMon = {"Factory Staff"}
        MaterialQuest = "Area2Quest"
        MaterialLevelQuest = 2
        MaterialLevelMon = 800
        MaterialQuestPos = CFrame.new(632.70, 73.11, 918.67)
        MaterialPos = CFrame.new(-507.7895202636719, 72.99479675292969, -126.45632934570312)
    elseif Material == "Mystic Droplet" and World2 then
        MaterialMon = {"Water Fighter"}
        MaterialQuest = "ForgottenQuest"
        MaterialLevelQuest = 2
        MaterialLevelMon = 1450
        MaterialQuestPos = CFrame.new(-3054.44, 235.54, -10142.82)
        MaterialPos = CFrame.new(-3352.9013671875, 285.01556396484375, -10534.841796875)
    elseif Material == "Magma Ore" and World1 then
        MaterialMon = {"Military Spy"}
        MaterialQuest = "MagmaQuest"
        MaterialLevelQuest = 2
        MaterialLevelMon = 325
        MaterialQuestPos = CFrame.new(-5313.37, 10.95, 8515.29)
        MaterialPos = CFrame.new(-5850.2802734375, 77.28675079345703, 8848.6748046875)
    elseif Material == "Magma Ore" and World2 then
        MaterialMon = {"Lava Pirate"}
        MaterialQuest = "FireSideQuest"
        MaterialLevelQuest = 2
        MaterialLevelMon = 1200
        MaterialQuestPos = CFrame.new(-5428.03, 15.06, -5299.43)
        MaterialPos = CFrame.new(-5234.60595703125, 51.953372955322266, -4732.27880859375)
    elseif Material == "Angel Wings" and World1 then
        MaterialMon = {"Royal Soldier"}
        MaterialQuest = "SkyExp2Quest"
        MaterialLevelQuest = 2
        MaterialLevelMon = 550
        MaterialQuestPos = CFrame.new(-7906.82, 5634.66, -1411.99)
        MaterialPos = CFrame.new(-7827.15625, 5606.912109375, -1705.5833740234375)
    elseif Material == "Scrap Metal and Leather" and World1 then
        MaterialMon = {"Brute", "Pirate"}
        MaterialQuest = "BuggyQuest1"
        MaterialLevelQuest = 2
        MaterialLevelMon = 40
        MaterialQuestPos = CFrame.new(-1141.07, 4.10, 3831.55)
        MaterialPos = {
            CFrame.new(-1132.4202880859375, 14.844913482666016, 4293.30517578125),
            CFrame.new(-1211.8792724609375, 4.787090301513672, 3916.83056640625)
        }
    elseif Material == "Leather" and World2 then
        MaterialMon = {"Marine Captain"}
        MaterialQuest = "MarineQuest3"
        MaterialLevelQuest = 2
        MaterialLevelMon = 900
        MaterialQuestPos = CFrame.new(-2440.80, 71.71, -3216.07)
        MaterialPos = CFrame.new(-2010.5059814453125, 73.00115966796875, -3326.620849609375)
    elseif Material == "Leather" and World3 then
        MaterialMon = {"Jungle Pirate"}
        MaterialQuest = "DeepForestIsland2"
        MaterialLevelQuest = 1
        MaterialLevelMon = 1900
        MaterialQuestPos = CFrame.new(-12680.38, 389.97, -9902.02)
        MaterialPos = CFrame.new(-11975.78515625, 331.7734069824219, -10620.0302734375)
    elseif Material == "Ectoplasm" and World2 then
        MaterialMon = {"Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer"}
        MaterialQuest = "ShipQuest1"
        MaterialLevelQuest = 1
        MaterialLevelMon = 1250
        MaterialQuestPos = CFrame.new(1037.80, 125.09, 32911.60)
        MaterialPos = CFrame.new(911.35827636719, 125.95812988281, 33159.5390625)
    elseif Material == "Scrap Metal" and World2 then
        MaterialMon = {"Mercenary"}
        MaterialQuest = "Area1Quest"
        MaterialLevelQuest = 2
        MaterialLevelMon = 725
        MaterialQuestPos = CFrame.new(-429.54, 71.77, 1836.18)
        MaterialPos = CFrame.new(-972.307373046875, 73.04473876953125, 1419.2901611328125)
    elseif Material == "Scrap Metal" and World3 then
        MaterialMon = {"Pirate Millionaire"}
        MaterialQuest = "PiratePortQuest"
        MaterialLevelQuest = 1
        MaterialLevelMon = 1500
        MaterialQuestPos = CFrame.new(-450.10, 107.68, 5950.73)
        MaterialPos = CFrame.new(-289.6311950683594, 43.8282470703125, 5583.66357421875)
    elseif Material == "Conjured Cocoa" and World3 then
        MaterialMon = {"Chocolate Bar Battler"}
        MaterialQuest = "ChocQuest1"
        MaterialLevelQuest = 2
        MaterialLevelMon = 2325
        MaterialQuestPos = CFrame.new(233.23, 29.88, -12201.23)
        MaterialPos = CFrame.new(744.7930908203125, 24.76934242248535, -12637.7255859375)
    elseif Material == "Dragon Scale" and World3 then
        MaterialMon = {"Dragon Crew Warrior"}
        MaterialQuest = "DragonCrewQuest"
        MaterialLevelQuest = 1
        MaterialLevelMon = 1575
        MaterialQuestPos = CFrame.new(6750.49, 127.45, -711.03)
        MaterialPos = CFrame.new(5824.06982421875, 51.38640213012695, -1106.694580078125)
    elseif Material == "Gunpowder" and World3 then
        MaterialMon = {"Pistol Billionaire"}
        MaterialQuest = "PiratePortQuest"
        MaterialLevelQuest = 2
        MaterialLevelMon = 1525
        MaterialQuestPos = CFrame.new(-450.10, 107.68, 5950.73)
        MaterialPos = CFrame.new(-379.6134338378906, 73.84449768066406, 5928.5263671875)
    elseif Material == "Fish Tail" and World1 then
        MaterialMon = {"Fishman Warrior", "Fishman Commando"}
        MaterialQuest = "FishmanQuest"
        MaterialLevelQuest = 2
        MaterialLevelMon = 400
        MaterialQuestPos = CFrame.new(61122.65, 18.50, 1569.40)
        MaterialPos = {
            CFrame.new(60878.30, 18.48, 1543.76),
            CFrame.new(61922.63, 18.48, 1493.93)
        }
    elseif Material == "Fish Tail" and World3 then
        MaterialMon = {"Fishman Captain"}
        MaterialQuest = "DeepForestIsland3"
        MaterialLevelQuest = 2
        MaterialLevelMon = 1800
        MaterialQuestPos = CFrame.new(-10581.66, 330.87, -8761.19)
        MaterialPos = CFrame.new(-10961.0126953125, 331.7977600097656, -8914.29296875)
    elseif Material == "Mini Tusk" and World3 then
        MaterialMon = {"Mythological Pirate"}
        MaterialQuest = "DeepForestIsland"
        MaterialLevelQuest = 2
        MaterialLevelMon = 1850
        MaterialQuestPos = CFrame.new(-13234.04, 331.49, -7625.40)
        MaterialPos = CFrame.new(-13516.0458984375, 469.8182373046875, -6899.16064453125)
    end
end

function CheckBoss(Lovuongnhe)
    if World1 then
        if Lovuongnhe == "The Gorilla King" then
            MonBoss = "The Gorilla King"
            NameQuestBoss = "JungleQuest"
            QuestData = 3
            LevelBoss = 25
            PosQuest = CFrame.new(-1601.6553955078, 36.85213470459, 153.38809204102)
            PosBoss = CFrame.new(-1088.75977, 8.13463783, -488.559906)
        elseif Lovuongnhe == "Bobby" then
            MonBoss = "Bobby"
            NameQuestBoss = "BuggyQuest1"
            QuestData = 3
            LevelBoss = 55
            PosQuest = CFrame.new(-1140.1761474609, 4.752049446106, 3827.4057617188)
            PosBoss = CFrame.new(-1087.3760986328, 46.949409484863, 4040.1462402344)
        elseif Lovuongnhe == "The Saw" then
            MonBoss = "The Saw"
            NameQuestBoss = nil
            QuestData = nil
            LevelBoss = 100
            PosQuest = nil
            PosBoss = CFrame.new(-784.89715576172, 72.427383422852, 1603.5822753906)
        elseif Lovuongnhe == "Yeti" then
            MonBoss = "Yeti"
            NameQuestBoss = "SnowQuest"
            QuestData = 3
            LevelBoss = 110
            PosQuest = CFrame.new(1386.8073730469, 87.272789001465, -1298.3576660156)
            PosBoss = CFrame.new(1218.7956542969, 138.01184082031, -1488.0262451172)
        elseif Lovuongnhe == "Mob Leader" then
            MonBoss = "Mob Leader"
            NameQuestBoss = nil
            QuestData = nil
            LevelBoss = 120
            PosQuest = nil
            PosBoss = CFrame.new(-2844.7307128906, 7.4180502891541, 5356.6723632813)
        elseif Lovuongnhe == "Vice Admiral" then
            MonBoss = "Vice Admiral"
            NameQuestBoss = "MarineQuest2"
            QuestData = 2
            LevelBoss = 130
            PosQuest = CFrame.new(-5036.2465820313, 28.677835464478, 4324.56640625)
            PosBoss = CFrame.new(-5006.5454101563, 88.032081604004, 4353.162109375)
        elseif Lovuongnhe == "Saber Expert" then
            MonBoss = "Saber Expert"
            NameQuestBoss = nil
            QuestData = nil
            LevelBoss = 200
            PosQuest = nil
            PosBoss = CFrame.new(-1458.89502, 29.8870335, -50.633564)
        elseif Lovuongnhe == "Warden" then
            MonBoss = "Warden"
            NameQuestBoss = "ImpelQuest"
            QuestData = 1
            LevelBoss = 220
            PosQuest = CFrame.new(5191.86133, 2.84020686, 686.438721)
            PosBoss = CFrame.new(5278.04932, 2.15167475, 944.101929)
        elseif Lovuongnhe == "Chief Warden" then
            MonBoss = "Chief Warden"
            NameQuestBoss = "ImpelQuest"
            QuestData = 2
            LevelBoss = 230
            PosQuest = CFrame.new(5191.86133, 2.84020686, 686.438721)
            PosBoss = CFrame.new(5206.92578, 0.997753382, 814.976746)
        elseif Lovuongnhe == "Swan" then
            MonBoss = "Swan"
            NameQuestBoss = "ImpelQuest"
            QuestData = 3
            LevelBoss = 240
            PosQuest = CFrame.new(5191.86133, 2.84020686, 686.438721)
            PosBoss = CFrame.new(5325.09619, 7.03906584, 719.570679)
        elseif Lovuongnhe == "Magma Admiral" then
            MonBoss = "Magma Admiral"
            NameQuestBoss = "MagmaQuest"
            QuestData = 3
            LevelBoss = 350
            PosQuest = CFrame.new(-5314.6220703125, 12.262420654297, 8517.279296875)
            PosBoss = CFrame.new(-5765.8969726563, 82.92064666748, 8718.3046875)
        elseif Lovuongnhe == "Fishman Lord" then
            MonBoss = "Fishman Lord"
            NameQuestBoss = "FishmanQuest"
            QuestData = 3
            LevelBoss = 425
            PosQuest = CFrame.new(61122.65234375, 18.497442245483, 1569.3997802734)
            PosBoss = CFrame.new(61260.15234375, 30.950881958008, 1193.4329833984)
        elseif Lovuongnhe == "Wysper" then
            MonBoss = "Wysper"
            NameQuestBoss = "SkyExp1Quest"
            QuestData = 3
            LevelBoss = 500
            PosQuest = CFrame.new(-7861.947265625, 5545.517578125, -379.85974121094)
            PosBoss = CFrame.new(-7866.1333007813, 5576.4311523438, -546.74816894531)
        elseif Lovuongnhe == "Thunder God" then
            MonBoss = "Thunder God"
            NameQuestBoss = "SkyExp2Quest"
            QuestData = 3
            LevelBoss = 575
            PosQuest = CFrame.new(-7903.3828125, 5635.9897460938, -1410.923828125)
            PosBoss = CFrame.new(-7994.984375, 5761.025390625, -2088.6479492188)
        elseif Lovuongnhe == "Cyborg" then
            MonBoss = "Cyborg"
            NameQuestBoss = "FountainQuest"
            QuestData = 3
            LevelBoss = 675
            PosQuest = CFrame.new(5258.2788085938, 38.526931762695, 4050.044921875)
            PosBoss = CFrame.new(6094.0249023438, 73.770050048828, 3825.7348632813)
        elseif Lovuongnhe == "Ice Admiral" then
            MonBoss = "Ice Admiral"
            NameQuestBoss = nil
            QuestData = nil
            LevelBoss = 700
            PosQuest = nil
            PosBoss = CFrame.new(1266.08948, 26.1757946, -1399.57678)
        elseif Lovuongnhe == "Greybeard" then
            MonBoss = "Greybeard"
            NameQuestBoss = nil
            QuestData = nil
            LevelBoss = 750
            PosQuest = nil
            PosBoss = CFrame.new(-5081.3452148438, 85.221641540527, 4257.3588867188)
        end
    elseif World2 then
        if Lovuongnhe == "Diamond" then
            MonBoss = "Diamond"
            NameQuestBoss = "Area1Quest"
            QuestData = 3
            LevelBoss = 750
            PosQuest = CFrame.new(-427.5666809082, 73.313781738281, 1835.4208984375)
            PosBoss = CFrame.new(-1576.7166748047, 198.59265136719, 13.724286079407)
        elseif Lovuongnhe == "Jeremy" then
            MonBoss = "Jeremy"
            NameQuestBoss = "Area2Quest"
            QuestData = 3
            LevelBoss = 850
            PosQuest = CFrame.new(636.79943847656, 73.413787841797, 918.00415039063)
            PosBoss = CFrame.new(2006.9261474609, 448.95666503906, 853.98284912109)
        elseif Lovuongnhe == "Order" then
            MonBoss = "Order"
            NameQuestBoss = "MarineQuest3"
            QuestData = 3
            LevelBoss = 925
            PosQuest = CFrame.new(-2441.986328125, 73.359344482422, -3217.5324707031)
            PosBoss = CFrame.new(-2172.7399902344, 103.32216644287, -4015.025390625)
        elseif Lovuongnhe == "Don Swan" then
            MonBoss = "Don Swan"
            NameQuestBoss = nil
            QuestData = nil
            LevelBoss = 1000
            PosQuest = nil
            PosBoss = CFrame.new(2286.2004394531, 15.177839279175, 863.8388671875)
        elseif Lovuongnhe == "Smoke Admiral" then
            MonBoss = "Smoke Admiral"
            NameQuestBoss = "IceSideQuest"
            QuestData = 3
            LevelBoss = 1150
            PosQuest = CFrame.new(-5429.0473632813, 15.977565765381, -5297.9614257813)
            PosBoss = CFrame.new(-5275.1987304688, 20.757257461548, -5260.6669921875)
        elseif Lovuongnhe == "Awakened Ice Admiral" then
            MonBoss = "Awakened Ice Admiral"
            NameQuestBoss = "FrostQuest"
            QuestData = 3
            LevelBoss = 1400
            PosQuest = CFrame.new(5668.9780273438, 28.519989013672, -6483.3520507813)
            PosBoss = CFrame.new(6403.5439453125, 340.29766845703, -6894.5595703125)
        elseif Lovuongnhe == "Tide Keeper" then
            MonBoss = "Tide Keeper"
            NameQuestBoss = "ForgottenQuest"
            QuestData = 3
            LevelBoss = 1475
            PosQuest = CFrame.new(-3053.9814453125, 237.18954467773, -10145.0390625)
            PosBoss = CFrame.new(-3795.6423339844, 105.88877105713, -11421.307617188)
        elseif Lovuongnhe == "Darkbeard" then
            MonBoss = "Darkbeard"
            NameQuestBoss = nil
            QuestData = nil
            LevelBoss = 1000
            PosQuest = nil
            PosBoss = CFrame.new(3677.08203125, 62.751937866211, -3144.8332519531)
        elseif Lovuongnhe == "Cursed Captain" then
            MonBoss = "Cursed Captain"
            NameQuestBoss = nil
            QuestData = nil
            LevelBoss = 1325
            PosQuest = nil
            PosBoss = CFrame.new(916.928589, 181.092773, 33422)
        elseif Lovuongnhe == "Order" then
            MonBoss = "Order"
            NameQuestBoss = nil
            QuestData = nil
            LevelBoss = 1250
            PosQuest = nil
            PosBoss = CFrame.new(-6217.2021484375, 28.047645568848, -5053.1357421875)
        end
    elseif World3 then
        if Lovuongnhe == "Stone" then
            MonBoss = "Stone"
            NameQuestBoss = "PiratePortQuest"
            QuestData = 3
            LevelBoss = 1550
            PosQuest = CFrame.new(-289.76705932617, 43.819011688232, 5579.9384765625)
            PosBoss = CFrame.new(-1027.6512451172, 92.404174804688, 6578.8530273438)
        elseif Lovuongnhe == "Hydra Leader" then
            MonBoss = "Hydra Leader"
            NameQuestBoss = "VenomCrewQuest"
            QuestData = 3
            LevelBoss = 1675
            PosQuest = CFrame.new(5211.021484375, 1004.35778859375, 758.1847534179688)
            PosBoss = CFrame.new(5821.89794921875, 1019.0950927734375, -73.71923065185547)
        elseif Lovuongnhe == "Kilo Admiral" then
            MonBoss = "Kilo Admiral"
            NameQuestBoss = "MarineTreeIsland"
            QuestData = 3
            LevelBoss = 1750
            PosQuest = CFrame.new(2179.3010253906, 28.731239318848, -6739.9741210938)
            PosBoss = CFrame.new(2764.2233886719, 432.46154785156, -7144.4580078125)
        elseif Lovuongnhe == "Captain Elephant" then
            MonBoss = "Captain Elephant"
            NameQuestBoss = "DeepForestIsland"
            QuestData = 3
            LevelBoss = 1875
            PosQuest = CFrame.new(-13232.682617188, 332.40396118164, -7626.01171875)
            PosBoss = CFrame.new(-13376.7578125, 433.28689575195, -8071.392578125)
        elseif Lovuongnhe == "Beautiful Pirate" then
            MonBoss = "Beautiful Pirate"
            NameQuestBoss = "DeepForestIsland2"
            QuestData = 3
            LevelBoss = 1950
            PosQuest = CFrame.new(-12682.096679688, 390.88653564453, -9902.1240234375)
            PosBoss = CFrame.new(5283.609375, 22.56223487854, -110.78285217285)
        elseif Lovuongnhe == "Cake Queen" then
            MonBoss = "Cake Queen"
            NameQuestBoss = "IceCreamIslandQuest"
            QuestData = 3
            LevelBoss = 2175
            PosQuest = CFrame.new(-819.376709, 64.9259796, -10967.2832)
            PosBoss = CFrame.new(-678.648804, 381.353943, -11114.2012)
        elseif Lovuongnhe == "Longma" then
            MonBoss = "Longma"
            NameQuestBoss = nil
            QuestData = nil
            LevelBoss = 2000
            PosQuest = nil
            PosBoss = CFrame.new(-10238.875976563, 389.7912902832, -9549.7939453125)
        elseif Lovuongnhe == "Soul Reaper" then
            MonBoss = "Soul Reaper"
            NameQuestBoss = nil
            QuestData = nil
            LevelBoss = 2100
            PosQuest = nil
            PosBoss = CFrame.new(-9524.7890625, 315.80429077148, 6655.7192382813)
        end
    end
end


function CheckQuestMon(SelectMonster)
    local team = tostring(game.Players.LocalPlayer.Team)
    
    if World1 then
        if SelectMonster == "Bandit" or SelectMonster == "Trainee" then
            if team == "Marines" then
                Mon = "Trainee"
                LevelQuest = 1
                LevelMon = 1
                NameQuest = "MarineQuest"
                NameMon = "Trainee"
                CFrameQuest = CFrame.new(-2699.69, 19.35, 2083.19)
                CFrameMon = CFrame.new(-2709.67, 24.52, 2104.24)
            elseif team == "Pirates" then
                Mon = "Bandit"
                LevelQuest = 1
                LevelMon = 1
                NameQuest = "BanditQuest1"
                NameMon = "Bandit"
                CFrameQuest = CFrame.new(1059.37, 15.45, 1550.42)
                CFrameMon = CFrame.new(1045.96, 27.00, 1560.82)
            end
        elseif SelectMonster == "Monkey" then
            Mon = "Monkey"
            LevelQuest = 1
            LevelMon = 10
            NameQuest = "JungleQuest"
            NameMon = "Monkey"
            CFrameQuest = CFrame.new(-1598.09, 35.55, 153.38)
            CFrameMon = CFrame.new(-1448.52, 67.85, 11.47)
        elseif SelectMonster == "Gorilla" then
            Mon = "Gorilla"
            LevelQuest = 2
            LevelMon = 15
            NameQuest = "JungleQuest"
            NameMon = "Gorilla"
            CFrameQuest = CFrame.new(-1598.09, 35.55, 153.38)
            CFrameMon = CFrame.new(-1249.19, 8.23, -456.19)
        elseif SelectMonster == "Pirate" then
            Mon = "Pirate"
            LevelQuest = 1
            LevelMon = 30
            NameQuest = "BuggyQuest1"
            NameMon = "Pirate"
            CFrameQuest = CFrame.new(-1141.07, 4.10, 3831.55)
            CFrameMon = CFrame.new(-1103.51, 13.75, 3896.09)
        elseif SelectMonster == "Brute" then
            Mon = "Brute"
            LevelQuest = 2
            LevelMon = 40
            NameQuest = "BuggyQuest1"
            NameMon = "Brute"
            CFrameQuest = CFrame.new(-1141.07, 4.10, 3831.55)
            CFrameMon = CFrame.new(-1145.06, 15.98, 4280.31)
        elseif SelectMonster == "Desert Bandit" then
            Mon = "Desert Bandit"
            LevelQuest = 1
            LevelMon = 60
            NameQuest = "DesertQuest"
            NameMon = "Desert Bandit"
            CFrameQuest = CFrame.new(894.49, 5.14, 4392.43)
            CFrameMon = CFrame.new(924.80, 6.45, 4481.59)
        elseif SelectMonster == "Desert Officer" then
            Mon = "Desert Officer"
            LevelQuest = 2
            LevelMon = 75
            NameQuest = "DesertQuest"
            NameMon = "Desert Officer"
            CFrameQuest = CFrame.new(894.49, 5.14, 4392.43)
            CFrameMon = CFrame.new(1608.28, 8.61, 4371.01)
        elseif SelectMonster == "Snow Bandit" then
            Mon = "Snow Bandit"
            LevelQuest = 1
            LevelMon = 90
            NameQuest = "SnowQuest"
            NameMon = "Snow Bandit"
            CFrameQuest = CFrame.new(1389.74, 88.15, -1298.91)
            CFrameMon = CFrame.new(1354.35, 87.27, -1393.95)
        elseif SelectMonster == "Snowman" then
            Mon = "Snowman"
            LevelQuest = 2
            LevelMon = 100
            NameQuest = "SnowQuest"
            NameMon = "Snowman"
            CFrameQuest = CFrame.new(1389.74, 88.15, -1298.91)
            CFrameMon = CFrame.new(1201.64, 144.58, -1550.07)
        elseif SelectMonster == "Chief Petty Officer" then
            Mon = "Chief Petty Officer"
            LevelQuest = 1
            LevelMon = 120
            NameQuest = "MarineQuest2"
            NameMon = "Chief Petty Officer"
            CFrameQuest = CFrame.new(-5039.59, 27.35, 4324.68)
            CFrameMon = CFrame.new(-4881.23, 22.65, 4273.75)
        elseif SelectMonster == "Sky Bandit" then
            Mon = "Sky Bandit"
            LevelQuest = 1
            LevelMon = 150
            NameQuest = "SkyQuest"
            NameMon = "Sky Bandit"
            CFrameQuest = CFrame.new(-4839.53, 716.37, -2619.44)
            CFrameMon = CFrame.new(-4953.21, 295.74, -2899.23)
        elseif SelectMonster == "Dark Master" then
            Mon = "Dark Master"
            LevelQuest = 2
            LevelMon = 175
            NameQuest = "SkyQuest"
            NameMon = "Dark Master"
            CFrameQuest = CFrame.new(-4839.53, 716.37, -2619.44)
            CFrameMon = CFrame.new(-5259.84, 391.40, -2229.04)
        elseif SelectMonster == "Toga Warrior" then
            Mon = "Toga Warrior"
            LevelQuest = 1
            LevelMon = 250
            NameQuest = "ColosseumQuest"
            NameMon = "Toga Warrior"
            CFrameQuest = CFrame.new(-1580.05, 6.35, -2986.48)
            CFrameMon = CFrame.new(-1820.21, 51.68, -2740.67)
        elseif SelectMonster == "Gladiator" then
            Mon = "Gladiator"
            LevelQuest = 2
            LevelMon = 275
            NameQuest = "ColosseumQuest"
            NameMon = "Gladiator"
            CFrameQuest = CFrame.new(-1580.05, 6.35, -2986.48)
            CFrameMon = CFrame.new(-1292.84, 56.38, -3339.03)
        elseif SelectMonster == "Military Soldier" then
            Mon = "Military Soldier"
            LevelQuest = 1
            LevelMon = 300
            NameQuest = "MagmaQuest"
            NameMon = "Military Soldier"
            CFrameQuest = CFrame.new(-5313.37, 10.95, 8515.29)
            CFrameMon = CFrame.new(-5411.16, 11.08, 8454.29)
        elseif SelectMonster == "Military Spy" then
            Mon = "Military Spy"
            LevelQuest = 2
            LevelMon = 325
            NameQuest = "MagmaQuest"
            NameMon = "Military Spy"
            CFrameQuest = CFrame.new(-5313.37, 10.95, 8515.29)
            CFrameMon = CFrame.new(-5802.87, 86.26, 8828.86)
        elseif SelectMonster == "Fishman Warrior" then
            Mon = "Fishman Warrior"
            LevelQuest = 1
            LevelMon = 375
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Warrior"
            CFrameQuest = CFrame.new(61122.65, 18.50, 1569.40)
            CFrameMon = CFrame.new(60878.30, 18.48, 1543.76)
        elseif SelectMonster == "Fishman Commando" then
            Mon = "Fishman Commando"
            LevelQuest = 2
            LevelMon = 400
            NameQuest = "FishmanQuest"
            NameMon = "Fishman Commando"
            CFrameQuest = CFrame.new(61122.65, 18.50, 1569.40)
            CFrameMon = CFrame.new(61922.63, 18.48, 1493.93)
        elseif SelectMonster == "God's Guard" then
            Mon = "God's Guard"
            LevelQuest = 1
            LevelMon = 450
            NameQuest = "SkyExp1Quest"
            NameMon = "God's Guard"
            CFrameQuest = CFrame.new(-4721.89, 843.87, -1949.97)
            CFrameMon = CFrame.new(-4710.04, 845.28, -1927.31)
        elseif SelectMonster == "Shanda" then
            Mon = "Shanda"
            LevelQuest = 2
            LevelMon = 475
            NameQuest = "SkyExp1Quest"
            NameMon = "Shanda"
            CFrameQuest = CFrame.new(-7859.10, 5544.19, -381.48)
            CFrameMon = CFrame.new(-7678.49, 5566.40, -497.22)
        elseif SelectMonster == "Royal Squad" then
            Mon = "Royal Squad"
            LevelQuest = 1
            LevelMon = 525
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Squad"
            CFrameQuest = CFrame.new(-7906.82, 5634.66, -1411.99)
            CFrameMon = CFrame.new(-7624.25, 5658.13, -1467.35)
        elseif SelectMonster == "Royal Soldier" then
            Mon = "Royal Soldier"
            LevelQuest = 2
            LevelMon = 550
            NameQuest = "SkyExp2Quest"
            NameMon = "Royal Soldier"
            CFrameQuest = CFrame.new(-7906.82, 5634.66, -1411.99)
            CFrameMon = CFrame.new(-7836.75, 5645.66, -1790.62)
        elseif SelectMonster == "Galley Pirate" then
            Mon = "Galley Pirate"
            LevelQuest = 1
            LevelMon = 625
            NameQuest = "FountainQuest"
            NameMon = "Galley Pirate"
            CFrameQuest = CFrame.new(5259.82, 37.35, 4050.03)
            CFrameMon = CFrame.new(5551.02, 78.90, 3930.41)
        elseif SelectMonster == "Galley Captain" then
            Mon = "Galley Captain"
            LevelQuest = 2
            LevelMon = 650
            NameQuest = "FountainQuest"
            NameMon = "Galley Captain"
            CFrameQuest = CFrame.new(5259.82, 37.35, 4050.03)
            CFrameMon = CFrame.new(5441.95, 42.50, 4950.09)
        end
    elseif World2 then
        if SelectMonster == "Raider" then
            Mon = "Raider"
            LevelQuest = 1
            LevelMon = 700
            NameQuest = "Area1Quest"
            NameMon = "Raider"
            CFrameQuest = CFrame.new(-429.54, 71.77, 1836.18)
            CFrameMon = CFrame.new(-728.33, 52.78, 2345.77)
        elseif SelectMonster == "Mercenary" then
            Mon = "Mercenary"
            LevelQuest = 2
            LevelMon = 725
            NameQuest = "Area1Quest"
            NameMon = "Mercenary"
            CFrameQuest = CFrame.new(-429.54, 71.77, 1836.18)
            CFrameMon = CFrame.new(-1004.32, 80.16, 1424.62)
        elseif SelectMonster == "Swan Pirate" then
            Mon = "Swan Pirate"
            LevelQuest = 1
            LevelMon = 775
            NameQuest = "Area2Quest"
            NameMon = "Swan Pirate"
            CFrameQuest = CFrame.new(638.44, 71.77, 918.28)
            CFrameMon = CFrame.new(1068.66, 137.61, 1322.11)
        elseif SelectMonster == "Factory Staff" then
            Mon = "Factory Staff"
            LevelQuest = 2
            LevelMon = 800
            NameQuest = "Area2Quest"
            NameMon = "Factory Staff"
            CFrameQuest = CFrame.new(632.70, 73.11, 918.67)
            CFrameMon = CFrame.new(73.08, 81.86, -27.47)
        elseif SelectMonster == "Marine Lieutenant" then
            Mon = "Marine Lieutenant"
            LevelQuest = 1
            LevelMon = 875
            NameQuest = "MarineQuest3"
            NameMon = "Marine Lieutenant"
            CFrameQuest = CFrame.new(-2440.80, 71.71, -3216.07)
           CFrameMon = CFrame.new(-2821.37, 75.90, -3070.09)
        elseif SelectMonster == "Marine Captain" then
            Mon = "Marine Captain"
            LevelQuest = 2
            LevelMon = 900
            NameQuest = "MarineQuest3"
            NameMon = "Marine Captain"
            CFrameQuest = CFrame.new(-2440.80, 71.71, -3216.07)
            CFrameMon = CFrame.new(-1861.23, 80.18, -3254.70)
        elseif SelectMonster == "Zombie" then
            Mon = "Zombie"
            LevelQuest = 1
            LevelMon = 950
            NameQuest = "ZombieQuest"
            NameMon = "Zombie"
            CFrameQuest = CFrame.new(-5497.06, 47.59, -795.24)
            CFrameMon = CFrame.new(-5657.78, 78.97, -928.69)
        elseif SelectMonster == "Vampire" then
            Mon = "Vampire"
            LevelQuest = 2
            LevelMon = 975
            NameQuest = "ZombieQuest"
            NameMon = "Vampire"
            CFrameQuest = CFrame.new(-5497.06, 47.59, -795.24)
            CFrameMon = CFrame.new(-6037.67, 32.18, -1340.66)
        elseif SelectMonster == "Snow Trooper" then
            Mon = "Snow Trooper"
            LevelQuest = 1
            LevelMon = 1000
            NameQuest = "SnowMountainQuest"
            NameMon = "Snow Trooper"
            CFrameQuest = CFrame.new(609.86, 400.12, -5372.26)
            CFrameMon = CFrame.new(549.15, 427.39, -5563.70)
        elseif SelectMonster == "Winter Warrior" then
            Mon = "Winter Warrior"
            LevelQuest = 2
            LevelMon = 1050
            NameQuest = "SnowMountainQuest"
            NameMon = "Winter Warrior"
            CFrameQuest = CFrame.new(609.86, 400.12, -5372.26)
            CFrameMon = CFrame.new(1142.75, 475.64, -5199.42)
        elseif SelectMonster == "Lab Subordinate" then
            Mon = "Lab Subordinate"
            LevelQuest = 1
            LevelMon = 1100
            NameQuest = "IceSideQuest"
            NameMon = "Lab Subordinate"
            CFrameQuest = CFrame.new(-6064.07, 15.24, -4902.98)
            CFrameMon = CFrame.new(-5707.47, 15.95, -4513.39)
        elseif SelectMonster == "Horned Warrior" then
            Mon = "Horned Warrior"
            LevelQuest = 2
            LevelMon = 1125
            NameQuest = "IceSideQuest"
            NameMon = "Horned Warrior"
            CFrameQuest = CFrame.new(-6064.07, 15.24, -4902.98)
            CFrameMon = CFrame.new(-6341.37, 15.95, -5723.16)
        elseif SelectMonster == "Magma Ninja" then
            Mon = "Magma Ninja"
            LevelQuest = 1
            LevelMon = 1175
            NameQuest = "FireSideQuest"
            NameMon = "Magma Ninja"
            CFrameQuest = CFrame.new(-5428.03, 15.06, -5299.43)
            CFrameMon = CFrame.new(-5449.67, 76.66, -5808.20)
        elseif SelectMonster == "Lava Pirate" then
            Mon = "Lava Pirate"
            LevelQuest = 2
            LevelMon = 1200
            NameQuest = "FireSideQuest"
            NameMon = "Lava Pirate"
            CFrameQuest = CFrame.new(-5428.03, 15.06, -5299.43)
            CFrameMon = CFrame.new(-5213.33, 49.74, -4701.45)
        elseif SelectMonster == "Ship Deckhand" then
            Mon = "Ship Deckhand"
            LevelQuest = 1
            LevelMon = 1250
            NameQuest = "ShipQuest1"
            NameMon = "Ship Deckhand"
            CFrameQuest = CFrame.new(1037.80, 125.09, 32911.60)
            CFrameMon = CFrame.new(1212.01, 150.79, 33059.25)
        elseif SelectMonster == "Ship Engineer" then
            Mon = "Ship Engineer"
            LevelQuest = 2
            LevelMon = 1275
            NameQuest = "ShipQuest1"
            NameMon = "Ship Engineer"
            CFrameQuest = CFrame.new(1037.80, 125.09, 32911.60)
            CFrameMon = CFrame.new(919.48, 43.54, 32779.97)
        elseif SelectMonster == "Ship Steward" then
            Mon = "Ship Steward"
            LevelQuest = 1
            LevelMon = 1300
            NameQuest = "ShipQuest2"
            NameMon = "Ship Steward"
            CFrameQuest = CFrame.new(968.81, 125.09, 33244.13)
            CFrameMon = CFrame.new(919.44, 129.56, 33436.04)
        elseif SelectMonster == "Ship Officer" then
            Mon = "Ship Officer"
            LevelQuest = 2
            LevelMon = 1325
            NameQuest = "ShipQuest2"
            NameMon = "Ship Officer"
            CFrameQuest = CFrame.new(968.81, 125.09, 33244.13)
            CFrameMon = CFrame.new(1036.02, 181.44, 33315.73)
        elseif SelectMonster == "Arctic Warrior" then
            Mon = "Arctic Warrior"
            LevelQuest = 1
            LevelMon = 1350
            NameQuest = "FrostQuest"
            NameMon = "Arctic Warrior"
            CFrameQuest = CFrame.new(5667.66, 26.80, -6486.09)
            CFrameMon = CFrame.new(5966.25, 62.97, -6179.38)
        elseif SelectMonster == "Snow Lurker" then
            Mon = "Snow Lurker"
            LevelQuest = 2
            LevelMon = 1375
            NameQuest = "FrostQuest"
            NameMon = "Snow Lurker"
            CFrameQuest = CFrame.new(5667.66, 26.80, -6486.09)
            CFrameMon = CFrame.new(5407.07, 69.19, -6880.88)
        elseif SelectMonster == "Sea Soldier" then
            Mon = "Sea Soldier"
            LevelQuest = 1
            LevelMon = 1425
            NameQuest = "ForgottenQuest"
            NameMon = "Sea Soldier"
            CFrameQuest = CFrame.new(-3054.44, 235.54, -10142.82)
            CFrameMon = CFrame.new(-3028.22, 64.67, -9775.43)
        elseif SelectMonster == "Water Fighter" then
            Mon = "Water Fighter"
            LevelQuest = 2
            LevelMon = 1450
            NameQuest = "ForgottenQuest"
            NameMon = "Water Fighter"
            CFrameQuest = CFrame.new(-3054.44, 235.54, -10142.82)
            CFrameMon = CFrame.new(-3352.90, 285.02, -10534.84)
        end
    elseif World3 then
        if SelectMonster == "Pirate Millionaire" then
            Mon = "Pirate Millionaire"
            LevelQuest = 1
            LevelMon = 1500
            NameQuest = "PiratePortQuest"
            NameMon = "Pirate Millionaire"
            CFrameQuest = CFrame.new(-450.10, 107.68, 5950.73)
            CFrameMon = CFrame.new(-245.99, 47.31, 5584.10)
        elseif SelectMonster == "Dragon Crew Warrior" then
            Mon = "Dragon Crew Warrior"
            LevelQuest = 1
            LevelMon = 1575
            NameQuest = "DragonCrewQuest"
            NameMon = "Dragon Crew Warrior"
            CFrameQuest = CFrame.new(6750.49, 127.45, -711.03)
            CFrameMon = CFrame.new(6709.76, 52.34, -1139.03)
        elseif SelectMonster == "Dragon Crew Archer" then
            Mon = "Dragon Crew Archer"
            LevelQuest = 2
            LevelMon = 1600
            NameQuest = "DragonCrewQuest"
            NameMon = "Dragon Crew Archer"
            CFrameQuest = CFrame.new(6750.49, 127.45, -711.03)
            CFrameMon = CFrame.new(6668.76, 481.38, 329.12)
        elseif SelectMonster == "Female Islander" then
            Mon = "Female Islander"
            LevelQuest = 1
            LevelMon = 1625
            NameQuest = "AmazonQuest"
            NameMon = "Female Islander"
            CFrameQuest = CFrame.new(5247.53, 41.61, 462.75)
            CFrameMon = CFrame.new(4685.42, 735.09, 816.99)
        elseif SelectMonster == "Giant Islander" then
            Mon = "Giant Islander"
            LevelQuest = 2
            LevelMon = 1650
            NameQuest = "AmazonQuest"
            NameMon = "Giant Islander"
            CFrameQuest = CFrame.new(5247.53, 41.61, 462.75)
            CFrameMon = CFrame.new(4729.13, 590.44, -37.96)
        elseif SelectMonster == "Marine Commodore" then
            Mon = "Marine Commodore"
            LevelQuest = 1
            LevelMon = 1700
            NameQuest = "MarineTreeIsland"
            NameMon = "Marine Commodore"
            CFrameQuest = CFrame.new(2481.09, 74.27, -6779.64)
            CFrameMon = CFrame.new(2577.25, 75.61, -7739.87)
        elseif SelectMonster == "Marine Rear Admiral" then
            Mon = "Marine Rear Admiral"
            LevelQuest = 2
            LevelMon = 1725
            NameQuest = "MarineTreeIsland"
            NameMon = "Marine Rear Admiral"
            CFrameQuest = CFrame.new(2481.09, 74.27, -6779.64)
            CFrameMon = CFrame.new(3761.81, 123.91, -6823.52)
        elseif SelectMonster == "Fishman Raider" then
            Mon = "Fishman Raider"
            LevelQuest = 1
            LevelMon = 1775
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Raider"
            CFrameQuest = CFrame.new(-10581.66, 330.87, -8761.19)
            CFrameMon = CFrame.new(-10407.53, 331.76, -8368.52)
        elseif SelectMonster == "Fishman Captain" then
            Mon = "Fishman Captain"
            LevelQuest = 2
            LevelMon = 1800
            NameQuest = "DeepForestIsland3"
            NameMon = "Fishman Captain"
            CFrameQuest = CFrame.new(-10581.66, 330.87, -8761.19)
            CFrameMon = CFrame.new(-10994.70, 352.38, -9002.11)
        elseif SelectMonster == "Forest Pirate" then
            Mon = "Forest Pirate"
            LevelQuest = 1
            LevelMon = 1825
            NameQuest = "DeepForestIsland"
            NameMon = "Forest Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.49, -7625.40)
            CFrameMon = CFrame.new(-13274.48, 332.38, -7769.58)
        elseif SelectMonster == "Mythological Pirate" then
            Mon = "Mythological Pirate"
            LevelQuest = 2
            LevelMon = 1850
            NameQuest = "DeepForestIsland"
            NameMon = "Mythological Pirate"
            CFrameQuest = CFrame.new(-13234.04, 331.49, -7625.40)
            CFrameMon = CFrame.new(-13680.61, 501.08, -6991.19)
        elseif SelectMonster == "Jungle Pirate" then
            Mon = "Jungle Pirate"
            LevelQuest = 1
            LevelMon = 1900
            NameQuest = "DeepForestIsland2"
            NameMon = "Jungle Pirate"
            CFrameQuest = CFrame.new(-12680.38, 389.97, -9902.02)
            CFrameMon = CFrame.new(-12256.16, 331.74, -10485.84)
        elseif SelectMonster == "Musketeer Pirate" then
            Mon = "Musketeer Pirate"
            LevelQuest = 2
            LevelMon = 1925
            NameQuest = "DeepForestIsland2"
            NameMon = "Musketeer Pirate"
            CFrameQuest = CFrame.new(-12680.38, 389.97, -9902.02)
            CFrameMon = CFrame.new(-13457.90, 391.55, -9859.18)
        elseif SelectMonster == "Reborn Skeleton" then
            Mon = "Reborn Skeleton"
            LevelQuest = 1
            LevelMon = 1975
            NameQuest = "HauntedQuest1"
            NameMon = "Reborn Skeleton"
            CFrameQuest = CFrame.new(-9479.22, 141.22, 5566.09)
            CFrameMon = CFrame.new(-8763.72, 165.72, 6159.86)
        elseif SelectMonster == "Living Zombie" then
            Mon = "Living Zombie"
            LevelQuest = 2
            LevelMon = 2000
            NameQuest = "HauntedQuest1"
            NameMon = "Living Zombie"
            CFrameQuest = CFrame.new(-9479.22, 141.22, 5566.09)
            CFrameMon = CFrame.new(-10144.13, 138.63, 5838.09)
        elseif SelectMonster == "Demonic Soul" then
            Mon = "Demonic Soul"
            LevelQuest = 1
            LevelMon = 2025
            NameQuest = "HauntedQuest2"
            NameMon = "Demonic Soul"
            CFrameQuest = CFrame.new(-9516.99, 172.02, 6078.47)
            CFrameMon = CFrame.new(-9505.87, 172.10, 6158.99)
        elseif SelectMonster == "Posessed Mummy" then
            Mon = "Posessed Mummy"
            LevelQuest = 2
            LevelMon = 2050
            NameQuest = "HauntedQuest2"
            NameMon = "Posessed Mummy"
            CFrameQuest = CFrame.new(-9516.99, 172.02, 6078.47)
            CFrameMon = CFrame.new(-9582.02, 6.25, 6205.48)
        elseif SelectMonster == "Peanut Scout" then
            Mon = "Peanut Scout"
            LevelQuest = 1
            LevelMon = 2075
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut Scout"
            CFrameQuest = CFrame.new(-2104.39, 38.10, -10194.22)
            CFrameMon = CFrame.new(-2143.24, 47.72, -10029.99)
        elseif SelectMonster == "Peanut President" then
            Mon = "Peanut President"
            LevelQuest = 2
            LevelMon = 2100
            NameQuest = "NutsIslandQuest"
            NameMon = "Peanut President"
            CFrameQuest = CFrame.new(-2104.39, 38.10, -10194.22)
            CFrameMon = CFrame.new(-1859.35, 38.10, -10422.43)
        elseif SelectMonster == "Ice Cream Chef" then
            Mon = "Ice Cream Chef"
            LevelQuest = 1
            LevelMon = 2125
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Chef"
            CFrameQuest = CFrame.new(-820.65, 65.82, -10965.80)
            CFrameMon = CFrame.new(-872.25, 65.82, -10919.96)
        elseif SelectMonster == "Ice Cream Commander" then
            Mon = "Ice Cream Commander"
            LevelQuest = 2
            LevelMon = 2150
            NameQuest = "IceCreamIslandQuest"
            NameMon = "Ice Cream Commander"
            CFrameQuest = CFrame.new(-820.65, 65.82, -10965.80)
            CFrameMon = CFrame.new(-558.06, 112.05, -11290.77)
        elseif SelectMonster == "Cookie Crafter" then
            Mon = "Cookie Crafter"
            LevelQuest = 1
            LevelMon = 2200
            NameQuest = "CakeQuest1"
            NameMon = "Cookie Crafter"
            CFrameQuest = CFrame.new(-2021.32, 37.80, -12028.73)
            CFrameMon = CFrame.new(-2374.14, 37.80, -12125.31)
        elseif SelectMonster == "Cake Guard" then
            Mon = "Cake Guard"
            LevelQuest = 2
            LevelMon = 2225
            NameQuest = "CakeQuest1"
            NameMon = "Cake Guard"
            CFrameQuest = CFrame.new(-2021.32, 37.80, -12028.73)
            CFrameMon = CFrame.new(-1598.31, 43.77, -12244.58)
        elseif SelectMonster == "Baking Staff" then
            Mon = "Baking Staff"
            LevelQuest = 1
            LevelMon = 2250
            NameQuest = "CakeQuest2"
            NameMon = "Baking Staff"
            CFrameQuest = CFrame.new(-1927.92, 37.80, -12842.54)
            CFrameMon = CFrame.new(-1887.81, 77.62, -12998.35)
        elseif SelectMonster == "Head Baker" then
            Mon = "Head Baker"
            LevelQuest = 2
            LevelMon = 2275
            NameQuest = "CakeQuest2"
            NameMon = "Head Baker"
            CFrameQuest = CFrame.new(-1927.92, 37.80, -12842.54)
            CFrameMon = CFrame.new(-2216.19, 82.88, -12869.29)
        elseif SelectMonster == "Cocoa Warrior" then
            Mon = "Cocoa Warrior"
            LevelQuest = 1
            LevelMon = 2300
            NameQuest = "ChocQuest1"
            NameMon = "Cocoa Warrior"
            CFrameQuest = CFrame.new(233.23, 29.88, -12201.23)
            CFrameMon = CFrame.new(-21.55, 80.57, -12352.39)
        elseif SelectMonster == "Chocolate Bar Battler" then
            Mon = "Chocolate Bar Battler"
            LevelQuest = 2
            LevelMon = 2325
            NameQuest = "ChocQuest1"
            NameMon = "Chocolate Bar Battler"
            CFrameQuest = CFrame.new(233.23, 29.88, -12201.23)
            CFrameMon = CFrame.new(582.59, 77.19, -12463.16)
        elseif SelectMonster == "Sweet Thief" then
            Mon = "Sweet Thief"
            LevelQuest = 1
            LevelMon = 2350
            NameQuest = "ChocQuest2"
            NameMon = "Sweet Thief"
            CFrameQuest = CFrame.new(150.51, 30.69, -12774.50)
            CFrameMon = CFrame.new(165.19, 76.06, -12600.84)
        elseif SelectMonster == "Candy Rebel" then
            Mon = "Candy Rebel"
            LevelQuest = 2
            LevelMon = 2375
            NameQuest = "ChocQuest2"
            NameMon = "Candy Rebel"
            CFrameQuest = CFrame.new(150.51, 30.69, -12774.50)
            CFrameMon = CFrame.new(134.87, 77.25, -12876.55)
        elseif SelectMonster == "Candy Pirate" then
            Mon = "Candy Pirate"
            LevelQuest = 1
            LevelMon = 2400
            NameQuest = "CandyQuest1"
            NameMon = "Candy Pirate"
            CFrameQuest = CFrame.new(-1150.04, 20.38, -14446.33)
            CFrameMon = CFrame.new(-1310.50, 26.02, -14562.40)
        elseif SelectMonster == "Snow Demon" then
            Mon = "Snow Demon"
            LevelQuest = 2
            LevelMon = 2425
            NameQuest = "CandyQuest1"
            NameMon = "Snow Demon"
            CFrameQuest = CFrame.new(-1150.04, 20.38, -14446.33)
            CFrameMon = CFrame.new(-880.20, 71.25, -14538.61)
        elseif SelectMonster == "Isle Outlaw" then
            Mon = "Isle Outlaw"
            LevelQuest = 1
            LevelMon = 2450
            NameQuest = "TikiQuest1"
            NameMon = "Isle Outlaw"
            CFrameQuest = CFrame.new(-16547.75, 61.14, -173.41)
            CFrameMon = CFrame.new(-16442.81, 116.14, -264.46)
        elseif SelectMonster == "Island Boy" then
            Mon = "Island Boy"
            LevelQuest = 2
            LevelMon = 2475
            NameQuest = "TikiQuest1"
            NameMon = "Island Boy"
            CFrameQuest = CFrame.new(-16547.75, 61.14, -173.41)
            CFrameMon = CFrame.new(-16901.26, 84.07, -192.89)
        elseif SelectMonster == "Sun-kissed Warrior" then
            Mon = "Sun-kissed Warrior"
            LevelQuest = 1
            LevelMon = 2500
            NameQuest = "TikiQuest2"
            NameMon = "Sun-kissed Warrior"
            CFrameQuest = CFrame.new(-16539.08, 55.69, 1051.57)
            CFrameMon = CFrame.new(-16349.59, 92.99, 1078.74)
        elseif SelectMonster == "Isle Champion" then
            Mon = "Isle Champion"
            LevelQuest = 2
            LevelMon = 2525
            NameQuest = "TikiQuest2"
            NameMon = "Isle Champion"
            CFrameQuest = CFrame.new(-16539.08, 55.69, 1051.57)
            CFrameMon = CFrame.new(-16641.68, 235.78, 1031.28)
        end
    end
end





local PlaceID = game.PlaceId
local AllIDs = {}
local ScannedServers = {}
local TargetServers = {}
local PrivateServerBlacklist = {}
local targetPlayerCount = {min = 1, max = 1}
local TotalServersFound = 0
local ValidServersFound = 0
local serverText

local function Hop1()
    local InsertService = game:GetService("InsertService")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ServerChangingGui"
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.IgnoreGuiInset = true

    local backgroundImage = Instance.new("ImageLabel")
    backgroundImage.Parent = screenGui
    backgroundImage.Size = UDim2.new(1, 0, 1, 0)
    backgroundImage.Position = UDim2.new(0, 0, 0, 0)
    backgroundImage.Image = "rbxassetid://94645616925474"
    backgroundImage.ScaleType = Enum.ScaleType.Stretch
    backgroundImage.BackgroundTransparency = 1
    backgroundImage.BorderSizePixel = 0

    local contentFrame = Instance.new("Frame")
    contentFrame.Parent = screenGui
    contentFrame.Size = UDim2.new(0, 450, 0, 150)
    contentFrame.Position = UDim2.new(0.08, 0, 0.35, 0)
    contentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    contentFrame.BackgroundTransparency = 0.6
    contentFrame.BorderSizePixel = 0

    local contentCorner = Instance.new("UICorner")
    contentCorner.CornerRadius = UDim.new(0, 15)
    contentCorner.Parent = contentFrame

    local contentStroke = Instance.new("UIStroke")
    contentStroke.Parent = contentFrame
    contentStroke.Color = Color3.fromRGB(0, 0, 0)
    contentStroke.Thickness = 3
    contentStroke.Transparency = 0.5

    local contentPadding = Instance.new("UIPadding")
    contentPadding.Parent = contentFrame
    contentPadding.PaddingLeft = UDim.new(0, 20)
    contentPadding.PaddingRight = UDim.new(0, 20)
    contentPadding.PaddingTop = UDim.new(0, 20)
    contentPadding.PaddingBottom = UDim.new(0, 20)

    local titleText = Instance.new("TextLabel")
    titleText.Parent = contentFrame
    titleText.Size = UDim2.new(1, 0, 0, 50)
    titleText.Position = UDim2.new(0, 0, 0, 0)
    titleText.BackgroundTransparency = 1
    titleText.Text = "Crystal Hub"
    titleText.Font = Enum.Font.Arcade
    titleText.TextSize = 36
    titleText.TextColor3 = Color3.new(1, 1, 1)
    titleText.TextXAlignment = Enum.TextXAlignment.Left
    titleText.TextYAlignment = Enum.TextYAlignment.Top
    titleText.TextStrokeTransparency = 0
    titleText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

    local titleGradient = Instance.new("UIGradient")
    titleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 85, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(85, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 85))
    })
    titleGradient.Parent = titleText

    local titleStroke = Instance.new("UIStroke")
    titleStroke.Parent = titleText
    titleStroke.Color = Color3.fromRGB(0, 0, 0)
    titleStroke.Thickness = 3
    titleStroke.Transparency = 0.4

    local serverFrame = Instance.new("Frame")
    serverFrame.Parent = contentFrame
    serverFrame.Size = UDim2.new(1, 0, 0, 40)
    serverFrame.Position = UDim2.new(0, 0, 0, 65)
    serverFrame.BackgroundTransparency = 1

    local serverIcon = Instance.new("ImageLabel")
    serverIcon.Parent = serverFrame
    serverIcon.Size = UDim2.new(0, 35, 0, 35)
    serverIcon.Position = UDim2.new(0, 0, 0.5, -17.5)
    serverIcon.BackgroundTransparency = 1
    serverIcon.Image = "rbxassetid://126956292082716"
    serverIcon.ScaleType = Enum.ScaleType.Fit

    serverText = Instance.new("TextLabel")
    serverText.Parent = serverFrame
    serverText.Size = UDim2.new(1, -45, 1, 0)
    serverText.Position = UDim2.new(0, 45, 0, 0)
    serverText.BackgroundTransparency = 1
    serverText.Text = "..."
    serverText.Font = Enum.Font.Arcade
    serverText.TextSize = 28
    serverText.TextColor3 = Color3.fromRGB(255, 255, 255)
    serverText.TextXAlignment = Enum.TextXAlignment.Left
    serverText.TextYAlignment = Enum.TextYAlignment.Center
    serverText.TextStrokeTransparency = 0
    serverText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

    local serverGradient = Instance.new("UIGradient")
    serverGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 200, 100)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 255, 200)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 100, 255))
    })
    serverGradient.Parent = serverText

    local serverStroke = Instance.new("UIStroke")
    serverStroke.Parent = serverText
    serverStroke.Color = Color3.fromRGB(0, 0, 0)
    serverStroke.Thickness = 3
    serverStroke.Transparency = 0.4

    local player = game.Players.LocalPlayer
    screenGui.Parent = player:WaitForChild("PlayerGui")

    task.spawn(function()
        while titleGradient do
            for i = 0, 360, 2 do
                if not titleGradient then break end
                titleGradient.Rotation = i
                serverGradient.Rotation = -i
                task.wait(0.03)
            end
        end
    end)
    
    PlayerLowSever()
end

local lastHopTime = 0
function PlayerLowSever()
    if tick() - lastHopTime < 10 then
        return
    end
    lastHopTime = tick()
    local TeleportService = game:GetService("TeleportService")
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local currentServer = game.JobId
    local isPrivateServer = game.PrivateServerId ~= "" and game.PrivateServerOwnerId ~= 0
    
    if isPrivateServer then
        return
    end
    
    local cursor = ""
    local hasMorePages = true
    local pageCount = 9
    local maxPages = 20
    local startTime = tick()
    local timeout = 1
    
    TotalServersFound = 0
    ValidServersFound = 0
    
    while hasMorePages and pageCount < maxPages do
        if tick() - startTime > timeout then
            break
        end
        
        pageCount = pageCount + 1
        
        local baseUrl = "https://games.roblox.com/v1/games/" .. PlaceID .. "/servers/Public"
        local params = "?sortOrder=Asc&limit=100"
        
        if cursor and cursor ~= "" and cursor ~= nil then
            params = params .. "&cursor=" .. tostring(cursor)
        end
        
        local url = baseUrl .. params
        local Site = nil
        
        pcall(function()
            local response = game:HttpGetAsync(url)
            if response and response ~= "" then
                Site = HttpService:JSONDecode(response)
            end
        end)
        
        if not Site or not Site.data or type(Site.data) ~= "table" or #Site.data == 0 then
            break
        end
        
        for _, server in ipairs(Site.data) do
            if server and type(server) == "table" and server.id then
                local ID = tostring(server.id)
                TotalServersFound = TotalServersFound + 1
                
                local isPrivate = false
                if server.privateServerId and server.privateServerId ~= "" then
                    isPrivate = true
                end
                if server.id and table.find(PrivateServerBlacklist, tostring(server.id)) then
                    isPrivate = true
                end
                
                if not isPrivate and not table.find(ScannedServers, ID) then
                    table.insert(ScannedServers, ID)
                    
                    local playing = tonumber(server.playing)
                    local maxPlayers = tonumber(server.maxPlayers)
                    
                    if playing and maxPlayers and playing >= 0 and maxPlayers > 0 then
                        if playing >= targetPlayerCount.min 
                            and playing <= targetPlayerCount.max 
                            and playing < maxPlayers then
                            
                            ValidServersFound = ValidServersFound + 1
                            
                            table.insert(TargetServers, {
                                id = ID,
                                players = playing,
                                maxPlayers = maxPlayers,
                                ping = tonumber(server.ping) or 999,
                                fps = tonumber(server.fps) or 60
                            })
                        end
                    end
                end
            end
        end
        
        if Site.nextPageCursor and Site.nextPageCursor ~= "" and Site.nextPageCursor ~= nil then
            cursor = tostring(Site.nextPageCursor)
            hasMorePages = true
            task.wait(0.1)
        else
            hasMorePages = false
            break
        end
    end
    
    if #TargetServers > 0 then
        table.sort(TargetServers, function(a, b)
            if a.players ~= b.players then
                return a.players < b.players
            end
            if a.ping ~= b.ping then
                return a.ping < b.ping
            end
            return a.fps > b.fps
        end)
    end
    
    if #AllIDs > 150 then
        local temp = {}
        for i = math.max(1, #AllIDs - 75), #AllIDs do
            if AllIDs[i] then
                table.insert(temp, AllIDs[i])
            end
        end
        AllIDs = temp
    end
    
    if #PrivateServerBlacklist > 300 then
        local temp = {}
        for i = math.max(1, #PrivateServerBlacklist - 150), #PrivateServerBlacklist do
            if PrivateServerBlacklist[i] then
                table.insert(temp, PrivateServerBlacklist[i])
            end
        end
        PrivateServerBlacklist = temp
    end
    
    if #ScannedServers > 500 then
        ScannedServers = {}
    end
    
    local failCount = 0
    local maxFailCount = 15
    
    TeleportService.TeleportInitFailed:Connect(function(player, teleportResult, errorMessage)
        failCount = failCount + 1
        task.wait(0.1)
        
        if #TargetServers > 0 then
            local removed = table.remove(TargetServers, 1)
            if removed and removed.id then
                table.insert(PrivateServerBlacklist, removed.id)
            end
        end
        
        if failCount >= maxFailCount then
            failCount = 0
        end
    end)
    
    if LocalPlayer and LocalPlayer.Parent and #TargetServers > 0 then
        local maxAttempts = math.min(#TargetServers, 20)
        
        for i = 1, maxAttempts do
            local server = TargetServers[i]
            
            if server and type(server) == "table" and server.id then
                local serverID = server.id
                
                if serverID and serverID ~= "" and type(serverID) == "string" 
                    and serverID ~= currentServer 
                    and not table.find(AllIDs, serverID) 
                    and not table.find(PrivateServerBlacklist, serverID) then
                    
                    table.insert(AllIDs, serverID)
                    
                    serverText.Text = "Hop Sever... | " .. server.players .. "/" .. server.maxPlayers
                    
                    local teleportOptions = Instance.new("TeleportOptions")
                    teleportOptions.ShouldReserveServer = false
                    
                    pcall(function()
                        TeleportService:TeleportAsync(PlaceID, {LocalPlayer}, teleportOptions)
                    end)
                    
                    task.wait(0.1)
                    
                    pcall(function()
                        TeleportService:TeleportToPlaceInstance(PlaceID, server.id, LocalPlayer)
                    end)
                    
                    task.wait(0.1)
                end
            end
        end
    end
end

local function Attack(v)
    if not v or not v.Parent then
        return
    end
    if not v:FindFirstChild("HumanoidRootPart") then
        return
    end
    if not v:FindFirstChild("Humanoid") then
        return
    end
    if v.Humanoid.Health <= 0 then
        return
    end
    
    EquipWeapon(getgenv().CrystalCfg["Select Weapon"])
    AutoHaki()
    
    PosMon = v.HumanoidRootPart.CFrame
    MonFarm = v.Name
    
    v.HumanoidRootPart.CanCollide = false
    v.HumanoidRootPart.Size = Vector3.new(40, 40, 40)  
    v.HumanoidRootPart.Transparency = 1
    v.Humanoid.WalkSpeed = 0
    v.Humanoid.JumpPower = 0
    v.Head.CanCollide = false
    
    if Config.SpinPosEnabled and Pos then
        topos(Pos)
    else
        topos(v.HumanoidRootPart.CFrame * CFrame.new(0, Config.SpinPosY, 0))
    end
    
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
end
	function AutoHaki()
  local player = game:GetService("Players").LocalPlayer
  local character = player.Character
  if character and not character:FindFirstChild("HasBuso") then
    local remote = game:GetService("ReplicatedStorage").Remotes.CommF_
    if remote then
      remote:InvokeServer("Buso") 
    end
  end
end
  
function EquipAllWeapon()
        pcall(function()
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v:IsA('Tool') and not (v.Name == "Summon Sea Beast" or v.Name == "Water Body" or v.Name == "Awakening") then
                    local ToolHumanoid = game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) 
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(ToolHumanoid) 
                    wait(1)
                end
            end
        end)
    end
function UnEquipWeapon(Weapon)
        if game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
            getgenv().NotAutoEquip = true
            wait(.5)
            game.Players.LocalPlayer.Character:FindFirstChild(Weapon).Parent = game.Players.LocalPlayer.Backpack
            wait(.1)
            getgenv().NotAutoEquip = false
        end
    end
    
    function EquipWeapon(ToolSe)
        if not getgenv().NotAutoEquip then
            if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
                Tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
                wait(.1)
                game.Players.LocalPlayer.Character.Humanoid:EquipTool(Tool)
            end
        end
    end

CheckItem = function(itemName)
    local inBackpackOrChar = plr.Backpack:FindFirstChild(itemName) or plr.Character:FindFirstChild(itemName)
    
    local inventory = ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")
    for _, v in pairs(inventory) do
        if type(v) == "table" then
            if v.Type == "Material" and v.Name == itemName then
                return v.Count or 0
            end
        end
    end
    
    if inBackpackOrChar then
        return true
    end
    
    for _, v in pairs(inventory) do
        if type(v) == "table" then
            if v.Name == itemName then
                return true
            end
            
            if v.Type == "Gun" and v.Name == itemName then
                return true
            end
        end
    end
    
    local inventoryWeapons = ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventoryWeapons")
    for _, v in pairs(inventoryWeapons) do
        if type(v) == "table" then
            if v.Name == itemName or v["Name"] == itemName then
                return true
            end
        end
    end
    
    for _, v1 in pairs(ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory")) do
        if type(v1) == "table" then
            if v1.Name == itemName or plr.Character:FindFirstChild(itemName) or plr.Backpack:FindFirstChild(itemName) then
                return true
            end
        end
    end
    
    return plr.Backpack:FindFirstChild(itemName) or plr.Character:FindFirstChild(itemName)
end
local NotifiedItems = {}
local function CheckAndNotify(itemName)
    if CheckItem(itemName) and not NotifiedItems[itemName] then
        NotifiedItems[itemName] = true
                        Crystal:Notify({
                            Title = "Crystal Hub",
                            Title1 = "Item Get",
                            Content = "Donte Item: " .. itemName,
                            Type = "Success",
                            Delay = 5
                        })
        return true
    end
    return CheckItem(itemName)
end
function StoreFruit()
    for i,v in pairs(thelocal.Backpack:GetChildren()) do
        if v:IsA("Tool") and string.find(v.Name, "Fruit") then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",v:GetAttribute("OriginalName"),v)
        end
    end
end		
local function GetInventoryFruits()
    local fruits = {}
    pcall(function()
        for i, v in pairs(replicated.Remotes.CommF_:InvokeServer("getInventoryFruits")) do
            table.insert(fruits, v.Name)
        end
    end)
    return fruits
end

local function StoreFruit(fruitName)
    pcall(function()
        replicated.Remotes.CommF_:InvokeServer("StoreFruit", fruitName)
    end)
end

getgenv().Click = function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0)
    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0) 
end
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local Config = {
    TweenSpeed = 350,
    TeleportDistance = 200,
    PortalDistanceThreshold = 1,
    PositionTolerance = 20,
    UsePortalTween = true,
    UseTeleportDistance = true,
    SpinPosEnabled = false,
    SpinPosY = 30
}

local TweenState = {
    IsTeleporting = nill,
    CurrentTween = nil,
    LastTweenTime = 0,
    LastTargetPosition = nil,
    UpdateThreshold = 2,
    MinTweenInterval = 1
}

local TeleporterLocations = {
    [2753915549] = {
        MiddleSkyLands = Vector3.new(-4607.82, 874.39, -1667.56),
        UpperSkyLands = Vector3.new(-7894.62, 5547.14, -380.29),
        Whirlpool = Vector3.new(3864.69, 6.74, -1926.21),
        UnderwaterCity = Vector3.new(61163.85, 11.68, 1819.78)
    },
    [4442272183] = {
        FlamingoMansion = Vector3.new(-317, 331, 597),
        FlamingoRoom = Vector3.new(2283, 15, 867),
        CursedShip = Vector3.new(923, 125, 32853),
        ZombieIsland = Vector3.new(-6509, 83, -133)
    },
    [7449423635] = {
        Mansion = Vector3.new(-12471, 374, -7551),
        HydraIsland = Vector3.new(5756, 610, -282),
        CastleOnTheSea = Vector3.new(-5092, 315, -3130),
        FloatingTurtle = Vector3.new(-12001, 332, -8861),
        BeautifulPirate = Vector3.new(5319, 23, -93),
        TempleOfTime = Vector3.new(28286, 14897, 103),
        DimensionalShift = Vector3.new(-2097.34, 4776.24, -15013.49),
        BeautifulRoom = Vector3.new(5314.58, 22.53, -125.94)
    }
}


local Tween = {}
Tween.__index = Tween

if not getgenv().noclipsetup then
    RunService.Stepped:Connect(function()
        if not getgenv().noclip then return end
        
        local character = LocalPlayer.Character
        if not character then return end
        
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
        
        local head = character:FindFirstChild("Head")
        if head and not head:FindFirstChild("BodyVelocity") then
            local bodyVel = Instance.new("BodyVelocity")
            bodyVel.Velocity = Vector3.zero
            bodyVel.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bodyVel.P = 9000
            bodyVel.Parent = head
        end
    end)
    getgenv().noclipsetup = true
end

function Tween.IsNearTeleporter(position)
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return false, nil
    end
    
    local playerPos = character.HumanoidRootPart.Position
    local locations = TeleporterLocations[game.PlaceId]
    
    if not locations then return false, nil end
    
    for name, pos in pairs(locations) do
        local dist = (pos - playerPos).Magnitude
        if dist <= Config.PositionTolerance then
            return true, name
        end
    end
    
    return false, nil
end

function Tween.CheckNearestTeleporter(targetPos)
    if not Config.UsePortalTween then return nil end
    
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return nil
    end
    
    local playerPos = character.HumanoidRootPart.Position
    local targetPosVector = targetPos.Position
    local locations = TeleporterLocations[game.PlaceId]
    
    if not locations then return nil end
    
    local isNear, portalName = Tween.IsNearTeleporter(playerPos)
    if isNear then
        return nil
    end
    
    local minDist = math.huge
    local chosenTeleport = nil
    
    for _, pos in pairs(locations) do
        local dist = (pos - targetPosVector).Magnitude
        if dist < minDist then
            minDist = dist
            chosenTeleport = pos
        end
    end
    
    return minDist <= (targetPosVector - playerPos).Magnitude and chosenTeleport or nil
end

function Tween.RequestEntrance(teleportPos)
    local success = pcall(function()
        ReplicatedStorage.Remotes.CommF_:InvokeServer("requestEntrance", teleportPos)
    end)
    
    if success then
        local character = LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0)
        end
        task.wait(0.5)
        return true
    end
    return false
end

function Tween.ShouldCreateNewTween(targetPosition, customThreshold, customInterval)
    local currentTime = tick()
    local threshold = customThreshold or TweenState.UpdateThreshold
    local interval = customInterval or TweenState.MinTweenInterval
    
    if TweenState.IsTeleporting then
        if not TweenState.LastTargetPosition then return false end
        
        local positionDiff = (targetPosition - TweenState.LastTargetPosition).Magnitude
        if positionDiff < threshold then return false end
    end
    
    if (currentTime - TweenState.LastTweenTime) < interval then
        return false
    end
    
    return true
end

function Tween.New(targetCFrame, callback, options)
    if not targetCFrame then return nil end
    
    options = options or {}
    local targetPosition = targetCFrame.Position
    
    if not Tween.ShouldCreateNewTween(targetPosition, options.UpdateThreshold, options.MinTweenInterval) then
        return TweenState.CurrentTween
    end
    
    if TweenState.CurrentTween then
        TweenState.CurrentTween:Cancel()
    end
    
    local self = setmetatable({
        CurrentTween = nil,
        Character = LocalPlayer.Character,
        HumanoidRootPart = nil,
        Callback = callback,
        PartTele = nil,
        TargetCFrame = targetCFrame
    }, Tween)
    
    TweenState.CurrentTween = self
    TweenState.LastTweenTime = tick()
    TweenState.LastTargetPosition = targetPosition
    
    self.HumanoidRootPart = self.Character and self.Character:FindFirstChild("HumanoidRootPart")
    
    if self:IsValid() then
        self:StartTween(targetCFrame)
    end
    
    return self
end

function Tween:IsValid()
    return self.Character and self.HumanoidRootPart
end

function Tween:CreatePartTele()
    local partTele = self.Character:FindFirstChild("PartTele")
    
    if not partTele then
        partTele = Instance.new("Part")
        partTele.Size = Vector3.new(10, 1, 10)
        partTele.Name = "PartTele"
        partTele.Anchored = true
        partTele.Transparency = 1
        partTele.CanCollide = true
        partTele.CFrame = self.HumanoidRootPart.CFrame
        partTele.Parent = self.Character
        
        partTele:GetPropertyChangedSignal("CFrame"):Connect(function()
            if not TweenState.IsTeleporting or not self:IsValid() then return end
            task.wait()
            self.HumanoidRootPart.CFrame = partTele.CFrame
        end)
    end
    
    self.PartTele = partTele
end

function Tween:StartTween(targetCFrame)
    if not self:IsValid() then return end
    
    self:Cancel()
    getgenv().noclip = true
    
    local distance = (targetCFrame.Position - self.HumanoidRootPart.Position).Magnitude
    local nearestTeleport = Tween.CheckNearestTeleporter(targetCFrame)
    
    if Config.UsePortalTween then
        if distance > Config.PortalDistanceThreshold or (distance <= Config.PortalDistanceThreshold and nearestTeleport) then
            if nearestTeleport and Tween.RequestEntrance(nearestTeleport) and self:IsValid() then
                distance = (targetCFrame.Position - self.HumanoidRootPart.Position).Magnitude
            end
        end
    end
    
    if Config.UseTeleportDistance and distance <= Config.TeleportDistance then
        self.HumanoidRootPart.CFrame = targetCFrame
        getgenv().noclip = false
        TweenState.IsTeleporting = false
        if self.Callback then self.Callback() end
        if TweenState.CurrentTween == self then
            TweenState.CurrentTween = nil
            TweenState.LastTargetPosition = nil
        end
        return
    end
    
    self:CreatePartTele()
    TweenState.IsTeleporting = true
    
    local tweenInfo = TweenInfo.new(distance / Config.TweenSpeed, Enum.EasingStyle.Linear)
    local tweenObj = TweenService:Create(self.PartTele, tweenInfo, {CFrame = targetCFrame})
    
    self.CurrentTween = {
        Tween = tweenObj,
        Cancel = function()
            tweenObj:Cancel()
            TweenState.IsTeleporting = false
            getgenv().noclip = false
        end
    }
    
    tweenObj:Play()
    tweenObj.Completed:Connect(function(status)
        if status == Enum.PlaybackState.Completed then
            if self.Character and self.Character:FindFirstChild("PartTele") then
                self.Character.PartTele:Destroy()
            end
            TweenState.IsTeleporting = false
            getgenv().noclip = false
            self.CurrentTween = nil
            if TweenState.CurrentTween == self then
                TweenState.CurrentTween = nil
                TweenState.LastTargetPosition = nil
            end
            if self.Callback then self.Callback() end
        end
    end)
end

function Tween:Cancel()
    if self.CurrentTween then
        self.CurrentTween.Cancel()
        self.CurrentTween = nil
    end
    
    if self.Character then
        if self.Character:FindFirstChild("PartTele") then
            self.Character.PartTele:Destroy()
        end
        
        local head = self.Character:FindFirstChild("Head")
        if head and head:FindFirstChild("BodyVelocity") then
            head.BodyVelocity:Destroy()
        end
    end
    TweenState.IsTeleporting = false
    getgenv().noclip = false
end

function StopTween(specificTween)
    pcall(function()
        if specificTween and specificTween ~= TweenState.CurrentTween then
            specificTween:Cancel()
        end
        
        if TweenState.CurrentTween then
            TweenState.CurrentTween:Cancel()
            TweenState.CurrentTween = nil
        end
        
        TweenState.IsTeleporting = false
        TweenState.LastTargetPosition = nil
        TweenState.LastTweenTime = 0
        getgenv().noclip = false
        
        local character = LocalPlayer.Character
        if not character then return end
        
        if character:FindFirstChild("PartTele") then
            character.PartTele:Destroy()
        end
        
        local head = character:FindFirstChild("Head")
        if head and head:FindFirstChild("BodyVelocity") then
            head.BodyVelocity:Destroy()
        end
        
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
        
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Running)
        end
    end)
end

function SetTweenThreshold(updateThreshold, minInterval)
    TweenState.UpdateThreshold = updateThreshold or TweenState.UpdateThreshold
    TweenState.MinTweenInterval = minInterval or TweenState.MinTweenInterval
end

function topos(targetCFrame, callback, options)
    return Tween.New(targetCFrame, callback, options)
end

function TP1(targetCFrame, callback, options)
    return topos(targetCFrame, callback, options)
end

getgenv().GetDistance = function(position)
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return math.huge
    end
    return (position - character.HumanoidRootPart.Position).Magnitude
end

local spinIndex = 0
spawn(function()
    while wait(Config.SpinSpeed) do
        if Config.SpinPosEnabled and PosMon then
            local centerPos = PosMon.Position
            local y = centerPos.Y + Config.SpinPosY
            local radius = Config.SpinRadius
            
            spinIndex = (spinIndex + 1) % 4
            
            if spinIndex == 0 then
                -- Điểm 1: Phía trước (Z-)
                Pos = CFrame.new(centerPos.X, y, centerPos.Z - radius)
            elseif spinIndex == 1 then
                -- Điểm 2: Bên trái (X-)
                Pos = CFrame.new(centerPos.X - radius, y, centerPos.Z)
            elseif spinIndex == 2 then
                -- Điểm 3: Phía sau (Z+)
                Pos = CFrame.new(centerPos.X, y, centerPos.Z + radius)
            elseif spinIndex == 3 then
                -- Điểm 4: Bên phải (X+)
                Pos = CFrame.new(centerPos.X + radius, y, centerPos.Z)
            end
        else
            local character = LocalPlayer.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local currentPos = character.HumanoidRootPart.Position
                Pos = CFrame.new(currentPos.X, currentPos.Y + Config.SpinPosY, currentPos.Z)
            else
                Pos = CFrame.new(0, Config.SpinPosY, 0)
            end
        end
    end
end)

spawn(function()
		while task.wait() do
			pcall(function()
				if getgenv().CrystalCfg["Start Farm Material"] or getgenv().GetCoolShades or getgenv().GetBazooka or getgenv().GetPinkCoat or getgenv().GetMagmaBlaster or getgenv().GetSharkSaw or getgenv().GetMarineCoat or getgenv().GetDragonTrident or getgenv().GetPoleV1 or getgenv().GetSaber or getgenv().OneclickUpgradeRace or getgenv().AutoQuestWorld or getgenv().AutoNear or getgenv().CrystalCfg["Start Farm method"] or getgenv().StartFarmBerry or getgenv().GetWardens or getgenv().AutoFactory or getgenv().OneclickDoughking or getgenv().GetDarkFragmentorCoat or getgenv().KillZebraCaporKoko or getgenv().QuestBartilo or getgenv().StartFarmChest or getgenv().GetRengoku or getgenv().GetFlail or getgenv().GetSwanGlasses or getgenv().GetGravityBlade or getgenv().GetBlackSpikeyCoat or getgenv().GetLong or getgenv().CrystalCfg["Start Farm Material"] or getgenv().CrystalCfg["Start Kill Boss"] or getgenv().CrystalCfg["Start Farm Material"] or getgenv().FullyCyborg or getgenv().CrystalCfg["Auto Fully Raid"]  or _G.AutoFullyRaid then
					if not plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
						local Noclip = Instance.new("BodyVelocity")
						Noclip.Name = "BodyClip"
						Noclip.Parent = plr.Character.HumanoidRootPart
						Noclip.MaxForce = Vector3.new(100000, 100000, 100000)
						Noclip.Velocity = Vector3.new(0, 0, 0)
					end
					if not plr.Character:FindFirstChild('highlight') then
						local Test = Instance.new('Highlight')
						Test.Name = "highlight"
						Test.Enabled = true
						Test.FillColor = Color3.fromRGB(138, 43, 226)
						Test.OutlineColor = Color3.fromRGB(255, 255, 255)
						Test.FillTransparency = 0.5
						Test.OutlineTransparency = 0.2
						Test.Parent = plr.Character
					end
					for _, no in pairs(plr.Character:GetDescendants()) do
						if no:IsA("BasePart") then
							no.CanCollide = false
						end
					end
				else
					if plr.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
						plr.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
					end
					if plr.Character:FindFirstChild('highlight') then
						plr.Character:FindFirstChild('highlight'):Destroy()
					end
				end
			end)
		end
	end)

local SelectWeapon = {
    "Melee",
    "Sword",
    "Blox Fruit",
    "Gun"
}

S:Dropdown({
    Title = "Select Weapons",
    Desc = "",
    List = SelectWeapon,
    Multi = false,
    Value = "Melee",
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Select Weapon"] = c
    end
})

spawn(function()
    while wait(0.1) do
        pcall(function()
            if getgenv().CrystalCfg["Select Weapon"] == "Melee" then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Melee" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            getgenv().CrystalCfg["Select Weapon"] = v.Name
                        end
                    end
                end
            elseif getgenv().CrystalCfg["Select Weapon"] == "Sword" then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Sword" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            getgenv().CrystalCfg["Select Weapon"] = v.Name
                        end
                    end
                end
            elseif getgenv().CrystalCfg["Select Weapon"] == "Gun" then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Gun" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            getgenv().CrystalCfg["Select Weapon"] = v.Name
                        end
                    end
                end
            elseif getgenv().CrystalCfg["Select Weapon"] == "Blox Fruit" then
                for _, v in pairs(plr.Backpack:GetChildren()) do
                    if v.ToolTip == "Blox Fruit" then
                        if plr.Backpack:FindFirstChild(tostring(v.Name)) then
                            getgenv().CrystalCfg["Select Weapon"] = v.Name
                        end
                    end
                end
            end
        end)
    end
end)
local a = S:Toggle({
    Title = "Use Portal Tween",
    Desc = "",
    Value = true,
    Side = "b",
    Callback = function(value)
        Config.UsePortalTween = value
    end
})

local b = S:Toggle({
    Title = "Use Teleport Distance",
    Desc = "",
    Side = "b",
    Value = true,
    Callback = function(value)
        Config.UseTeleportDistance = value
    end
})

local c = S:Toggle({
    Title = "Spin Position",
    Desc = "Enable spinning position mode",
    Value = false,
    Side = "b",
    Callback = function(value)
        Config.SpinPosEnabled = value
        getgenv().SpinPos = value
    end
})

local TweenSpeedSlider = S:Slider({
    Title = "Tween Speed",
    Desc = "",
    Min = 50,
    Max = 350,
    Rounding = 0,
    Value = 350,
    Side = "b",
    Callback = function(value)
        Config.TweenSpeed = value
    end
})

local TeleportDistanceSlider = S:Slider({
    Title = "Teleport Distance",
    Desc = "",
    Min = 50,
    Max = 200,
    Rounding = 0,
    Value = 150,
    Side = "b",
    Callback = function(value)
        Config.TeleportDistance = value
    end
})

local a = S:Slider({
    Title = "Spin Position Y",
    Desc = "Adjust Y height for spin position",
    Min = 0,
    Max = 100,
    Rounding = 0,
    Value = 30,
    Side = "b",
    Callback = function(value)
        Config.SpinPosY = value
    end
})

S:Toggle({
    Title = "Fast Attack",
    Desc = "Run to 2 Under Work",
    Icon = "",
    Value = true,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Fast Attack"] = c
    end
})


S:Toggle({
    Title = "attack[Player]",
    Desc = "",
    Icon = "",
    Value = true,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Attack Player"] = c
    end
})

S:Toggle({
    Title = "attack[Mob]",
    Desc = "",
    Icon = "",
    Value = true,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Attack Mobs"] = c
    end
})

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")

local LocalPlayer = Players.LocalPlayer
local player = LocalPlayer

local cache = {
    lastClean = tick(),
    attackCount = 1,
    lastAttackTime = 0,
    attackCooldown = 0.008
}

local rs = ReplicatedStorage
local players = Players
local client = LocalPlayer
local Modules = ReplicatedStorage.Modules
local Net = Modules.Net
local Register_Hit = Net:WaitForChild("RE/RegisterHit")
local Register_Attack = Net:WaitForChild("RE/RegisterAttack")
local modules = rs:WaitForChild("Modules")
local net = modules:WaitForChild("Net")
local charFolder = Workspace:WaitForChild("Characters")
local enemyFolder = Workspace:WaitForChild("Enemies")
local playerFolder = Players
local AttackModule = {}
local RegisterAttack = net:WaitForChild("RE/RegisterAttack")
local RegisterHit = net:WaitForChild("RE/RegisterHit")

local function FindRemotes()
    return {
        attack = RegisterAttack,
        hit = RegisterHit
    }
end

local remotes = FindRemotes()

local Funcs = {}

function GetAllBladeHits()
    bladehits = {}
    if not getgenv().CrystalCfg["Fast Attack"] then return bladehits end
    if not getgenv().CrystalCfg["Attack Mobs"] then return bladehits end
    
    for _, v in pairs(Workspace.Enemies:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 
        and (v.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 65 then
            table.insert(bladehits, v)
        end
    end
    return bladehits
end

function Getplayerhit()
    bladehits = {}
    if not getgenv().CrystalCfg["Fast Attack"] then return bladehits end
    if not getgenv().CrystalCfg["Attack Player"] then return bladehits end
    
    for _, v in pairs(Workspace.Characters:GetChildren()) do
        if v.Name ~= LocalPlayer.Name and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 
        and (v.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 65 then
            table.insert(bladehits, v)
        end
    end
    return bladehits
end

function Funcs:Attack()
    if not getgenv().CrystalCfg["Fast Attack"] then return end
    
    local bladehits = {}
    for r,v in pairs(GetAllBladeHits()) do
        table.insert(bladehits, v)
    end
    for r,v in pairs(Getplayerhit()) do
        table.insert(bladehits, v)
    end
    if #bladehits == 0 then return end
    local args = {
        [1] = nil;
        [2] = {},
        [4] = "078da341"
    }
    for r, v in pairs(bladehits) do
        if Register_Attack and Register_Hit then
    Register_Attack:FireServer(0)
    Register_Hit:FireServer(unpack(args))
end
        if not args[1] then
            args[1] = v.Head
        end
        args[2][r] = {
            [1] = v,
            [2] = v.HumanoidRootPart
        }
    end
    Register_Hit:FireServer(unpack(args))
end

local function IsEntityAlive(entity)
    if not entity then
        return false
    end
    local humanoid = entity:FindFirstChild("Humanoid")
    return humanoid and humanoid.Health > 0
end

local function GetEnemiesInRange(character, range)
    local enemies = Workspace.Enemies:GetChildren()
    local players = Players:GetPlayers()
    local targets = {}
    local playerPos = character:GetPivot().Position
    
    if not getgenv().CrystalCfg["Fast Attack"] then return targets end
    
    if getgenv().CrystalCfg["Attack Mobs"] then
        for _, enemy in ipairs(enemies) do
            local rootPart = enemy:FindFirstChild("HumanoidRootPart")
            if rootPart and IsEntityAlive(enemy) then
                local distance = (rootPart.Position - playerPos).Magnitude
                if distance <= range then
                    table.insert(targets, enemy)
                end
            end
        end
    end
    
    if getgenv().CrystalCfg["Attack Player"] then
        for _, otherPlayer in ipairs(players) do
            if otherPlayer ~= player and otherPlayer.Character then
                local rootPart = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
                if rootPart and IsEntityAlive(otherPlayer.Character) then
                    local distance = (rootPart.Position - playerPos).Magnitude
                    if distance <= range then
                        table.insert(targets, otherPlayer.Character)
                    end
                end
            end
        end
    end
    
    return targets
end

function AttackNoCoolDown()
    if not getgenv().CrystalCfg["Fast Attack"] then return end
    
    local character = player.Character
    if not character then
        return
    end
    
    if not character:FindFirstChild("Humanoid") or character.Humanoid.Health <= 0 then
        return
    end
    local equippedWeapon = nil
    for _, item in ipairs(character:GetChildren()) do
        if item:IsA("Tool") then
            equippedWeapon = item
            break
        end
    end
    
    if not equippedWeapon then
        return
    end
    
    local enemiesInRange = GetEnemiesInRange(character, 60)
    if #enemiesInRange == 0 then
        return
    end
    
    local storage = ReplicatedStorage
    local modules = storage:FindFirstChild("Modules")
    if not modules then
        return
    end
    
    local attackEvent = storage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterAttack")
    local hitEvent = storage:WaitForChild("Modules"):WaitForChild("Net"):WaitForChild("RE/RegisterHit")
    
    if not attackEvent or not hitEvent then
        return
    end
    
    local targets, mainTarget = {}, nil
    for _, enemy in ipairs(enemiesInRange) do
        if not enemy:GetAttribute("IsBoat") then
            local HitboxLimbs = {
                "RightLowerArm",
                "RightUpperArm",
                "LeftLowerArm",
                "LeftUpperArm",
                "RightHand",
                "LeftHand"
            }
            local head = enemy:FindFirstChild(HitboxLimbs[math.random(#HitboxLimbs)]) or enemy.PrimaryPart
            if head then
                table.insert(targets, {enemy, head})
                mainTarget = head
            end
        end
    end
    
    if not mainTarget then
        return
    end
    
    attackEvent:FireServer(0)
    
    local playerScripts = player:FindFirstChild("PlayerScripts")
    if not playerScripts then
        return
    end
    
    local localScript = playerScripts:FindFirstChildOfClass("LocalScript")
    while not localScript do
        playerScripts.ChildAdded:Wait()
        localScript = playerScripts:FindFirstChildOfClass("LocalScript")
    end
    
    local hitFunction
    if getsenv then
        local success, scriptEnv = pcall(getsenv, localScript)
        if success and scriptEnv then
            hitFunction = scriptEnv._G.SendHitsToServer
        end
    end
    
    local successFlags, combatRemoteThread = pcall(function()
        return require(modules.Flags).COMBAT_REMOTE_THREAD or false
    end)
    
    if successFlags and combatRemoteThread and hitFunction then
        hitFunction(mainTarget, targets)
    elseif successFlags and not combatRemoteThread then
        hitEvent:FireServer(mainTarget, targets)
    end
end

function AttackModule:AttackEnemy(EnemyHead, Table)
    if not getgenv().CrystalCfg["Fast Attack"] then return end
    
    if EnemyHead then
        for i = 1, 3 do
            RegisterAttack:FireServer(0)
            RegisterAttack:FireServer(1)
            RegisterAttack:FireServer(2)
            RegisterAttack:FireServer(3)
            RegisterHit:FireServer(EnemyHead, Table or {})
        end
    end
end

function AttackModule:AttackNearest()
    if not getgenv().CrystalCfg["Fast Attack"] then return end
    
    local mon = {
        nil,
        {}
    }
    
    if getgenv().CrystalCfg["Attack Mobs"] then
        local nearestEnemies = {}
        for _, Enemy in enemyFolder:GetChildren() do
            if Enemy:FindFirstChild("HumanoidRootPart", true) and client:DistanceFromCharacter(Enemy.HumanoidRootPart.Position) < 145 then
                table.insert(nearestEnemies, {
                    enemy = Enemy,
                    root = Enemy:FindFirstChild("HumanoidRootPart"),
                    distance = client:DistanceFromCharacter(Enemy.HumanoidRootPart.Position)
                })
            end
        end
        
        table.sort(nearestEnemies, function(a, b)
            return a.distance < b.distance
        end)
        
        if #nearestEnemies > 0 then
            mon[1] = nearestEnemies[1].root
            
            for i = 2, math.min(3, #nearestEnemies) do
                table.insert(mon[2], {
                    [1] = nearestEnemies[i].enemy,
                    [2] = nearestEnemies[i].root
                })
            end
            
            self:AttackEnemy(unpack(mon))
        end
    end
    
    if getgenv().CrystalCfg["Attack Player"] then
        local nearestPlayers = {}
        for _, Player in playerFolder:GetChildren() do
            if Player ~= client and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart", true) then
                local distance = client:DistanceFromCharacter(Player.Character.HumanoidRootPart.Position)
                if distance < 145 then
                    table.insert(nearestPlayers, {
                        player = Player,
                        root = Player.Character:FindFirstChild("HumanoidRootPart"),
                        distance = distance
                    })
                end
            end
        end
        
        table.sort(nearestPlayers, function(a, b)
            return a.distance < b.distance
        end)
        
        if #nearestPlayers > 0 then
            local player = {
                nearestPlayers[1].root,
                {}
            }
            
            for i = 2, math.min(3, #nearestPlayers) do
                table.insert(player[2], {
                    [1] = nearestPlayers[i].player,
                    [2] = nearestPlayers[i].root
                })
            end
            
            self:AttackEnemy(unpack(player))
        end
    end
end

function AttackModule:BladeHits()
    self:AttackNearest()
end

getgenv().GetDistance = function(position)
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return math.huge
    end
    return (position - character.HumanoidRootPart.Position).Magnitude
end

getgenv().GetBladeHits = function()
    local targets = {}
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return targets
    end

    if not getgenv().CrystalCfg["Fast Attack"] then
        return targets
    end

    local containers = {}
    
    if getgenv().CrystalCfg["Attack Mobs"] then
        if Workspace:FindFirstChild("Enemies") then
            containers[#containers + 1] = Workspace.Enemies
        end
        if Workspace:FindFirstChild("Mobs") then
            containers[#containers + 1] = Workspace.Mobs
        end
    end
    
    if getgenv().CrystalCfg["Attack Player"] then
        if Workspace:FindFirstChild("Characters") then
            containers[#containers + 1] = Workspace.Characters
        end
        if Workspace:FindFirstChild("Players") then
            containers[#containers + 1] = Workspace.Players
        end
        
  local success, players = pcall(function()
    return Players:GetPlayers()
end)
if not success then return result end

for _, player in pairs(players) do
            if player ~= LocalPlayer and player.Character then
                if player.Character:FindFirstChild("HumanoidRootPart") and IsEntityAlive(player.Character) then
                    local distance = getgenv().GetDistance(player.Character.HumanoidRootPart.Position)
                    if distance < 145 then
                        targets[#targets + 1] = {Entity = player.Character, Distance = distance}
                    end
                end
            end
        end
    end

    for _, container in ipairs(containers) do
        if container then
            for _, entity in pairs(container:GetChildren()) do
                if entity:IsA("Model") and entity.Name ~= LocalPlayer.Name then
                    if entity:FindFirstChild("HumanoidRootPart") and IsEntityAlive(entity) and not entity:GetAttribute("IsBoat") then
                        local distance = getgenv().GetDistance(entity.HumanoidRootPart.Position)
                        if distance < 145 then
                            targets[#targets + 1] = {Entity = entity, Distance = distance}
                        end
                    end
                end
            end
        end
    end

    table.sort(targets, function(a, b)
        return a.Distance < b.Distance
    end)
    
    local result = {}
    for i = 1, math.min(#targets, 3) do
        result[#result + 1] = targets[i].Entity
    end
    return result
end

local function CleanEffects()
    if tick() - cache.lastClean < 0.001 then
        return
    end
    cache.lastClean = tick()

    pcall(function()
        local worldOrigin = Workspace:FindFirstChild("_WorldOrigin")
        if worldOrigin then
            for _, v in pairs(worldOrigin:GetChildren()) do
                if v.Name:match("CurvedRing") or v.Name:match("SlashHit") or 
                   v.Name:match("SwordSlash") or v.Name:match("SlashTail") or 
                   v.Name:match("Sounds") then
                    v:Destroy()
                end
            end
        end
        
        for _, v in pairs(Workspace:GetChildren()) do
            if v:IsA("ParticleEmitter") or v:IsA("Sound") then
                v:Destroy()
            end
        end
    end)
end

getgenv().EnhancedAttack = function()
    if not getgenv().CrystalCfg["Fast Attack"] then
        return
    end

    local currentTime = tick()
    if currentTime - cache.lastAttackTime < cache.attackCooldown then
        return
    end
    cache.lastAttackTime = currentTime

    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local equippedWeapon = nil
    for _, item in ipairs(character:GetChildren()) do
        if item:IsA("Tool") then
            equippedWeapon = item
            break
        end
    end

    local enemies = getgenv().GetBladeHits()
    if #enemies == 0 then
        return
    end

    if equippedWeapon and equippedWeapon:FindFirstChild("LeftClickRemote") then
        for _, enemy in ipairs(enemies) do
            if enemy:FindFirstChild("HumanoidRootPart") then
                local direction = (enemy.HumanoidRootPart.Position - character:GetPivot().Position).Unit
                for i = 1, 2 do
                    pcall(function()
                        equippedWeapon.LeftClickRemote:FireServer(direction, cache.attackCount)
                    end)
                    cache.attackCount = (cache.attackCount % 500) + 1
                end
            end
        end
    elseif remotes.attack and remotes.hit then
        local targets = {}
        local mainTarget = nil
        local playerPos = character:GetPivot().Position

        for _, enemy in ipairs(enemies) do
            local head = enemy:FindFirstChild("Head") or enemy:FindFirstChild("HumanoidRootPart")
            if head and (playerPos - head.Position).Magnitude <= 145 then
                if mainTarget == nil then
                    mainTarget = head
                end
                table.insert(targets, {enemy, head})
            end
        end

        if mainTarget and #targets > 0 then
            for j = 1, 2 do
                for i = 0, 3 do
                    pcall(function()
                        remotes.attack:FireServer(i)
                    end)
                end
                
                pcall(function()
                    remotes.hit:FireServer(mainTarget, targets)
                end)
            end
        end
    end
    
    CleanEffects()
end

function NormalAttack()
    AttackModule:BladeHits()
end

getgenv().Attack = function()
    if getgenv().CrystalCfg["Fast Attack"] then
        getgenv().EnhancedAttack()
        pcall(function()
            Funcs:Attack()
        end)
    else
        AttackModule:BladeHits()
    end
end

CameraShakerR = require(ReplicatedStorage.Util.CameraShaker)
CameraShakerR:Stop()

local function AutoAttackLoop()
    if getgenv().CrystalCfg["Fast Attack"] then
        pcall(getgenv().Attack)
    end
end

local attackConnection
local cleanConnection

local function StartFastAttack()
    if attackConnection then
        pcall(function()
            attackConnection:Disconnect()
        end)
    end
    if cleanConnection then
        pcall(function()
            cleanConnection:Disconnect()
        end)
    end

    if getgenv().CrystalCfg["Fast Attack"] then
        attackConnection = RunService.Heartbeat:Connect(function()
            pcall(AutoAttackLoop)
            pcall(AttackNoCoolDown)
            pcall(function()
                Funcs:Attack()
            end)
        end)
        
        cleanConnection = RunService.RenderStepped:Connect(function()
            pcall(CleanEffects)
        end)
    end
end

getgenv().FastattackNormal = AttackModule.BladeHits
getgenv().FastattackBladeHits = AttackModule.BladeHits

pcall(function()
    Debris:AddItem(script, 0)
end)



task.spawn(function()
    while task.wait(0.1) do
        local currentState = getgenv().CrystalCfg["Fast Attack"]
        
        if currentState ~= lastFastAttackState then
            lastFastAttackState = currentState
            
            if currentState then
                StartFastAttack()
            else
                if attackConnection then
                    pcall(function()
                        attackConnection:Disconnect()
                    end)
                    attackConnection = nil
                end
                if cleanConnection then
                    pcall(function()
                        cleanConnection:Disconnect()
                    end)
                    cleanConnection = nil
                end
            end
        end
    end
end)

pcall(function()
    StartFastAttack()
end)
S:Toggle({
    Title = "Auto Click",
    Desc = "",
    Icon = "",
    Value = true,
    Side = "a",
    Callback = function(c)
getgenv().Click = (c)
end
})

S:Toggle({
    Title = "Bring mob",
    Desc = "",
    Icon = "",
    Value = true,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Bring Mob"] = c
    end
})
S:Slider({
    Title = "Set Bring Mobs",
    Desc = "",
    Min = 1,
    Max = 6,
    Rounding = 0,
    Value = 2,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Max Bring Mobs"] = c
    end
})

local stabilizedMobMonsters = {}

local function SmoothPull(part, targetCFrame, speed)
    local currentPos = part.Position
    local targetPos = targetCFrame.Position
    local newPos = currentPos + (targetPos - currentPos) * speed
    part.CFrame = CFrame.new(newPos, targetPos)
end

local function LockPosition(part, targetPos)
    part.CFrame = CFrame.new(targetPos)
end

local function CheckMonstersAlive(pos)
    local count = 0
    for _, v in pairs(Workspace.Enemies:GetChildren()) do
        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            if (v.HumanoidRootPart.Position - pos.Position).Magnitude <= 250 then
                count = count + 1
            end
        end
    end
    return count
end

local function IsPlayerNear(pos)
    if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
        return (plr.Character.HumanoidRootPart.Position - pos.Position).Magnitude <= 250
    end
    return false
end

if not isnetworkowner then
    isnetworkowner = function() return true end
end

spawn(function()
    while task.wait() do
        pcall(function()
            if getgenv().CrystalCfg["Bring Mob"] and PosMon then
                for monster, data in pairs(stabilizedMobMonsters) do
                    local shouldRemove = false
                    
                    if not monster or not monster.Parent then
                        shouldRemove = true
                    elseif not monster:FindFirstChild("Humanoid") or not monster:FindFirstChild("HumanoidRootPart") then
                        shouldRemove = true
                    elseif monster.Humanoid.Health <= 0 then
                        shouldRemove = true
                    elseif tick() - data.LastUpdate > 2 then
                        shouldRemove = true
                    end
                    
                    if shouldRemove then
                        stabilizedMobMonsters[monster] = nil
                    end
                end
                
                if CheckMonstersAlive(PosMon) == 0 then
                    stabilizedMobMonsters = {}
                end

                local pulledCount = 0
                for _, v in pairs(Workspace.Enemies:GetChildren()) do
                    if pulledCount >= getgenv().CrystalCfg["Max Bring Mobs"] then break end
                    
                    local isValid = (v.Name == MonFarm or v.Name == NameMon or v.Name == "Factory Staff") and 
                        not string.find(v.Name, "Boss") and
                        v.Name ~= "Ice Admiral" and v.Name ~= "Don Swan" and 
                        v.Name ~= "Saber Expert" and v.Name ~= "Longma"
                    
                    local hasPart = v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Head")
                    local isAlive = hasPart and v.Humanoid.Health > 0
                    local inRange = hasPart and (v.HumanoidRootPart.Position - PosMon.Position).Magnitude <= 300
                    local isNotGhost = hasPart and v.HumanoidRootPart.Anchored == false
                    
                    if isValid and hasPart and isAlive and inRange and isNotGhost and IsPlayerNear(PosMon) then
                        if isnetworkowner(v.HumanoidRootPart) then
                            pulledCount = pulledCount + 1
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            v.Humanoid.WalkSpeed = 0
                            v.Humanoid.JumpPower = 0
                            v.Humanoid:ChangeState(11)
                            v.Humanoid.PlatformStand = true
                            
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            
                            local distToPosMon = (v.HumanoidRootPart.Position - PosMon.Position).Magnitude
                            
                            if stabilizedMobMonsters[v] then
                                LockPosition(v.HumanoidRootPart, PosMon.Position)
                            else
                                if distToPosMon > 400 then
                                    v.HumanoidRootPart.CFrame = CFrame.new(PosMon.Position)
                                else
                                    SmoothPull(v.HumanoidRootPart, PosMon, 0.4)
                                end
                                
                                if distToPosMon < 9 then
                                    LockPosition(v.HumanoidRootPart, PosMon.Position)
                                    stabilizedMobMonsters[v] = {
                                        Position = PosMon.Position,
                                        LastUpdate = tick(),
                                        RockSpeedX = math.random(1, 3) * 0.05,
                                        RockSpeedZ = math.random(1, 3) * 0.05,
                                        FloatPhase = math.random(0, 2 * math.pi)
                                    }
                                end
                            end
                        end
                    end
                end
                
                sethiddenproperty(plr, "SimulationRadius", math.huge)
                plr.SimulationRadius = math.huge
            end
        end)
    end
end)

spawn(function()
    RunService.RenderStepped:Connect(function(deltaTime)
        pcall(function()
            if getgenv().CrystalCfg["Bring Mob"] then
                for monster, data in pairs(stabilizedMobMonsters) do
                    if monster and monster.Parent and monster:FindFirstChild("HumanoidRootPart") and monster.Humanoid.Health > 0 then
                        local shakeIntensity = 0.5
                        local time = tick()
                        local offsetX = math.sin(time * data.RockSpeedX + data.FloatPhase) * shakeIntensity
                        local offsetZ = math.cos(time * data.RockSpeedZ + data.FloatPhase) * shakeIntensity
                        local shakeOffset = Vector3.new(offsetX, 0, offsetZ)
                        LockPosition(monster.HumanoidRootPart, data.Position + shakeOffset)
                        data.LastUpdate = tick()
                    else
                        stabilizedMobMonsters[monster] = nil
                    end
                end
            end
        end)
    end)
end)
S:Toggle({
    Title = "Auto Turn on Instinct",
    Desc = "",
    Icon = "",
    Value = true,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Turn On Instinct"] = c
    end
})
spawn(function()
while task.wait() do
pcall(function()
    if getgenv().CrystalCfg["Turn On Instinct"] then  
        if game:GetService("Players").LocalPlayer:FindFirstChild("PlayerGui") and game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
        else
            wait(1)
            game:service('VirtualUser'):CaptureController()
            game:service('VirtualUser'):SetKeyDown('0x65')
            wait(2)
            game:service('VirtualUser'):SetKeyUp('0x65')
        end
    end
end)
end
end)
S:Toggle({
    Title = "Auto Turn on Buso",
    Desc = "",
    Icon = "",
    Value = true,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Turn On Haki"] = c
    end
})

spawn(function()
    while task.wait(0.1) do
        if getgenv().CrystalCfg["Turn On Haki"] then
            pcall(AutoHaki)
        end
    end
end)

S:Toggle({
    Title = "Auto Turn on Race V3",
    Desc = "",
    Icon = "",
    Value = false,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Turn on Race V3"] = c
    end
})

spawn(function()
    while task.wait() do
    pcall(function()
            if getgenv().CrystalCfg["Turn on Race V3"] then
                game:GetService("ReplicatedStorage").Remotes.CommE:FireServer("ActivateAbility")
            end
        end);
    end
end)

S:Toggle({
    Title = "Auto Turn on Race V4",
    Desc = "",
    Icon = "",
    Value = false,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Turn on Race V4"] = c
    end
})

	spawn(function()
		while wait(.2) do
			pcall(function()
				if _G.RaceClickAutov4 then
					if plr.Character:FindFirstChild("RaceEnergy") then
						if plr.Character:FindFirstChild("RaceEnergy").Value == 1 then
							                game:GetService("VirtualInputManager"):SendKeyEvent(true, "Y", false, game)
						end
					end
				end
			end)
		end
	end)
-- Main Farming
local methodfarm = {"Level", "Bone", "Katakuri", "Kill Near"}
local CakePos = CFrame.new(-2091.911865234375, 70.00884246826172, -12142.8359375)
local BonePos = CFrame.new(-9506.234375, 172.130615234375, 6117.0771484375)
local BoneQuestPos = CFrame.new(-9516.99316, 172.017181, 6078.46533, 0, 0, -1, 0, 1, 0, 1, 0, 0)
local CakeQuestPos = CFrame.new(-2021.32007, 37.7982254, -12028.7295, 0.957576931, -8.80302053e-08, 0.288177848, 6.9301187e-08, 1, 7.51931211e-08, -0.288177848, -5.2032135e-08, 0.957576931)

MF:Dropdown({
    Title = "Select method Farm",
    Desc = "",
    List = methodfarm,
    Multi = false,
    Value = "Level",
    Side = "a",
    Callback = function(value)
        getgenv().CrystalCfg["Select Farm"] = value
    end
})

MF:Toggle({
    Title = "Start Farming",
    Desc = "",
    Icon = "",
    Value = false,
    Side = "a",
    Callback = function(value)
        getgenv().CrystalCfg["Start Farm method"] = value
        StopTween(getgenv().CrystalCfg["Start Farm method"])
    end
})

MF:Toggle({
    Title = "Accept Quest",
    Desc = " Bone / Katakuri",
    Icon = "",
    Value = true,
    Side = "a",
    Callback = function(value)
        getgenv().Crystal = getgenv().Crystal or {}
        getgenv().Crystal["Accept Quest"] = value
    end
})

local function CheckAnyEnemyAlive(enemyList)
    for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
        if table.find(enemyList, enemy.Name) then
            if enemy:FindFirstChild("Humanoid") and enemy:FindFirstChild("HumanoidRootPart") then
                if enemy.Humanoid.Health > 0 then
                    return true
                end
            end
        end
    end
    return false
end

local function GetNextEnemy(enemyList)
    for _, enemy in pairs(Workspace.Enemies:GetChildren()) do
        if table.find(enemyList, enemy.Name) then
            if enemy:FindFirstChild("HumanoidRootPart") and enemy:FindFirstChild("Humanoid") then
                if enemy.Humanoid.Health > 0 then
                    return enemy
                end
            end
        end
    end
    return nil
end

task.spawn(function()
    while task.wait(0.1) do
        if getgenv().CrystalCfg["Select Farm"] == "Level" and getgenv().CrystalCfg["Start Farm method"] then
            pcall(function()
                local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                
                if World1 and plr.Data.Level.Value >= 10 and plr.Data.Level.Value <= 60 then
                    Mon = "Sky Bandit"
                    CFrameMon = CFrame.new(-4953.21, 295.74, -2899.23)
                    
                    local enemy = GetNextEnemy({Mon})
                    if enemy then
                        repeat 
                            task.wait()
                            Attack(enemy)
                        until not getgenv().CrystalCfg["Start Farm method"] or not enemy.Parent or enemy.Humanoid.Health <= 0
                    else
                        topos(CFrameMon)
                        UnEquipWeapon(getgenv().CrystalCfg["Select Weapon"])
                    end
                    return
                end
                
                if plr.Data.Level.Value >= 60 and plr.Data.Level.Value < 2600 then
                    CheckQuest()
                    
                    if not playerGui.Main.Quest.Visible then
                        if (hrp.Position - CFrameQuest.Position).Magnitude > 5 then
                            topos(CFrameQuest)
                        else
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                            task.wait(0.5)
                        end
                        return
                    end
                    
                    local QuestTitle = playerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, NameMon) then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                        return
                    end
                    
                    local enemy = GetNextEnemy({Mon})
                    if enemy then
                        repeat 
                            task.wait()
                            Attack(enemy)
                        until not getgenv().CrystalCfg["Start Farm method"] or not enemy.Parent or enemy.Humanoid.Health <= 0 or not playerGui.Main.Quest.Visible
                    else
                        topos(CFrameMon)
                        UnEquipWeapon(getgenv().CrystalCfg["Select Weapon"])
                    end
                    return
                end
                
                if World3 and plr.Data.Level.Value >= 2600 then
                    local submarineCF = CFrame.new(-16269.4121, 24.7584076, 1371.70752, -0.999348342, -0.00479344372, 0.0357791297, -0.00262145093, 0.998164296, 0.0605080314, -0.036003489, 0.0603748076, -0.997526407)
                    if CFrameQuest and (CFrameQuest.Position - hrp.Position).Magnitude > 10000 then
                        if (hrp.Position - submarineCF.Position).Magnitude > 5 then
                            topos(submarineCF)
                        else
                            local args = {"TravelToSubmergedIsland"}
                            local rf = ReplicatedStorage.Modules.Net:FindFirstChild("RF/SubmarineWorkerSpeak")
                            if rf then
                                rf:InvokeServer(unpack(args))
                            end
                        end
                        return 
                    end
                end
                
                CheckQuest()
                
                if not playerGui.Main.Quest.Visible then
if hrp and hrp.Parent and (hrp.Position - CFrameQuest.Position).Magnitude > 5 then
    topos(CFrameQuest)
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                        task.wait(0.5)
                    end
                    return
                end
                
                local QuestTitle = playerGui.Main.Quest.Container.QuestTitle.Title.Text
                if not string.find(QuestTitle, NameMon) then
                    ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                    return
                end
                
                local enemy = GetNextEnemy({Mon})
                if enemy then
                    repeat 
                        task.wait()
                        Attack(enemy)
                    until not getgenv().CrystalCfg["Start Farm method"] or not enemy.Parent or enemy.Humanoid.Health <= 0 or not playerGui.Main.Quest.Visible
                else
                    topos(CFrameMon)
                    UnEquipWeapon(getgenv().CrystalCfg["Select Weapon"])
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if getgenv().CrystalCfg["Select Farm"] == "Katakuri" and getgenv().CrystalCfg["Start Farm method"] and World3 then
            pcall(function()
                if game:GetService("Workspace").Enemies:FindFirstChild("Dough King") then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Dough King" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                if v.Humanoid.Health > 0 then
                                    repeat 
                                        task.wait()
                                        Attack(v)
                                        if v:FindFirstChild("Humanoid") then
                                            if v.Humanoid:FindFirstChild("Animator") then
                                                v.Humanoid.Animator:Destroy()
                                            end
                                        end
                                    until not getgenv().CrystalCfg["Start Farm method"] or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    end
                    return
                end
                
                if game.ReplicatedStorage:FindFirstChild("Cake Prince") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                    if game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince") then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == "Cake Prince" then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                    if v.Humanoid.Health > 0 then
                                        repeat 
                                            task.wait()
                                            Attack(v)
                                        until not getgenv().CrystalCfg["Start Farm method"] or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        end
                    else
                        if game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 then
                            if (CFrame.new(-1990.672607421875, 4532.99951171875, -14973.6748046875).Position - plr.Character.HumanoidRootPart.Position).Magnitude >= 2000 then
                                topos(CFrame.new(-2151.82153, 149.315704, -12404.9053))
                            end
                        end
                    end
                    return
                end
                
                if getgenv().Crystal and getgenv().Crystal["Accept Quest"] and plr.Data.Level.Value >= 2025 then
                    if not playerGui.Main.Quest.Visible then
                        if (CakeQuestPos.Position - plr.Character.HumanoidRootPart.Position).Magnitude > 5 then
                            topos(CakeQuestPos)
                        else
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", "CakeQuest1", 1)
                            task.wait(0.5)
                        end
                        return
                    end
                    
                    local QuestTitle = playerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, "Cookie Crafter") then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                        return
                    end
                end
                
                if game:GetService("Workspace").Enemies:FindFirstChild("Cookie Crafter") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Guard") or game:GetService("Workspace").Enemies:FindFirstChild("Baking Staff") or game:GetService("Workspace").Enemies:FindFirstChild("Head Baker") then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Cookie Crafter" or v.Name == "Cake Guard" or v.Name == "Baking Staff" or v.Name == "Head Baker" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                if v.Humanoid.Health > 0 then
                                    repeat 
                                        task.wait()
                                        Attack(v)
                                    until not getgenv().CrystalCfg["Start Farm method"] or not v.Parent or v.Humanoid.Health <= 0 or game:GetService("Workspace").Map.CakeLoaf.BigMirror.Other.Transparency == 0 or game:GetService("Workspace").Enemies:FindFirstChild("Dough King") or game:GetService("Workspace").Enemies:FindFirstChild("Cake Prince")
                                end
                            end
                        end
                    end
                else
                    UnEquipWeapon(getgenv().CrystalCfg["Select Weapon"])
                    topos(CakePos)
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if getgenv().CrystalCfg["Select Farm"] == "Bone" and getgenv().CrystalCfg["Start Farm method"] and World3 then
            pcall(function()
                if getgenv().Crystal and getgenv().Crystal["Accept Quest"] and plr.Data.Level.Value >= 2030 then
                    if not playerGui.Main.Quest.Visible then
                        if (BoneQuestPos.Position - plr.Character.HumanoidRootPart.Position).Magnitude > 5 then
                            topos(BoneQuestPos)
                        else
                            ReplicatedStorage.Remotes.CommF_:InvokeServer("StartQuest", "HauntedQuest1", 1)
                            task.wait(0.5)
                        end
                        return
                    end
                    
                    local QuestTitle = playerGui.Main.Quest.Container.QuestTitle.Title.Text
                    if not string.find(QuestTitle, "Reborn Skeleton") then
                        ReplicatedStorage.Remotes.CommF_:InvokeServer("AbandonQuest")
                        return
                    end
                end
                
                if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy") then
                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                        if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                                if v.Humanoid.Health > 0 then
                                    repeat 
                                        task.wait()
                                        Attack(v)
                                    until not getgenv().CrystalCfg["Start Farm method"] or not v.Parent or v.Humanoid.Health <= 0 or (getgenv().Crystal and getgenv().Crystal["Accept Quest"] and not playerGui.Main.Quest.Visible)
                                end
                            end
                        end
                    end
                else
                    if game.ReplicatedStorage:FindFirstChild("Demonic Soul") then
                        for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
                            if v.Name == "Reborn Skeleton" or v.Name == "Living Zombie" or v.Name == "Demonic Soul" or v.Name == "Posessed Mummy" then
                                if v:FindFirstChild("HumanoidRootPart") then
                                    topos(v.HumanoidRootPart.CFrame * CFrame.new(0, 30, 0))
                                    return
                                end
                            end
                        end
                    else
                        topos(BonePos)
                    end
                end
            end)
        end
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        if getgenv().CrystalCfg["Select Farm"] == "Kill Near" and getgenv().CrystalCfg["Start Farm method"] then
            pcall(function()
                local nearestEnemy = nil
                local nearestDistance = math.huge
                
                for _, v in pairs(Workspace.Enemies:GetChildren()) do
                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") then
                        if v.Humanoid.Health > 0 then
                            local distance = (plr.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                            if distance <= (getgenv().CrystalCfg["Set Farm Near"] or 5000) and distance < nearestDistance then
                                nearestDistance = distance
                                nearestEnemy = v
                            end
                        end
                    end
                end
                
                if nearestEnemy then
                    repeat 
                        task.wait()
                        Attack(nearestEnemy)
                    until not getgenv().CrystalCfg["Start Farm method"] or not nearestEnemy.Parent or nearestEnemy.Humanoid.Health <= 0
                end
            end)
        end
    end
end)

MF:Slider({
    Title = "Set Aura Farm",
    Desc = "",
    Min = 1,
    Max = 500,
    Rounding = 2,
    Value = 100,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Set Farm Near"] = c
    end
})

if World1 then
    MaterialList = {
        "Magma Ore",
        "Angel Wings",
        "Scrap Metal and Leather",
        "Fish Tail"
    }
elseif World2 then
    MaterialList = {
        "Radioactive",
        "Mystic Droplet",
        "Magma Ore",
        "Leather",
        "Ectoplasm",
        "Scrap Metal"
    }
elseif World3 then
    MaterialList = {
        "Leather",
        "Scrap Metal",
        "Conjured Cocoa",
        "Dragon Scale",
        "Gunpowder",
        "Fish Tail",
        "Mini Tusk"
    }
end

MF:Dropdown({
    Title = "Select Material",
    Desc = "",
    List = MaterialList,
    Multi = false,
    Value = "",
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Select Material"] = c
    end
})

MF:Toggle({
    Title = "Auto Quest Material",
    Desc = "Auto Take Quest When Farm Material",
    Icon = "rbxassetid://18558566660",
    Value = false,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Auto Quest Material"] = c
    end
})

MF:Toggle({
    Title = "Start Farm Material",
    Desc = "",
    Icon = "rbxassetid://18558566660",
    Value = false,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Start Farm Material"] = c
        StopTween(getgenv().CrystalCfg["Start Farm Material"])
    end
})

spawn(function()
    while wait(0.2) do
        if getgenv().CrystalCfg["Start Farm Material"] then
            pcall(function()
                getConfigMaterial(getgenv().CrystalCfg["Select Material"])
                local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
                
                if getgenv().CrystalCfg["Auto Quest Material"] and MaterialQuest and MyLevel >= MaterialLevelMon then
                    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        local QuestTitle = game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                        local isCorrectQuest = false
                        
                        for i, mon in pairs(MaterialMon) do
                            if string.find(QuestTitle, mon) then
                                isCorrectQuest = true
                                break
                            end
                        end
                        
                        if not isCorrectQuest then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                            wait(0.5)
                        else
                            local gayMob = false
                            for i, mon in pairs(MaterialMon) do
                                if game:GetService("Workspace").Enemies:FindFirstChild(mon) then
                                    for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                        if v.Name == mon then
                                            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                                gayMob = true
                                                repeat
                                                    wait()
                                                    Attack(v)
                                                until not getgenv().CrystalCfg["Start Farm Material"] or not v.Parent or v.Humanoid.Health <= 0
                                            end
                                        end
                                    end
                                end
                            end
                            
                            if not gayMob then
                                if type(MaterialPos) == "table" then
                                    for i, pos in pairs(MaterialPos) do
                                        topos(pos)
                                        wait(2)
                                        local checkMob = false
                                        for j, mon in pairs(MaterialMon) do
                                            if game:GetService("Workspace").Enemies:FindFirstChild(mon) then
                                                checkMob = true
                                                break
                                            end
                                        end
                                        if checkMob then
                                            break
                                        end
                                    end
                                else
                                    topos(MaterialPos)
                                end
                            end
                        end
                    else
                        topos(MaterialQuestPos)
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - MaterialQuestPos.Position).Magnitude <= 5 then
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", MaterialQuest, MaterialLevelQuest)
                            wait(0.5)
                        end
                    end
                else
                    local gayMob = false
                    for i, mon in pairs(MaterialMon) do
                        if game:GetService("Workspace").Enemies:FindFirstChild(mon) then
                            for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                if v.Name == mon then
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        gayMob = true
                                        repeat
                                            wait()
                                            Attack(v)
                                        until not getgenv().CrystalCfg["Start Farm Material"] or not v.Parent or v.Humanoid.Health <= 0
                                    end
                                end
                            end
                        end
                    end
                    
                    if not gayMob then
                        UnEquipWeapon(getgenv().CrystalCfg["Select Weapon"])
                        local Distance = (type(MaterialPos) == "table" and MaterialPos[1].Position or MaterialPos.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                        if Distance > 18000 and getgenv().CrystalCfg["Select Material"] == "Ectoplasm" then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
                        end
                        
                        if type(MaterialPos) == "table" then
                            for i, pos in pairs(MaterialPos) do
                                topos(pos)
                                wait(2)
                                local checkMob = false
                                for j, mon in pairs(MaterialMon) do
                                    if game:GetService("Workspace").Enemies:FindFirstChild(mon) then
                                        checkMob = true
                                        break
                                    end
                                end
                                if checkMob then
                                    break
                                end
                            end
                        else
                            topos(MaterialPos)
                        end
                    end
                end
            end)
        end
    end
end)

if World1 then
    tableMon = {
        "Bandit",
        "Trainee",
        "Monkey",
        "Gorilla",
        "Pirate",
        "Brute",
        "Desert Bandit",
        "Desert Officer",
        "Snow Bandit",
        "Snowman",
        "Chief Petty Officer",
        "Sky Bandit",
        "Dark Master",
        "Prisoner",
        "Dangerous Prisoner",
        "Toga Warrior",
        "Gladiator",
        "Military Soldier",
        "Military Spy",
        "Fishman Warrior",
        "Fishman Commando",
        "God's Guard",
        "Shanda",
        "Royal Squad",
        "Royal Soldier",
        "Galley Pirate",
        "Galley Captain"
    }
elseif World2 then
    tableMon = {
        "Raider",
        "Mercenary",
        "Swan Pirate",
        "Factory Staff",
        "Marine Lieutenant",
        "Marine Captain",
        "Zombie",
        "Vampire",
        "Snow Trooper",
        "Winter Warrior",
        "Lab Subordinate",
        "Horned Warrior",
        "Magma Ninja",
        "Lava Pirate",
        "Ship Deckhand",
        "Ship Engineer",
        "Ship Steward",
        "Ship Officer",
        "Arctic Warrior",
        "Snow Lurker",
        "Sea Soldier",
        "Water Fighter"
    }
elseif World3 then
    tableMon = {
        "Pirate Millionaire",
        "Pistol Billionaire",
        "Dragon Crew Warrior",
        "Dragon Crew Archer",
        "Hydra Enforcer",
        "Venomous Assailant",
        "Marine Commodore",
        "Marine Rear Admiral",
        "Fishman Raider",
        "Fishman Captain",
        "Forest Pirate",
        "Mythological Pirate",
        "Jungle Pirate",
        "Musketeer Pirate",
        "Reborn Skeleton",
        "Living Zombie",
        "Demonic Soul",
        "Posessed Mummy",
        "Peanut Scout",
        "Peanut President",
        "Ice Cream Chef",
        "Ice Cream Commander",
        "Cookie Crafter",
        "Cake Guard",
        "Baking Staff",
        "Head Baker",
        "Cocoa Warrior",
        "Chocolate Bar Battler",
        "Sweet Thief",
        "Candy Rebel",
        "Candy Pirate",
        "Snow Demon",
        "Isle Outlaw",
        "Island Boy",
        "Sun-kissed Warrior",
        "Isle Champion",
        "Serpent Hunter",
        "Skull Slayer",
        "Reef Bandit",
        "Coral Pirate",
        "Sea Chanter",
        "Ocean Prophet",
        "High Disciple",
        "Grand Devotee"
    }
end

MF:Dropdown({
    Title = "Select Mon",
    Desc = "",
    List = tableMon,
    Multi = false,
    Value = "",
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Select Mon"] = c
    end
})

MF:Toggle({
    Title = "Auto Quest Mon",
    Desc = "Auto Take Quest When Farm",
    Icon = "rbxassetid://18558566660",
    Value = false,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Auto Quest Mon"] = c
    end
})

MF:Toggle({
    Title = "Start Kill Mon",
    Desc = "Auto Kill Mon When Spawn",
    Icon = "rbxassetid://18558566660",
    Value = false,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Start Kill Mon"] = c
        StopTween(getgenv().CrystalCfg["Start Kill Mon"])
    end
})

spawn(function()
    while task.wait() do
        if getgenv().CrystalCfg["Start Kill Mon"] and getgenv().CrystalCfg["Select Mon"] then
            pcall(function()
                CheckQuestMon(getgenv().CrystalCfg["Select Mon"])
                local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
                
                if getgenv().CrystalCfg["Auto Quest Mon"] and NameQuest and MyLevel >= LevelMon then
                    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        local QuestTitle = game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                        
                        if not string.find(QuestTitle, NameMon) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                            wait(0.5)
                        else
                            if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == Mon then
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat
                                                wait()
                                                Attack(v)
                                            until not getgenv().CrystalCfg["Start Kill Mon"] or not v.Parent or v.Humanoid.Health <= 0
                                        end
                                    end
                                end
                            else
                                topos(CFrameMon)
                            end
                        end
                    else
                        topos(CFrameQuest)
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameQuest.Position).Magnitude <= 5 then
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuest, LevelQuest)
                            wait(0.5)
                        end
                    end
                else
                    if game:GetService("Workspace").Enemies:FindFirstChild(Mon) then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == Mon then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat
                                        wait()
                                        Attack(v)
                                    until not getgenv().CrystalCfg["Start Kill Mon"] or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild(Mon) then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild(Mon).HumanoidRootPart.CFrame * CFrame.new(0, 10, 5))
                        else
                            topos(CFrameMon)
                        end
                    end
                end
            end)
        end
    end
end)

if World1 then
    Boss = {
        "The Gorilla King",
        "Bobby",
        "The Saw",
        "Yeti",
        "Mob Leader",
        "Vice Admiral",
        "Saber Expert",
        "Warden",
        "Chief Warden",
        "Swan",
        "Magma Admiral",
        "Fishman Lord",
        "Wysper",
        "Thunder God",
        "Cyborg",
        "Ice Admiral",
        "Greybeard"
    }
elseif World2 then
    Boss = {
        "Diamond",
        "Jeremy",
        "Order",
        "Don Swan",
        "Smoke Admiral",
        "Awakened Ice Admiral",
        "Tide Keeper",
        "Darkbeard",
        "Cursed Captain",
        "Order"
    }
elseif World3 then
    Boss = {
        "Stone",
        "Hydra Leader",
        "Kilo Admiral",
        "Captain Elephant",
        "Beautiful Pirate",
        "Cake Queen",
        "Longma",
        "Soul Reaper"
    }
end

MF:Dropdown({
    Title = "Select Boss",
    Desc = "",
    List = Boss,
    Multi = false,
    Value = "",
    Side = "a",
    Callback = function(value)
        getgenv().CrystalCfg["Select Boss"] = value
    end
})

MF:Toggle({
    Title = "Quest Boss",
    Desc = "",
    Icon = "rbxassetid://18558566660",
    Value = false,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Quest Boss"] = c
    end
})

MF:Toggle({
    Title = "Start Kill Boss",
    Desc = "",
    Icon = "rbxassetid://18558566660",
    Value = false,
    Side = "a",
    Callback = function(c)
        getgenv().CrystalCfg["Start Kill Boss"] = c
        StopTween(getgenv().CrystalCfg["Start Kill Boss"])
    end
})
spawn(function()
    while wait() do
        if getgenv().CrystalCfg["Start Kill Boss"] and getgenv().CrystalCfg["Select Boss"] then
            pcall(function()
                CheckBoss(getgenv().CrystalCfg["Select Boss"])
                local MyLevel = game:GetService("Players").LocalPlayer.Data.Level.Value
                local HasQuest = NameQuestBoss ~= nil and QuestData ~= nil
                local CanTakeQuest = MyLevel >= LevelBoss
                
                if getgenv().CrystalCfg["Quest Boss"] and HasQuest and CanTakeQuest then
                    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                        local QuestTitle = game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text
                        
                        if not string.find(QuestTitle, MonBoss) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                            wait(0.5)
                        else
                            if game:GetService("Workspace").Enemies:FindFirstChild(MonBoss) then
                                for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                                    if v.Name == MonBoss then
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            repeat
                                                wait()
                                                Attack(v)
                                            until not getgenv().CrystalCfg["Start Kill Boss"] or not v.Parent or v.Humanoid.Health <= 0
                                        end
                                    end
                                end
                            else
                                topos(PosBoss)
                            end
                        end
                    else
                        topos(PosQuest)
                        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - PosQuest.Position).Magnitude <= 5 then
                            wait(0.5)
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", NameQuestBoss, QuestData)
                            wait(0.5)
                        end
                    end
                else
                    if game:GetService("Workspace").Enemies:FindFirstChild(MonBoss) then
                        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
                            if v.Name == MonBoss then
                                if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                    repeat
                                        wait()
                                        Attack(v)
                                    until not getgenv().CrystalCfg["Start Kill Boss"] or not v.Parent or v.Humanoid.Health <= 0
                                end
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage"):FindFirstChild(MonBoss) then
                            topos(game:GetService("ReplicatedStorage"):FindFirstChild(MonBoss).HumanoidRootPart.CFrame * CFrame.new(0, 10, 5))
                        else
                            topos(PosBoss)
                        end
                    end
                end
            end)
        end
    end
end)


game:GetService("Players").PlayerRemoving:Connect(function(playerLeaving)
    if playerLeaving == LocalPlayer then
        StopTween()
        if attackConnection then attackConnection:Disconnect() end
        if cleanConnection then cleanConnection:Disconnect() end
        if getgenv().noclipConnection then getgenv().noclipConnection:Disconnect() end
    end
end)
print("God Hub Main.lua")