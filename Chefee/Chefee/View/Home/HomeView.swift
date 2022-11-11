//
//  HomeView.swift
//  Chefee
//
//  Created by Vitor Cheung on 08/09/22.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @State private var searchText = ""
    var receitas: [Receita]
    
    var comidasPaises = ["Comida japonesa", "Comida francesa", "Comida Italiana"]
    var body: some View {
        NavigationView {
            VStack{
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<comidasPaises.count){ comidas in
                        ZStack {
                            Image(comidasPaises[comidas])
                                .resizable()
                                .scaledToFit()
                            Color.black.opacity(0.3)
                            Text(comidasPaises[comidas])
                                .foregroundColor(.white)
                                .bold()
                                .font(.title)
                        }
                        .frame(width: 330, height: 170, alignment: .center)
                        .cornerRadius(12)
                                .padding()
                    }
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
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(receitas: [])
    }
}
