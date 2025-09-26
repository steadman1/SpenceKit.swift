//
//  Objects.swift
//  SpenceKit
//
//  Created by Spencer Steadman on 10/19/24.
//

#if canImport(SwiftUI) && canImport(UIKit)

import SwiftUI
import UIKit


extension Animation {
    /// Contains SpenceKit related structures and objects
    public struct SpenceKit {
        /// Bouncy animations
        public struct Bouncy {
            public static let quick = Animation.bouncy(duration: 0.2, extraBounce: 0.15)
            public static let normal = Animation.bouncy(duration: 0.4, extraBounce: 0.1)
            public static let slow = Animation.bouncy(duration: 0.8, extraBounce: 0.05)
        }
        
        /// Standard easing animations
        public struct Default {
            public static let quick = Animation.bouncy(duration: 0.2, extraBounce: -0.3)
            public static let normal = Animation.bouncy(duration: 0.4, extraBounce: -0.2)
            public static let slow = Animation.bouncy(duration: 0.8, extraBounce: -0.1)
        }
    }
}

extension Color {
    /// Contains SpenceKit related structures and objects
    public struct SpenceKit {
        public static let Border = Color(UIColor(resource: .init(name: "Colors/Border", bundle: .module)))
        public static let Clear = Color(UIColor(resource: .init(name: "Colors/Clear", bundle: .module)))
        
        // Accents
        public static let PrimaryAccent = Color(UIColor(resource: .init(name: "Colors/Accent/PrimaryAccent", bundle: .module)))
        public static let SecondaryAccent = Color(UIColor(resource: .init(name: "Colors/Accent/SecondaryAccent", bundle: .module)))
        public static let ModeAccent = Color(UIColor(resource: .init(name: "Colors/Accent/ModeAccent", bundle: .module)))
        public static let ModeInverseAccent = Color(UIColor(resource: .init(name: "Colors/Accent/ModeInverseAccent", bundle: .module)))
        
        // Destructive
        public static let PrimaryDestructive = Color(UIColor(resource: .init(name: "Colors/Destructive/PrimaryDestructive", bundle: .module)))
        public static let SecondaryDestructive = Color(UIColor(resource: .init(name: "Colors/Destructive/SecondaryDestructive", bundle: .module)))
        
        // Validity
        public static let Success = Color(UIColor(resource: .init(name: "Colors/Validity/Success", bundle: .module)))
        public static let Failure = Color(UIColor(resource: .init(name: "Colors/Validity/Failure", bundle: .module)))
        
        // CTA
        public static let PrimaryCTA = Color(UIColor(resource: .init(name: "Colors/CTA/PrimaryCTA", bundle: .module)))
        public static let SecondaryCTA = Color(UIColor(resource: .init(name: "Colors/CTA/SecondaryCTA", bundle: .module)))
        
        // Grounding
        public static let Background = Color(UIColor(resource: .init(name: "Colors/Ground/Background", bundle: .module)))
        public static let PrimaryForeground = Color(UIColor(resource: .init(name: "Colors/Ground/PrimaryForeground", bundle: .module)))
        public static let LayerForeground = Color(UIColor(resource: .init(name: "Colors/Ground/LayerForeground", bundle: .module)))
        
        // Text
        public static let PrimaryText = Color(UIColor(resource: .init(name: "Colors/Text/PrimaryText", bundle: .module)))
        public static let SecondaryText = Color(UIColor(resource: .init(name: "Colors/Text/SecondaryText", bundle: .module)))
        public static let TertiaryText = Color(UIColor(resource: .init(name: "Colors/Text/TertiaryText", bundle: .module)))
        
        // Bundles
        /// Returns grounding for the "Standard" Color set
        public static func standardColorBundle(for style: SpenceKitStyle) -> (foreground: Color, background: Color, border: Color) {
            switch style {
            case .CTA:
                return (.SpenceKit.PrimaryCTA, .SpenceKit.SecondaryCTA, .SpenceKit.Clear)
            case .primary:
                return (.SpenceKit.PrimaryAccent, .SpenceKit.SecondaryAccent, .SpenceKit.Clear)
            case .secondary:
                return (.SpenceKit.PrimaryText, .SpenceKit.PrimaryForeground, .SpenceKit.Clear)
            case .tertiary:
                return (.SpenceKit.PrimaryText, .SpenceKit.Background, .SpenceKit.Border)
            case .destructive:
                return (.SpenceKit.PrimaryDestructive, .SpenceKit.SecondaryDestructive, .SpenceKit.Clear)
            default:
                return (.SpenceKit.PrimaryText, .SpenceKit.Clear, .SpenceKit.Clear)
            }
        }
        
