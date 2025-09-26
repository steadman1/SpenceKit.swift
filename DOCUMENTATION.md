# Overview

SpenceKit.swift is a powerful, developer-friendly framework designed to simplify the creation of consistent, visually appealing user interfaces. It combines ease of use, universal design principles, and prebuilt components to empower developers—especially those who aren't design-savvy—to focus on functionality while achieving professional-grade UI results. The kit's modular components are built using UIKit and adhere to accessibility standards, ensuring a seamless and inclusive user experience across all devices. Its ability to serve as a rapid prototyping tool enables developers to bring their ideas to life with elegance in seconds, making it an indispensable asset for fast-paced development cycles.

The following documentation contains all Views, Structures, and Functions provided by the SpenceKit Swift library. 

# Preview every available View on Figma

Linked below is a Figma file containing all available Views in SpenceKit.swift mocked up in Figma with more information on the project. The Figma file also includes more info about SpenceKit's Typography and Color.
https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=673-205&t=8VBDpbuxr4nibJhb-0

# SpenceKit.swift Helper GPT

Linked below is a custom OpenAI GPT with full access to this documentation for assistance with understanding and developing SwiftUI Views that make full use of SpenceKit.
https://chatgpt.com/g/g-67893e24f09881918c232c76d8f3e0f7-spencekit-swift

---

# Table of Contents

