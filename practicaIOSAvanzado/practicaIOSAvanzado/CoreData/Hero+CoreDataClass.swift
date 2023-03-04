//
//  Hero+CoreDataClass.swift
//  PracticaIOSAvanzado
//
//  Created by vero on 18/2/23.
//

import Foundation
import CoreData

@objc(Hero)
public class Hero: NSManagedObject {
    
}

public extension Hero {
    
    @nonobjc class func fetchRequest() -> NSFetchRequest<Hero> {
        return NSFetchRequest<Hero>(entityName: "Hero")
    }
    
    @NSManaged var photo: String
    @NSManaged var id: String
    @NSManaged var name: String
    @NSManaged var heroeDescription: String
    @NSManaged var latitud: String
    @NSManaged var longitud: String


  

    
    
}

extension Hero: Identifiable {}