        /// Returns grounding for the "Restricted" Color set—similar to "Standard" but without accenting
        public static func restrictedColorBundle(for style: SpenceKitStyle) -> (foreground: Color, background: Color, border: Color) {
            switch style {
            case .CTA:
                return (.SpenceKit.PrimaryCTA, .SpenceKit.SecondaryCTA, .SpenceKit.Clear)
            case .primary:
                return (.SpenceKit.PrimaryText, .SpenceKit.PrimaryForeground, .SpenceKit.Clear)
            default:
                return (.SpenceKit.PrimaryText, .SpenceKit.Background, .SpenceKit.Border)
            }
        }
    }
}

extension UIFont {
    /// Contains SpenceKit related structures and objects
    public struct SpenceKit {
        // Adjusted Font
        public static func XLargeTitleFont() -> UIFont {
            Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.XLargeTitle).uiFont
        }
        public static func LargeTitleFont() -> UIFont {
            Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.LargeTitle).uiFont
        }
        public static func PrimaryTitleFont() -> UIFont {
            Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.PrimaryTitle).uiFont
        }
        public static func SecondaryTitleFont() -> UIFont {
            Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.SecondaryTitle).uiFont
        }
        public static func TertiaryTitleFont() -> UIFont {
            Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.TertiaryTitle).uiFont
        }
        public static func HeadlineFont() -> UIFont {
            Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Headline).uiFont
        }
        public static func HeadFont() -> UIFont {
            Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Head).uiFont
        }
        public static func BodyFont() -> UIFont {
            Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Body).uiFont
        }
        public static func CalloutFont() -> UIFont {
            Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Callout).uiFont
        }
        public static func SubheadlineFont() -> UIFont {
            Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Subheadline).uiFont
        }
        public static func SubheadFont() -> UIFont {
            Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Subhead).uiFont
        }
        public static func CaptionFont() -> UIFont {
            Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Caption).uiFont
        }
        public static func HintFont() -> UIFont {
            Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Hint).uiFont
        }
        
        // Custom fonts with specified sizes using FontSkeleton
        public static let SansXLargeTitleFont: UIFont = Font.SpenceKit.FontSkeleton.SansXLargeTitle.uiFont
        public static let SansLargeTitleFont: UIFont = Font.SpenceKit.FontSkeleton.SansLargeTitle.uiFont
        public static let SansPrimaryTitleFont: UIFont = Font.SpenceKit.FontSkeleton.SansPrimaryTitle.uiFont
        public static let SansSecondaryTitleFont: UIFont = Font.SpenceKit.FontSkeleton.SansSecondaryTitle.uiFont
        public static let SansTertiaryTitleFont: UIFont = Font.SpenceKit.FontSkeleton.SansTertiaryTitle.uiFont
        public static let SansHeadlineFont: UIFont = Font.SpenceKit.FontSkeleton.SansHeadline.uiFont
        public static let SansHeadFont: UIFont = Font.SpenceKit.FontSkeleton.SansHead.uiFont
        public static let SansBodyFont: UIFont = Font.SpenceKit.FontSkeleton.SansBody.uiFont
        public static let SansCalloutFont: UIFont = Font.SpenceKit.FontSkeleton.SansCallout.uiFont
        public static let SansSubheadlineFont: UIFont = Font.SpenceKit.FontSkeleton.SansSubheadline.uiFont
        public static let SansSubheadFont: UIFont = Font.SpenceKit.FontSkeleton.SansSubhead.uiFont
        public static let SansCaptionFont: UIFont = Font.SpenceKit.FontSkeleton.SansCaption.uiFont
        public static let SansHintFont: UIFont = Font.SpenceKit.FontSkeleton.SansHint.uiFont
        
        public static let SerifXLargeTitleFont: UIFont = Font.SpenceKit.FontSkeleton.SerifXLargeTitle.uiFont
        public static let SerifLargeTitleFont: UIFont = Font.SpenceKit.FontSkeleton.SerifLargeTitle.uiFont
        public static let SerifPrimaryTitleFont: UIFont = Font.SpenceKit.FontSkeleton.SerifPrimaryTitle.uiFont
        public static let SerifSecondaryTitleFont: UIFont = Font.SpenceKit.FontSkeleton.SerifSecondaryTitle.uiFont
        public static let SerifTertiaryTitleFont: UIFont = Font.SpenceKit.FontSkeleton.SerifTertiaryTitle.uiFont
        public static let SerifBodyFont: UIFont = Font.SpenceKit.FontSkeleton.SerifBody.uiFont
        public static let SerifCalloutFont: UIFont = Font.SpenceKit.FontSkeleton.SerifCallout.uiFont
        public static let SerifCaptionFont: UIFont = Font.SpenceKit.FontSkeleton.SerifCaption.uiFont
    }
}

