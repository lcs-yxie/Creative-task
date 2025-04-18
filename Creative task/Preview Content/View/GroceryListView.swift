//
//  ContentView.swift
//  Creative task
//
//  Created by Yukun Xie on 2025/4/4.
//

import SwiftUI

struct GroceryListView: View {
    
    //Array of all names
    @State private var items: [GroceryItem] = []
    
    //A changing text value that can allow user input to the name array
    @State private var newName: String = ""
    
    //Setting the unselected category as undetermined
    @State var selectedCategoriesFilter: Categories = .undetermined
    
    @State var currentCategories: Categories = .undetermined

    var body: some View {
        VStack {
            
            //Place to add the new grocery items
            TextField("Enter grocery name", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            //Add items when finished adding text
            Button("Add") {
                
                // Make sure the name is not empty
                if newName != "" {
                    
                    // Make sure the user picked a category
                    if currentCategories != .undetermined {
                        // Add the item with its name and category
                        items.append(GroceryItem(name: newName, category: currentCategories))
                        
                        // Clear the text field and reset category
                        newName = ""
                        currentCategories = .undetermined
                    }
                }
            }
        
            // Picker to choose category for the added item
            Picker("Select a category", selection: $currentCategories) {
                Text("Fruit").tag(Categories.fruit)
                Text("Meat").tag(Categories.meat)
                Text("Dairy").tag(Categories.dairy)
                Text("Grain").tag(Categories.grain)
                Text("Seafood").tag(Categories.seafood)
                Text("Snack").tag(Categories.snack)
                Text("Drink").tag(Categories.drink)
                Text("Other").tag(Categories.other)
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            
            
            //Picking a specific category to filter
            Picker("Filtering on", selection: $selectedCategoriesFilter) {
                Text("All results").tag(Categories.undetermined)
                Text("Fruit").tag(Categories.fruit)
                Text("Meat").tag(Categories.meat)
                Text("Dairy").tag(Categories.dairy)
                Text("Grain").tag(Categories.grain)
                Text("Seafood").tag(Categories.seafood)
                Text("Snack").tag(Categories.snack)
                Text("Drink").tag(Categories.drink)
                Text("Other").tag(Categories.other)
                
            }
            .padding()

            
            //List to show grocery items
            List {
                
                let filteredList = filtering(
                    originalList: items,
                    on: selectedCategoriesFilter
                )
                ForEach(filteredList) { item in
                    
                    //Actual name of the item
                    HStack{
                        Text(item.name)
                        Spacer()
                        Text((item.category.rawValue))
                        
                    }
                    //Button to delete
                    Button {
                        deleteItem(item)
                                            } label: {
                                                Image(systemName: "trash")
                                            }
                }
                //Adds in the delete function
            }
        }
        .padding()
    }
    
    //This is the function that deletes the item from the names array
    func deleteItem(_ itemToDelete: GroceryItem) {
        // Go through every item in the list
        for index in 0..<items.count {
            // If we find a match
            if items[index].id == itemToDelete.id {
                // Remove it
                items.remove(at: index)
                // Stop the loop, we're done
                break
            }
        }
    }
}


