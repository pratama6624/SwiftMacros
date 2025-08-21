//
//  FourCharacterCodeTests.swift
//  SwiftMacros
//
//  Created by Pratama One on 21/08/25.
//

import XCTest
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

@testable import SwiftMacrosMacros
import SwiftSyntaxMacrosTestSupport

final class FourCharacterCodeTests: XCTestCase {
    func testFourCharacterCode_OK() {
        assertMacroExpansion(
            """
            let abcd = #fourCharacterCode("ABCD")
            """,
            expandedSource: """
            let abcd = 1145258561 as UInt32
            """,
            macros: ["fourCharacterCode": FourCharacterCode.self]
        )
    }

    func testFourCharacterCode_InvalidString() {
        assertMacroExpansion(
            #"""
            let s1 = "AB"
            let s2 = "CD"
            let bad = #fourCharacterCode(s1 + s2)
            """#,
            expandedSource: #"""
            let s1 = "AB"
            let s2 = "CD"
            let bad = #fourCharacterCode(s1 + s2)
            """#,
            diagnostics: [
                DiagnosticSpec(message: "Need a static string literal", line: 3, column: 11)
            ],
            macros: ["fourCharacterCode": FourCharacterCode.self]
        )
    }
}
