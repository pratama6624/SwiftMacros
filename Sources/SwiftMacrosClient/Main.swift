//
//  TestMacroAutoDescription.swift
//  SwiftMacros
//
//  Created by Pratama One on 11/08/25.
//

import SwiftMacros

@AutoDescription
@CustomDescription
struct User {
    let name: String
    let age: Int
}

@AutoDescription
@CustomDescription
struct Car {
    let make: String
    let model: String
    let name: String
}

@main
struct MyApp {
    static func main() {
        let u = User(name: "Pratama", age: 26)
        print(u.description)
        print(u.customDescription)
        let car = Car(make: "Toyota", model: "Corolla", name: "My Car")
        print(car.description)
        print(car.customDescription)
    }
}
