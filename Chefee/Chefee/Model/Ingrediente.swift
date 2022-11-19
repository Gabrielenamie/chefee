//
//  Ingediente.swift
//  Chefee
//
//  Created by Vitor Cheung on 11/11/22.
//

import Foundation
class Ingrediente: Identifiable{
    var id: UUID
    var nome: String
    var estaNaGeladeira: Bool
    
    init( nome: String, estaNaGeladeira: Bool) {
        self.id = UUID()
        self.nome = nome
        self.estaNaGeladeira = estaNaGeladeira
    }
}
