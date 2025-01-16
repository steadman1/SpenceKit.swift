# SpenceKit for SwiftUI

**SpenceKit** is a powerful, developer-friendly framework designed to simplify the creation of consistent, visually appealing user interfaces. Built with modularity, accessibility, and usability in mind, SpenceKit provides prebuilt components and tools to accelerate development and enable professional-grade UI results, even for developers without a design background.

## Key Features

- **Modular Components**: A comprehensive library of reusable components to build modern, consistent UIs.
- **Universal Design Principles**: Built to align with accessibility standards and adaptable across devices.
- **Customizable**: Flexible options for styling and behavior to fit your app’s unique design.
- **Rapid Prototyping**: Quickly bring ideas to life with minimal effort and maximum elegance.
- **Lightweight and Efficient**: Designed to integrate seamlessly with SwiftUI while maintaining high performance.

---

## Getting Started

### Requirements

- **iOS 16.0+**

---

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

---

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

---

## Documentation

The complete API reference and usage guides for all components are available in the [SpenceKit Documentation](https://mypainterstape.com/docs/spencekit). This includes:

- **Core Components**: `Divider`, `SFIcon`, `Radio`, `Checkbox`, etc.
- **Advanced Components**: `ProgressSelector`, `TabBar`, `HelperButton`, and more.
- **Utilities and Constants**: Design constants, animations, and reusable styles.

---

## License

This software is proprietary and subject to the following terms:

1. **Payment Required**: The use of the library's binary requires the purchase of a valid license from the copyright holder. Contact `support@mypainterstape.com` for licensing.
2. **Modification**: Users can modify the source code for internal, non-distributable purposes only.
3. **Distribution Prohibited**: Redistribution of the software, whether modified or not, is strictly prohibited.
4. **Commercial Use**: Commercial use is permitted for licensed users, with all proceeds belonging to the user.

For full details, see the [LICENSE](./LICENSE) file.

---

## Third-Party Licenses

SpenceKit includes the following third-party open-source components:

1. **ViewExtractor** (MIT License) - [Repository](https://github.com/GeorgeElsham/ViewExtractor)
2. **MeasurementReader** (MIT License) - [Repository](https://github.com/vinceplusplus/measurement-reader)

See the [LICENSE](./LICENSE) file for full details.

---

## Support

If you encounter issues, have questions, or want to request features, please contact us:

- Email: `support@mypainterstape.com`
- Website: [mypainterstape.com](https://mypainterstape.com)
- Documentation: [SpenceKit Docs](https://mypainterstape.com/docs/spencekit)

---

## Acknowledgments

SpenceKit was developed by Spencer Steadman with a focus on rapid prototyping for quick, consistent UI/UX. Thank you so much for using SpenceKit and supporting my projects!
