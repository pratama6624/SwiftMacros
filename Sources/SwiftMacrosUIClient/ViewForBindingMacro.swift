//
//  ViewForBindingMacro.swift
//  SwiftMacros
//
//  Created by Pratama One on 16/08/25.
//

import SwiftUI
import SwiftMacros

@AutoBindMacro
class UserModel: ObservableObject {
    var name: String = "Pratama"
    var age: Int = 25
}

struct ContentView: View {
    @ObservedObject var user = UserModel()
    
    var body: some View {
        VStack {
            TextField("Name", text: $user.name)
            Stepper("Age: \(user.age)", value: $user.age)
        }
        .padding()
    }
}

// For Preview
#Preview {
    ContentView()
}

