//
//  DetalhesDaReceitaView.swift
//  Chefee
//
//  Created by Vitor Cheung on 08/09/22.
//

import SwiftUI

struct DetalhesDaReceitaView: View {
    var receita: Receita
    var body: some View {
        VStack{
            if let image = UIImage(systemName: "plus"){
                Image(uiImage: image)
            }
            Text(receita.nome ?? "Bolo")
                .font(.title)
                .bold()
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding([.top,.leading,.trailing])
            Text("Nota do autor: \(receita.notaDoAutor)⭐️")
                .bold()
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding([.leading,.trailing])
            Text("Tempo duração: \(receita.tempoDeDuracao ?? "1 hora")")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding([.leading,.trailing])
            
            Text("Ingredientes:")
                .font(.title2)
                .bold()
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding([.top,.leading,.trailing])
            ForEach(receita.arrayIngredientes()){ ingrediente in
                HStack{
                    Text("\(ingrediente.quantidade) \(ingrediente.nome ?? "Bolo")")
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .padding([.leading,.trailing])
                }
                
            }
            Text("Modo de preparo:")
                .font(.title2)
                .bold()
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding([.top,.leading,.trailing])
            Text(receita.modoDePreparo ?? "joga tudo fora")
                .frame(maxWidth:.infinity, alignment: .leading)
                .padding([.leading,.trailing])
            Spacer()
            
            
        }
    }
}

struct DetalhesDaReceitaView_Previews: PreviewProvider {
    static var previews: some View {
        DetalhesDaReceitaView(receita: Receita())
    }
}
