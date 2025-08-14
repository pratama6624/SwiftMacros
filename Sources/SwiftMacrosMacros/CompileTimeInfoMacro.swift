//
//  CompileTimeInfoMacro.swift
//  SwiftMacros
//
//  Created by Pratama One on 13/08/25.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct CompileTimeInfoMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        // Get argument (Custome Message)
        let customMessage: String
        let args = node.arguments
        if let firstArg = args.first?.expression.as(StringLiteralExprSyntax.self),
           let firstSegment = firstArg.segments.first?.as(StringSegmentSyntax.self) {
            customMessage = firstSegment.content.text
        } else {
            customMessage = "No message provided"
        }
        
        // Build JSON String
        let json = "{\n   \"file\": \"\(context.location(of: node)?.file ?? "")\",\n   \"line\": \"\(context.location(of: node)?.line ?? "")\",\n   \"column\": \"\(context.location(of: node)?.column ?? "")\",\n   \"message\": \"\(customMessage)\"\n}"
        
        // Return String Literal
        return ExprSyntax(StringLiteralExprSyntax(content: json))
    }
}
