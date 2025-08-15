//
//  CustomDescriptionMacroTest.swift
//  SwiftMacros
//
//  Created by Pratama One on 12/08/25.
//

import SwiftMacros

@CustomDescriptionMacro
struct Car {
    let make: String
    let model: String
    let name: String
}
