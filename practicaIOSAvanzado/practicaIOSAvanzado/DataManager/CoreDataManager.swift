//
//  CoreDataManager.swift
//  PracticaIOSAvanzado
//
//  Created by vero on 14/2/23.
//
import Foundation
import CoreData

class CoreDataManager {
    private let modelName: String
    
    init(modelName: String) {
        self.modelName = modelName
    }
    
    private lazy var storeContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: self.modelName)
        container.loadPersistentStores { _ , error in
            if let error {
                debugPrint("Error during loading persistent stores \(error)")
            }
        }
        
        return container
    }()
    
    lazy var managedContext : NSManagedObjectContext = self.storeContainer.viewContext
    
    func saveContext() {
        guard managedContext.hasChanges else { return }
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            debugPrint("Error during saving context \(error)")
        }
    }
    
}


//MARK: HANDLER HERO

typealias HandlerHero = (_ heroe: Hero) -> Void

var contextUsers = AppDelegate.sharedAppDelegate.coreDataUsers.managedContext
var contextHeroes = AppDelegate.sharedAppDelegate.coreDataHeroes.managedContext
var currentUser: User?
var currentHeroe: Hero?
var updateHeroe: HandlerHero?


// MARK: CoreData

func saveHeroeCoreData(_ id: String, _ photo: String, _ name: String, _ heroeDescription: String, _ longitud: String, _ latitud: String) {
    
    
    let heroe = Hero(context: contextHeroes)
    
    heroe.id = id
    heroe.photo = photo
    heroe.name = name
    heroe.heroeDescription = heroeDescription
    heroe.latitud = latitud
    heroe.longitud = longitud
 
    
    do {
        try contextHeroes.save()
    } catch let error {
        debugPrint(error)
    }
    
}

func getHeroesCoreData() -> [Hero] {
    let heroeFetch: NSFetchRequest<Hero> = Hero.fetchRequest()
    
    do {
        let result = try contextHeroes.fetch(heroeFetch)
        
        return result
        
    } catch let error as NSError {
        debugPrint("Error -> \(error)")
        return []
    }
}


func deleteHeroesCoreData() {
    // Obtener los objetos de la entidad que deseas eliminar
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Hero")
    let heroes = try! contextHeroes.fetch(fetchRequest) as! [NSManagedObject]
    
    // Iterar a través de los objetos y eliminarlos del contexto
    heroes.forEach({ heroe in
        contextHeroes.delete(heroe)
    })
    
    
    do {
        
        // Guardar los cambios en el contexto
        try contextHeroes.save()
        print("Heroes deleted susccessfully ( CoreData )")
    } catch let error as NSError {
        debugPrint("Error during deleting heroes of coreData -> \(error)")
    }
    
}




func getEmail() -> String {
    let userFetch: NSFetchRequest<User> = User.fetchRequest()
    
    do {
        let result = try contextUsers.fetch(userFetch)
        return result.first?.email ?? ""
        
    } catch let error as NSError {
        debugPrint("Error -> \(error)")
        return ""
    }
}


func saveEmail(_ email: String) {
    // Guardo la info en CoreData
    
    
    let user = User(context: contextUsers)
    
    user.email = email
    
    do {
        
        try contextUsers.save()
        
    } catch let error {
        debugPrint(error)
    }
    
}

