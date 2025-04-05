//
//  ContentView.swift
//  Creative task
//
//  Created by Yukun Xie on 2025/4/4.
//

import SwiftUI

struct GroceryListView: View {
    
    //New array of all names
    @State private var items: [GroceryItem] = []
    
    //A changing text value that can assist user input to the name array
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
                    
                    // Make sure the user picked a real category
                    if currentCategories != .undetermined {
                        // Add the item with its name and category
                        let newItem = GroceryItem(name: newName, category: currentCategories)
                        items.append(newItem)
                        
                        // Clear the text field and reset category
                        newName = ""
                        currentCategories = .undetermined
                    }
                }
            }

            // Picker to choose category for the added item
            Picker("Select a category", selection: $currentCategories) {
                Text("Pick one").tag(Categories.undetermined)
                Text("Fruit").tag(Categories.fruit)
                Text("Meat").tag(Categories.meat)
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            
            //List to show grocery items
            List {
                ForEach(items.indices, id: \.self) { index in
                    
                    //Actual name of the item
                    HStack{
                        Text(items[index].name)
                        Spacer()
                        Text((items[index].category.rawValue))
                        
                    }
                    //Button to delete
                    Button {
                                        items.remove(at: index)
                                            } label: {
                                                Image(systemName: "trash")
                                            }
                }
                //Adds in the delete function
                .onDelete(perform: deleteItems)
            }
        }
        .padding()
    }
    
    //This is the function that deletes the item from the names array
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}


