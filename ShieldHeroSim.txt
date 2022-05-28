getgenv().autoSell = false;
getgenv().autoBuysword = false;
getgenv().autoBuyshield = false;
getgenv().autoCoins = false;
getgenv().autoChest = false;
------------------------------------------
local player = game.Players.LocalPlayer



-------------------------------------------
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("ShieldHeroSim") -- Creates the window

local b = w:CreateFolder("Autofarm") -- Creates the folder(U will put here your buttons,etc)

local c = w:CreateFolder("Misc")


local selectedShields;
b:Dropdown("Shields",{"Basic Shield","Basic Shield DarkGreen","Basic Shield Red","Basic Shield Yellow","Basic Shield Orange","Basic Shield Blue","Basic Shield Cyan","Basic Shield Purple","Basic Shield Magenta","Basic Shield Pink","Basic Shield Brown","Basic Shield White","Basic Shield Gray","Basic Shield Dark","Upgraded Shield","Upgraded Shield DarkGreen","Upgraded Shield Red","Upgraded Shield Yellow","Upgraded Shield Orange","Upgraded Shield Blue","Upgraded Shield Cyan","Upgraded Shield Purple","Upgraded Shield Magenta","Upgraded Shield Pink","Upgraded Shield Brown","Upgraded Shield White","Upgraded Shield Gray","Upgraded Shield Dark","Forest Shield","Forest Shield DarkGreen","Forest Shield Red","Forest Shield Yellow","Forest Shield Orange","Forest Shield Blue","Forest Shield Cyan","Forest Shield Purple","Forest Shield Magenta","Forest Shield Pink","Forest Shield Brown","Forest Shield White","Forest Shield Gray","Forest Shield Dark","Bubble Shield","Bubble Shield Blue","Bubble Shield Green","Bubble Shield DarkGreen","Bubble Shield Red","Bubble Shield Yellow","Bubble Shield Orange","Bubble Shield Purple","Bubble Shield Magenta","Bubble Shield Pink","Bubble Shield Brown","Bubble Shield White","Bubble Shield Gray","Bubble Shield Dark","Shell Shield","Shell Shield Blue","Shell Shield Green","Shell Shield DarkGreen","Shell Shield Red","Shell Shield Yellow","Shell Shield Orange","Shell Shield Purple","Shell Shield Magenta","Shell Shield Pink","Shell Shield Brown","Shell Shield White","Shell Shield Gray","Shell Shield Dark","Ice Shield","Ice Shield Blue","Ice Shield Green","Ice Shield DarkGreen","Ice Shield Red","Ice Shield Yellow","Ice Shield Orange","Ice Shield Purple","Ice Shield Magenta","Ice Shield Pink","Ice Shield Brown","Ice Shield Dark","Shield Prison"},true,function(value)
    selectedShields = value;
end)

local selectedRank;
b:Dropdown("Ranks",{"None",1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24},true,function(value)
    selectedRank = value;
end)


b:Toggle("BuyAllSwords",function(bool)
    getgenv().autoBuysword = bool
    if bool then
        buySword()
    end
end)


b:Toggle("BuyAllShields",function(bool)
    getgenv().autoBuyshield = bool
    if bool then
        buyShield()
    end
end)


b:Toggle("AutoSell",function(bool)
    getgenv().autoSell = bool
    if bool then
        autoSell()
    end
end)


b:Toggle("AutoCoins",function(bool)
    getgenv().autoCoins = bool
    if bool and selectedShields then
        autoHit()
    end
end)


c:Toggle("CollectChest",function(bool)
    getgenv().autoChest = bool
    if bool then 
        tpChest()
    end
end)


c:Button("Gamepass",function()
    game:GetService("Players").nottoxicnz.Gamepasses.TripleHatch.Value = true
    game:GetService("Players").nottoxicnz.Gamepasses.Teleport.Value = true
end
end)





function buySword()
    spawn(function()
        while getgenv().autoBuysword == true do
     local event = game:GetService("ReplicatedStorage").Modules.Events.BuyItem
        event:InvokeServer("Sword","Sword","BuyAll")
        wait()
        end
    end)
end

function buyShield()
    spawn(function()
        while getgenv().autoBuyshield == true do
    local event = game:GetService("ReplicatedStorage").Modules.Events.BuyItem
        event:InvokeServer("Backpack","Backpack","BuyAll")
        wait()
        end
    end)
end


function  autoSell()
    spawn(function()
        while getgenv().autoSell == true do
            for _,v in pairs(game:GetService("Workspace").Sells["Sell-Island_9"].Touch:GetChildren()) do
                if v:IsA("TouchTransmitter")  then
                     firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 0) --0 is touch
                     wait()
                    firetouchinterest(player.Character.HumanoidRootPart, v.Parent, 1) -- 1 is untouch
                    wait()
                end
            end
        end
    end)
end


function tpChest()
    spawn(function ()
        while getgenv().autoChest == true do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1383.8468, 358.71106, -1426.67358)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(143.248993, 367.50351, 110.981834)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-332.781433, 363.321808, 334.672485)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(242.815567, 368.377808, 237.026398)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-753.281433, 363.821808, 157.172623)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1146.34521, 363.82193, 144.755569)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1449.62549, 364.688629, 328.203583)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1658.54736, 364.691071, 154.032349)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2059.25977, 364.69693, 317.330505)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1766.22046, 370.394196, 584.547974)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2426.75977, 364.69693, 152.830627)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2828.90503, 373.747498, 205.322281)
            wait(0.5)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(306.617981, 366.5, 242.179001)
            wait()
        end
    end)
end



b:Button("Rank",function()
    if selectedRank then
    local Event = game:GetService("ReplicatedStorage").Modules.Events.BuyItem
    Event:InvokeServer(selectedRank,"Class","Buy")
end
end)


function autoHit()
    spawn(function()
        while getgenv().autoCoins == true do
            if selectedShields then
                local event = game:GetService("ReplicatedStorage").Modules.Events.Sword
                event:FireServer(selectedShields)
                wait()
            end;
        end;
    end)
end

