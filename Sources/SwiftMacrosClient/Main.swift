//
//  TestMacroAutoDescription.swift
//  SwiftMacros
//
//  Created by Pratama One on 11/08/25.
//

import Foundation
import SwiftMacros

@main
struct MyApp {
    static func main() {
        // Auto Description
        print("Auto Description")
        let user = User(name: "Pratama", age: 26)
        print(user.description)
        
        // Custom Description
        print("\nCustom Description")
        let car = Car(make: "Toyota", model: "Corolla", name: "My Car")
        print(car.customDescription)
        
        // Simple Free Standing Macro
        print("\nSimple Free Standing Macro")
        let result = #stringify(2 + 3)
        print(result)
        
        // Free Standing Macro -> Generated Function
        print("\nFree Standing Macro -> Generated Function")
        #generatedAppinfo("My App", 1)
        
        // Free Standing Macro -> Compile Time Info
        print("\nFree Standing Macro -> Compile Time Info")
        print(#compileTimeInfo("Testing compile time info"))
        
        // Attached Macros -> Auto Codable
        print("\nAttached Macros -> Auto Codable")
        let me = User(name: "Young", age: 24)
        // Encode struct
        let encoded = try! JSONEncoder().encode(me)
        print(String(data: encoded, encoding: .utf8))
        // Decode balik hasil encode
        let decodeUser = try! JSONDecoder().decode(User.self, from: encoded)
        print(decodeUser)
        print(decodeUser.name)
        print(decodeUser.age)
        
        // Attached Macros -> Auto Init
        print("\nAttached Macros -> Auto Init")
        let young = User(name: "Young", age: 24)
        print(young.name)
        print(young.age)
        
        // Attached Macros -> Auto Property Mapping
        print("\nAttached Macros -> Auto Property Mapping")
        var mappingUser = User(name: "Pratama", age: 26)
        let dict: [String: Any] = ["name": "Doni", "age": 30]
        mappingUser.map(from: dict)
        print(mappingUser)
        
        // Freestanding Macros -> Auto Logging
        print("\nFreestanding Macros -> Auto Logging")
        let service = UserService()
        print(service.login(username: "admin", password: "123"))
        
        // Attached Macros -> Auto Tracing Func
        print("\nAttached Macros -> Auto Tracing Func")
        let tracingUser = User(name: "Pratama", age: 26)
        print(tracingUser.sayHello(name: "Young"))
        
        // Attached Macros -> Auto Property Wrapper
        print("\nAttached Macros -> Auto Property Wrapper")
        var wrapperUser = UserData()
        wrapperUser.name = "Young"
        print(wrapperUser.name)
        wrapperUser.name = "One"
        print(wrapperUser.name)
        
        // Attached Macros -> Auto Generated Code For Tests
        // print("\nAttached Macros -> Auto Generated Code For Tests")
        // var product = Product(id: 1, name: "IPhone 16", price: 13_000_000.0)
        
        // Apple Swift Documentation -> How to use macros from zero to hero
        print("\nOfficial Documentation from apple (swift) -> How to use macros from zero to hero")
        let code: UInt32 = #fourCharacterCode("ABCD")
        print(code) // 1094861636
        
        print("\n")
    }
}
