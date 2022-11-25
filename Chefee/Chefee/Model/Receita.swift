//
//  Receita.swift
//  Chefee
//
//  Created by Vitor Cheung on 11/11/22.
//

import Foundation
import SwiftUI

class Receita: Identifiable {
    var id: UUID
    var image: Image
    var modoDePreparo: String
    var nome: String
    var tempoDeDuracao: String
    var notaDoAutor: Float
    var quantidade: [String]
    var ingredientes: [Ingrediente]
    var categoria: String
    
    init( modoDePreparo: String, nome: String, tempoDeDuracao: String, image: Image, notaDoAutor: Float, ingredientes: [Ingrediente], quantidade: [String], categoria: String) {
        self.id = UUID()
        self.modoDePreparo = modoDePreparo
        self.image = image
        self.nome = nome
        self.tempoDeDuracao = tempoDeDuracao
        self.notaDoAutor = notaDoAutor
        self.quantidade = quantidade
        self.ingredientes = ingredientes
        self.categoria = categoria
    }
}
