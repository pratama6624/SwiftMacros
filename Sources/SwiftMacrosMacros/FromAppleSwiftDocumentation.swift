//
//  FromAppleSwiftDocumentation.swift
//  SwiftMacros
//
//  Created by Pratama One on 19/08/25.
//

// This for Attached Macro

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftCompilerPlugin

public struct OptionSetMacro: MemberMacro, ExtensionMacro {
    
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf decl: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let structDecl = decl.as(StructDeclSyntax.self) else {
            return []
        }
                
        let rawType = node.attributeName.as(IdentifierTypeSyntax.self)?
            .genericArgumentClause?.arguments.first?.description.trimmingCharacters(in: .whitespacesAndNewlines) ?? "Int"
                
        var members: [DeclSyntax] = [
            DeclSyntax("public typealias RawValue = \(raw: rawType)"),
            DeclSyntax("public var rawValue: RawValue"),
            DeclSyntax("public init() { self.rawValue = 0 }"),
            DeclSyntax("public init(rawValue: RawValue) { self.rawValue = rawValue }")
        ]
                
        // Cari enum Options di dalam struct
        if let optionsEnum = structDecl.memberBlock.members
            .compactMap({ $0.decl.as(EnumDeclSyntax.self) })
            .first(where: { $0.name.text == "Options" })
        {
        for (i, c) in optionsEnum.memberBlock.members
            .compactMap({ $0.decl.as(EnumCaseDeclSyntax.self) })
            .flatMap({ $0.elements })
            .enumerated()
        {
            let caseName = c.name.text
            members.append(
                DeclSyntax(
                    """
                    public static let \(raw: caseName): Self = Self(rawValue: 1 << Options.\(raw: caseName).rawValue)
                    """
                    )
                )
            }
        }
                
        return members
    }
    
    public static func expansion(
        of node: AttributeSyntax,
        attachedTo declaration: some DeclGroupSyntax,
        providingExtensionsOf type: some TypeSyntaxProtocol,
        conformingTo protocols: [TypeSyntax],
        in context: some MacroExpansionContext
    ) throws -> [ExtensionDeclSyntax] {
        [
            try ExtensionDeclSyntax("extension \(type.trimmed): OptionSet { }")
        ]
    }
}