extension Font {
    /// Contains SpenceKit related structures and objects
    public struct SpenceKit {
        public enum TypographyTheme: Sendable {
            case sans
            case serifTitleSansBody
            case sansTitleSerifBody
            case sansSerif
        }
        
        public enum FontType {
            case XLargeTitle
            case LargeTitle
            case PrimaryTitle
            case SecondaryTitle
            case TertiaryTitle
            case Headline
            case Head
            case Body
            case Callout
            case Subheadline
            case Subhead
            case Caption
            case Hint
        }
        
        /// Defines "Skeleton" values for Font and UIFont implementations to follow
        public struct FontSkeleton: Sendable {
            public let name: String
            public let size: CGFloat
            public let uiFont: UIFont
            public let font: Font
            
            // Initializer that creates both UIFont and Font
            public init(name: String, size: CGFloat, uiWeight: UIFont.Weight? = nil, weight: Font.Weight? = nil) {
                self.name = name
                self.size = size
                if let uiWeight = uiWeight, let weight = weight {
                    self.uiFont = UIFont.systemFont(ofSize: size, weight: uiWeight)
                    self.font = Font.system(size: size, weight: weight)
                } else if let uiWeight = uiWeight {
                    self.uiFont = UIFont.systemFont(ofSize: size, weight: uiWeight)
                    self.font = Font.custom(name, size: size)
                } else if let weight = weight {
                    self.uiFont = UIFont(name: name, size: size)!
                    self.font = Font.system(size: size, weight: weight)
                } else {
                    self.uiFont = UIFont(name: name, size: size)!
                    self.font = Font.custom(name, size: size)
                }
            }
            
            // Define FontSkeletons for Sans Typography
            public static let SansXLargeTitle = FontSkeleton(name: SpenceKitFont.Inter_Bold.name, size: 50, uiWeight: .bold, weight: .bold)
            public static let SansLargeTitle = FontSkeleton(name: SpenceKitFont.Inter_Bold.name, size: 34, uiWeight: .bold, weight: .bold)
            public static let SansPrimaryTitle = FontSkeleton(name: SpenceKitFont.Inter_Bold.name, size: 28, uiWeight: .bold, weight: .bold)
            public static let SansSecondaryTitle = FontSkeleton(name: SpenceKitFont.Inter_Semibold.name, size: 22, uiWeight: .semibold, weight: .semibold)
            public static let SansTertiaryTitle = FontSkeleton(name: SpenceKitFont.Inter_Semibold.name, size: 20, uiWeight: .semibold, weight: .semibold)
            public static let SansHeadline = FontSkeleton(name: SpenceKitFont.Inter_Bold.name, size: 17, uiWeight: .bold, weight: .bold)
            public static let SansHead = FontSkeleton(name: SpenceKitFont.Inter_Medium.name, size: 17, uiWeight: .medium, weight: .medium)
            public static let SansBody = FontSkeleton(name: SpenceKitFont.Inter_Medium.name, size: 17, uiWeight: .medium, weight: .medium)
            public static let SansCallout = FontSkeleton(name: SpenceKitFont.Inter_Medium.name, size: 16, uiWeight: .medium, weight: .medium)
            public static let SansSubheadline = FontSkeleton(name: SpenceKitFont.Inter_Semibold.name, size: 15, uiWeight: .semibold, weight: .semibold)
            public static let SansSubhead = FontSkeleton(name: SpenceKitFont.Inter_Medium.name, size: 15, uiWeight: .medium, weight: .medium)
            public static let SansCaption = FontSkeleton(name: SpenceKitFont.Inter_Medium.name, size: 15, uiWeight: .medium, weight: .medium)
            public static let SansHint = FontSkeleton(name: SpenceKitFont.Inter_Medium.name, size: 13, uiWeight: .medium, weight: .medium)
            
