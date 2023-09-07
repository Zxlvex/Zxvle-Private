local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()


local Window = Fluent:CreateWindow({
    Title = "Drain ⁠✧" .. Fluent.Version,
    SubTitle = "by Zxvle",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Universel", Icon = "code-2" }),
    BloxFruit = Window:AddTab({ Title = "Blox fruit", Icon = "app-window"}),
    Reality = Window:AddTab({ Title = "Fe scripts", Icon = "app-window"}),
    Credits = Window:AddTab({ Title = "Credits", Icon = "code-2"})
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Zxvle",
        Content = "Now in blalant mode",
        SubContent = "SubContent", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })

    Tabs.BloxFruit:AddParagraph({
        Title = "Note!",
        Content = "I do not own any scripts seen in here, only some in Universal"
    })

    Tabs.Main:AddButton({
        Title = "DarkDex",
        Description = "Roblox explore",
        Callback = function()
            Window:Dialog({
                Title = "Inject Dex?",
                Content = "A powerful Script!",
                Buttons = {
                    {
                        Title = "Injects",
                        Callback = function()
                            getgenv().Key = "Bash"
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AIY%20Dex",true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })


    Tabs.Main:AddButton({
        Title = "VxpeV4 ⁠コ⁠⁠彡",
        Description = "Very important button",
        Callback = function()
            Window:Dialog({
                Title = "Inject VxpeV4?",
                Content = "Uses Config if u only have one for",
                Buttons = {
                    {
                        Title = "Injectes",
                        Callback = function()
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Refused to use Vxpe")
                        end
                    }
                }
            })
        end
    })

    Tabs.BloxFruit:AddButton({
        Title = "Zamex Hub",
        Description = "Blox fruit hub!",
        Callback = function()
            Window:Dialog({
                Title = "Inject Zamex?",
                Content = "Blox fruit script!",
                Buttons = {
                    {
                        Title = "Injecte?",
                        Callback = function()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/Sixnumz/ZamexMobile/main/Zamex_Mobile.lua'))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Refused to Inject")
                        end
                    }
                }
            })
        end
    })

   Tabs.BloxFruit:AddButton({
        Title = "Anime Hub/bf hub",
        Description = "Hub for blox fruit",
        Callback = function()
            Window:Dialog({
                Title = "Inject Anime hub?",
                Content = "blox fruit script",
                Buttons = {
                    {
                        Title = "Injecte?",
                        Callback = function()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/ScriptBloxOfficial/Script/main/Anime%20Hub'))() 
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })


        Tabs.BloxFruit:AddButton({
        Title = "TAWAN hubV2",
        Description = "Very good for raid",
        Callback = function()
            Window:Dialog({
                Title = "Inject TawanV2?",
                Content = "ONLY FOR BLOX FRUITS!",
                Buttons = {
                    {
                        Title = "Inject?",
                        Callback = function()
                            loadstring(game:HttpGet('https://raw.githubusercontent.com/kill55547/TAWAN_HUB/main/TAWANxHUB_V2.lua.txt', true))()
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

    local Keybind = Tabs.Main:AddKeybind("Keybind", {
        Title = "KeyBind",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

        -- Occurs when the keybind is clicked, Value is `true`/`false`
        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,

        -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })

    -- OnClick is only fired when you press the keybind and the mode is Toggle
    -- Otherwise, you will have to use Keybind:GetState()
    Keybind:OnClick(function()
        print("Keybind clicked:", Keybind:GetState())
    end)

    Keybind:OnChanged(function()
        print("Keybind changed:", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)

            -- example for checking if a keybind is being pressed
            local state = Keybind:GetState()
            if state then
                print("Keybind is being held down")
            end

            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold


    local Input = Tabs.Main:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)
end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("Zxvle privateV1")
SaveManager:SetFolder("Zxvle/Universal")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Zxvle",
    Content = ("Game loaded at:"),
    Duration = 5.7,
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig() 
