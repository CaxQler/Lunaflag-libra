local Lunaflag = loadstring(game:HttpGet("https://raw.githubusercontent.com/CaxQler/Lunaflag-libra/refs/heads/main/Library.lua"))() 
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/CaxQler/Lunaflag-libra/refs/heads/Lib/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/CaxQler/Lunaflag-libra/refs/heads/Lib/SaveManager.lua"))()
local Window = Lunaflag:CreateWindow({
    Title = "Lunaflag UI",
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local MainTab = Window:AddTab("Main")
local MiscTab = Window:AddTab("Misc")

local LeftGroup = MainTab:AddLeftGroupbox("Combat")

LeftGroup:AddToggle("MyToggle", {
    Text = "Enable Feature",
    Default = false,
    Tooltip = "Short description",
    Callback = function(Value)
        print("Toggle =", Value)
    end
})

LeftGroup:AddToggle("Aimbot", {
    Text = "Aimbot",
    Default = false,
    Callback = function(Value)
        print("Aimbot:", Value)
    end
}):AddKeyPicker("AimbotKey", {
    Default = "E",
    Mode = "Toggle",
    Text = "Aimbot Key",
    Callback = function(Value)
        print("Key pressed state:", Value)
    end
})

LeftGroup:AddSlider("MySlider", {
    Text = "Speed",
    Default = 16,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Suffix = " studs",
    Callback = function(Value)
        print("Speed =", Value)
    end
})

LeftGroup:AddDropdown("MyDropdown", {
    Text = "Select Mode",
    Values = {"Mode 1", "Mode 2", "Mode 3"},
    Default = 1,
    Callback = function(Value)
        print("Selected:", Value)
    end
})

LeftGroup:AddDropdown("MultiDropdown", {
    Text = "Select Multiple",
    Values = {"Apple", "Banana", "Orange"},
    Default = {"Apple"},
    Multi = true,
    Callback = function(Value)
        print("Selected table:", Value)
    end
})

LeftGroup:AddDropdown("PlayerDropdown", {
    Text = "Select Player",
    SpecialType = "Player",
    Callback = function(Value)
        print("Player:", Value)
    end
})

LeftGroup:AddInput("MyInput", {
    Text = "Username",
    Default = "",
    Placeholder = "Type here...",
    Numeric = false,
    Finished = true,
    Callback = function(Value)
        print("Input:", Value)
    end
})

LeftGroup:AddButton({
    Text = "Click Me",
    Func = function()
        Lunaflag:Notify("Button clicked!", 3)
    end
})

LeftGroup:AddButton({
    Text = "Dangerous Action",
    DoubleClick = true,
    Func = function()
        print("Confirmed!")
    end
})

LeftGroup:AddDivider()
LeftGroup:AddLabel("Normal label")
LeftGroup:AddLabel("Long text that can wrap", true)

local RightGroup = MainTab:AddRightGroupbox("Visuals")

RightGroup:AddLabel("ESP Color"):AddColorPicker("ESPColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "ESP Color",
    Callback = function(Color)
        print("Color changed:", Color)
    end
})

RightGroup:AddLabel("Fill Color"):AddColorPicker("FillColor", {
    Default = Color3.fromRGB(0, 255, 0),
    Transparency = 0.5,
    Title = "Fill",
    Callback = function(Color)
        print(Color)
    end
})

local DepBox = LeftGroup:AddDependencyBox()
DepBox:SetupDependencies({
    { Toggles.MyToggle, true }
})

DepBox:AddSlider("DepSlider", {
    Text = "Only show when toggle on",
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Callback = function(v) end
})

ThemeManager:SetLibrary(Lunaflag)
SaveManager:SetLibrary(Lunaflag)

SaveManager:IgnoreThemeSettings()

ThemeManager:SetFolder("LunaflagSettings")
SaveManager:SetFolder("LunaflagSettings")

ThemeManager:ApplyToTab(MiscTab)
SaveManager:BuildConfigSection(MiscTab)

local UIBox = MiscTab:AddRightGroupbox("UI")

UIBox:AddLabel("Menu Key"):AddKeyPicker("MenuKey", {
    Default = "RightControl",
    Mode = "Toggle",
    Text = "Menu",
    Callback = function() end
})

Lunaflag.ToggleKeybind = Options.MenuKey

UIBox:AddDivider()

UIBox:AddButton({
    Text = "Unload UI",
    DoubleClick = true,
    Func = function()
        Lunaflag:Unload()
    end
})

Lunaflag:SetWatermark("Lunaflag | v1.0")
Lunaflag:SetWatermarkVisibility(true)

SaveManager:LoadAutoloadConfig()

Lunaflag:Notify("Lunaflag loaded successfully!", 4)
