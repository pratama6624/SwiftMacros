//
//  CustomDescriptionMacro.swift
//  SwiftMacros
//
//  Created by Pratama One on 12/08/25.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftCompilerPlugin

public struct CustomDescriptionMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let structDecl = declaration.as(StructDeclSyntax.self) else {
            return []
        }
        
        // Get struct name
        let structName = structDecl.name.text.uppercased()
        
        // Get property
        let properties = structDecl.memberBlock.members
            .compactMap {
                $0.decl.as(VariableDeclSyntax.self)?
                    .bindings.first?.pattern.description
            }
        
        let joinedProps = properties
            .map { "\($0.capitalized): \\(\($0))" }
            .joined(separator: " | ")
        
        return [
            #"""
                var customDescription: String {
                    return """
                    THIS IS CUSTOM DESCRIPTION
                        Struct Name -\#(raw: structName) \#(raw: joinedProps)
                        Custom message: "Just Never Give UP"
                    """
                }
            """#
        ]
    }
}
