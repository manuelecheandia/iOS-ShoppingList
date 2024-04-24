//
//  ViewModel.swift
//  UIForCoreDataDemo
//
//  Created by Echeandia Pais, Manuel Arturo on 2024-03-28.
//

import Foundation
import CoreData

//Create
func addItem(name: String, context: NSManagedObjectContext){
  //create a new instance, set properties, and save
  let newItem = Item(context: context)
  newItem.id = UUID()
  newItem.name = name.trimmingCharacters(in: .whitespaces)
  do{
    try context.save()
  }catch{
      print("Failed to save item")
  }
}

//RetrieveItemList
func fetchItems(context: NSManagedObjectContext) -> [Item]{
  let request: NSFetchRequest<Item> = Item.fetchRequest()
  do{
    return try context.fetch(request)
  }catch{
    print("There was an issue with the fetch")
    return []
  }
}
