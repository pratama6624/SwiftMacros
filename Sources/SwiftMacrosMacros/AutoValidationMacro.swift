//
//  AutoValidation.swift
//  SwiftMacros
//
//  Created by Pratama One on 13/08/25.
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import SwiftDiagnostics
import SwiftCompilerPlugin
import SwiftSyntax
import Foundation

// MARK: - Macro Definition
public struct AutoValidateMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let structDecl = declaration.as(StructDeclSyntax.self) else { return [] }
        
        var validationStmts: [ExprSyntax] = []
        
        for member in structDecl.memberBlock.members {
            if let varDecl = member.decl.as(VariableDeclSyntax.self),
               let binding = varDecl.bindings.first,
               let identifier = binding.pattern.as(IdentifierPatternSyntax.self) {
                let varName = identifier.identifier.text
                
                // Examples of automatic rule: if string -> empty check
                if let typeAnnotation = binding.typeAnnotation,
                   typeAnnotation.type.description.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "String" {
                    let expr: ExprSyntax = "if \(raw: varName).isEmpty { return false }"
                    validationStmts.append(expr)
                }
                
                // Examples of automatic rule: If int -> check >= 18
                if let typeAnnotation = binding.typeAnnotation,
                   typeAnnotation.type.description.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) == "Int" {
                    let expr: ExprSyntax = "if \(raw: varName) < 18 { return false }"
                    validationStmts.append(expr)
                }
            }
        }
        
        let body: ExprSyntax = """
            {
                \(raw: validationStmts.map { "\($0)"}.joined(separator: "\n"))
                return true
            }()
            """
        
        let validateFunc: DeclSyntax =
        """
        func validate() -> Bool {
            \(raw: validationStmts.map { "\($0)" }.joined(separator: "\n"))
            return true
        }
        """

        return [validateFunc]
    }
}
