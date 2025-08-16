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

struct UserService {
    func login(username: String, password: String) -> Bool {
        // Freestanding Macro -> Auto Logging
        #AutoLog("login")
        return username == "admin" && password == "123"
    }
}