            // Define FontSkeletons for Serif Typography
            public static let SerifXLargeTitle = FontSkeleton(name: SpenceKitFont.LibreCaslon_Regular.name, size: 52)
            public static let SerifLargeTitle = FontSkeleton(name: SpenceKitFont.LibreCaslon_Regular.name, size: 36)
            public static let SerifPrimaryTitle = FontSkeleton(name: SpenceKitFont.LibreCaslon_Regular.name, size: 30)
            public static let SerifSecondaryTitle = FontSkeleton(name: SpenceKitFont.LibreCaslon_Regular.name, size: 24)
            public static let SerifTertiaryTitle = FontSkeleton(name: SpenceKitFont.LibreCaslon_RegularItalic.name, size: 22)
            public static let SerifBody = FontSkeleton(name: SpenceKitFont.LibreCaslon_Regular.name, size: 18)
            public static let SerifCallout = FontSkeleton(name: SpenceKitFont.LibreCaslon_Regular.name, size: 17)
            public static let SerifCaption = FontSkeleton(name: SpenceKitFont.LibreCaslon_Regular.name, size: 16)
            
            public static func font(_ theme: Font.SpenceKit.TypographyTheme, fontType: Font.SpenceKit.FontType) -> FontSkeleton {
                switch fontType {
                case .XLargeTitle:
                    switch theme {
                    case .sansTitleSerifBody, .sans:
                        return SansXLargeTitle
                    case .serifTitleSansBody, .sansSerif:
                        return SerifXLargeTitle
                    }
                case .LargeTitle:
                    switch theme {
                    case .sansTitleSerifBody, .sans:
                        return SansLargeTitle
                    case .serifTitleSansBody, .sansSerif:
                        return SerifLargeTitle
                    }
                case .PrimaryTitle:
                    switch theme {
                    case .sansTitleSerifBody, .sans:
                        return SansPrimaryTitle
                    case .serifTitleSansBody, .sansSerif:
                        return SerifPrimaryTitle
                    }
                case .SecondaryTitle:
                    switch theme {
                    case .sansTitleSerifBody, .sans:
                        return SansSecondaryTitle
                    case .serifTitleSansBody, .sansSerif:
                        return SerifSecondaryTitle
                    }
                case .TertiaryTitle:
                    switch theme {
                    case .sansTitleSerifBody, .sans:
                        return SansTertiaryTitle
                    case .serifTitleSansBody, .sansSerif:
                        return SerifTertiaryTitle
                    }
                case .Headline:
                    return SansHeadline
                case .Body:
                    switch theme {
                    case .sans, .serifTitleSansBody:
                        return SansBody
                    case .sansTitleSerifBody, .sansSerif:
                        return SerifBody
                    }
                case .Head:
                    return SansHead
                case .Callout:
                    switch theme {
                    case .serifTitleSansBody, .sans:
                        return SansCallout
                    case .sansTitleSerifBody, .sansSerif:
                        return SerifCallout
                    }
                case .Subheadline:
                    return SansSubheadline
                case .Subhead:
                    return SansSubhead
                case .Caption:
                    switch theme {
                    case .serifTitleSansBody, .sans:
                        return SansCaption
                    case .sansTitleSerifBody, .sansSerif:
                        return SerifCaption
                    }
                case .Hint:
                    return SansHint
                }
            }

        }
        
