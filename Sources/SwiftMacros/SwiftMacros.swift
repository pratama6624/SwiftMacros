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
