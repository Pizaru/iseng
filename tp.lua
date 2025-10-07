--// GUI SETUP
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TeleportGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 220, 0, 60)
MainFrame.Position = UDim2.new(0.5, -110, 0.9, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 2
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0.4, 0)
Title.BackgroundTransparency = 1
Title.Text = "Teleport Menu"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.Parent = MainFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(1, -10, 0.5, 0)
ToggleButton.Position = UDim2.new(0, 5, 0.45, 0)
ToggleButton.Text = "Teleport OFF"
ToggleButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ToggleButton.TextColor3 = Color3.fromRGB(255,255,255)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 22
ToggleButton.Parent = MainFrame

--// TELEPORT POSITIONS
local teleportPositions = {
    Vector3.new(47, 12, 315),
    Vector3.new(-62, 60, -1013),
    Vector3.new(-518, 32, -1450),
    Vector3.new(-1098, 100, -1666),
    Vector3.new(-1384, 91, -2036),
    Vector3.new(-1961, 20, -2010),
    Vector3.new(-2386, 186, -2402),
    Vector3.new(-2686, 236, -2899),
    Vector3.new(-3021, 371, -3362),
    Vector3.new(-3703, 664, -4244),
    Vector3.new(-3901, 824, -5058),
    Vector3.new(-3725, 946, -5453),
    Vector3.new(-3142, 1280, -6442),
    Vector3.new(-2529, 1580, -6528),
    Vector3.new(-2291, 1728, -7814),
    Vector3.new(-2374, 2060, -9781),
    Vector3.new(-2441, 2136, -10296)
}

--// VARIABLES
local teleporting = false

--// TELEPORT FUNCTION (loop sampai OFF)
local function startTeleport()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    while teleporting do
        for _, pos in ipairs(teleportPositions) do
            if not teleporting then break end
            local hrp = character:WaitForChild("HumanoidRootPart")
            hrp.CFrame = CFrame.new(pos)
            task.wait(0.4) -- jeda antar teleport (ubah sesuai keinginan)
        end
    end
end

--// BUTTON FUNCTION
ToggleButton.MouseButton1Click:Connect(function()
    teleporting = not teleporting
    if teleporting then
        ToggleButton.Text = "Teleport ON"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        task.spawn(startTeleport)
    else
        ToggleButton.Text = "Teleport OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    end
end)
