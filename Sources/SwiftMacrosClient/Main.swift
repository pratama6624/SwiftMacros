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
        
        let result = #stringify(2 + 3)
        print(result)
    }
}
