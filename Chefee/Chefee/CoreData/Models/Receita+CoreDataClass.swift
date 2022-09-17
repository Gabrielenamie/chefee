//
//  Receita+CoreDataClass.swift
//  Chefee
//
//  Created by Vitor Cheung on 09/09/22.
//
//

import Foundation
import CoreData


public class Receita: NSManagedObject {
    public func arrayIngredientes() -> [Ingrediente]{
        let set = ingredientes as? Set<Ingrediente> ?? []
        return set.sorted {
            $0.quantidade < $1.quantidade
        }
    }
}