        // Adjusted Font
        public static let XLargeTitleFont: Font = Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.XLargeTitle).font
        public static let LargeTitleFont: Font = Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.LargeTitle).font
        public static let PrimaryTitleFont: Font = Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.PrimaryTitle).font
        public static let SecondaryTitleFont: Font =  Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.SecondaryTitle).font
        public static let TertiaryTitleFont: Font = Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.TertiaryTitle).font
        public static let HeadlineFont: Font = Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Headline).font
        public static let HeadFont: Font = Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Head).font
        public static let BodyFont: Font = Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Body).font
        public static let CalloutFont: Font = Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Callout).font
        public static let SubheadlineFont: Font = Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Subheadline).font
        public static let SubheadFont: Font = Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Subhead).font
        public static let CaptionFont: Font = Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Caption).font
        public static let HintFont: Font = Font.SpenceKit.FontSkeleton.font(SKSingleton.shared.typography, fontType: Font.SpenceKit.FontType.Hint).font
        
        // Custom fonts with specified sizes
        public static let SansXLargeTitleFont: Font = Font.SpenceKit.FontSkeleton.SansXLargeTitle.font
        public static let SansLargeTitleFont: Font = Font.SpenceKit.FontSkeleton.SansLargeTitle.font
        public static let SansPrimaryTitleFont: Font = Font.SpenceKit.FontSkeleton.SansPrimaryTitle.font
        public static let SansSecondaryTitleFont: Font = Font.SpenceKit.FontSkeleton.SansSecondaryTitle.font
        public static let SansTertiaryTitleFont: Font = Font.SpenceKit.FontSkeleton.SansTertiaryTitle.font
        public static let SansHeadlineFont: Font = Font.SpenceKit.FontSkeleton.SansHeadline.font
        public static let SansHeadFont: Font = Font.SpenceKit.FontSkeleton.SansHead.font
        public static let SansBodyFont: Font = Font.SpenceKit.FontSkeleton.SansBody.font
        public static let SansCalloutFont: Font = Font.SpenceKit.FontSkeleton.SansCallout.font
        public static let SansSubheadlineFont: Font = Font.SpenceKit.FontSkeleton.SansSubheadline.font
        public static let SansSubheadFont: Font = Font.SpenceKit.FontSkeleton.SansSubhead.font
        public static let SansCaptionFont: Font = Font.SpenceKit.FontSkeleton.SansCaption.font
        public static let SansHintFont: Font = Font.SpenceKit.FontSkeleton.SansHint.font
        
        public static let SerifXLargeTitleFont: Font = Font.SpenceKit.FontSkeleton.SerifXLargeTitle.font
        public static let SerifLargeTitleFont: Font = Font.SpenceKit.FontSkeleton.SerifLargeTitle.font
        public static let SerifPrimaryTitleFont: Font = Font.SpenceKit.FontSkeleton.SerifPrimaryTitle.font
        public static let SerifSecondaryTitleFont: Font = Font.SpenceKit.FontSkeleton.SerifSecondaryTitle.font
        public static let SerifTertiaryTitleFont: Font = Font.SpenceKit.FontSkeleton.SerifTertiaryTitle.font
        public static let SerifBodyFont: Font = Font.SpenceKit.FontSkeleton.SerifBody.font
        public static let SerifCalloutFont: Font = Font.SpenceKit.FontSkeleton.SerifCallout.font
        public static let SerifCaptionFont: Font = Font.SpenceKit.FontSkeleton.SerifCaption.font
    }
}

extension String {
    /// Calculates the size of String given constraints and Font traits
    public func stringSize(
        usingFont font: UIFont,
        withTraits traits: UIFontDescriptor.SymbolicTraits = [],
        constrainedTo constraints: CGSize? = nil
    ) -> CGSize {
        // Create a new UIFont with the specified traits
        let updatedFont: UIFont
        if traits.isEmpty {
            updatedFont = font // Use the original font if no traits are specified
        } else {
            // Create a font descriptor with the traits
            if let descriptorWithTraits = font.fontDescriptor.withSymbolicTraits(traits) {
                updatedFont = UIFont(descriptor: descriptorWithTraits, size: font.pointSize)
            } else {
                updatedFont = font // Fallback to the original font if traits can't be applied
            }
        }
        
        // Set font attributes
        let fontAttributes: [NSAttributedString.Key: Any] = [.font: updatedFont]
        
        // If constraints are provided, use boundingRect to calculate the size
        if let constraints = constraints {
            let boundingRect = self.boundingRect(
                with: constraints,
                options: [.usesLineFragmentOrigin, .usesFontLeading],
                attributes: fontAttributes,
                context: nil
            )
            return CGSize(width: ceil(boundingRect.width), height: ceil(boundingRect.height))
        } else {
            // Default behavior without constraints
            let size = self.size(withAttributes: fontAttributes)
            return CGSize(width: ceil(size.width), height: ceil(size.height))
        }
    }
}


