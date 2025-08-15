//// SwiftMacrosMacros/AutoInitMacro.swift
//import SwiftSyntax
//import SwiftSyntaxBuilder
//import SwiftSyntaxMacros
//
//public struct AutoInitMacro: MemberMacro {
//    public static func expansion(
//        of node: some DeclGroupSyntax,
//        providingMembersOf type: some DeclGroupSyntax,
//        in context: some MacroExpansionContext
//    ) throws -> [DeclSyntax] {
//        
//        // Ambil properti yang bukan static
//        let properties = type.memberBlock.members.compactMap { member -> VariableDeclSyntax? in
//            guard let varDecl = member.decl.as(VariableDeclSyntax.self),
//                  varDecl.bindingSpecifier.tokenKind == .keyword(.let) || varDecl.bindingSpecifier.tokenKind == .keyword(.var),
//                  !varDecl.modifiers.contains(where: { $0.name.text == "static" }) else {
//                return nil
//            }
//            return varDecl
//        }
//        
//        // Generate parameter list dari properti
//        let parameters = properties.compactMap { prop -> String? in
//            guard let name = prop.bindings.first?.pattern.as(IdentifierPatternSyntax.self)?.identifier.text,
//                  let typeAnnotation = prop.bindings.first?.typeAnnotation else { return nil }
//            return "\(name): \(typeAnnotation.type)"
//        }.joined(separator: ", ")
//        
//        // Generate isi init
//        let body = properties.compactMap { prop -> String? in
//            guard let name = prop.bindings.first?.pattern.as(IdentifierPatternSyntax.self)?.identifier.text else { return nil }
//            return "self.\(name) = \(name)"
//        }.joined(separator: "\n        ")
//        
//        // Balikin sebagai DeclSyntax
//        let initDecl: DeclSyntax = """
//        init(\(raw: parameters)) {
//            \(raw: body)
//        }
//        """
//        
//        return [initDecl]
//    }
//}
