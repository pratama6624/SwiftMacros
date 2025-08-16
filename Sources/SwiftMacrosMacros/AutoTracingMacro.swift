//
//  AutoTracingMacro.swift
//  SwiftMacros
//
//  Created by Pratama One on 13/08/25.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct AutoTracingMacro: PeerMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingPeersOf declaration: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        
        guard let funcDecl = declaration.as(FunctionDeclSyntax.self) else {
            return []
        }
        
        // Get function name
        let funcName = funcDecl.name.text
        
        // Create new version of a function with more log
        let tracedFunc: DeclSyntax = """
            \(funcDecl.modifiers) func \(raw: funcName)_traced\(funcDecl.signature) {
                    print("[TRACE] Entering \(raw: funcName)")
                        defer { print("[TRACE] Exiting \(raw: funcName)") }
                    return \(raw: funcName)(\(raw: funcDecl.signature.parameterClause.parameters.map { param in
                        let label = param.firstName.text
                        let name = param.secondName?.text ?? param.firstName.text
                        return "\(label): \(name)"
                    }.joined(separator: ", ")))
                }
            """
        
        return [tracedFunc]
    }
}

