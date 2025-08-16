//
//  AutoDescriptionMacroTest.swift
//  SwiftMacros
//
//  Created by Pratama One on 12/08/25.
//

import SwiftMacros

@AutoDescriptionMacro
@AutoCodableMacro
@AutoInitMacro
@AutoPropertyMapping
struct User {
    var name: String
    var age: Int
}
