//
//  ListaDeReceitas.swift
//  Chefee
//
//  Created by Vitor Cheung on 11/11/22.
//

import SwiftUI

struct ListaDeReceitas: View {
    var receitas : [Receita]
    var body: some View {
        List{
            ForEach(receitas) { receita in
                NavigationLink(destination: DetalhesDaReceitaView(receita: receita)){
                    cardComidaView(receita: receita)
                        .padding()
                }
            }
        }
    }
}


