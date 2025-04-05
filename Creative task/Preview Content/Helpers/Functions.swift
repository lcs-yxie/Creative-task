//
//  Functions.swift
//  Spelling
//
//  Created by Russell Gordon on 2023-10-30.
//

import Foundation

func filtering(originalList: [GroceryItem], on desiredCategory: Categories) -> [GroceryItem] {
    
    // When the desired outcome is undetermined, just stop and return everything
    if desiredCategory == .undetermined {
        return originalList
    } else{
        return originalList.filter { item in
            item.category == desiredCategory
        }
    }
    
    
}