- [SpenceKit Initialization](#spencekit-initialization)
- [Elements](#elements)
    - [Divider](#divider-view)
    - [SFIcon](#sficon-view)
    - [Radio](#radio-view)
    - [Toggle](#toggle-view)
    - [Checkbox](#checkbox-view)
    - [PasswordInputField](#passwordinputfield-view)
    - [TabBar](#tabbar-view)
    - [TabGroup](#tabgroup-view)
    - [iOSScrubber](#iosscrubber-view)
    - [ContinuousSlider](#continuousslider-view)
    - [Slider](#slider-view)
    - [Dropdown](#dropdown-view)
- [Compounds](#compounds)
    - [HelperButton](#helperbutton-view)
    - [IconButton](#iconbutton-view)
    - [Card](#card-view)
    - [SearchBar](#searchbar-view)
    - [LargeChip](#largechip-view)
    - [SmallChip](#smallchip-view)
    - [ExpandingButton](#expandingbutton-view)
    - [InlineTextField](#inlinetextfield-view)
    - [MultilineTextField](#multilinetextfield-view)
    - [ProgressSelector](#progressselector-view)
    - [TabSelector](#tabselector-view)
- [Classes](#classes)
    - [Icons](#icons-class)
    - [HelperButtons](#helperbuttons-class)
- [Structures](#structures)
    - [SpenceKit](#spencekit)
    - [Tab](#tab)
    - [Icon](#icon)
- [Enums](#standalone-enums)
    - [SpenceKitStyle](#spencekitstyle)
    - [SpenceKitSize](#spencekitsize)
- [Extensions & Functions](#extensions--functions)
- [View Modifiers](#view-modifiers)
- [StrokeModifier](#strokemodifier)

---

# License

Copyright 2025 Spencer Steadman

Licensed under the Apache License, Version 2.0 (the "License");  
you may not use this library except in compliance with the License.  
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

If you have any questions, contact `support@mypainterstape.com`!

---


# SpenceKit Initialization

## Using `SKSingleton` for shared parameters

The `SKSingleton` singleton class allows customization of SpenceKit using a shared class instance.
## Attributes

- `typography`: Typography theme for the app—see Figma typography overview!
    - `sans` : all sans Fonts
    - `serifTitleSansBody`: Serif title fonts with sans body fonts
    - `sansTitleSerifBody`: Sans title fonts with serif body fonts **excluding required sans body fonts**
    - `sansSerif`: all serif fonts **excluding required sans body fonts**

## Usage

### Example 1: Sans-Serif typography theme (default) & SwiftUI app setup

```swift
@main  
struct MyApp: App {

    init() {
        SKSingleton.typography = Font.SpenceKit.TypographyTheme.sansSerif
    }
    
    var body: some Scene {  
        WindowGroup {  
            SomeView()
        }  
    }  
}
```

### Example 2: Serif Title with Sans Body typography theme

```swift
SKSingleton.typography = Font.SpenceKit.TypographyTheme.serifTitleSansBody
```

### Example 3: Using the typography theme within your app

```swift
Text("sample text")
    .font(Font.SpenceKit.BodyFont)
```

See the `Font.SpenceKit` structure located in Extensions.swift 
### Example 4: Using the typography theme within your app

```swift
Text("sample text")
    .font(Font.SpenceKit.PrimaryTitleFont)
```


# Elements

SpenceKit `Elements` are a subset of Views made using Swift UI primitives and never include @ViewBuilder parameters. 

## `Divider` View

A visually consistent, customizable divider that expands along the specified axis to separate content in horizontal or vertical layouts.

---
### Preview on Figma

 [SpenceKit Divider Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=523-169&t=Dst1yPDRjPShsn0T-1)

---

### Declaration

```swift
public struct Divider: View
````

#### Type: Element

- Built using primitives (`Rectangle`) for a minimal and efficient design.

---

### Initializers

#### 1. `Divider with Axis`

Creates a `Divider` with the specified axis for layout separation.

```swift
public init(_ axis: Axis)
```

##### Parameters

- `axis`: The axis along which the divider expands:
    - `.horizontal`: Creates a horizontal divider.
    - `.vertical`: Creates a vertical divider.

---

### Usage

#### Example 1: Horizontal Divider

```swift
Divider(.horizontal)
```

#### Example 2: Vertical Divider

```swift
Divider(.vertical)
```

---

### Features

- **Axis Customization**: Supports both horizontal and vertical orientations.
- **Dynamic Sizing**: Automatically expands to fill the available space along the specified axis.
- **Consistent Styling**: Uses `SpenceKit.Constants` for border width and color for a unified design language.

---

### Notes

- **Styling**: Adheres to `SpenceKit.Constants` for visual consistency across components.
- **Simple Integration**: Easily dropped into any layout for clean content separation.

---

### Related

- **Views**: `Rectangle`
- **Modifiers**: `.frame`, `.foregroundStyle`
- **Styles**: `SpenceKit.Constants`

---

## `SFIcon` View

A customizable wrapper around `Image(systemName:)` for consistent rendering of SF Symbols with flexible sizing.

---
### Preview on Figma

 [SpenceKit SFIcon Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=561-300&t=Dst1yPDRjPShsn0T-1)

---
### Declaration

```swift
@available(iOS 16.0, *)
public struct SFIcon: View
````

#### Type: Element

- Built using the `Image` view for lightweight, consistent icon rendering.

---

### Initializers

#### `SFIcon with System Name and Size`

Creates an `SFIcon` with a specified system name and size.

```swift
public init(
    _ systemName: String,
    size: SpenceKitSize
)
```

##### Parameters

- `systemName`: The name of the SF Symbol to display.
- `size`: The desired size of the icon, defined by `SpenceKitSize`.

---

### Usage

#### Example 1: Small Icon

```swift
SFIcon("star.fill", size: .small)
```

#### Example 2: Headline-Sized Icon

```swift
SFIcon("checkmark.circle.fill", size: .head)
```

---

### Features

- **Consistent Styling**: Ensures uniform appearance and size across the app.
- **Resizable**: Dynamically adjusts the icon size based on `SpenceKitSize`.
- **Customizable Font Weight**: Icons are rendered with a bold, black font weight for emphasis.

---

### Notes

- **iOS Compatibility**: Available for iOS 16.0 and later.
- **Design Integration**: Uses `SpenceKitSize` to align with app-wide size standards.

---

### Related

- **Views**: `Image`
- **Modifiers**: `.font`, `.fontWeight`
- **Components**: `SpenceKitSize`

---


## `Radio` View

A circular binary selection component designed for toggling between active and inactive states.

---
### Preview on Figma

 [SpenceKit Radio Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=561-183&t=Dst1yPDRjPShsn0T-1)

---
### Declaration

```swift
@available(iOS 16.0, *)
public struct Radio: View
````

#### Type: Element

- Built using `Circle` for simplicity and lightweight interaction.

---

### Initializers

#### `Radio with Binding State`

Creates a `Radio` component with a binding to the active state.

```swift
public init(
    _ isActive: Binding<Bool>
)
```

##### Parameters

- `isActive`: A binding to a Boolean value representing the current state. `true` indicates active, while `false` indicates inactive.

---

### Usage

#### Example 1: Basic Radio Button

```swift
@State private var isActive = false

Radio($isActive)
```

---

### Features

- **Binary State**: Represents an active (`true`) or inactive (`false`) state.
- **Dynamic Border**: Changes border color and thickness based on the current state.
- **Interactive Animation**: Provides a smooth, bouncy animation when toggling states.
- **Compact Design**: Small circular component, ideal for use in forms or as selectors.

---

### Notes

- **Styling Dependency**: Uses `SpenceKit.Constants` for consistent border widths and colors.
- **Interactive Behavior**: Toggling is handled via `onTapGesture`, making it intuitive and responsive.
- **Compatibility**: Available for iOS 16.0 and later.

---

### Related

- **Views**: `Circle`
- **Modifiers**: `.stroke`, `.frame`, `.onTapGesture`
- **Components**: `SpenceKit.Constants`

---

---
## `Toggle` View

A compact binary toggle component designed for seamless switching between active and inactive states.

---
### Preview on Figma

 [SpenceKit Toggle Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=562-343&t=Dst1yPDRjPShsn0T-1)

---
### Declaration

```swift
public struct Toggle: View
````

#### Type: Element

- Built using `RoundedRectangle` and `Circle` for a minimal and elegant design.

---

### Initializers

#### `Toggle with Binding State`

Creates a `Toggle` component with a binding to the active state.

```swift
public init(
    _ isActive: Binding<Bool>
)
```

##### Parameters

- `isActive`: A binding to a Boolean value representing the current state. `true` indicates active, while `false` indicates inactive.

---

### Usage

#### Example 1: Basic Toggle

```swift
@State private var isActive = false

Toggle($isActive)
```

---

### Features

- **Binary State**: Provides clear visual feedback for `on` (`true`) and `off` (`false`) states.
- **Interactive Animation**: Smooth, bouncy animation when toggling states.
- **Compact Design**: Small, visually appealing component that integrates well into forms or settings.
- **Dynamic Colors**: Adjusts foreground color to reflect the active state, utilizing `SpenceKit.Success` and `SpenceKit.Failure`.

---

### Notes

- **Styling Dependency**: Uses `SpenceKit.Constants` for consistent sizing and color themes.
- **Interactive Behavior**: Toggle state changes on tap with animation for responsive feedback.
- **Compatibility**: Designed for iOS 17.0 and later.

---

### Related

- **Views**: `RoundedRectangle`, `Circle`
- **Modifiers**: `.frame`, `.background`, `.onTapGesture`

---


---

## `Checkbox` View

A binary or tri-state input component with customizable states: unchecked, checked, and indeterminate. Designed for flexibility and modern UI interactions.

---
### Preview on Figma

 [SpenceKit Checkbox Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=562-351&t=Dst1yPDRjPShsn0T-1)

---
### Declaration

```swift
@available(iOS 16.0, *)
public struct Checkbox: View
````

#### Type: Compound

- Combines **Elements** (e.g., `RoundedRectangle`, `onTapGesture`).
- Incorporates **Compounds** (e.g., `SFIcon`).

---

### Enums

#### `Checkbox.State`

Defines the possible states of the checkbox:

- `.unchecked`: The default state.
- `.checked`: The checkbox is selected.
- `.indeterminate`: Represents an intermediate or undefined state.

---

### Initializers

#### `Checkbox with Binding State`

Creates a `Checkbox` with a bound state.

```swift
public init(
    _ state: Binding<Checkbox.State>
)
```

##### Parameters

- `state`: A binding to the current state of the checkbox (`.unchecked`, `.checked`, `.indeterminate`).

---

### Usage

#### Example 1: Binary Checkbox

```swift
@State private var state: Checkbox.State = .unchecked

Checkbox($state)
```

#### Example 2: Tri-State Checkbox

```swift
@State private var state: Checkbox.State = .indeterminate

Checkbox($state)
```

---

### Features

- **Tri-State Support**: Handles `.unchecked`, `.checked`, and `.indeterminate` states.
- **Dynamic Colors**: Adjusts colors dynamically based on the current state.
- **Interactive Feedback**: Includes smooth animations when toggling states.
- **Compact Design**: A small, square design suitable for dense UIs.

---

### Notes

- **Styling Dependency**: Adheres to `SpenceKit.Constants` for consistent colors, sizes, and animations.
- **Interactive Behavior**: Toggling state is enabled via `onTapGesture` with animated transitions.
- **Compatibility**: Available for iOS 16.0 and later.

---

### Related

- **Views**: `RoundedRectangle`, `SFIcon`
- **Modifiers**: `.background`, `.clipShape`, `.onTapGesture`
- **Components**: `SpenceKit.Constants`, `SpenceKitStyle`

---

## `PasswordInputField` View

A secure and interactive password input field with customizable placeholder, title, description, and visibility toggle functionality.

---
### Preview on Figma

 [SpenceKit PasswordInputField Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=562-359&t=Dst1yPDRjPShsn0T-1)

---
### Declaration

```swift
@available(iOS 16.0, *)
public struct PasswordInputField: View
````

#### Type: Compound

- Combines **Elements** (e.g., `TextField`, `SecureField`, `Image`, `RoundedRectangle`).
- Incorporates **Compounds** (e.g., `HelperButtons.Peek`, `HelperButtons.Hide`).

---

### Initializers

#### 1. `PasswordInputField with Placeholder, Title, and Description`

Creates a `PasswordInputField` with a text binding, optional placeholder, title, and description.

```swift
public init(
    _ text: Binding<String>,
    placeholder: String = "",
    title: String = "",
    description: String = ""
)
```

##### Parameters

- `text`: A binding to the secure input text.
- `placeholder`: _(Optional)_ The placeholder text displayed when the field is empty. Defaults to an empty string.
- `title`: _(Optional)_ A title displayed above the password field. Defaults to an empty string.
- `description`: _(Optional)_ A description displayed below the password field. Defaults to an empty string.

---

### Usage

#### Example 1: Basic `PasswordInputField`

```swift
PasswordInputField($text, placeholder: "Enter your password")
```

#### Example 2: With Title and Description

```swift
PasswordInputField(
    $text,
    placeholder: "Enter password",
    title: "Password",
    description: "Must be at least 8 characters long"
)
```

---

### Features

- **Secure Input**: Toggles between `SecureField` and `TextField` for hidden or visible text entry.
- **Customizable Labels**: Supports optional placeholder, title, and description for better context.
- **Visibility Toggle**: Includes a button to show or hide the entered password.
- **Keyboard Dismissal**: Provides a compact keyboard dismissal button when the field is focused.
- **Strength Indicator**: Displays a visual strength indicator based on the entered password length.

---

### Notes

- **Focus Management**: Automatically manages focus state and allows users to dismiss the keyboard with a tap.
- **Accessibility**: Ensures the visibility toggle is accessible and intuitive for all users.
- **Styling Dependency**: Adheres to `SpenceKit.Constants` for consistent design language.

---

### Related

- **Views**: `TextField`, `SecureField`, `Image`, `RoundedRectangle`
- **Modifiers**: `.focused`, `.foregroundStyle`, `.padding`
- **Components**: `HelperButtons.Peek`, `HelperButtons.Hide`

---

## `TabBar` View

A customizable bottom tab bar for universal tab selection within an app. Supports floating and non-floating configurations, dynamic layouts, and responsive styling.

---
### Preview on Figma

 [SpenceKit TabBar Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=562-367&t=Dst1yPDRjPShsn0T-1)

---
### Declaration

```swift
@available(iOS 16.0, *)
public struct TabBar: View
````

#### Type: Mixture

- Combines **Elements** (e.g., `Button`, `Text`, `Image`, `Divider`).
- Incorporates **Compounds** (e.g., `RoundedRectangle`, `Spacer`).

---

### Initializers

#### `TabBar with Configurable Tabs`

Creates a `TabBar` with a binding to the selected tab, style, color scheme, and tab definitions.

```swift
public init(
    _ selection: Binding<Int>,
    tabStyle: SpenceKitStyle = .primary,
    colorStyle: SpenceKitStyle = .primary,
    usesSpacers: Bool = true,
    tabs: [Tab]
)
```

##### Parameters

- `selection`: A binding to the currently selected tab index.
- `tabStyle`: _(Optional)_ The style of the tabs. Options include `.primary`, `.secondary`, `.tertiary`, etc. Defaults to `.primary`.
- `colorStyle`: _(Optional)_ Defines the color scheme for active and inactive states. Defaults to `.primary`.
- `usesSpacers`: _(Optional)_ Whether to use spacers between tabs. Defaults to `true`.
- `tabs`: An array of `Tab` objects defining the tabs' content.

---

### Usage

#### Example 1: Basic `TabBar`

```swift
TabBar(
    $selectedTab,
    tabs: [
        Tab(
            "Home",
            activeIcon: .init(systemName: "house.fill"),
            inactiveIcon: .init(systemName: "house")
        ),
        Tab(
            "Search",
            activeIcon: .init(systemName: "magnifyingglass.circle.fill"),
            inactiveIcon: .init(systemName: "magnifyingglass.circle")
        )
    ]
)
```

#### Example 2: `TabBar` with Custom Styles

```swift
TabBar(
    $selectedTab,
    tabStyle: .primary,
    colorStyle: .CTA,
    tabs: [
        Tab(
            "Profile",
            activeIcon: .init(systemName: "person.fill"),
            inactiveIcon: .init(systemName: "person")
        ),
        Tab(
            "Settings",
            activeIcon: .init(systemName: "gearshape.fill"),
            inactiveIcon: .init(systemName: "gearshape")
        )
    ]
)
```

---

### Features

- **Dynamic Layout**: Adapts to the available screen width, supporting both floating and non-floating configurations.
- **Configurable Tabs**: Allows for flexible tab definitions with customizable icons and labels.
- **Responsive Styling**: Includes support for various styles and color schemes using `SpenceKitStyle`.
- **Active State Animation**: Smooth transitions between active and inactive states.

---

### Notes

- **Floating Configuration**: When the screen width exceeds `440`, the tab bar appears as a floating component with rounded edges.
- **Styling Dependency**: Leverages `SpenceKit.Constants` for consistent padding, spacing, and colors.
- **Accessibility**: Tabs are accessible with visual and text-based feedback for active and inactive states.

---

### Related

- **Views**: `Button`, `Text`, `Image`, `Divider`
- **Modifiers**: `.padding`, `.clipShape`, `.background`
- **Components**: `Tab`

---
## `TabGroup` View

A vertically stacked tab selection component designed for grouping related tabs under an optional title. Tabs include icons, titles, and actions for seamless interaction.

---
### Preview on Figma

 [SpenceKit TabGroup Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=562-383&t=Dst1yPDRjPShsn0T-1)

---
### Declaration

```swift
public struct TabGroup: View
````

#### Type: Mixture

- Combines **Elements** (e.g., `Button`, `Text`, `Image`, `Divider`).
- Incorporates **Compounds** (e.g., `RoundedRectangle`, `CornerRadiusReader`).

---

### Initializers

#### `TabGroup with Title and Tabs`

Creates a `TabGroup` with an optional title and a list of tabs.

```swift
public init(
    title: String? = nil,
    tabs: [Tab]
)
```

##### Parameters

- `title`: _(Optional)_ A title displayed above the tab group. Defaults to `nil`.
- `tabs`: An array of `Tab` objects defining the tabs' content and actions.

---

### Usage

#### Example 1: `TabGroup` with Title

```swift
TabGroup(
    title: "General",
    tabs: [
        Tab(
            "Home",
            icon: .init(systemName: "house")
        ),
        Tab(
            "Settings",
            icon: .init(systemName: "gearshape")
        )
    ]
)
```

#### Example 2: `TabGroup` without Title

```swift
TabGroup(
    tabs: [
        Tab(
            "Profile",
            icon: .init(systemName: "person")
        ),
        Tab(
            "Notifications",
            icon: .init(systemName: "bell")
        )
    ]
)
```

---

### Features

- **Grouped Tabs**: Organizes related tabs into a vertical stack with optional titles for clarity.
- **Customizable Actions**: Each tab can trigger a specific action on selection.
- **Icon and Label Support**: Tabs include icons and text for better usability and design consistency.
- **Dividers**: Separates tabs visually with horizontal dividers for a clean layout.

---

### Notes

- **Dynamic Layout**: The height of the `TabGroup` adjusts automatically based on the number of tabs.
- **Styling Dependency**: Adheres to `SpenceKit.Constants` for consistent spacing, fonts, and colors.
- **Accessible Design**: Ensures icons and labels are visually and functionally distinct.

---

### Related

- **Views**: `Button`, `Text`, `Image`, `Divider`
- **Modifiers**: `.padding`, `.clipShape`, `.frame`
- **Components**: `Tab`

---

## `iOSScrubber` View

A custom implementation of iOS 16's media scrubber slider, designed for smooth, interactive control over a bounded range. Includes support for dynamic binding modes and animated feedback.

---
### Declaration

```swift
public struct iOSScrubber: View
````

#### Type: Mixture

- Combines **Elements** (e.g., `Rectangle`, `RoundedRectangle`).
- Incorporates **Compounds** (e.g., `DragGesture`).

---

### Enums

#### `iOSScrubber.ScrubberBinding`

Defines the binding mode for the scrubber:

- `.bindAlways`: Updates the bound value continuously during interaction.
- `.bindAtRest`: Updates the bound value only after interaction ends.

---

### Initializers

#### `iOSScrubber with Binding Value`

Creates an `iOSScrubber` slider with a bound value and binding mode.

```swift
public init(
    _ value: Binding<CGFloat>,
    bind: ScrubberBinding = .bindAlways
)
```

##### Parameters

- `value`: A binding to the slider's value. Should be a `CGFloat` between `0.0` and `1.0`.
- `bind`: _(Optional)_ The binding mode for the slider. Defaults to `.bindAlways`.

---

### Usage

#### Example 1: Always-Binding Scrubber

```swift
@State private var value: CGFloat = 0.5

iOSScrubber($value)
```

#### Example 2: Bind-At-Rest Scrubber

```swift
@State private var value: CGFloat = 0.75

iOSScrubber($value, bind: .bindAtRest)
```

---

### Features

- **Dynamic Binding Modes**: Choose between continuous updates (`.bindAlways`) or updates only at rest (`.bindAtRest`).
- **Smooth Animations**: Provides responsive feedback during interaction with a bouncy easing effect.
- **Velocity-Based Glide**: Supports momentum-based continuation when releasing the scrubber.
- **Custom Track Design**: Includes an interactive track that changes size and opacity based on user interaction.
- **Range Constraints**: Ensures the value remains within the range `[0.0, 1.0]`.

---

### Notes

- **Styling Dependency**: Utilizes `SpenceKit.Constants` for consistent spacing, corner radius, and color themes.
- **GeometryReader Integration**: Adjusts dynamically to the parent view's size.
- **Performance Considerations**: Uses a timer to handle velocity-based animations.

---

### Related

- **Views**: `Rectangle`, `RoundedRectangle`
- **Gestures**: `DragGesture`
- **Modifiers**: `.frame`, `.background`, `.onTapGesture`

---
## `ContinuousSlider` View

A customizable continuous slider for smooth range-based input. Provides various styles, dynamic animations, and optional glide behavior for user interactions.

---
### Preview on Figma

 [SpenceKit ContinuousSlider Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=561-253&t=Dst1yPDRjPShsn0T-1)

---
### Declaration

```swift
public struct ContinuousSlider: View
````

#### Type: Mixture

- Combines **Elements** (e.g., `RoundedRectangle`, `Text`).
- Incorporates **Compounds** (e.g., `DragGesture`).

---

### Enums

#### `ContinuousSlider.GlideLength`

Defines the glide behavior's length:

- `.none`: No glide effect.
- `.short`: Short glide distance.
- `.moderate`: Moderate glide distance.
- `.long`: Long glide distance.

#### `ContinuousSlider.GlideResistance`

Defines the resistance applied during the glide effect:

- `.low`: Minimal resistance for faster glides.
- `.moderate`: Medium resistance.
- `.high`: High resistance for slower glides.
- `.infinity`: Infinite resistance disables glide.

---

### Initializers

#### `ContinuousSlider with Binding Value`

Creates a `ContinuousSlider` with a binding to the slider's value.

```swift
public init(
    _ value: Binding<CGFloat>,
    style: SpenceKitStyle = .CTA,
    range: ClosedRange<Double> = 0...10,
    decimalCount: Int = 1,
    glideLength: GlideLength = .moderate,
    glideResistance: GlideResistance = .moderate
)
```

##### Parameters

- `value`: A binding to the slider's value, constrained between `0.0` and `1.0`.
- `style`: _(Optional)_ Visual style of the slider (`.primary`, `.secondary`, `.tertiary`, `.CTA`). Defaults to `.CTA`.
- `range`: _(Optional)_ The numerical range the slider maps to. Defaults to `0...10`.
- `decimalCount`: _(Optional)_ Number of decimal places displayed. Defaults to `1`.
- `glideLength`: _(Optional)_ Length of the glide effect. Defaults to `.moderate`.
- `glideResistance`: _(Optional)_ Resistance applied during the glide. Defaults to `.moderate`.

---

### Usage

#### Example 1: Primary Style Slider

```swift
@State private var value: CGFloat = 0.5

ContinuousSlider($value, style: .primary, range: 0...100, decimalCount: 2)
```

#### Example 2: Secondary Style with Glide

```swift
@State private var value: CGFloat = 0.3

ContinuousSlider($value, style: .secondary, glideLength: .long, glideResistance: .low)
```

---

### Features

- **Dynamic Styling**: Supports `.primary`, `.secondary`, `.tertiary`, and `.CTA` styles for different use cases.
- **Range Mapping**: Maps normalized values (`0.0` to `1.0`) to a specified numerical range.
- **Glide Effect**: Adds smooth momentum-based motion when releasing the slider.
- **Responsive Feedback**: Provides real-time value updates with animated transitions.
- **Decimal Precision**: Customizable number of decimal places for the displayed value.

---

### Notes

- **Styling Dependency**: Leverages `SpenceKit.Constants` for consistent dimensions, colors, and animations.
- **Gesture Handling**: Incorporates `DragGesture` for seamless interaction.
- **Performance Considerations**: Glide behavior uses a `Timer` for smooth updates.

---

### Related

- **Views**: `RoundedRectangle`, `Text`
- **Gestures**: `DragGesture`
- **Modifiers**: `.frame`, `.foregroundStyle`, `.padding`

---

## `Slider` View

A customizable slider for continuous range-based input, supporting both single-thumb and double-thumb configurations.

---
### Preview on Figma

 [SpenceKit Slider Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=561-264&t=Dst1yPDRjPShsn0T-1)

---
### Declaration

```swift
public struct Slider: View
````

#### Type: Mixture

- Combines **Elements** (e.g., `RoundedRectangle`, `Circle`).
- Incorporates **Compounds** (e.g., `DragGesture`).

---

### Enums

#### `Slider.Count`

Defines the number of thumbs on the slider:

- `.single`: Single thumb for basic input.
- `.double`: Two thumbs for range-based input.

---

### Initializers

#### `Single-Thumb Slider`

Creates a `Slider` with a single thumb for basic continuous input.

```swift
public init(
    _ value: Binding<Double>
)
```

##### Parameters

- `value`: A binding to the slider's value, constrained between `0.0` and `1.0`.

#### `Double-Thumb Slider`

Creates a `Slider` with two thumbs for specifying a range.

```swift
public init(
    from: Binding<Double>,
    to: Binding<Double>
)
```

##### Parameters

- `from`: A binding to the starting value of the range.
- `to`: A binding to the ending value of the range.

---

### Usage

#### Example 1: Single-Thumb Slider

```swift
@State private var value: Double = 0.5

Slider($value)
```

#### Example 2: Double-Thumb Slider

```swift
@State private var from: Double = 0.2
@State private var to: Double = 0.8

Slider(from: $from, to: $to)
```

---

### Features

- **Single and Double Thumbs**: Supports basic single-value input or range selection with two thumbs.
- **Dynamic Track**: Active track dynamically adjusts to reflect the selected range.
- **Responsive Interaction**: Provides smooth and precise value updates via `DragGesture`.
- **Styling Consistency**: Adapts colors and dimensions based on `SpenceKit.Constants`.

---

### Notes

- **Range Constraints**: Values are clamped to the range `[0.0, 1.0]`.
- **Animation**: Includes bouncy animations for thumb interactions.
- **Styling Dependency**: Utilizes `SpenceKit.Constants` for consistent corner radius, border widths, and colors.

---

### Related

- **Views**: `RoundedRectangle`, `Circle`
- **Gestures**: `DragGesture`
- **Modifiers**: `.offset`, `.frame`, `.stroke`

---
## `Dropdown` View

A dropdown menu for tab selection with customizable placeholder and tab options. Supports seamless interaction and dynamic state management.

---
### Preview on Figma

 [SpenceKit Dropdown Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=562-433&t=Dst1yPDRjPShsn0T-1)

---
### Declaration

```swift
@available(iOS 16.0, *)
public struct Dropdown: View
````

#### Type: Mixture

- Combines **Elements** (e.g., `Button`, `Text`, `Image`, `Picker`).
- Incorporates **Compounds** (e.g., `Menu`, `Tab`).

---

### Initializers

#### `Dropdown with Binding Selection`

Creates a `Dropdown` with a binding to the selected index, a placeholder, and an array of tabs.

```swift
public init(
    _ selection: Binding<Int>,
    placeholder: String = "Select...",
    tabs: [Tab]
)
```

##### Parameters

- `selection`: A binding to the selected tab index. Use `-1` for no initial selection.
- `placeholder`: _(Optional)_ Placeholder text displayed when no selection is made. Defaults to `"Select..."`.
- `tabs`: An array of `Tab` objects representing the dropdown options.

---

### Usage

#### Example 1: Basic Dropdown

```swift
@State private var selection = -1

Dropdown(
    $selection,
    tabs: [
        Tab("Option 1"),
        Tab("Option 2"),
        Tab("Option 3")
    ]
)
```

#### Example 2: Dropdown with Custom Placeholder

```swift
@State private var selection = -1

Dropdown(
    $selection,
    placeholder: "Choose an option",
    tabs: [
        Tab("Choice A"),
        Tab("Choice B"),
        Tab("Choice C")
    ]
)
```

---

### Features

- **Dynamic State Management**: Reflects the current selection and updates on user interaction.
- **Customizable Placeholder**: Displays placeholder text until a selection is made.
- **Menu Integration**: Uses `Menu` and `Picker` for dropdown functionality.
- **Compact Design**: Fits seamlessly within compact UIs while maintaining clarity.

---

### Notes

- **Responsive Design**: Adapts height and width based on font size and available space.
- **Styling Dependency**: Uses `SpenceKit.Constants` for consistent fonts, colors, and dimensions.
- **Compatibility**: Available for iOS 16.0 and later.

---

### Related

- **Views**: `Menu`, `Picker`, `Button`, `Text`, `Image`
- **Modifiers**: `.foregroundStyle`, `.padding`, `.roundBorder`
- **Components**: `Tab`

---

# Compounds

SpenceKit `Compounds` are a subset of Views made using a combination of both Element(s) & Primitive(s) and/or has a View Building parameter. For more info about View Building, see [@ViewBuilder docs](https://developer.apple.com/documentation/swiftui/viewbuilder)
## `HelperButton` View

A small, circular button designed for lightweight interactions. Highly customizable with support for dynamic actions and content.

---
### Preview on Figma

 [SpenceKit HelperButton Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=567-654&t=qX2O40tvnik5nS45-1)

---
### Declaration

```swift
public struct HelperButton<Content: View>: View
````

#### Type: Compound

- Combines **Elements** (e.g., `Button`, `Circle`).
- Incorporates **Compounds** (e.g., `SFIcon`).

---

### Initializers

#### `HelperButton with Custom Content`

Creates a `HelperButton` with a specific style, action, and customizable label.

```swift
public init(
    _ style: SpenceKitStyle = .primary,
    action: @escaping () -> Void,
    @ViewBuilder label: @escaping () -> Content
)
```

##### Parameters

- `style`: _(Optional)_ The style applied to the button. Options include `.primary` and `.tertiary`. Defaults to `.primary`.
- `action`: A closure executed when the button is tapped.
- `label`: A closure providing the content displayed inside the button.

---

### Usage

#### Example 1: Basic `HelperButton`

```swift
HelperButton(.primary) {
    print("Primary button tapped")
} label: {
    SFIcon("checkmark", size: .small)
}
```

#### Example 2: Tertiary-Styled `HelperButton`

```swift
HelperButton(.tertiary) {
    print("Tertiary button tapped")
} label: {
    SFIcon("info", size: .small)
}
```

---

### Features

- **Circular Design**: Buttons are styled with a circular background for compact, aesthetic interactions.
- **Customizable Content**: Supports any SwiftUI view as the button's label.
- **Style Variants**: Offers primary and tertiary styles, each with unique colors and borders.
- **Lightweight**: Designed for small-scale interactions like toggles or utility actions.

---

### Notes

- **Dynamic Styling**: Adheres to `SpenceKitStyle` for consistent color schemes.
- **Responsive Sizing**: Adjusts size and border width based on the selected style.
- **Compatibility**: Available for iOS 16.0 and later.

---

### Related

- **Views**: `Button`, `Circle`, `SFIcon`
- **Modifiers**: `.background`, `.clipShape`, `.stroke`
- **Components**: `SpenceKitStyle`, `HelperButtons`

---

## `IconButton` View

A circular button designed for interactive actions, supporting multiple styles and customizable content.

---
### Preview on Figma

 [SpenceKit IconButton Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=567-318&t=qX2O40tvnik5nS45-1)

---
### Declaration

```swift
public struct IconButton<Content: View>: View
````

#### Type: Compound

- Combines **Elements** (e.g., `Button`, `RoundedRectangle`).
- Incorporates **Compounds** (e.g., `Text`, `Image`).

---

### Initializers

#### `IconButton with Custom Content`

Creates an `IconButton` with a specified style, action, and customizable label.

```swift
public init(
    _ style: SpenceKitStyle = .primary,
    action: @escaping () -> Void,
    @ViewBuilder label: @escaping () -> Content
)
```

##### Parameters

- `style`: _(Optional)_ The visual style of the button. Options include:
    - `.CTA`: Call-to-action style with vibrant colors.
    - `.primary`: Accent colors for primary actions.
    - `.secondary`: Subdued colors for secondary actions.
    - `.tertiary`: Neutral colors with a border.
    - `.destructive`: Red-themed for destructive actions.
    - `.lowest`: Minimal style with no background. Defaults to `.primary`.
- `action`: A closure executed when the button is tapped.
- `label`: A closure providing the content displayed inside the button.

---

### Usage

#### Example 1: Primary IconButton

```swift
IconButton(.primary) {
    print("Primary button tapped")
} label: {
    SFIcon("checkmark", size: .small)
}
```

#### Example 2: Destructive IconButton

```swift
IconButton(.destructive) {
    print("Destructive button tapped")
} label: {
    SFIcon("trash", size: .small)
}
```

---

### Features

- **Circular Design**: Styled as a rounded rectangle with consistent sizing.
- **Customizable Content**: Supports any SwiftUI view as the button's label.
- **Multiple Styles**: Offers styles for actions like call-to-action, primary, secondary, and destructive.
- **Dynamic Sizing**: Adjusts dimensions based on the selected style.

---

### Notes

- **Styling Dependency**: Utilizes `SpenceKitStyle` for consistent design language.
- **Responsive Design**: Adjusts size and border thickness dynamically for each style.
- **Compatibility**: Available for iOS 16.0 and later.

---

### Related

- **Views**: `Button`, `RoundedRectangle`
- **Modifiers**: `.background`, `.clipShape`, `.stroke`
- **Components**: `SpenceKitStyle`, `SFIcon`

---


## `Card` View

The `Card` view is a versatile container used to define paired content, such as a title-body combination, with customizable footers (chips or buttons). It supports different styles defined by `SpenceKitStyle`.

---
### Preview on Figma

 [SpenceKit Card Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=567-360&t=qX2O40tvnik5nS45-1)

---

### Declaration

```swift
public struct Card<ContentBody: View, ContentFooter: View>: View
```

#### Type: Mixture
- Combines **Elements** (e.g., text, buttons, chips) and **Compounds**.

---

### Initializers

#### 1. Standard Card
Defines a `Card` with a body and footer.

```swift
public init(
    _ style: SpenceKitStyle = .primary,
    @ViewBuilder body: @escaping () -> ContentBody,
    @ViewBuilder footer: @escaping () -> ContentFooter
)
```

##### Parameters
- `style`: *(Optional)* The style of the card, defined by `SpenceKitStyle`. Defaults to `.primary`.
- `body`: A closure returning the main content of the card.
- `footer`: A closure returning the footer content, which can include chips, buttons, or other views.

---

#### 2. Chips-Based Footer *(Not yet implemented)*
Defines a `Card` where the footer is built using a collection of chips.

```swift
public init(
    @ViewBuilder body: @escaping () -> ContentBody,
    @ViewBuilder chips: @escaping () -> ContentFooter
)
```

##### Parameters
- `body`: A closure returning the main content of the card.
- `chips`: A closure returning a collection of chips displayed in the footer.

---

### Usage

#### Example 1: Primary Style with Footer
```swift
Card(SpenceKitStyle.primary) {
    VStack {
        Text("Testing Card")
            .font(.SpenceKit.SerifPrimaryTitleFont)
        Text("Placeholder text for the card body.")
            .font(.SpenceKit.SansBodyFont)
    }
} footer: {
    HStack {
        LargeChip("Option 1", style: .CTA)
        LargeChip("Option 2", style: .CTA)
    }
}.frame(width: 200, height: 300)
```

#### Example 2: CTA Style with Expanding Button
```swift
Card(SpenceKitStyle.CTA) {
    Text("Testing Card")
        .font(.SpenceKit.SerifPrimaryTitleFont)
    Text("Placeholder text for the card body.")
        .font(.SpenceKit.SansBodyFont)
} footer: {
    ExpandingButton(.CTA) {
        print("Button clicked")
    } label: {
        HStack {
            SFIcon("checkmark", size: .head)
            Text("Done")
                .font(.SpenceKit.SansHeadlineFont)
        }
    }
}
```

---

### Notes
- The `Card` view dynamically adjusts its layout based on the `SpenceKitStyle`.
- Background color and border are defined by `SpenceKit` constants.
- Footers adapt their padding based on the style (`.CTA`, `.primary`, etc.).

---

### Private Methods

#### `getTextLabel(for:with:)`
Generates a styled `Text` view for a given string and style.

```swift
private static func getTextLabel(for text: String, with style: SpenceKitStyle) -> Text
```

##### Parameters
- `text`: The string content to be displayed.
- `style`: The `SpenceKitStyle` that determines the text's font and foreground color.

---


## `SearchBar` View

A customizable search bar for text input with optional placeholder text, label, and styling. Supports dynamic content and interaction.

---
### Preview on Figma

 [SpenceKit SearchBar Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=567-401&t=qX2O40tvnik5nS45-1)

---
### Declaration

```swift
public struct SearchBar<Content: View>: View
````

#### Type: Mixture

- Combines **Elements** (e.g., `TextField`, `Icons.MagnifyingGlass`).
- Incorporates **Compounds** (e.g., `HelperButtons.ClearText`, `IconButton`).

---

### Initializers

#### 1. `SearchBar with Custom Label`

Creates a `SearchBar` with a placeholder, dynamic label, and style customization.

```swift
public init(
    _ query: Binding<String>,
    placeholder: String = "Search...",
    style: SpenceKitStyle = .CTA,
    @ViewBuilder label: @escaping () -> Content
)
```

##### Parameters

- `query`: A binding to the search text, allowing real-time updates.
- `placeholder`: _(Optional)_ Placeholder text displayed when the `query` is empty. Defaults to `"Search..."`.
- `style`: _(Optional)_ Visual style of the `SearchBar`. Defaults to `.CTA`.
- `label`: A closure providing a customizable label to display within the `SearchBar`.

---

#### 2. `SearchBar without Label`

A simplified `SearchBar` for basic use cases with no additional label content.

```swift
public init(
    _ query: Binding<String>,
    placeholder: String = "Search..."
) where Content == EmptyView
```

##### Parameters

- `query`: A binding to the search text, allowing real-time updates.
- `placeholder`: _(Optional)_ Placeholder text displayed when the `query` is empty. Defaults to `"Search..."`.

---

### Usage

#### Example 1: `SearchBar` with Custom Label

```swift
SearchBar(.constant(""), placeholder: "Search for anything...", style: .CTA) {
    IconButton {
        // Action
    } label: {
        Icons.Airplane(with: .medium)
    }
}
```

#### Example 2: Basic `SearchBar`

```swift
SearchBar(.constant(""), placeholder: "Enter search text")
```

#### Example 3: `SearchBar` with Primary Style and Label

```swift
SearchBar(.constant("Example"), style: .primary) {
    IconButton(.lowest) {
        // Action
    } label: {
        Icons.Airplane(with: .medium)
            .foregroundStyle(Color.SpenceKit.TertiaryText)
    }
}
```

---

### Features

- **Dynamic Text Input**: Binds to a `String` for real-time updates.
- **Placeholder Support**: Displays a placeholder when no text is entered.
- **Style Options**: Includes `.CTA`, `.primary`, and `.lowest` styles for visual customization.
- **Optional Label**: Adds dynamic content using the `@ViewBuilder` label.
- **Clear Button**: Automatically shows a clear button when `query` is not empty.

---

### Notes

- **Styling**: Adjust visual styles via `SpenceKitStyle` to match the design language.
- **Label Visibility**: Automatically hides the label if the style does not require it.
- **Flexibility**: Supports additional features such as truncation and dynamic width.

---

### Related

- **Views**: `IconButton`, `HelperButtons.ClearText`, `Icons.MagnifyingGlass`
- **Modifiers**: `.roundBorder`, `.padding`, `.frame`
- **Styles**: `SpenceKitStyle`

---


## `LargeChip` View

A versatile rounded rectangular view that can display text, icons, or custom content with optional actions. Designed for both simple and complex use cases.

---
### Preview on Figma

 [SpenceKit LargeChip Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=567-444&t=qX2O40tvnik5nS45-1)

---
### Declaration

```swift
public struct LargeChip<Content: View>: View
````

#### Type: Mixture

- Combines **Elements** (e.g., `Text`, `SFIcon`).
- Incorporates **Compounds** (e.g., `Button`, `HStack`).

---

### Initializers

#### 1. `LargeChip with Custom Label (No Action)`

Creates a `LargeChip` with a customizable label and optional style.

```swift
public init(
    _ style: SpenceKitStyle = .primary,
    @ViewBuilder label: @escaping () -> Content
)
```

##### Parameters

- `style`: _(Optional)_ Visual style of the chip. Defaults to `.primary`.
- `label`: A closure providing custom content for the chip.

---

#### 2. `LargeChip with Custom Label and Action`

Creates a `LargeChip` with a customizable label and an action when tapped.

```swift
public init(
    _ style: SpenceKitStyle = .primary,
    action: @escaping () -> Void,
    @ViewBuilder label: @escaping () -> Content
)
```

##### Parameters

- `style`: _(Optional)_ Visual style of the chip. Defaults to `.primary`.
- `action`: A closure executed when the chip is tapped.
- `label`: A closure providing custom content for the chip.

---

#### 3. `LargeChip with Text (No Action)`

Creates a `LargeChip` displaying text with optional styling.

```swift
public init(
    _ text: String,
    style: SpenceKitStyle = .primary
) where Content == Text
```

##### Parameters

- `text`: The text displayed inside the chip.
- `style`: _(Optional)_ Visual style of the chip. Defaults to `.primary`.

---

#### 4. `LargeChip with Text and Action`

Creates a `LargeChip` displaying text with a tap action.

```swift
public init(
    _ text: String,
    style: SpenceKitStyle = .primary,
    action: @escaping () -> Void
) where Content == Text
```

##### Parameters

- `text`: The text displayed inside the chip.
- `style`: _(Optional)_ Visual style of the chip. Defaults to `.primary`.
- `action`: A closure executed when the chip is tapped.

---

#### 5. `LargeChip with Icon and Text (No Action)`

Creates a `LargeChip` displaying an SF Symbol and text without a tap action.

```swift
@available(iOS 16.0, *)
public init(
    _ systemName: String,
    _ text: String,
    style: SpenceKitStyle = .primary
) where Content == HStack<TupleView<(SFIcon, Text)>>
```

##### Parameters

- `systemName`: The name of the SF Symbol displayed inside the chip.
- `text`: The text displayed alongside the icon.
- `style`: _(Optional)_ Visual style of the chip. Defaults to `.primary`.

---

#### 6. `LargeChip with Icon, Text, and Action`

Creates a `LargeChip` displaying an SF Symbol and text with a tap action.

```swift
@available(iOS 16.0, *)
public init(
    _ systemName: String,
    _ text: String,
    style: SpenceKitStyle = .primary,
    action: @escaping () -> Void
) where Content == HStack<TupleView<(SFIcon, Text)>>
```

##### Parameters

- `systemName`: The name of the SF Symbol displayed inside the chip.
- `text`: The text displayed alongside the icon.
- `style`: _(Optional)_ Visual style of the chip. Defaults to `.primary`.
- `action`: A closure executed when the chip is tapped.

---

### Usage

#### Example 1: `LargeChip` with Text and Action

```swift
LargeChip("Tap Me", style: .primary) {
    print("Chip tapped!")
}
```

#### Example 2: `LargeChip` with Icon and Text

```swift
LargeChip("star.fill", "Favorite", style: .primary)
```

#### Example 3: Custom `LargeChip`

```swift
LargeChip(.primary) {
    SFIcon("checkmark", size: .head)
    Text("Custom Label")
        .font(Font.SpenceKit.SansHeadlineFont)
}
```

---

### Features

- **Customizable Content**: Supports text, icons, or any custom SwiftUI views.
- **Styling Options**: Includes `.primary`, `.lowest`, and more styles from `SpenceKitStyle`.
- **Optional Actions**: Configure the chip with or without tap interactions.
- **Dynamic Layout**: Automatically adjusts padding and sizing for content.

---

### Notes

- **Content Flexibility**: Use the `@ViewBuilder` to include complex layouts or multiple views.
- **iOS Compatibility**: Icon-based initializers require iOS 16.0 or later.
- **Styling Dependency**: Colors and fonts depend on `SpenceKitStyle` configurations.

---

### Related

- **Views**: `Button`, `HStack`, `SFIcon`
- **Modifiers**: `.padding`, `.clipShape`, `.stroke`
- **Styles**: `SpenceKitStyle`

---


## `SmallChip` View

A compact rounded rectangular view designed for displaying concise content such as text, icons, or custom labels. Supports optional actions and flexible styling.

---
### Preview on Figma

 [SpenceKit SmallChip Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=567-486&t=qX2O40tvnik5nS45-1)

---
### Declaration

```swift
public struct SmallChip<Content: View>: View
````

#### Type: Mixture

- Combines **Elements** (e.g., `Text`, `SFIcon`).
- Incorporates **Compounds** (e.g., `Button`, `HStack`).

---

### Initializers

#### 1. `SmallChip with Custom Label (No Action)`

Creates a `SmallChip` with a customizable label and optional style.

```swift
public init(
    _ style: SpenceKitStyle = .primary,
    @ViewBuilder label: @escaping () -> Content
)
```

##### Parameters

- `style`: _(Optional)_ Visual style of the chip. Defaults to `.primary`.
- `label`: A closure providing custom content for the chip.

---

#### 2. `SmallChip with Custom Label and Action`

Creates a `SmallChip` with a customizable label and a tap action.

```swift
public init(
    _ style: SpenceKitStyle = .primary,
    action: @escaping () -> Void,
    @ViewBuilder label: @escaping () -> Content
)
```

##### Parameters

- `style`: _(Optional)_ Visual style of the chip. Defaults to `.primary`.
- `action`: A closure executed when the chip is tapped.
- `label`: A closure providing custom content for the chip.

---

#### 3. `SmallChip with Text (No Action)`

Creates a `SmallChip` displaying text with optional styling.

```swift
public init(
    _ text: String,
    style: SpenceKitStyle = .primary
) where Content == Text
```

##### Parameters

- `text`: The text displayed inside the chip.
- `style`: _(Optional)_ Visual style of the chip. Defaults to `.primary`.

---

#### 4. `SmallChip with Text and Action`

Creates a `SmallChip` displaying text with a tap action.

```swift
public init(
    _ text: String,
    style: SpenceKitStyle = .primary,
    action: @escaping () -> Void
) where Content == Text
```

##### Parameters

- `text`: The text displayed inside the chip.
- `style`: _(Optional)_ Visual style of the chip. Defaults to `.primary`.
- `action`: A closure executed when the chip is tapped.

---

#### 5. `SmallChip with Icon and Text (No Action)`

Creates a `SmallChip` displaying an SF Symbol and text without a tap action.

```swift
@available(iOS 16.0, *)
public init(
    _ systemName: String,
    _ text: String,
    style: SpenceKitStyle = .primary
) where Content == HStack<TupleView<(SFIcon, Text)>>
```

##### Parameters

- `systemName`: The name of the SF Symbol displayed inside the chip.
- `text`: The text displayed alongside the icon.
- `style`: _(Optional)_ Visual style of the chip. Defaults to `.primary`.

---

#### 6. `SmallChip with Icon, Text, and Action`

Creates a `SmallChip` displaying an SF Symbol and text with a tap action.

```swift
@available(iOS 16.0, *)
public init(
    _ systemName: String,
    _ text: String,
    style: SpenceKitStyle = .primary,
    action: @escaping () -> Void
) where Content == HStack<TupleView<(SFIcon, Text)>>
```

##### Parameters

- `systemName`: The name of the SF Symbol displayed inside the chip.
- `text`: The text displayed alongside the icon.
- `style`: _(Optional)_ Visual style of the chip. Defaults to `.primary`.
- `action`: A closure executed when the chip is tapped.

---

### Usage

#### Example 1: `SmallChip` with Text and Action

```swift
SmallChip("Tap Me", style: .primary) {
    print("Chip tapped!")
}
```

#### Example 2: `SmallChip` with Icon and Text

```swift
SmallChip("star.fill", "Favorite", style: .primary)
```

#### Example 3: Custom `SmallChip`

```swift
SmallChip(.primary) {
    HStack {
        SFIcon("checkmark", size: .head)
        Text("Custom Label")
            .font(Font.SpenceKit.SansSubheadlineFont)
    }
}
```

---

### Features

- **Compact Design**: Ideal for small amounts of content or concise labels.
- **Customizable Content**: Supports text, icons, or any custom SwiftUI views.
- **Styling Options**: Includes `.primary`, `.lowest`, and more styles from `SpenceKitStyle`.
- **Optional Actions**: Configure the chip with or without tap interactions.

---

### Notes

- **Content Flexibility**: Use the `@ViewBuilder` to include complex layouts or multiple views.
- **iOS Compatibility**: Icon-based initializers require iOS 16.0 or later.
- **Styling Dependency**: Colors and fonts depend on `SpenceKitStyle` configurations.

---

### Related

- **Views**: `Button`, `HStack`, `SFIcon`
- **Modifiers**: `.padding`, `.clipShape`, `.stroke`
- **Styles**: `SpenceKitStyle`

---

## `ExpandingButton` View

A versatile button with dynamic width expansion, customizable content, and multiple style options. Ideal for creating visually consistent and accessible buttons across layouts.

---
### Preview on Figma

 [SpenceKit ExpandingButton Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=567-528&t=qX2O40tvnik5nS45-1)

---
### Declaration

```swift
public struct ExpandingButton<Content: View>: View
````

#### Type: Mixture

- Combines **Elements** (e.g., `Text`, `Button`, `RoundedRectangle`).
- Incorporates **Compounds** (e.g., `CornerRadiusReader`, `ZStack`).

---

### Initializers

#### 1. `ExpandingButton with Action and Label`

Creates an `ExpandingButton` with a specified style, action, and custom label.

```swift
public init(
    _ style: SpenceKitStyle = .primary,
    action: @escaping () -> Void,
    @ViewBuilder label: @escaping () -> Content
)
```

##### Parameters

- `style`: _(Optional)_ The style of the button, affecting its colors and appearance. Defaults to `.primary`.
- `action`: A closure executed when the button is tapped.
- `label`: A closure providing custom content for the button.

---

### Usage

#### Example 1: `ExpandingButton` with Text Label

```swift
ExpandingButton(.primary) {
    print("Button tapped")
} label: {
    Text("Click Me")
        .font(Font.SpenceKit.SansHeadlineFont)
}
```

#### Example 2: `ExpandingButton` with Icon and Text

```swift
ExpandingButton(.CTA) {
    print("CTA Button tapped")
} label: {
    HStack {
        Image(systemName: "arrow.up.right")
        Text("Continue")
    }
}
```

---

### Features

- **Dynamic Width**: Automatically expands to fit the parent layout.
- **Style Variants**: Supports multiple styles (`.CTA`, `.primary`, `.secondary`, `.tertiary`, etc.) to align with the design language.
- **Customizable Content**: Use the `@ViewBuilder` to include any combination of text, icons, or custom views.
- **Rounded Corners**: Adapts corner radius dynamically using `CornerRadiusReader`.

---

### Notes

- **Styling Dependency**: Colors and fonts depend on `SpenceKitStyle`.
- **Flexible Layout**: Automatically adjusts dimensions for consistent appearance across devices.
- **Accessibility**: Ensures labels and styles are accessible and visually distinct.

---

### Related

- **Views**: `Button`, `RoundedRectangle`, `ZStack`
- **Modifiers**: `.frame`, `.foregroundStyle`, `.background`
- **Styles**: `SpenceKitStyle`

---



## `InlineTextField` View

An inline text input field with customizable placeholders, titles, descriptions, and optional identifier and helper button support.

---
### Preview on Figma

 [SpenceKit InlineTextField Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=567-570&t=qX2O40tvnik5nS45-1)

---
### Declaration

```swift
public struct InlineTextField<IdentifierContent: View, HelperContent: View>: View
````

#### Type: Mixture

- Combines **Elements** (e.g., `Text`, `TextField`, `Image`).
- Incorporates **Compounds** (e.g., `HelperButtons.Info`, `SFIcon`).

---

### Initializers

#### 1. `InlineTextField with Placeholder and Text`

Creates a basic `InlineTextField` with a placeholder and text binding.

```swift
public init(
    _ placeholder: String,
    _ text: Binding<String>,
    title: String = "",
    description: String = ""
) where IdentifierContent == EmptyView, HelperContent == EmptyView
```

##### Parameters

- `placeholder`: The placeholder text displayed when the field is empty.
- `text`: A binding to the text input.
- `title`: _(Optional)_ A title displayed above the text field. Defaults to an empty string.
- `description`: _(Optional)_ A description displayed below the text field. Defaults to an empty string.

---

#### 2. `InlineTextField with Helper Button`

Adds a helper button to the basic `InlineTextField`.

```swift
public init(
    _ placeholder: String,
    _ text: Binding<String>,
    title: String = "",
    description: String = "",
    @ViewBuilder helperButton: @escaping () -> HelperContent
) where IdentifierContent == EmptyView
```

##### Additional Parameter

- `helperButton`: A closure providing the content for the helper button.

---

#### 3. `InlineTextField with Identifier and Helper Button`

Adds both an identifier and a helper button.

```swift
public init(
    _ placeholder: String,
    _ text: Binding<String>,
    title: String = "",
    description: String = "",
    @ViewBuilder identifier: @escaping () -> IdentifierContent,
    @ViewBuilder helperButton: @escaping () -> HelperContent
)
```

##### Additional Parameters

- `identifier`: A closure providing an identifier, such as an icon or label.
- `helperButton`: A closure providing the content for the helper button.

---

#### 4. `InlineTextField with Identifier`

Adds only an identifier to the `InlineTextField`.

```swift
public init(
    _ placeholder: String,
    _ text: Binding<String>,
    title: String = "",
    description: String = "",
    @ViewBuilder identifier: @escaping () -> IdentifierContent
) where HelperContent == EmptyView
```

##### Additional Parameter

- `identifier`: A closure providing an identifier, such as an icon or label.

---

### Usage

#### Example 1: Basic `InlineTextField`

```swift
InlineTextField("Enter text", $text)
```

#### Example 2: With Title and Description

```swift
InlineTextField(
    "Placeholder",
    $text,
    title: "Title",
    description: "Additional description"
)
```

#### Example 3: With Identifier and Helper Button

```swift
InlineTextField(
    "Enter Text...",
    $text,
    title: "Title",
    description: "Description"
) {
    SFIcon("arrow.up.right", size: .head)
} helperButton: {
    HelperButtons.Info {
        print("Info tapped")
    }
}
```

---

### Features

- **Customizable Placeholder**: Displays placeholder text when the input is empty.
- **Title and Description**: Provides optional labels for better context and guidance.
- **Identifiers and Helpers**: Supports additional views such as icons and buttons for extended functionality.
- **Focus Management**: Includes a keyboard dismissal button for seamless interaction.

---

### Notes

- **Dynamic Content**: Uses `@ViewBuilder` closures for flexible identifier and helper button content.
- **Styling Dependency**: Adheres to `SpenceKit.Constants` for consistent spacing, fonts, and colors.
- **Animation**: Smooth transitions for focus-related UI changes.

---

### Related

- **Views**: `TextField`, `Text`, `Image`
- **Modifiers**: `.focused`, `.foregroundStyle`, `.padding`
- **Components**: `HelperButtons.Info`, `SFIcon`

---

## `MultilineTextField` View

A flexible multiline text input component with customizable placeholder, title, description, character limit, and optional identifier and helper button support.

---
### Preview on Figma

 [SpenceKit MultilineTextField Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=567-612&t=qX2O40tvnik5nS45-1)

---
### Declaration

```swift
public struct MultilineTextField<IdentifierContent: View, HelperContent: View>: View
````

#### Type: Mixture

- Combines **Elements** (e.g., `TextEditor`, `Text`, `Image`).
- Incorporates **Compounds** (e.g., `HelperButtons.Info`, `SFIcon`).

---

### Initializers

#### 1. `MultilineTextField with Placeholder and Text`

Creates a basic `MultilineTextField` with a placeholder, text binding, and optional title and description.

```swift
public init(
    _ placeholder: String,
    _ text: Binding<String>,
    title: String = "",
    description: String = "",
    maxCharacters: Int = 250
) where IdentifierContent == EmptyView, HelperContent == EmptyView
```

##### Parameters

- `placeholder`: The placeholder text displayed when the field is empty.
- `text`: A binding to the text input.
- `title`: _(Optional)_ A title displayed above the text field. Defaults to an empty string.
- `description`: _(Optional)_ A description displayed below the text field. Defaults to an empty string.
- `maxCharacters`: _(Optional)_ Maximum number of characters allowed. Defaults to `250`.

---

#### 2. `MultilineTextField with Helper Button`

Adds a helper button to the basic `MultilineTextField`.

```swift
public init(
    _ placeholder: String,
    _ text: Binding<String>,
    title: String,
    description: String = "",
    maxCharacters: Int = 250,
    @ViewBuilder helperButton: @escaping () -> HelperContent
) where IdentifierContent == EmptyView
```

##### Additional Parameter

- `helperButton`: A closure providing the content for the helper button.

---

#### 3. `MultilineTextField with Identifier`

Adds an identifier to the `MultilineTextField`.

```swift
public init(
    _ placeholder: String,
    _ text: Binding<String>,
    title: String,
    description: String = "",
    maxCharacters: Int = 250,
    @ViewBuilder identifier: @escaping () -> IdentifierContent
) where HelperContent == EmptyView
```

##### Additional Parameter

- `identifier`: A closure providing an identifier, such as an icon or label.

---

#### 4. `MultilineTextField with Identifier and Helper Button`

Adds both an identifier and a helper button to the `MultilineTextField`.

```swift
public init(
    _ placeholder: String,
    _ text: Binding<String>,
    title: String,
    description: String = "",
    maxCharacters: Int = 250,
    @ViewBuilder identifier: @escaping () -> IdentifierContent,
    @ViewBuilder helperButton: @escaping () -> HelperContent
)
```

##### Additional Parameters

- `identifier`: A closure providing an identifier, such as an icon or label.
- `helperButton`: A closure providing the content for the helper button.

---

### Usage

#### Example 1: Basic `MultilineTextField`

```swift
MultilineTextField("Enter text here", $text, maxCharacters: 200)
```

#### Example 2: With Title and Description

```swift
MultilineTextField(
    "Placeholder",
    $text,
    title: "Title",
    description: "Additional description",
    maxCharacters: 300
)
```

#### Example 3: With Identifier and Helper Button

```swift
MultilineTextField(
    "Enter Text...",
    $text,
    title: "Title",
    description: "More info...",
    maxCharacters: 500
) {
    SFIcon("arrow.up.right", size: .head)
} helperButton: {
    HelperButtons.Info {
        print("Helper tapped")
    }
}
```

---

### Features

- **Customizable Placeholder**: Displays placeholder text when input is empty.
- **Title and Description**: Optional title and description for context.
- **Character Limit**: Enforces a maximum character count with real-time validation.
- **Identifiers and Helpers**: Supports additional views such as icons and buttons for extended functionality.
- **Focus Management**: Includes a keyboard dismissal button for seamless interaction.

---

### Notes

- **Dynamic Content**: Uses `@ViewBuilder` closures for flexible identifier and helper button content.
- **Styling Dependency**: Adheres to `SpenceKit.Constants` for consistent spacing, fonts, and colors.
- **Resizable Height**: Adjusts height dynamically based on character limit and content.

---

### Related

- **Views**: `TextEditor`, `Text`, `Image`
- **Modifiers**: `.focused`, `.foregroundStyle`, `.padding`
- **Components**: `HelperButtons.Info`, `SFIcon`

---


## TODO: `IconProgressSelector` View

🚧 work in progress! 🚧

---
### Preview on Figma

 [SpenceKit IconProgressSelector Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=567-695&t=qX2O40tvnik5nS45-1)

---

## `ProgressSelector` View

A flexible, step-based linear progression component for navigating multi-step processes. Supports custom styling, labels, skippable steps, and optional finish actions.

---
### Preview on Figma

 [SpenceKit ProgressSelector Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=567-653&t=qX2O40tvnik5nS45-1)

---
### Declaration

```swift
@available(iOS 16.0, *)
public struct ProgressSelector<ContentCompleted: View, ContentActive: View, ContentInactive: View, ContentFinish: View>: View
````

#### Type: Mixture

- Combines **Elements** (e.g., `Divider`, `Spacer`).
- Incorporates **Compounds** (e.g., `LargeChip`, `SmallChip`, `ScrollViewReader`).

---

### Initializers

#### 1. `ProgressSelector with Default Content`

Creates a `ProgressSelector` with default chips for active, inactive, and completed states, along with optional finish functionality.

```swift
public init(
    _ selection: Binding<Int>,
    style: SpenceKitStyle,
    size: SpenceKitSize = .large,
    placeholder: String? = nil,
    skippable: Bool = true,
    labels: [String],
    padding: CGFloat = SpenceKit.Constants.padding16
) where ContentCompleted == AnyView, ContentActive == AnyView, ContentInactive == AnyView, ContentFinish == AnyView
```

##### Parameters

- `selection`: A binding to the current step index.
- `style`: The visual style of the progress selector.
- `size`: _(Optional)_ The size of the chips. Defaults to `.large`.
- `placeholder`: _(Optional)_ Label for the finish step. Defaults to `"Finish"`.
- `skippable`: _(Optional)_ Indicates whether steps can be skipped. Defaults to `true`.
- `labels`: An array of labels for each step.
- `padding`: _(Optional)_ Horizontal padding around chips. Defaults to `SpenceKit.Constants.padding16`.

---

#### 2. `ProgressSelector with Custom Content (No Finish)`

Creates a `ProgressSelector` with fully customizable chips for completed, active, and inactive states.

```swift
public init(
    _ selection: Binding<Int>,
    padding: CGFloat = SpenceKit.Constants.padding16,
    skippable: Bool = true,
    @ViewBuilder completed: @escaping () -> ContentCompleted,
    @ViewBuilder active: @escaping () -> ContentActive,
    @ViewBuilder inactive: @escaping () -> ContentInactive
) where ContentFinish == EmptyView
```

##### Parameters

- `selection`: A binding to the current step index.
- `padding`: _(Optional)_ Horizontal padding around chips. Defaults to `SpenceKit.Constants.padding16`.
- `skippable`: _(Optional)_ Indicates whether steps can be skipped. Defaults to `true`.
- `completed`: A closure providing custom views for completed steps.
- `active`: A closure providing custom views for active steps.
- `inactive`: A closure providing custom views for inactive steps.

---

#### 3. `ProgressSelector with Custom Content (With Finish)`

Creates a `ProgressSelector` with fully customizable chips for all states, including a finish step.

```swift
public init(
    _ selection: Binding<Int>,
    padding: CGFloat = SpenceKit.Constants.padding16,
    skippable: Bool = true,
    @ViewBuilder completed: @escaping () -> ContentCompleted,
    @ViewBuilder active: @escaping () -> ContentActive,
    @ViewBuilder inactive: @escaping () -> ContentInactive,
    @ViewBuilder finish: @escaping () -> ContentFinish
)
```

##### Additional Parameter

- `finish`: A closure providing a custom view for the finish step.

---

### Usage

#### Example 1: Default `ProgressSelector`

```swift
ProgressSelector(
    .constant(2),
    style: .CTA,
    labels: ["Step 1", "Step 2", "Step 3"]
)
```

#### Example 2: Custom Content without Finish

```swift
ProgressSelector($selection) {
    LargeChip("Completed", style: .primary)
} active: {
    LargeChip("Active", style: .secondary)
} inactive: {
    LargeChip("Inactive", style: .tertiary)
}
```

#### Example 3: Custom Content with Finish

```swift
ProgressSelector($selection) {
    LargeChip("Completed", style: .primary)
} active: {
    LargeChip("Active", style: .secondary)
} inactive: {
    LargeChip("Inactive", style: .tertiary)
} finish: {
    LargeChip("Finish", style: .CTA)
}
```

---

### Features

- **Step-Based Progression**: Displays a linear progression through steps with customizable views.
- **Custom States**: Provides customizability for completed, active, inactive, and finish states.
- **Scroll Support**: Automatically enables horizontal scrolling for larger content.
- **Finish Step**: Optionally adds a finish step with customizable behavior.
- **Skippable Steps**: Configurable option to allow skipping steps.

---

### Notes

- **Dynamic Layout**: Adapts to the screen width, either fitting all content or enabling scrollable behavior.
- **Responsive Design**: Adjusts chip sizes and spacing based on the `size` and `padding` parameters.
- **Styling Dependency**: Uses `SpenceKit.Constants` for consistent spacing and design language.

---

### Related

- **Views**: `Divider`, `ScrollView`, `LargeChip`, `SmallChip`
- **Modifiers**: `.padding`, `.measure`
- **Components**: `ScrollViewReader`

---

## `TabSelector` View

An inline tab selection component for horizontally displaying tabs with active and inactive states. Tabs are fully customizable, supporting dynamic layouts and transitions.

---
### Preview on Figma

 [SpenceKit TabSelector Preview](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=564-170&t=qX2O40tvnik5nS45-1)

---
### Declaration

```swift
@available(iOS 16.0, *)
public struct TabSelector<ContentInactive: View, ContentActive: View>: View
````

#### Type: Mixture

- Combines **Elements** (e.g., `RoundedRectangle`, `Spacer`).
- Incorporates **Compounds** (e.g., `SmallChip`, `LargeChip`).

---

### Initializers

#### 1. `TabSelector with Default Content`

Creates a `TabSelector` with a binding to the selected tab, style, and a predefined set of tabs.

```swift
public init(
    _ selection: Binding<Int>,
    style: SpenceKitStyle,
    tabs: [Tab]
) where ContentInactive == AnyView, ContentActive == AnyView
```

##### Parameters

- `selection`: A binding to the currently selected tab index.
- `style`: The style applied to the active tabs.
- `tabs`: An array of `Tab` objects defining the tab titles.

---

#### 2. `TabSelector with Custom Content`

Creates a `TabSelector` with custom views for active and inactive states.

```swift
public init(
    _ selection: Binding<Int>,
    @ViewBuilder active: @escaping () -> ContentActive,
    @ViewBuilder inactive: @escaping () -> ContentInactive
)
```

##### Parameters

- `selection`: A binding to the currently selected tab index.
- `active`: A closure providing custom views for active tabs.
- `inactive`: A closure providing custom views for inactive tabs.

---

### Usage

#### Example 1: `TabSelector` with Default Tabs

```swift
TabSelector(
    $selectedTab,
    style: .CTA,
    tabs: [
        Tab("Home"),
        Tab("Search"),
        Tab("Profile")
    ]
)
```

#### Example 2: `TabSelector` with Custom Tabs

```swift
TabSelector($selectedTab) {
    LargeChip("Tab 1", style: .CTA)
    LargeChip("Tab 2", style: .primary)
    LargeChip("Tab 3", style: .secondary)
} inactive: {
    SmallChip("Tab 1", style: .secondary)
    SmallChip("Tab 2", style: .tertiary)
    SmallChip("Tab 3", style: .lowest)
}
```

---

### Features

- **Dynamic States**: Supports active and inactive states for each tab.
- **Custom Content**: Use the `@ViewBuilder` closures to design unique active and inactive tab styles.
- **Interactive Layout**: Allows users to switch tabs with smooth animations and gesture support.
- **Inline Design**: Tabs are displayed in a horizontal arrangement, ideal for compact layouts.

---

### Notes

- **Styling Dependency**: Adheres to `SpenceKit.Constants` for consistent spacing, colors, and corner radius.
- **Responsiveness**: The layout adapts to the available width, ensuring a clean and usable interface.
- **Animation**: Includes smooth transitions when switching between tabs.

---

### Related

- **Views**: `RoundedRectangle`, `Spacer`, `LargeChip`, `SmallChip`
- **Modifiers**: `.padding`, `.onTapGesture`, `.measure`
- **Components**: `Tab`


---

## TODO: `SteppedSlider` View

🚧 work in progress! 🚧

---
### Preview on Figma

 [SpenceKit SteppedSlider Preview](hhttps://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=567-737&t=qX2O40tvnik5nS45-1)

---
---
# Classes

## `Icons` Class

A static utility class providing access to commonly used icons in a resizable and customizable format. Designed for quick integration into views with consistent styling.

---

### Declaration

```swift
public final class Icons
````

---

### Methods

#### 1. `Airplane`

Returns a static airplane icon view, resizable based on the provided size.

```swift
@MainActor @available(iOS 16.0, *)
public static func Airplane(with size: SpenceKitSize) -> some View
```

##### Parameters

- `size`: The desired size of the icon, defined by `SpenceKitSize`.

##### Example

```swift
Icons.Airplane(with: .head)
    .foregroundStyle(Color.SpenceKit.PrimaryText)
```

---

#### 2. `MagnifyingGlass`

Returns a static magnifying glass icon view, resizable based on the provided size.

```swift
@MainActor @available(iOS 16.0, *)
public static func MagnifyingGlass(with size: SpenceKitSize) -> some View
```

##### Parameters

- `size`: The desired size of the icon, defined by `SpenceKitSize`.

##### Example

```swift
Icons.MagnifyingGlass(with: .head)
    .foregroundStyle(Color.SpenceKit.PrimaryText)
```

---

### Features

- **Static Access**: Provides predefined icons for consistent use across the app.
- **Resizable**: Icons adjust dynamically based on the size specified via `SpenceKitSize`.
- **Customizable**: Easily apply styles like `foregroundStyle` to match design requirements.

---

### Notes

- **iOS Compatibility**: Available for iOS 16.0 and later.
- **Design Consistency**: Ensures uniform icon dimensions and alignment across components.
- **Performance**: Uses `UIImage` for optimized rendering.

---

### Related

- **Views**: `Image`
- **Modifiers**: `.resizable`, `.frame`, `.aspectRatio`
- **Components**: `SpenceKitSize`


---

## `HelperButtons` Class

A static utility class providing pre-configured helper button views for common interactions such as clearing text, toggling visibility, and displaying information.

---

### Declaration

```swift
public final class HelperButtons
````

---

### Methods

#### 1. `ClearText`

Returns a button for clearing text, styled with a "xmark" icon.

```swift
@MainActor @available(iOS 16.0, *)
public static func ClearText(action: @escaping () -> Void) -> some View
```

##### Parameters

- `action`: A closure executed when the button is tapped.

##### Example

```swift
HelperButtons.ClearText {
    print("Clear text action executed")
}
```

---

#### 2. `Peek`

Returns a button for toggling visibility to "peek," styled with an "eye" icon.

```swift
@MainActor @available(iOS 16.0, *)
public static func Peek(action: @escaping () -> Void) -> some View
```

##### Parameters

- `action`: A closure executed when the button is tapped.

##### Example

```swift
HelperButtons.Peek {
    print("Peek action executed")
}
```

---

#### 3. `Hide`

Returns a button for toggling visibility to "hide," styled with an "eye.slash" icon.

```swift
@MainActor @available(iOS 16.0, *)
public static func Hide(action: @escaping () -> Void) -> some View
```

##### Parameters

- `action`: A closure executed when the button is tapped.

##### Example

```swift
HelperButtons.Hide {
    print("Hide action executed")
}
```

---

#### 4. `Info`

Returns a button for displaying information, styled with an "info" icon.

```swift
@MainActor @available(iOS 16.0, *)
public static func Info(action: @escaping () -> Void) -> some View
```

##### Parameters

- `action`: A closure executed when the button is tapped.

##### Example

```swift
HelperButtons.Info {
    print("Info action executed")
}
```

---

### Features

- **Reusable Buttons**: Pre-configured buttons for common actions, reducing development effort.
- **Dynamic Actions**: Executes custom closures upon interaction.
- **Customizable Styles**: Buttons are styled using `SpenceKit` themes for visual consistency.
- **SF Symbols Integration**: Leverages `SFIcon` for easily recognizable icons.

---

### Notes

- **iOS Compatibility**: Available for iOS 16.0 and later.
- **Quick Integration**: Use these static methods to streamline common interactions in your app.

---

### Related

- **Views**: `HelperButton`, `SFIcon`
- **Modifiers**: `.font`, `.foregroundStyle`
- **Components**: `SpenceKitStyle`

---


---
# Structures
(that aren't Views)

## `SpenceKit`

A foundational structure providing constants and utilities for consistent design and layout in the SpenceKit framework. It defines reusable values for spacing, padding, and corner radii, ensuring visual harmony across components.

---

### Declaration

```swift
public struct SpenceKit
````

#### Type: Element

- Represents the core design system of SpenceKit, defining shared constants for UI components.

---

### `SpenceKit.Constants`

A nested struct within `SpenceKit` that defines standard values for dimensions used throughout the framework. These constants maintain a unified design language and simplify UI development.

#### Declaration

```swift
public struct Constants
```

---

### Constants Overview

#### **Corner Radius**

Predefined corner radius values for consistent rounded shapes.

- `cornerRadiusMAX: CGFloat = 1024`
    - Used for creating fully rounded views like circles or pill shapes.
- `cornerRadius32: CGFloat = 32`
    - For large rounded corners, typically used in cards or containers.
- `cornerRadius24: CGFloat = 24`
    - Commonly applied to buttons and smaller UI elements.
- `cornerRadius16: CGFloat = 16`
    - Medium-sized rounded corners for moderate shapes.
- `cornerRadius8: CGFloat = 8`
    - Subtle rounded corners, ideal for input fields or icons.
- `cornerRadius4: CGFloat = 4`
    - Minimal rounding, often used in tight layouts.

#### **Padding**

Standardized padding values to maintain consistent spacing inside components.

- `padding24: CGFloat = 24`
    - Used for larger spacing, such as view margins.
- `padding16: CGFloat = 16`
    - Moderate padding, typically for content inside containers.
- `padding12: CGFloat = 12`
    - Compact padding for tighter layouts.
- `padding8: CGFloat = 8`
    - Small padding for minor spacing adjustments.
- `padding4: CGFloat = 4`
    - Minimal padding for subtle separation.

#### **Spacing**

Defines the space between elements, ensuring uniform alignment.

- `spacing24: CGFloat = 24`
- `spacing16: CGFloat = 16`
- `spacing12: CGFloat = 12`
- `spacing8: CGFloat = 8`
- `spacing4: CGFloat = 4`

#### **Border Width**

- `borderWidth: CGFloat = 2`
    - Default border width for components requiring outlines or separators.

---

### Usage

These constants can be accessed directly within views or modifiers for easy and consistent styling.

#### Example: Corner Radius

```swift
RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadius16)
    .stroke(Color.primary, lineWidth: SpenceKit.Constants.borderWidth)
```

#### Example: Padding and Spacing

```swift
VStack(spacing: SpenceKit.Constants.spacing12) {
    Text("Item 1")
        .padding(SpenceKit.Constants.padding16)
    Text("Item 2")
        .padding(SpenceKit.Constants.padding8)
}
```

---

### Features

- **Consistency**: Promotes uniformity across all components and layouts.
- **Reusability**: Predefined constants eliminate repetitive value definitions.
- **Scalability**: Values are adaptable for different screen sizes or themes.

---

### Notes

- The constants are integral to maintaining visual coherence within the SpenceKit framework.
- Values like `cornerRadiusMAX` are useful for dynamic shapes, especially for highly rounded containers.

---

### Related

- **Modifiers**: `.padding`, `.cornerRadius`, `.spacing`
- **Components**: `RoundedRectangle`, `Circle`, `VStack`, `HStack`

---
## `Tab` 

A flexible and reusable structure representing a tab within a user interface. The `Tab` object includes properties for titles, icons, roles, and actions, allowing for consistent implementation across components like `TabBar` or `TabGroup`.

---

### Declaration

```swift
public struct Tab: Identifiable
````

#### Type: Element

- Represents a standalone, reusable unit for tab-based navigation.

---

### Initializers

#### 1. **Tab with a Single Icon and Action**

Creates a `Tab` with a title, a single icon (active and inactive states are the same), an optional button role, and an action.

```swift
public init(
    _ title: String,
    icon: Image,
    role: ButtonRole? = nil,
    action: @escaping () -> Void
)
```

##### Parameters

- `title`: The label for the tab.
- `icon`: The shared icon for both active and inactive states.
- `role`: _(Optional)_ Specifies the button's role (`cancel`, `destructive`, or `none`). Defaults to `nil`.
- `action`: A closure executed when the tab is selected.

---

#### 2. **Tab with a Single Icon**

Creates a `Tab` with a title and a single icon (used for both active and inactive states) without an action.

```swift
public init(
    _ title: String,
    icon: Image,
    role: ButtonRole? = nil
)
```

##### Parameters

- `title`: The label for the tab.
- `icon`: The shared icon for both active and inactive states.
- `role`: _(Optional)_ Specifies the button's role. Defaults to `nil`.

---

#### 3. **Tab with Active and Inactive Icons and Action**

Creates a `Tab` with a title, distinct icons for active and inactive states, an optional role, and an action.

```swift
public init(
    _ title: String,
    activeIcon: Image,
    inactiveIcon: Image,
    role: ButtonRole? = nil,
    action: @escaping () -> Void
)
```

##### Parameters

- `title`: The label for the tab.
- `activeIcon`: The icon displayed when the tab is active.
- `inactiveIcon`: The icon displayed when the tab is inactive.
- `role`: _(Optional)_ Specifies the button's role. Defaults to `nil`.
- `action`: A closure executed when the tab is selected.

---

#### 4. **Tab with Active and Inactive Icons**

Creates a `Tab` with a title and distinct icons for active and inactive states without an action.

```swift
public init(
    _ title: String,
    activeIcon: Image,
    inactiveIcon: Image,
    role: ButtonRole? = nil
)
```

##### Parameters

- `title`: The label for the tab.
- `activeIcon`: The icon displayed when the tab is active.
- `inactiveIcon`: The icon displayed when the tab is inactive.
- `role`: _(Optional)_ Specifies the button's role. Defaults to `nil`.

---

#### 5. **Tab with Title and Action**

Creates a `Tab` with only a title and an action, without icons.

```swift
public init(
    _ title: String,
    role: ButtonRole? = nil,
    action: @escaping () -> Void
)
```

##### Parameters

- `title`: The label for the tab.
- `role`: _(Optional)_ Specifies the button's role. Defaults to `nil`.
- `action`: A closure executed when the tab is selected.

---

#### 6. **Tab with Title**

Creates a `Tab` with only a title, without icons or actions.

```swift
public init(
    _ title: String,
    role: ButtonRole? = nil
)
```

##### Parameters

- `title`: The label for the tab.
- `role`: _(Optional)_ Specifies the button's role. Defaults to `nil`.

---

### Properties

- `id: UUID`: A unique identifier for the tab.
- `title: String`: The label displayed for the tab.
- `hasIcon: Bool`: Indicates if the tab includes an icon.
- `activeIcon: Image`: The icon displayed when the tab is active.
- `inactiveIcon: Image`: The icon displayed when the tab is inactive.
- `role: ButtonRole?`: The role assigned to the tab.
- `action: () -> Void`: A closure executed when the tab is selected.

---

### Usage

#### Example 1: Tab with Icon and Action

```swift
Tab("Home", icon: Image(systemName: "house.fill"), action: {
    print("Home tab selected")
})
```

#### Example 2: Tab with Active and Inactive Icons

```swift
Tab("Settings", activeIcon: Image(systemName: "gearshape.fill"), inactiveIcon: Image(systemName: "gearshape"))
```

#### Example 3: Tab with Title Only

```swift
Tab("Profile")
```

---

### Features

- **Flexibility**: Supports a wide range of configurations with icons, titles, and actions.
- **Reusability**: Easily integrates into tab-based UI components.
- **Customizable**: Allows developers to define roles and behaviors specific to each tab.

---

### Notes

- If no `role` is specified, the tab defaults to `nil` and has no additional behavior.
- Tabs without actions will act as placeholders or visual indicators.
- The `Tab` structure is compatible with SwiftUI components like `TabBar` or `Dropdown`.

---

### Related

- **Views**: `TabBar`, `Dropdown`
- **Modifiers**: `.buttonStyle`, `.foregroundStyle`
- **Icons**: `Image`, `SFIcon`

---

## `Icon`

Provides utility methods for determining font and pixel size based on `SpenceKitSize`.

#### `getFont(for:)`

Returns the associated font and skeleton details for a given size.

```swift
public static func getFont(for size: SpenceKitSize) -> (font: Font, skeleton: Font.SpenceKit.FontSkeleton)
```

- **Parameters**:
    
    - `size`: The size of the icon (`SpenceKitSize`).
- **Returns**:
    
    - `font`: The associated `Font` for the size.
    - `skeleton`: The `FontSkeleton` structure for precise measurements.

#### `getPixelSize(for:)`

Calculates the recommended size in points (pixels) for each size category.

```swift
public static func getPixelSize(for size: SpenceKitSize) -> CGFloat
```

- **Parameters**:
    
    - `size`: The size of the icon (`SpenceKitSize`).
- **Returns**:
    
    - The width and height in points (pixels) for the given size.

---

### Usage Example

#### Setting Icon Size

```swift
let iconSize = SpenceKitSize.Icon.getPixelSize(for: .medium)
Image(systemName: "star.fill")
    .frame(width: iconSize, height: iconSize)
```

#### Getting Font for Size

```swift
let fontDetails = SpenceKitSize.Icon.getFont(for: .head)
Text("Headline")
    .font(fontDetails.font)
```

---


---
# Standalone Enums
## `SpenceKitStyle` 

Defines universal styles for color and functionality across `SpenceKit` Views. These styles can be used to standardize design elements and behavior.

### Declaration

```swift
public enum SpenceKitStyle: Int
````

### Cases

- **`.CTA`** (`0`): Call-to-action style for emphasis.
- **`.primary`** (`1`): Primary style for main elements.
- **`.secondary`** (`2`): Secondary style for less prominent elements.
- **`.tertiary`** (`3`): Tertiary style for subtle elements.
- **`.lowest`** (`4`): Lowest-priority style for minimal emphasis.
- **`.destructive`** (`5`): Destructive style for actions that delete or remove.

### Usage Example 1

```swift
ExpandingButton(.CTA) {
    print("Hello, World")
} label: {
    Text("Hello, World")
        .font(.SpenceKit.BodyFont)
}
```

### Usage Example 2

```swift
SmallChip(.destructive) {
    print("Hello, World")
} label: {
    Text("Hello, World")
        .font(.SpenceKit.BodyFont)
}
```

---

## `SpenceKitSize` 

Specifies size categories for icons and views, particularly for maintaining proportional text and icon scaling.

### Declaration

```swift
public enum SpenceKitSize: Int
```

### Cases

- **`.large`** (`0`): Large size for prominent elements.
- **`.medium`** (`1`): Medium size for moderately important elements.
- **`.head`** (`2`): Headline size for key labels.
- **`.subhead`** (`3`): Subhead size for secondary labels.
- **`.small`** (`4`): Small size for minimal elements.

---
### Features

- **Scalability**: Ensures consistent sizing across components.
- **Flexibility**: Adapts to various design priorities (`SpenceKitStyle`).
- **Utility**: Simplifies font and size management for developers.

---

### Related Components

- **Views**: `IconButton`, `HelperButton`, `TabBar`
- **Modifiers**: `.buttonStyle`, `.foregroundStyle`

---


---
# Extensions & Functions
## Animation Extensions

### `Animation.SpenceKit.Bouncy.quick`

**Description**: Provides a quick bouncy animation with a duration of 0.2 seconds and an extra bounce of 0.15.  
**Return Type**: `Animation`

---

### `Animation.SpenceKit.Bouncy.normal`

**Description**: Provides a normal bouncy animation with a duration of 0.4 seconds and an extra bounce of 0.1.  
**Return Type**: `Animation`

---

### `Animation.SpenceKit.Bouncy.slow`

**Description**: Provides a slow bouncy animation with a duration of 0.8 seconds and an extra bounce of 0.05.  
**Return Type**: `Animation`

---

### `Animation.SpenceKit.Default.quick`

**Description**: Provides a quick easing animation with a duration of 0.2 seconds and a reduced bounce of -0.3.  
**Return Type**: `Animation`

---

### `Animation.SpenceKit.Default.normal`

**Description**: Provides a normal easing animation with a duration of 0.4 seconds and a reduced bounce of -0.2.  
**Return Type**: `Animation`

---

### `Animation.SpenceKit.Default.slow`

**Description**: Provides a slow easing animation with a duration of 0.8 seconds and a reduced bounce of -0.1.  
**Return Type**: `Animation`

---

## Color Extensions

### `Color.SpenceKit.standardColorBundle(for:)`

**Description**: Returns a tuple of foreground, background, and border colors for the specified `SpenceKitStyle`.  
**Parameters**:

- `style`: The `SpenceKitStyle` to retrieve colors for.  
    **Return Type**: `(foreground: Color, background: Color, border: Color)`

---

### `Color.SpenceKit.restrictedColorBundle(for:)`

**Description**: Returns a tuple of foreground, background, and border colors for the specified `SpenceKitStyle`, excluding accent colors.  
**Parameters**:

- `style`: The `SpenceKitStyle` to retrieve colors for.  
    **Return Type**: `(foreground: Color, background: Color, border: Color)`

---

## UIFont Extensions

### `UIFont.SpenceKit`

**Description**: Provides predefined `UIFont` instances for various typographic needs using the `SpenceKit` design system.

---

## Font Extensions

### `Font.SpenceKit`

**Description**: Provides predefined `Font` instances for various typographic needs using the `SpenceKit` design system.

---

## String Extensions

### `String.stringSize(usingFont:withTraits:constrainedTo:)`

**Description**: Calculates the size of the string based on the specified font, traits, and optional size constraints.  
**Parameters**:

- `font`: The `UIFont` to use for size calculation.
- `traits`: Optional font traits (e.g., bold, italic).
- `constraints`: Optional size constraints for the string.  
    **Return Type**: `CGSize`

---

## Double Extensions

### `Double.format(decimalPlaces:)`

**Description**: Formats a `Double` value to a specified number of decimal places, removing insignificant trailing zeros.  
**Parameters**:

- `decimalPlaces`: The number of decimal places to include in the formatted string.  
    **Return Type**: `String`

---

## RandomAccessCollection Extensions

### `RandomAccessCollection.enumerate()`

**Description**: Returns a list of tuples containing the index and element for each item in the collection.  
**Return Type**: `[(Int, Element)]`

---

## EnvironmentValues Extensions

### `EnvironmentValues.cornerRadius`

**Description**: Provides a `CornerRadiusModel` value from the environment, used for modifying corner radii in views.  
**Type**: `CornerRadiusModel?`

---

## View Modifiers

### `LeftAligned`

**Description**: Aligns content to the left within its parent view.  
**Conformance**: `ViewModifier`

---

### `RightAligned`

**Description**: Aligns content to the right within its parent view.  
**Conformance**: `ViewModifier`

---

### `CenterAligned`

**Description**: Centers content horizontally within its parent view.  
**Conformance**: `ViewModifier`

---

## View Extensions

### `View.serifBold(font:strokeColor:)`

**Description**: Applies a bold serif font with an optional stroke color to a view.  
**Parameters**:

- `font`: The `Font.SpenceKit.FontSkeleton` to use.
- `strokeColor`: The color of the stroke.  
    **Return Type**: `some View`

---

### `View.stroke(color:width:)`

**Description**: Applies a stroke to a view.  
**Parameters**:

- `color`: The stroke color.
- `width`: The stroke width.  
    **Return Type**: `some View`

---

### `View.border()`

**Description**: Applies a standard border to a view using `SpenceKit` design system.  
**Return Type**: `some View`

---

### `View.roundBorder(_:)`

**Description**: Applies a rounded border with a specified corner radius to a view.  
**Parameters**:

- `cornerRadius`: The corner radius of the border.  
    **Return Type**: `some View`

---

### `View.cornerRadius(_:)`

**Description**: Passes a corner radius value to child views using the `cornerRadius` environment value.  
**Parameters**:

- `cornerRadius`: The corner radius value to pass.  
    **Return Type**: `some View`

---

### `View.left()`

**Description**: Aligns the view's content to the left.  
**Return Type**: `some View`

---

### `View.right()`

**Description**: Aligns the view's content to the right.  
**Return Type**: `some View`

---

### `View.center()`

**Description**: Centers the view's content horizontally.  
**Return Type**: `some View`

---

## StrokeModifier

### `StrokeModifier.body(content:)`

**Description**: Applies a stroke effect to the content view.  
**Parameters**:

**Sourced From:** *paescebu* on StackOverflow (https://stackoverflow.com/questions/57334125/how-to-make-text-stroke-in-swiftui)

- `content`: The content to modify.  
    **Return Type**: `some View`


---
