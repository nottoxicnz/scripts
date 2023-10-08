getgenv().autoPlace = false
getgenv().autoUpgrade = false
getgenv().autoRetry = false

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Test',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})
local Tabs = {
    Main = Window:AddTab('Farm'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('FarmTab')
LeftGroupBox:AddToggle('AutoPlace', {
    Text = 'AutoPlace',
    Default = false, 
    Tooltip = 'AutoPlaces Unit', 

    Callback = function(Value)
        getgenv().autoPlace = Value
    end
})
LeftGroupBox:AddToggle('AutoUpgrade', {
    Text = 'AutoUpgrade',
    Default = false, 
    Tooltip = 'AutoPlaces Unit', 

    Callback = function(Value)
        getgenv().autoUpgrade = Value
    end
})
LeftGroupBox:AddToggle('AutoRetry', {
    Text = 'AutoRetry',
    Default = false, 
    Tooltip = 'AutoPlaces Unit', 

    Callback = function(Value)
        getgenv().autoRetry = Value
    end
})

task.spawn(function ()
    while task.wait() do
        if getgenv().autoPlace then
            if game.Players.LocalPlayer.PlayerGui.PlayerUI.TowerLimit["5"].Limit.TextLabel.Text == "0/3" then
                repeat 
                    local args = {
                        [1] = "Falcon Eye (Amulet)",
                        [2] = CFrame.new(-1105.81787109375, 6.0028533935546875, -329.9661865234375) * CFrame.Angles(-0, 0, -0),
                        [3] = 1100
                    }
                    
                    game:GetService("ReplicatedStorage").Functions.SpawnTower:InvokeServer(unpack(args))
            task.wait(0.1)
                until
                game.Players.LocalPlayerPlayerGui.PlayerUI.TowerLimit["5"].Limit.TextLabel.Text == "3/3"
            end
        end
    end
end)

task.spawn(function ()
    while task.wait() do
        if getgenv().autoUpgrade then
            local args = {
                [1] = workspace.Running.Towers:FindFirstChild("Falcon Eye (Amulet)")
            }

            game:GetService("ReplicatedStorage").Functions.UpgradeTower:InvokeServer(unpack(args))
        end
    end
end)

task.spawn(function ()
    while task.wait() do
        if getgenv().autoRetry then
            if game:GetService("Players").LocalPlayer.PlayerGui.PlayerUI.WinScreen.Visible == true then
                game:GetService("ReplicatedStorage").Events.Game.ReplayGame:InvokeServer()
            end
        end
    end
end)
