//
//  Persistence.swift
//  Chefee
//
//  Created by Vitor Cheung on 08/09/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newReceita = Receita(context: viewContext)
            newReceita.nome = "Macarrão"
            newReceita.notaDoAutor = 4.5
            newReceita.modoDePreparo = "Coloque tudo na panela e mecha"
            newReceita.tempoDeDuracao = "2 horas"
            
            let ingrediente = Ingrediente(context: viewContext)
            ingrediente.quantidade = 2
            ingrediente.nome = "tomate"
            newReceita.ingredientes = [ingrediente]
            
            let newReceita1 = Receita(context: viewContext)
            newReceita1.nome = "Sushi"
            newReceita1.notaDoAutor = 4.5
            newReceita1.modoDePreparo = "Coloque tudo no prato e mecha"
            newReceita1.tempoDeDuracao = "10 horas"
            
            let ingrediente1 = Ingrediente(context: viewContext)
            ingrediente1.quantidade = 2
            ingrediente1.nome = "Peixe"
            newReceita1.ingredientes = [ingrediente]
            
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Chefee")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
