local lp = game.Players.LocalPlayer
local character = lp.Character or lp.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local speed = 350
local flying = false
local targetPosition = nil
local tpIsland = nil
local waterBase = nil
local air = nil
local noclip = false
local runService = game:GetService("RunService")
local InstantMoveStatus = false
local MoveRange = 150
local yair = nil
local TPBodyMaxRange = 150
local TpBodyStatus = false
local function getAllIslands()
    local islands = {}
    local mapFolder = game.Workspace:FindFirstChild("Map")
    if mapFolder then
        for _, island in pairs(mapFolder:GetChildren()) do
            if island:IsA("Model") then
                table.insert(islands, island.Name)
            end
        end
    end
    return islands
end
local function createWaterBase()
    if waterBase then return end
    waterBase = Instance.new("Part")
    waterBase.Size = Vector3.new(50, 1, 50)
    waterBase.Position = Vector3.new(hrp.Position.X, -4.5, hrp.Position.Z)
    waterBase.Anchored = true
    waterBase.Transparency = 1
    waterBase.CanCollide = true
    waterBase.Parent = game.Workspace
    game:GetService("RunService").RenderStepped:Connect(function()
        if hrp and waterBase then
            waterBase.Position = Vector3.new(hrp.Position.X, -4.5, hrp.Position.Z)
        end
    end)
end
local function removeWaterBase()
    if waterBase then
        waterBase:Destroy()
        waterBase = nil
    end
end
local function onGodMovement()
    if air then return end
    local character = lp.Character or lp.CharacterAdded:Wait()
    hrp = character:WaitForChild("HumanoidRootPart") 
    air = Instance.new("Part")
    air.Size = Vector3.new(50, 1, 50)
    yair = hrp.Position.Y - 4
    air.Position = Vector3.new(hrp.Position.X, yair, hrp.Position.Z)
    air.Anchored = true
    air.Transparency = 1
    air.CanCollide = true
    air.Parent = game.Workspace
    game:GetService("RunService").RenderStepped:Connect(function()
        if hrp and air then
            air.Position = Vector3.new(hrp.Position.X, yair, hrp.Position.Z)
        end
    end)
end
local function offGodMovement()
    if air then
        air:Destroy()
        air = nil
    end
