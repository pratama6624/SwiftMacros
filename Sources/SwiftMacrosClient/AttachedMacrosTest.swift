//
//  AutoDescriptionMacroTest.swift
//  SwiftMacros
//
//  Created by Pratama One on 12/08/25.
//

import SwiftMacros
import XCTest

@AutoDescriptionMacro
@AutoCodableMacro
@AutoInitMacro
@AutoPropertyMapping
struct User {
    var name: String
    var age: Int
    
    @AutoTracingMacro
    public func sayHello(name: String) -> String {
        return "Hello, \(name)!"
    }
}

struct UserService {
    func login(username: String, password: String) -> Bool {
        // Freestanding Macro -> Auto Logging
        #AutoLog("login")
        return username == "admin" && password == "123"
    }
}

@AutoPropertyWrapperMacro
struct UserData {
    @Logged var name: String = "Pratama"
    @Logged var age: Int = 25
}

@AutoGenerateTestMacro
struct Product {
    let id: Int
    var name: String
    var price: Double
}

