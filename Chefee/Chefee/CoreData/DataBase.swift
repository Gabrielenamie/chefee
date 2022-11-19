//
//  DataBase.swift
//  Chefee
//
//  Created by Vitor Cheung on 11/11/22.
//

import Foundation
class DataBase: ObservableObject {
    static var shared = DataBase()
    var comidasPaises: [String] = []
    @Published var receitas: [Receita]
    @Published var ingredientes: [Ingrediente]
    @Published var recitasFavoritadas: [Receita]
    
    private init() {
        
        self.ingredientes = [
            Ingrediente(nome: "tomate", estaNaGeladeira: false),
            Ingrediente(nome: "cenora", estaNaGeladeira: false),
            Ingrediente(nome: "alho", estaNaGeladeira: false),
            Ingrediente(nome: "manga", estaNaGeladeira: false),
            Ingrediente(nome: "lula", estaNaGeladeira: false),
            Ingrediente(nome: "macarrão", estaNaGeladeira: false),
            Ingrediente(nome: "peixe", estaNaGeladeira: false),
            Ingrediente(nome: "arroz", estaNaGeladeira: false),
            Ingrediente(nome: "vegetais", estaNaGeladeira: false),
        ]
        self.comidasPaises = [EnumComidasPaises.japonesa.rawValue, EnumComidasPaises.francesa.rawValue, EnumComidasPaises.italina.rawValue]
        self.recitasFavoritadas = []
        self.receitas = []
        loadReceitas()
    }
    
    func loadReceitas() {
        receitas = [
            Receita(modoDePreparo: "Coloque tudo na panela e mecha",
                    nome: "macarrão",
                    tempoDeDuracao: "2 horas",
                    notaDoAutor: 4.6,
                    ingredientes: [ingredientes[0],ingredientes[5]],
                    quantidade: ["5","1/2 Kilo"],
                    categoria: EnumComidasPaises.italina.rawValue
                   ),
            Receita(modoDePreparo: "corta os peixe e coloque em cima do arroz",
                    nome: "sushi",
                    tempoDeDuracao: "1 horas",
                    notaDoAutor: 4.7,
                    ingredientes: [ingredientes[6],ingredientes[7]],
                    quantidade: ["1","400 gramas"],
                    categoria: EnumComidasPaises.japonesa.rawValue
                   ),
            Receita(modoDePreparo: "corte os vegetais, coloques em uma bandeja e coloque no forno",
                    nome: "ratatui",
                    tempoDeDuracao: "4 horas",
                    notaDoAutor: 4.7,
                    ingredientes: [ingredientes[8]],
                    quantidade: ["500 gramas"],
                    categoria: EnumComidasPaises.francesa.rawValue
                   ),

        ]
    }
}
