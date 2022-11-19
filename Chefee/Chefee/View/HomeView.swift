//
//  HomeView.swift
//  Chefee
//
//  Created by Vitor Cheung on 08/09/22.
//

import SwiftUI
import CoreData

struct HomeView: View {
    @EnvironmentObject var database: DataBase
    @State var searchText = ""
    var body: some View {
        NavigationView {
            VStack{
                if searchText.isEmpty{
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(0 ..< database.comidasPaises.count){ comidas in
                                NavigationLink {
                                    ListaDeReceitas(receitas: database.receitas.filter({ receita in
                                        receita.categoria == database.comidasPaises[comidas]
                                    }))
                                } label: {
                                    ZStack {
                                        Image(database.comidasPaises[comidas])
                                            .resizable()
                                            .scaledToFit()
                                        Color.black.opacity(0.3)
                                        Text(database.comidasPaises[comidas])
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
                    }
                    ListaDeReceitas(receitas: database.receitas)
                }
                else{
                    ListaDeReceitas(receitas: database.receitas.filter({ receita in
                        receita.nome.starts(with: searchText.lowercased())
                        })
                    )
                }
            }
            .searchable(text: $searchText, prompt: "Look for something")
            .navigationTitle("Chefee")
        }
    }
}
