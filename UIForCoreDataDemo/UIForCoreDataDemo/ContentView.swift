//
//  ContentView.swift
//  UIForCoreDataDemo
//
//  Created by Echeandia Pais, Manuel Arturo on 2024-03-28.
//
import SwiftUI
import CoreData

struct ContentView: View {

  //set up the viewContext
  @Environment(\.managedObjectContext) private var viewContext

  // this fetch request will sort by name
  @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Item.name, ascending: true)], animation: .default )

  private var items: FetchedResults<Item>

  // State for the text field input
  @State private var newItemName: String = ""

   var body: some View {
    NavigationView {
      
      List {
        Section(header: Text("Add New Item")) {
          HStack {
            TextField("Item Name", text: $newItemName)
            Button(action: {
              
              addItem(name: newItemName, context: viewContext)
              newItemName = ""
              
            }) {
              Label("", systemImage: "plus")
            }
            .disabled(newItemName == "")
          }
        }
        
        Section(header: Text("Items")) {
          //loop through & display the items
          ForEach(items){ item in
            Text(item.name ??  "Unnamed")
          }
        }
      }
      .navigationTitle("Shopping List")
    }
  }
}

#Preview {
  ContentView()
}


