# SpenceKit for SwiftUI

**SpenceKit** is a powerful, developer-friendly framework designed to simplify the creation of consistent, visually appealing user interfaces. Built with modularity, accessibility, and usability in mind, SpenceKit provides prebuilt components and tools to accelerate development and enable professional-grade UI results, even for developers without a design background.



## See the Docs

The complete API reference and usage guides for all Views are available in the [SpenceKit Documentation](./DOCUMENTATION.md) and previews of all Views on Figma at [Figma Previews](https://www.figma.com/design/P1idYsSZ2mbgbCAQHGRmpw/SpenceKit?node-id=673-205&t=8VBDpbuxr4nibJhb-0). This includes info such as:

- **Core Components**: `Divider`, `SFIcon`, `Radio`, `Checkbox`, etc.
- **Advanced Components**: `ProgressSelector`, `TabBar`, `HelperButton`, etc.
- **Utilities and Constants**: Design constants, animations, and reusable styles.

A custom ChatGPT _GPT_, [SpenceKit.swift GPT](https://chatgpt.com/g/g-67893e24f09881918c232c76d8f3e0f7-spencekit-swift) is also available to discuss the Docs with you or help build your UI.



## Key Features

- **Modular Components**: A comprehensive library of reusable components to build modern, consistent UIs.
- **Universal Design Principles**: Built to align with accessibility standards and adaptable across devices.
- **Customizable**: Flexible options for styling and behavior to fit your app’s unique design.
- **Rapid Prototyping**: Quickly bring ideas to life with minimal effort and maximum elegance.
- **Lightweight and Efficient**: Designed to integrate seamlessly with SwiftUI while maintaining high performance.



## Getting Started

### Requirements

- **iOS 16.0+**



### Installation

#### Local Integration

1. Download the latest release from Gumroad to a given directory `~/spence/Desktop` for example.
2. Open your Xcode Project (.xcodeproj or .xcworkspace file).
3. Navigate to "Packagge Dependencies" in your Project File .
4. Click the "+" to add a dependency.
5. Click "Add Local" in the bottom left.
6. Open `~/spence/Desktop/SpenceKit` directory in the Finder window and click "Add Package."

#### In-project Integration

1. Clone the repository or download the latest release from the [Releases](https://github.com/your-repo/spencekit/releases) page.
2. Drag and drop the `SpenceKit` folder into your Xcode project.
3. Add `SpenceKit.swift` to your target.



### Usage

Import SpenceKit in your SwiftUI files:

```swift
import SpenceKit
```

#### Example: Adding a `Divider` View

```swift
import SpenceKit

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, SpenceKit!")
            Divider(.horizontal)
        }
    }
}
```

#### Example: Using `SFIcon`

```swift
import SpenceKit

struct ContentView: View {
    var body: some View {
        SFIcon("star.fill", size: .large)
            .foregroundStyle(.yellow)
    }
}
```

For detailed usage of components, check the documentation below.

## License

Copyright 2025 Spencer Steadman

Licensed under the Apache License, Version 2.0 (the "License");  
you may not use this library except in compliance with the License.  
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0
    
or at

    [LICENSE](./LICENSE)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

If you have any questions, contact `support@mypainterstape.com`!

## Attribution during Hackathons

If you use SpenceKit at a hackathon, please include both SpenceKit.swift and my name, Spencer Steadman, in your project’s “open source libraries” or “credits” slide if you have one.
If judges or others ask about your UI, a quick note that “our UI was built with SpenceKit.swift by Spencer Steadman” is appreciated.
THANK YOU!

## Third-Party Licenses

SpenceKit includes the following third-party open-source components:

1. **ViewExtractor** (MIT License) - [Repository](https://github.com/GeorgeElsham/ViewExtractor)
2. **MeasurementReader** (MIT License) - [Repository](https://github.com/vinceplusplus/measurement-reader)

See the [LICENSE](./LICENSE) file for full details.



## Support

If you encounter issues, have questions, or want to request features, please contact us:

- Email: `support@mypainterstape.com`
- Website: [mypainterstape.com](https://mypainterstape.com)
- Documentation: [SpenceKit Docs](https://mypainterstape.com/docs/spencekit)



## Acknowledgments

SpenceKit was developed by Spencer Steadman with a focus on rapid prototyping for quick, consistent UI/UX. Thank you so much for using SpenceKit and supporting my projects!
