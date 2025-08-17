//
//  PropertyWrapperMacro.swift
//  SwiftMacros
//
//  Created by Pratama One on 13/08/25.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftCompilerPlugin
import SwiftDiagnostics
import SwiftSyntaxMacros

public struct AutoPropertyWrapperMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf decl: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        
        // Generated @porpertyWrapper default for "Logged"
        let wrapper: DeclSyntax =
        """
        @propertyWrapper
        struct Logged<Value> {
            private var value: Value
            var wrappedValue: Value {
                get {
                    print("Get: \\(value)")
                    return value
                }
                set {
                    print("Set: \\(newValue)")
                    value = newValue
                }
            }
            init(wrappedValue: Value) {
                self.value = wrappedValue
            }
        }
        """
        
        return [wrapper]
    }
}
