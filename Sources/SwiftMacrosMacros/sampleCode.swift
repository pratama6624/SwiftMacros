
//import SwiftUI
//import Foundation

//@attached(member, names: named($property))
//macro AutoBind() = #externalMacro(module: "MyMacros", type: "AutoBindMacro")

//// ---- Model ----
//class UserModel: ObservableObject {
//    @AutoBind var name: String = "Pratama"
//    @AutoBind var age: Int = 20
//}
//
//// ---- Macro Implementation (AutoBindMacro.swift) ----
//import SwiftSyntax
//import SwiftSyntaxBuilder
//import SwiftCompilerPlugin
//
//public struct AutoBindMacro: MemberMacro {
//    public static func expansion(
//        of node: AttributeSyntax,
//        providingMembersOf decl: some DeclGroupSyntax,
//        in context: some MacroExpansionContext
//    ) throws -> [DeclSyntax] {
//        guard let varDecl = decl.as(VariableDeclSyntax.self),
//              let name = varDecl.bindings.first?.pattern.as(IdentifierPatternSyntax.self)?.identifier.text
//        else { return [] }
//        
//        return [
//            "var $\(raw: name): Binding<\(raw: varDecl.bindings.first!.typeAnnotation!.type)> { Binding(get: { self.\(raw: name) }, set: { self.\(raw: name) = $0 }) }"
//        ]
//    }
//}


//import SwiftUI
//
//struct ContentView: View {
//    @StateObject var user = UserModel()
//    
//    var body: some View {
//        VStack {
//            TextField("Name", text: user.$name)
//            Stepper("Age: \(user.age)", value: user.$age)
//        }
//        .padding()
//    }
//}
//
//// Preview untuk Xcode Canvas
//#Preview {
//    ContentView()
//}
