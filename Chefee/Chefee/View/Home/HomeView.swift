//
//  HomeView.swift
//  Chefee
//
//  Created by Vitor Cheung on 08/09/22.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    var receitas: [Receita]
    var body: some View {
        NavigationView
            ScrollView(.horizontal) {
                HStack {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    Text("Hello, World!")
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    Text("Hello, World!")
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
            }
            List{
                ForEach(receitas) { receita in
                    NavigationLink(destination: DetalhesDaReceitaView(receita: receita)){
                            cardComidaView(receita: receita)
                                .padding()
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Favoritadas")
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(receitas: [])
    }
}
