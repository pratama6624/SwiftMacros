//
//  AutoDescriptionMacro.swift
//  SwiftMacros
//
//  Created by Pratama One on 11/08/25.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct AutoDescriptionMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {

        guard let structDecl = declaration.as(StructDeclSyntax.self) else {
            return []
        }

        let structName = structDecl.name.text

        let properties = structDecl.memberBlock.members
            .compactMap {
                $0.decl.as(VariableDeclSyntax.self)?
                    .bindings.first?.pattern.description
            }

        let joinedProps = properties
            .map { "\($0): \\(\($0))" } // ini cukup string biasa
            .joined(separator: ", ")

        return [
            """
            var description: String {
                return "\(raw: structName)(\(raw: joinedProps))"
            }
            """
        ]
    }
}
