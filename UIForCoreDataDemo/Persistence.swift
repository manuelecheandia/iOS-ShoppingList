//
//  Persistence.swift
//  UIForCoreDataDemo
//
//  Created by Echeandia Pais, Manuel Arturo on 2024-03-28.
//

//this is the code for the Persistence.swift file. I am giving you this since it is very temperamental and often will trigger errors before you can even finish typing the code need

import CoreData

struct PersistenceController {

  /*

   the line below creates a static instance of 'PersistenceController' called shared. This allows other parts of your application to access a single shared instance of PersistenceController following the singleton pattern. This pattern ensures that there is a single instance of the PersistenceController in memory, providing global access to it

   */

    static let shared = PersistenceController()

    let container: NSPersistentContainer

  /* the container (NSPersistentContainer) manages the model (managed object model), the context (managed object context), and persistent data stores

  */

    init() { //this init is responsible for setting up the NSPersistentContainer


      /* the name (in this case 'Model' must match the name of the Core Data Model file. It describes the schema of your database including entities, attributes, and relationships */

        container = NSPersistentContainer(name: "Model")

      /*

       the container.loadPersistentStores... method loads the persistent stores associated with the container. (a sqlite database). The closure provided as an argument is called once for each persistent store that is loaded. This closure receives a 'storeDescription' which provides details about the confi and location of the store and an error if an error occured while loading the store

       */

        container.loadPersistentStores { (storeDescription, error) in

          //basic error handling that should be made more robust for a project that would be deployed

            if let error = error as NSError? {

                print("Unresolved error \(error), \(error.userInfo)")

            }

        }

    }

}
