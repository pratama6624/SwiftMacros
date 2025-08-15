//
//  AutoInitMacro.swift
//  SwiftMacros
//
//  Created by Pratama One on 13/08/25.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct AutoInitMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf decl: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        
        // Get all properties != static function
        let properties = decl.memberBlock.members.compactMap { member ->
            VariableDeclSyntax? in
            guard let varDecl = member.decl.as(VariableDeclSyntax.self),
                  varDecl.bindingSpecifier.tokenKind == .keyword(.let) || varDecl.bindingSpecifier.tokenKind == .keyword(.var),
                  !varDecl.modifiers.contains(where: { $0.name.text == "static" }) else {
                return nil
            }
            return varDecl
        }
        
        // Generated parameter list from properties
        let parameters = properties.compactMap { prop -> String? in
            guard let name = prop.bindings.first?.pattern.as(IdentifierPatternSyntax.self)?.identifier.text, let typeAnnotation = prop.bindings.first?.typeAnnotation else {
                return nil
            }
            return "\(name): \(typeAnnotation.type)"
        }.joined(separator: ", ")
        
        // Generated init contents
        let body = properties.compactMap { prop -> String? in
            guard let name = prop.bindings.first?.pattern.as(IdentifierPatternSyntax.self)?.identifier.text else {
                return nil
            }
            return "self.\(name) = \(name)"
        }.joined(separator: "\n        ")
        
        // Return syntax for init
        let initDecl: DeclSyntax = """
            init(\(raw: parameters)) {
                \(raw: body)
            }
            """
        
        return [initDecl]
    }
}

