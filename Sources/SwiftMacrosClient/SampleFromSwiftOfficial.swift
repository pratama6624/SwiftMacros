//
//  SampleFromSwiftOfficial.swift
//  SwiftMacros
//
//  Created by Pratama One on 19/08/25.
//

import SwiftMacros

// Manual -> Ngetik kode manual bree
struct ManualSundaeToppings: OptionSet {
    let rawValue: Int
    static let nuts = ManualSundaeToppings(rawValue: 1 << 0)
    static let cherry = ManualSundaeToppings(rawValue: 1 << 1)
    static let fudge = ManualSundaeToppings(rawValue: 1 << 2)
}

// NOTE: Macro form for OptionSet is commented out due to ambiguity errors.
// Once macro definitions are cleaned up and only one valid attached OptionSet macro remains, you can re-enable below.
 @OptionSet<Int>
 struct SundaeToppings {
     private enum Options: Int {
         case nuts
         case cherry
         case fudge
     }
 }
