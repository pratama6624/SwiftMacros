//
//  HowToUseMacro.swift
//  SwiftMacros
//
//  Created by Pratama One on 20/08/25.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftCompilerPlugin

// For Development & Debugging
public enum MacroError: Error, CustomStringConvertible {
    case message(String)
    public var description: String {
        switch self {
        case .message(let a): return a
        }
    }
}

public struct FourCharacterCode: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        guard let argument = node.arguments.first?.expression,
              let segments = argument.as(StringLiteralExprSyntax.self)?.segments,
              segments.count == 1,
              case .stringSegment(let literalSegment)? = segments.first
        else {
            // throw CustomError.message("Need a static string")
            throw MacroError.message("Need a static string literal")
        }

        let string = literalSegment.content.text
        
        // Lenght validation = 4
        guard string.count == 4 else {
            throw MacroError.message("Must be exactly 4 characters")
        }
        
        // Convert into UInt32 (big-endian)
        var result: UInt32 = 0
        for byte in string.utf8 {
            result = (result << 8) | UInt32(byte)
        }

        return "\(raw: result) as UInt32"
    }
}

private func fourCharacterCode(for characters: String) -> UInt32? {
    guard characters.count == 4 else { return nil }

    var result: UInt32 = 0
    for character in characters {
        result = result << 8
        guard let asciiValue = character.asciiValue else { return nil }
        result += UInt32(asciiValue)
    }
    return result
}

//enum CustomError: Error { case message(String) }
