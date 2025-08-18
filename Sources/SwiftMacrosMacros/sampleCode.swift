//
//import SwiftSyntax
//import SwiftSyntaxBuilder
//import SwiftCompilerPlugin
//import SwiftDiagnostics
//import SwiftSyntaxMacros
//
//public struct GenerateTestMacro: PeerMacro {
//    public static func expansion(
//        of node: AttributeSyntax,
//        providingPeersOf decl: some DeclSyntaxProtocol,
//        in context: some MacroExpansionContext
//    ) throws -> [DeclSyntax] {
//        guard let structDecl = decl.as(StructDeclSyntax.self) else {
//            return []
//        }
//
//        let structName = structDecl.identifier.text
//        let testClassName = "\(structName)Tests"
//
//        // Ambil semua properti struct
//        let properties = structDecl.memberBlock.members.compactMap { member in
//            member.decl.as(VariableDeclSyntax.self)?.bindings.first?.pattern.as(IdentifierPatternSyntax.self)?.identifier.text
//        }
//
//        // Generate init test
//        var initAssertions = ""
//        for prop in properties {
//            initAssertions += "XCTAssertEqual(\(structName.lowercased()).\(prop), \(prop)\n"
//        }
//
//        let testCode: DeclSyntax =
//        """
//        final class \(raw: testClassName): XCTestCase {
//            func testInit() {
//                let \(raw: structName.lowercased()) = \(raw: structName)(\(raw: properties.map { "\($0): <#\($0)#>" }.joined(separator: ", ")))
//                \(raw: initAssertions)
//            }
//        }
//        """
//
//        return [testCode]
//    }
//}

//@GenerateTest
//struct Product {
//    let id: Int
//    var name: String
//    var price: Double
//}

//@attached(peer, names: suffixed(Tests))
//macro GenerateTest() = #externalMacro(
//    module: "SwiftMacrosMacros",
//    type: "GenerateTestMacro"
//)
