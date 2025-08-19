//
//  AutoGereratedCodeForMockingMacro.swift
//  SwiftMacros
//
//  Created by Pratama One on 13/08/25.
//

import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import SwiftDiagnostics
import SwiftSyntax
import SwiftCompilerPlugin

public struct AutoGereratedCodeForMockingMacro: PeerMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingPeersOf decl: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        // Target only protocol
        guard let protoDecl = decl.as(ProtocolDeclSyntax.self) else {
            return []
        }
        
        let protoName = protoDecl.name.text
        let mockClassName = "Mock\(protoName)"
        
        // Get all function (protocol)
        let functions = protoDecl.memberBlock.members.compactMap {
            $0.decl.as(FunctionDeclSyntax.self)
        }
        
        // Generated mock function implementation
        let mockFuncs: [DeclSyntax] = functions.map { fn in
            let name = fn.name.text
            let params = fn.signature.parameterClause
            let returnType = fn.signature.returnClause?.type.description.trimmingCharacters(in: .whitespacesAndNewlines)

            if let returnType = returnType, !returnType.isEmpty {
                return DeclSyntax(stringLiteral: """
                func \(name)\(params) -> \(returnType) {
                    print("Mocked \(name) called")
                    return \(defaultReturn(for: returnType))
                }
                """)
            } else {
                return DeclSyntax(stringLiteral: """
                func \(name)\(params) {
                    print("Mocked \(name) called")
                }
                """)
            }
        }

        // Kelas Mock
        let mockClass = DeclSyntax(stringLiteral: """
        final class \(mockClassName): \(protoName) {
            \(mockFuncs.map { $0.description }.joined(separator: "\n"))
        }
        """)

        return [mockClass]
    }
}

fileprivate func defaultReturn(for type: String) -> String {
    switch type {
    case "Bool": return "false"
    case "Int": return "0"
    case "String": return "\"\""
    default: return "\(type)()"
    }
}

