// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example,
///
///     #stringify(x + y)
///
/// produces a tuple `(x + y, "x + y")`.

/// Simple Free Standing Macro
/// Easy Level
@freestanding(expression)
public macro stringify<T>(_ value: T) -> (T, String) = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "StringifyMacro"
)

// Auto Description
@attached(member, names: named(description))
public macro AutoDescriptionMacro() = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "AutoDescriptionMacro"
)

// Custom Description
@attached(member, names: named(customDescription))
public macro CustomDescriptionMacro() = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "CustomDescriptionMacro"
)

// Medium level
// FreeStandingMacro -> Generated Function (Just Print App Info)
@freestanding(expression)
public macro generatedAppinfo(_ name: String, _ version: Int) = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "AppInfoMacro"
)

// Advanced Level
// FreeStandingMacro -> Compile Time Info
@freestanding(expression)
public macro compileTimeInfo(_ message: String) -> String = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "CompileTimeInfoMacro"
)

// Attached Macros
// Auto Codable
@attached(extension, conformances: Codable)
public macro AutoCodableMacro() = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "AutoCodableMacro"
)

// Attached Macros
// Auto Init
@attached(member, names: named(init))
public macro AutoInitMacro() = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "AutoInitMacro"
)

// Attached Macros
// Properti Mapping
@attached(member, names: named(map(from:)))
public macro AutoPropertyMapping() = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "PropertyMappingMacro"
)

// Freestanding Macros
// Auto Logging
@freestanding(expression)
public macro AutoLog(_ functionName: String) -> Void = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "AutoLogMacro"
)

// Attached Macros
// Auto Tracing Func
@attached(peer, names: suffixed(_traced))
public macro AutoTracingMacro() = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "AutoTracingMacro"
)

// Attached Macros
// Auto Binding UI
@attached(member, names: named($property))
public macro AutoBindMacro() = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "AutoBindMacro"
)

// Attached Macros
// Auto Property Wrapper
@attached(member, names: named(Logged))
public macro AutoPropertyWrapperMacro() = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "AutoPropertyWrapperMacro"
)

// Attached Macros
// Auto Generated Code For Tests
@attached(peer, names: suffixed(Tests))
public macro AutoGenerateTestMacro() = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "AutoGenerateTestMacro"
)

// Attached Macros
// Auto Generated Code For Mocking Test
@attached(peer, names: prefixed(Mock))
public macro AutoGereratedMock() = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "AutoGereratedCodeForMockingMacro"
)

// Attached Macros
// Free sample from apple swift documentation
@attached(member, names: arbitrary)
@attached(extension, conformances: OptionSet)
public macro OptionSet<RawType>() = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "OptionSetMacro"
)

// Apple Documentation -> How to use macros from zero to hero
@freestanding(expression)
public macro fourCharacterCode(_ string: StaticString) -> UInt32 = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "FourCharacterCode"
)

// Attached Macros
// Auto validation
@attached(member, names: named(validate))
public macro AutoValidate() = #externalMacro(
    module: "SwiftMacrosMacros",
    type: "AutoValidateMacro"
)
