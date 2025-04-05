//
//  ContentView.swift
//  Creative task
//
//  Created by Yukun Xie on 2025/4/4.
//

import SwiftUI

struct GroceryListView: View {
    @State private var names: [String] = []
    @State private var newName: String = ""

    var body: some View {
        VStack {
            
            //Place to add the new grocery items
            TextField("Enter grocery name", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            //To add items when finished adding text
            Button("Add") {
                //Only allow to add when there are text in the textfield
                if !newName.isEmpty {
                    names.append(newName)
                    newName = ""
                }
            }

            //List to show grocery items
            List {
                ForEach(names, id: \.self) { name in
                    Text(name)
                }
                .onDelete(perform: deleteItems) 
            }
        }
        .padding()
    }
    func deleteItems(at offsets: IndexSet) {
        names.remove(atOffsets: offsets)
    }
}


