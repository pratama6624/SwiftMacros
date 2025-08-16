//
//  AutoBindingUIMacro.swift
//  SwiftMacros
//
//  Created by Pratama One on 13/08/25.
//

import SwiftUI
import Foundation

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftCompilerPlugin
import SwiftSyntaxMacros

public struct AutoBindMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf decl: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let varDecl = decl.as(VariableDeclSyntax.self),
              let name = varDecl.bindings.first?.pattern.as(IdentifierPatternSyntax.self)?.identifier.text else {
            return []
        }
        
        return [
            "var $\(raw: name): Binding<\(raw: varDecl.bindings.first!.typeAnnotation!.type)> { Binding(get: { self.\(raw: name) }, set: { self.\(raw: name) = $0 }) }"
        ]
    }
}
