//
//  TestMacroAutoDescription.swift
//  SwiftMacros
//
//  Created by Pratama One on 11/08/25.
//

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
        
        print("\n")
    }
}