end
lp.CharacterAdded:Connect(function(character)
    character:WaitForChild("HumanoidRootPart")
    hrp = character:FindFirstChild("HumanoidRootPart")
    yair = hrp.Position.Y - 4
    if waterBase then
        removeWaterBase()
        createWaterBase()
    end
    if noclip then
        enableNoClip()
    end
end)
local function enableNoClip()
    noclip = true
    runService.Stepped:Connect(function()
        if noclip and lp.Character then
            for _, part in pairs(lp.Character:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
end
local function disableNoClip()
    noclip = false
    if lp.Character then
        for _, part in pairs(lp.Character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end
local function toggleFly(pos)
    if pos then
        targetPosition = pos
        flying = true
    else
        flying = false
        if lp.Character and hrp then
            lp.Character.Humanoid.PlatformStand = false
            hrp.Velocity = Vector3.new(0, -5, 0)
        end
        return
    end
    lp.Character.Humanoid.PlatformStand = true
    hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    local dis1 = math.abs((targetPosition - hrp.Position).Magnitude)
    local sky1 = Vector3.new(-4607, 872, -1667)
    local sky2 = Vector3.new(-7894, 5545, -380)
    local sea1 = Vector3.new(3864, 6, -1926)
    local sea2 = Vector3.new(61163, 11, 1819)
    local dis2 = math.abs((targetPosition - sky1).Magnitude)
    local dis3 = math.abs((targetPosition - sky2).Magnitude)
    local dis4 = math.abs((targetPosition - sea1).Magnitude)
    local dis5 = math.abs((targetPosition - sea2).Magnitude)
    if dis2 < dis1 and dis2 < dis3 and dis2 < dis4 and dis2 < dis5 then
        local args = {
            [1] = "requestEntrance",
            [2] = Vector3.new(-4607.8232421875, 874.3909912109375, -1667.5570068359375)
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
        local args = {
            [1] = "SetLastSpawnPoint",
            [2] = "Sky"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Location"):FireServer()
    end
    if dis3 < dis1 and dis3 < dis2 and dis3 < dis4 and dis3 < dis5 then
        local args = {
            [1] = "requestEntrance",
            [2] = Vector3.new(-7894.6181640625, 5547.14208984375, -380.2909851074219)
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
        local args = {
            [1] = "SetLastSpawnPoint",
            [2] = "Sky2"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
        local args = {
            [1] = workspace:WaitForChild("_WorldOrigin"):WaitForChild("EnemyRegions"):WaitForChild("Region90")
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Location"):FireServer(unpack(args))
    end
    if dis4 < dis1 and dis4 < dis2 and dis4 < dis3 and dis4 < dis5 then
        local args = {
        [1] = "requestEntrance",
        [2] = Vector3.new(3864.68798828125, 6.73699951171875, -1926.2139892578125)
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end
    if dis5 < dis1 and dis5 < dis2 and dis5 < dis3 and dis5 < dis4 then
        local args = {
        [1] = "requestEntrance",
        [2] = Vector3.new(61163.8515625, 11.680007934570312, 1819.7840576171875)
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer(unpack(args))
    end
    while flying and targetPosition do
        hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then break end
        local directionToTarget = (targetPosition - hrp.Position).unit
        hrp.Velocity = directionToTarget * speed
        if (hrp.Position - targetPosition).Magnitude < 5 then
            targetPosition = nil
            flying = false
            hrp.Velocity = Vector3.new(0, -5, 0)
            lp.Character.Humanoid.PlatformStand = false
        end
        wait()
    end
end
function teleportForward(distance)
    local player = game.Players.LocalPlayer
    if InstantMoveStatus and player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = player.Character.HumanoidRootPart
        local direction = hrp.CFrame.LookVector
        hrp.CFrame = hrp.CFrame + (direction * distance)
    end
end
function getNearestPlayer()
    local players = game:GetService("Players")
    local localPlayer = players.LocalPlayer
    if not localPlayer or not localPlayer.Character or not localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        return nil
    end
    local rootPart = localPlayer.Character.HumanoidRootPart
    local nearestPlayer = nil
    local shortestDistance = math.huge
    for _, player in pairs(players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local targetRootPart = player.Character.HumanoidRootPart
            local distance = (rootPart.Position - targetRootPart.Position).Magnitude     
            if distance < shortestDistance then
                shortestDistance = distance
                nearestPlayer = player
            end
        end
    end
    if nearestPlayer and nearestPlayer.Character then
        return nearestPlayer.Character.HumanoidRootPart.Position
    else
        return nil
    end
end
local function teleportToNearestPlayer()
    if not TpBodyStatus then
        return nil
    end
    lp.Character.Humanoid.PlatformStand = true
    hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
    local nearestPosition = getNearestPlayer()
    if nearestPosition == nil then 
        return 
    end
    local userPosition = hrp.Position
    local dis = math.abs((nearestPosition - userPosition).Magnitude)
    if dis <= TPBodyMaxRange then
        lp.Character.HumanoidRootPart.CFrame = CFrame.new(nearestPosition)
    end
end
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Castorice Hub",
   Icon = "candy-cane",
   LoadingTitle = "Castorice Hub Loading...",
   LoadingSubtitle = "by BaoBao",
   Theme = "Bloom",
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true, 
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Castorice Hub"
   },
   Discord = {
      Enabled = false, 
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Castorice Hub",
      Subtitle = "Key System",
      Note = "Use the key provided by the admin.",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"BaoBaoDZ1337"}
   }
})
local MovementTab = Window:CreateTab("Movement", "move")
local MmToggle1 = MovementTab:CreateToggle({
    Name = "Instant Move",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        InstantMoveStatus = Value
    end,
})
local MmSlider1 = MovementTab:CreateSlider({
    Name = "Move Range",
    Range = {0, 300},
    Increment = 10,
    Suffix = "Meter",
    CurrentValue = 150,
    Flag = "Slider1",
    Callback = function(Value)
        MoveRange = Value
    end,
})
local MmKeybind1 = MovementTab:CreateKeybind({
    Name = "Instant Move Key Bind",
    CurrentKeybind = "LeftAlt",
    HoldToInteract = false,
    Flag = "Keybind1", 
    Callback = function(Keybind)
        teleportForward(MoveRange)
    end,
})
local MmToggle2 = MovementTab:CreateToggle({
    Name = "God Movement",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if Value then
            onGodMovement()
        else
            offGodMovement()
        end
    end,
})
local MmKeybind2 = MovementTab:CreateKeybind({
    Name = "Up Keybind",
    CurrentKeybind = "Space",
    HoldToInteract = false,
    Flag = "Keybind1", 
    Callback = function(Keybind)
        wait(0.3)
        yair = hrp.Position.y - 2
    end,
})
local MmKeybind3 = MovementTab:CreateKeybind({
    Name = "Down Keybind",
    CurrentKeybind = "LeftAlt",
    HoldToInteract = false,
    Flag = "Keybind1", 
    Callback = function(Keybind)
        yair = yair - 10
    end,
})
local MmToggle3 = MovementTab:CreateToggle({
    Name = "TP Body",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        TpBodyStatus = Value
    end,
})
local MmSlider2 = MovementTab:CreateSlider({
    Name = "Player Range",
    Range = {0, 300},
    Increment = 10,
    Suffix = "Meter",
    CurrentValue = 150,
    Flag = "Slider1",
    Callback = function(Value)
        TPBodyMaxRange = Value
    end,
})
local MmKeybind4 = MovementTab:CreateKeybind({
    Name = "TP Body keybind",
    CurrentKeybind = "LeftAlt",
    HoldToInteract = false,
    Flag = "Keybind1", 
    Callback = function(Keybind)
        teleportToNearestPlayer()
    end,
})
local TeleportTab = Window:CreateTab("Teleport", "map-pin")
local TPDropdown1 = TeleportTab:CreateDropdown({
    Name = "Place",
    Options = getAllIslands(),
    CurrentOption = nil,
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Options)
        tpIsland = Options[1]
    end,
})
local TPButton1 = TeleportTab:CreateButton({
    Name = "Teleport",
    Callback = function()
        if tpIsland then
            local mapFolder = game.Workspace:FindFirstChild("Map")
            if mapFolder then
                for _, island in pairs(mapFolder:GetChildren()) do
                    if island:IsA("Model") and island.Name == tpIsland then
                        local islandPos = island:GetBoundingBox().Position
                        enableNoClip()
                        toggleFly(islandPos)
                        disableNoClip()
                        break
                    end
                end
            end
        end
    end,
})
local MiscTab = Window:CreateTab("Misc", "list-collapse")
local MiscToggle1 = MiscTab:CreateToggle({
   Name = "No Clip",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
        if Value then
           enableNoClip()
        else
            disableNoClip()
        end
   end,
})
local MiscToggle2 = MiscTab:CreateToggle({
    Name = "Walk On Water",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
         if Value then
            createWaterBase()
         else
            removeWaterBase()
         end
    end,
})
local Button = MiscTab:CreateButton({
    Name = "Shut down",
    Callback = function()
        Rayfield:Destroy()
    end,
})