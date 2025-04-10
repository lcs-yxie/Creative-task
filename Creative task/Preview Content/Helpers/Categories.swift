//
//  Categories.swift
//  Creative task
//
//  Created by Yukun Xie on 2025/4/5.
//

import Foundation
import SwiftUI

enum Categories: String {
    case undetermined = " "
    case fruit = "Fruit"
    case vegetable = "Vegetable"
    case meat = "Meat"
    case dairy = "Dairy"
    case grain = "Grain"
    case seafood = "Seafood"
    case snack = "Snack"
    case drink = "Drink"
    case other = "Other"
    
    var id: String { self.rawValue }
}
