//
//  GeladeiraViewModel.swift
//  Chefee
//
//  Created by Vitor Cheung on 11/11/22.
//

import Foundation
class GeladeiraViewModel: ObservableObject{
    
    var receitas: [Receita] = DataBase.shared .receitas
    
    @Published var ingredientes: [Ingrediente] = DataBase.shared.ingredientes
    
    @Published var selectIngredientes: [Ingrediente] = []
    
    func ingredienteNaGeladeira() -> [Ingrediente] {
        let naGeladeira = ingredientes.filter { ingrediente in
            ingrediente.estaNaGeladeira == true
        }
        return naGeladeira
    }
    
    func ingredienteFilter(nome: String) -> [Ingrediente] {
        let ingredientes = ingredientes.filter { ingrediente in
            ingrediente.nome.starts(with: nome.lowercased())
        }
        return ingredientes
    }
    
    func indexForLoopBy2(array: Array<Any>) -> Int{
        return Int(ceil(Float(array.count)/2.0))
    }
    
    func recitasFiltadras() -> [Receita]{
        return receitas.filter { receita in
            checkPorIngrediente(ingredientes: receita.ingredientes)
        }
    }
    
    func checkPorIngrediente(ingredientes: [Ingrediente]) -> Bool{
        for selectIngrediente in selectIngredientes {
            for ingrediente in ingredientes{
                if selectIngrediente.id == ingrediente.id{
                    return true
                }
            }
        }
        return false
    }
    
}
