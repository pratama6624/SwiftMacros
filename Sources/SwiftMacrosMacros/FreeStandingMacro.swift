//
//  FreeStandingMacro.swift
//  SwiftMacros
//
//  Created by Pratama One on 13/08/25.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftCompilerPlugin

public struct AppInfoMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        // Get Macro Argument (App name & Version)
        let args = node.arguments
        guard args.count == 2 else {
            fatalError("There must be 2 arguments: App Name (String) and Version (Int).")
        }
        
        // First Argument: App Name
        guard let appNameLiteral = args.first?.expression.as(StringLiteralExprSyntax.self),
              let appName = appNameLiteral.segments.first?.description.trimmingCharacters(in: .whitespacesAndNewlines) else {
            fatalError("First argument must be String.")
        }
        
        // Second Argument: App Version
        guard let versionLiteral = args.last?.expression.as(IntegerLiteralExprSyntax.self),
              let version = Int(versionLiteral.literal.text) else {
            fatalError("Second argument must be Int.")
        }
        
        return """
            {
                print("App name: \(raw: appName), Version: \(raw: version)")
            }()
            """
    }
}