extension Double {
    /// Formats Double as String removing insignificant zeros
    func format(decimalPlaces: Int = 2) -> String {
        let formatString = "%.\(decimalPlaces)f"
        let formatted = String(format: formatString, self)
        
        // Check if the formatted value ends in ".0"
        if formatted.hasSuffix(".0") {
            return String(formatted.dropLast(2)) // Remove ".0"
        }
        
        return formatted // Return with decimals if applicable
    }
}


extension RandomAccessCollection {
    /// Returns a ForEach-usable tuple with (index, element) for each element in array
    func enumerate() -> [(Int, Element)] {
        return Array(zip(indices.map { $0 as! Int }, self)) as! [(Int, Element)]
    }
}

extension EnvironmentValues {
    /// Defines value storage for use with .cornerRadius View modifier
    public var cornerRadius: CornerRadiusModel? {
        get { self[CornerRadiusKey.self] }
        set { self[CornerRadiusKey.self] = newValue }
    }
}

public struct LeftAligned: ViewModifier {
    public func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
        }
    }
}

public struct RightAligned: ViewModifier {
    public func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
        }
    }
}

public struct CenterAligned: ViewModifier {
    public func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}

public extension View {
    func serifBold(font: Font.SpenceKit.FontSkeleton, strokeColor: Color = .black) -> some View {
        self
            .font(.custom(font.name, size: font.size))
            .stroke(color: strokeColor, width: font.size / 80)
    }
    
    func stroke(color: Color, width: CGFloat = SpenceKit.Constants.borderWidth) -> some View {
        modifier(StrokeModifier(strokeSize: width / 2, strokeColor: color))
    }
    
    func border() -> some View {
        modifier(StrokeModifier(strokeSize: SpenceKit.Constants.borderWidth / 2, strokeColor: Color.SpenceKit.Border))
    }
    
    func roundBorder(_ cornerRadius: CGFloat) -> some View {
        self
            .background(Color.SpenceKit.Background)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .border()
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius + SpenceKit.Constants.borderWidth))
    }
    
    /// Defines modifier to pass CGFloat to child using cornerRadius EnvironmentValue
    func cornerRadius(_ cornerRadius: CGFloat) -> some View {
        self.environment(\.cornerRadius, CornerRadiusModel(cornerRadius))
            .modifier(CornerRadiusModifier(cornerRadius: CornerRadiusModel(cornerRadius)))
    }
    
    func left() -> some View {
        self.modifier(LeftAligned())
    }
    
    func right() -> some View {
        self.modifier(RightAligned())
    }
    
    func center() -> some View {
        self.modifier(CenterAligned())
    }
}

// from "paescebu" on StackOverflow
// https://stackoverflow.com/questions/57334125/how-to-make-text-stroke-in-swiftui
public struct StrokeModifier: ViewModifier {
    private let id = UUID()
    var strokeSize: CGFloat = 1
    var strokeColor: Color = .blue

    public func body(content: Content) -> some View {
        if strokeSize > 0 {
            appliedStrokeBackground(content: content)
        } else {
            content
        }
    }

    private func appliedStrokeBackground(content: Content) -> some View {
        content
            .padding(strokeSize * 2)
            .background(
                Rectangle()
                    .foregroundColor(strokeColor)
                    .mask(alignment: .center) {
                        mask(content: content)
                    }
            )
    }

    private func mask(content: Content) -> some View {
        Canvas { context, size in
            context.addFilter(.alphaThreshold(min: 0.01))
            if let resolvedView = context.resolveSymbol(id: id) {
                context.draw(resolvedView, at: .init(x: size.width/2, y: size.height/2))
            }
        } symbols: {
            content
                .tag(id)
                .blur(radius: strokeSize)
        }
    }
}

#endif
