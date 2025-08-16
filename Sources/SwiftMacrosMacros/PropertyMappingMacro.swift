//
//  PropertyMappingMacro.swift
//  SwiftMacros
//
//  Created by Pratama One on 13/08/25.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct PropertyMappingMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf type: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        // Get all non static properties
        let properties = type.memberBlock.members.compactMap { member ->
            VariableDeclSyntax? in
            guard let varDecl = member.decl.as(VariableDeclSyntax.self),
                  !varDecl.modifiers.contains(where: { $0.name.text == "static" }) else {
                return nil
            }
            return varDecl
        }
        
        // Make mapping
        let mappingBody = properties.compactMap { prop -> String? in
            guard let name = prop.bindings.first?.pattern.as(IdentifierPatternSyntax.self)?.identifier.text else {
                return nil
            }
            let typeString = prop.bindings.first?.typeAnnotation?.type.description.trimmingCharacters(in: .whitespacesAndNewlines) ?? "Any"
            return """
            if let \(name) = dict["\(name)"] as? \(typeString) {
                self.\(name) = \(name)
            }
            """
        }.joined(separator: "\n        ")
        
        let initFromDict: DeclSyntax = """
            mutating func map(from dict: [String: Any]) {
                \(raw: mappingBody)
            }
            """
        
        return [initFromDict]
    }
}
