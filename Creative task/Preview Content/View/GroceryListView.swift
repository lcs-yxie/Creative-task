//
//  ContentView.swift
//  Creative task
//
//  Created by Yukun Xie on 2025/4/4.
//

import SwiftUI

struct GroceryListView: View {
    
    //New array of all names
    @State private var names: [String] = []
    
    //A changing text value that can assist user input to the name array
    @State private var newName: String = ""
    
    //
    @State var selectedOutcomeFilter: Outcome = .undetermined
    
    
    @State var currentOutcome: Outcome = .undetermined

    var body: some View {
        VStack {
            
            //Place to add the new grocery items
            TextField("Enter grocery name", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            //Add items when finished adding text
            Button("Add") {
                
                //Only allow to add when there are text in the textfield
                if !newName.isEmpty {
                    
                    //Add newName text into the array of names
                    names.append(newName)
                    newName = ""
                }
            }

            //List to show grocery items
            List {
                ForEach(names.indices, id: \.self) { index in
                    
                    //Actual name of the item
                    Text(names[index])
                    
                    //Button to delete
                    Button {
                                        names.remove(at: index)
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
        names.remove(atOffsets: offsets)
    }
}


