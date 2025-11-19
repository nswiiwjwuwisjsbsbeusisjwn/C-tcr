# Cat UI Library Documentation

A modern, feature-rich UI library for Roblox with beautiful animations, customizable elements, and mobile support.

---

## 📋 Table of Contents

- [Getting Started](#getting-started)
- [Creating a Window](#creating-a-window)
- [Notifications](#notifications)
- [Creating Tabs](#creating-tabs)
- [UI Elements](#ui-elements)
  - [Toggle](#toggle)
  - [Button](#button)
  - [Slider](#slider)
  - [Textbox](#textbox)
  - [Dropdown](#dropdown)
  - [Keybind](#keybind)
  - [Label](#label)
  - [Paragraph](#paragraph)
  - [Discord](#discord)
  - [Image Thumbnail](#image-thumbnail)
  - [Code Editor](#code-editor)
  - [Checkbox List](#checkbox-list)
- [Customization](#customization)
- [Examples](#examples)

---

## 🚀 Getting Started

Load the Cat UI Library into your script:

```lua
local Cat = loadstring(game:HttpGet("your-library-url"))()
```

---

## 🪟 Creating a Window

Create the main window for your UI:

```lua
local Window = Cat:Window({
    Title = "My Hub",
    Desc = "Version 1.0",
    IconTile = "rbxassetid://123456", -- Optional icon next to title
    SizeUi = "520,340", -- Width,Height (default: 520x340)
    Theme = "rbxassetid://789012" -- Optional background image
})
```

### Parameters:
- **Title**: Main window title
- **Desc**: Subtitle/description
- **IconTile**: Optional icon displayed next to title
- **SizeUi**: Window dimensions (format: "width,height")
- **Theme**: Optional background image for the window

### Features:
- **Draggable**: Click and drag the window to move it
- **Resizable**: Two-finger pinch gesture on mobile to resize
- **Close Button**: F2 key or UI button to toggle visibility

---

## 🔔 Notifications

Show toast notifications to users:

```lua
Cat:Notify({
    Title = "Success",
    Title1 = "by Developer", -- Optional secondary title
    Content = "Action completed!",
    Logo = "rbxassetid://123456",
    Type = "Success", -- "Success", "Error", "Warning", "Info"
    Time = 0.5, -- Animation time
    Delay = 5 -- Display duration
})
```

### Notification Types:
- **Success**: Green checkmark icon
- **Error**: Red X icon  
- **Warning**: Yellow warning icon
- **Info**: Blue info icon

---

## 📑 Creating Tabs

Add tabs to organize your UI elements:

```lua
local MainTab = Window.Tabs:Add({
    Title = "Main",
    Desc = "Main features", -- Shows under icon when Icon is provided
    Banner = "rbxassetid://123456", -- Tab card background
    Icon = "rbxassetid://789012", -- Optional small icon
    Columns = 2 -- 1 or 2 columns (default: 1)
})
```

### Tab Features:
- **Search Bar**: Automatically included for filtering elements
- **Badge Counter**: Shows number of elements in the tab
- **Animated Transitions**: Smooth animations when switching tabs
- **Column Layouts**: Choose 1 or 2 column layouts

### Column System:
- **Columns = 1**: Single column (full width)
- **Columns = 2**: Two columns (Left and Right sides)

---

## 🎨 UI Elements

### Toggle

Create on/off switches with optional icons:

```lua
-- Simple Toggle
local Toggle = MainTab:Toggle({
    Title = "Auto Farm",
    Desc = "Automatically farm resources",
    Value = false,
    Side = "l", -- "l" (left) or "r" (right) for 2-column layouts
    ShowStatusText = true, -- Show ON/OFF text
    StatusTextType = "OnOff", -- "OnOff" or "TrueFalse"
    Callback = function(value)
        print("Toggle:", value)
    end
})

-- Toggle with Icon
local IconToggle = MainTab:Toggle({
    Title = "Speed Boost",
    Desc = "Increase movement speed",
    Icon = "rbxassetid://123456",
    Value = false,
    Callback = function(value)
        -- Your code
    end
})
```

#### Methods:
```lua
Toggle:SetValue(true) -- Set toggle state
Toggle:GetValue() -- Returns current state
Toggle:SetTitle("New Title")
Toggle:SetDesc("New Description")
Toggle:SetIcon("rbxassetid://...")
Toggle:Visible(false) -- Hide/show element
Toggle:ShowStatus(true) -- Show/hide status text
Toggle:SetStatusTextType("OnOff") -- Change status text type
```

---

### Button

Create clickable buttons:

```lua
-- Simple Button
local Button = MainTab:Button({
    Title = "Execute",
    Callback = function()
        print("Button clicked!")
    end
})

-- Button with Icon & Description
local IconButton = MainTab:Button({
    Title = "Teleport",
    Desc = "Go to spawn",
    Icon = "rbxassetid://123456",
    Side = "r",
    Callback = function()
        -- Teleport code
    end
})
```

#### Methods:
```lua
Button:Fire() -- Programmatically trigger button
Button:UpdateTitle("New Text") -- or Button:Title("...")
Button:Desc("New description")
Button:Icon("rbxassetid://...")
Button:Visible(true)
```

---

### Slider

Create value sliders:

```lua
local Slider = MainTab:Slider({
    Title = "Walk Speed",
    Desc = "Adjust character speed",
    Min = 16,
    Max = 100,
    Rounding = 0, -- Decimal places (0 = integers)
    Value = 16,
    Side = "l",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})
```

#### Methods:
```lua
Slider:SetValue(50)
Slider:GetValue()
Slider:SetMin(10)
Slider:SetMax(200)
Slider:SetTitle("New Title")
Slider:Visible(true)
```

---

### Textbox

Create text input fields:

```lua
local Textbox = MainTab:Textbox({
    Title = "Player Name",
    Desc = "Enter target player",
    Value = "",
    PlaceHolder = "Username...",
    ClearOnFocus = false, -- Keep text when focused
    Side = "l",
    Callback = function(text)
        print("Input:", text)
    end
})
```

#### Methods:
```lua
Textbox:SetValue("NewText")
Textbox:GetValue()
Textbox:SetTitle("New Title")
Textbox:Visible(false)
```

---

### Dropdown

Create dropdown selection menus:

```lua
local Dropdown = MainTab:Dropdown({
    Title = "Select Weapon",
    Desc = "Choose your weapon",
    List = {"Sword", "Bow", "Staff"},
    Value = "Sword", -- Default selection
    Multi = false, -- true for multiple selection
    Side = "l",
    Callback = function(selected)
        print("Selected:", selected)
    end
})
```

#### Methods:
```lua
Dropdown:Add("Axe") -- Add new option
Dropdown:Remove("Bow") -- Remove option
Dropdown:Clear() -- Remove all options
Dropdown:SetValue("Staff") -- Set selection
Dropdown:GetValue() -- Get current selection
Dropdown:SetList({"New", "Options"}) -- Replace all options
Dropdown:Refresh() -- Update visual state
Dropdown:Visible(true)
```

---

### Keybind

Create keybind controllers:

```lua
local Keybind = MainTab:Keybind({
    Title = "Toggle UI",
    Desc = "Show/hide interface",
    Key = Enum.KeyCode.Q, -- Default key
    Value = false, -- Initial state
    Mode = "Toggle", -- "Toggle" or "Hold"
    Side = "l",
    Callback = function(key, value, mode)
        print("Key:", key, "Active:", value, "Mode:", mode)
    end
})
```

#### Methods:
```lua
Keybind:SetKey(Enum.KeyCode.F)
Keybind:GetKey()
Keybind:SetValue(true) -- Set active state
Keybind:GetValue()
Keybind:SetMode("Hold") -- Change mode
Keybind:GetMode()
Keybind:Visible(false)
```

---

### Label

Simple text display:

```lua
local Label = MainTab:Label({
    Title = "Welcome to Cat Hub!",
    Side = "l"
})
```

#### Methods:
```lua
Label:SetText("New text") -- Supports RichText
Label:Visible(true)
```

---

### Paragraph

Multi-line text display:

```lua
local Paragraph = MainTab:Paragraph({
    Title = "Information",
    Desc = "This is a longer description that can contain multiple lines of text and will automatically adjust its height.",
    Side = "l"
})
```

#### Methods:
```lua
Paragraph:SetTitle("New Title")
Paragraph:SetDesc("New description text")
Paragraph:Visible(true)
```

---

### Discord

Display Discord invite link:

```lua
local Discord = MainTab:Discord({
    Link = "discord.gg/yourserver",
    Side = "l"
})
```

#### Features:
- Copies link to clipboard when clicked
- Animated hover effects
- Visual feedback on copy

#### Methods:
```lua
Discord:SetLink("discord.gg/newserver")
Discord:Visible(false)
```

---

### Image Thumbnail

Display images with fullscreen viewer:

```lua
local Image = MainTab:ThumnailsImage({
    Banner = "rbxassetid://123456",
    Title = "Preview Image", -- Optional caption
    SizeY = 120, -- Height (leave nil for auto)
    Side = "l",
    ShowTitle = true -- Show caption overlay
})
```

#### Features:
- Click to view fullscreen
- Loading animation
- Automatic sizing
- ESC key to close fullscreen

#### Methods:
```lua
Image:SetImage("rbxassetid://...")
Image:SetHeight(150)
Image:SetTitle("New Caption")
Image:Visible(true)
```

---

### Code Editor

Multi-line code editor with syntax highlighting:

```lua
local CodeEditor = MainTab:CodeEditor({
    Title = "Script Editor",
    Desc = "Edit your code",
    Value = "print('Hello')",
    PlaceHolder = "-- Code here...",
    Height = 150,
    Language = "lua", -- Currently supports "lua"
    Side = "l",
    Callback = function(code)
        print("Code changed:", code)
    end
})
```

#### Features:
- Lua syntax highlighting
- Line numbers
- Copy button
- Clear button
- Multi-line editing

#### Methods:
```lua
CodeEditor:SetValue("new code")
CodeEditor:GetValue()
CodeEditor:Clear()
CodeEditor:Append("\n-- more code")
CodeEditor:SetLanguage("lua")
CodeEditor:SetHeight(200)
CodeEditor:Visible(true)
```

---

### Checkbox List

Scrollable list with checkboxes:

```lua
local CheckboxList = MainTab:CheckboxList({
    Title = "Select Items",
    Desc = "Choose multiple items",
    List = {"Item 1", "Item 2", "Item 3"},
    Selected = {"Item 1"}, -- Pre-selected items
    MaxHeight = 200,
    Side = "l",
    Callback = function(selected)
        print("Selected items:", selected)
    end
})
```

#### Methods:
```lua
CheckboxList:Add("Item 4") -- Add new item
CheckboxList:Remove("Item 2") -- Remove item
CheckboxList:Clear() -- Remove all items
CheckboxList:SetSelected({"Item 1", "Item 3"}) -- Set selection
CheckboxList:GetSelected() -- Returns array of selected items
CheckboxList:SelectAll() -- Select all items
CheckboxList:DeselectAll() -- Deselect all
CheckboxList:Visible(true)
```

---

## 🎨 Customization

### Colors & Gradients

The library uses a consistent gradient theme:
- Primary: RGB(0, 255, 127) → RGB(0, 170, 255) → RGB(85, 85, 255)

### Icons

Use Roblox asset IDs for icons:
```lua
Icon = "rbxassetid://123456"
-- or
Icon = 123456 -- Number format
-- or  
Icon = "123456" -- String format
```

### Side Parameter

For 2-column layouts:
- `Side = "l"` or `Side = "left"` or `Side = 1` → Left column
- `Side = "r"` or `Side = "right"` or `Side = 2` → Right column

---

## 💡 Examples

### Complete Example

```lua
local Cat = loadstring(game:HttpGet("your-url"))()

-- Create Window
local Window = Cat:Window({
    Title = "My Awesome Hub",
    Desc = "v1.0.0",
    SizeUi = "520,340"
})

-- Show notification
Cat:Notify({
    Title = "Welcome!",
    Content = "Hub loaded successfully",
    Type = "Success",
    Time = 0.5,
    Delay = 3
})

-- Create Tab
local MainTab = Window.Tabs:Add({
    Title = "Main",
    Banner = "rbxassetid://123456",
    Columns = 2
})

-- Add Elements
local AutoFarm = MainTab:Toggle({
    Title = "Auto Farm",
    Value = false,
    Side = "l",
    Callback = function(value)
        print("Auto Farm:", value)
    end
})

local Speed = MainTab:Slider({
    Title = "Speed",
    Min = 16,
    Max = 100,
    Value = 16,
    Side = "r",
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

-- Methods usage
AutoFarm:SetValue(true)
Speed:SetValue(50)
```

---

## 📱 Mobile Support

The library includes full mobile support:

- **Touch Gestures**: All elements respond to touch input
- **Pinch to Resize**: Two-finger pinch gesture to resize window
- **Long Press**: 2-second hold with two fingers to enable resize mode
- **Draggable**: Touch and drag to move window
- **Responsive**: UI scales appropriately on mobile devices

---

## 🎯 Best Practices

1. **Organization**: Use tabs to organize features logically
2. **Descriptions**: Always provide clear descriptions for elements
3. **Callbacks**: Keep callback functions lightweight
4. **Error Handling**: Use `pcall` for potentially failing operations
5. **Search**: Take advantage of the automatic search feature by using clear, descriptive titles
6. **Resource IDs**: Use the helper function to accept multiple asset ID formats

---

## 🔧 Advanced Features

### Search System
All tabs automatically include a search bar that filters elements by title in real-time.

### Highlight System
When searching, matching elements briefly highlight to draw attention.

### Badge Counter
Each tab displays the number of elements it contains.

### Return Button
Automatically appears when viewing a tab, allows quick return to tab selection.

---

## ⚙️ Element Visibility

All elements support the `:Visible(boolean)` method to show/hide them:

```lua
myToggle:Visible(false) -- Hide
myToggle:Visible(true)  -- Show
```

---

## 📝 Notes

- All elements support **RichText** in Title/Text fields
- Asset IDs can be provided as strings or numbers
- The library handles asset ID formatting automatically
- All animations use TweenService for smooth transitions
- Close/Open UI with **F2** key by default

---

## 🎨 Banner Presets

The library includes preset banner IDs:

```lua
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
```

---

## 🌟 Credits

**Cat UI Library** - A modern, feature-rich UI library for Roblox
- Developer: Catdzs1vn
- Beautiful animations and effects
- Mobile-friendly design
- Extensive customization options

---

*Documentation last updated: 2025*
