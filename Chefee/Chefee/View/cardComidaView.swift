//
//  cardComidaView.swift
//  Chefee
//
//  Created by Vitor Cheung on 08/09/22.
//

import SwiftUI

struct cardComidaView: View {
    var receita: Receita
    var body: some View {
        HStack{
            Image(receita.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
            VStack {
                HStack {
                    Text(receita.nome)
                        .bold()
                        .font(.title2)
                        .padding([.leading])
                    Spacer()
                }
                HStack {
                    Text("Tempo de duração: \(receita.tempoDeDuracao)")
                        .padding([.leading])
                        .font(.caption)
                    Spacer()
                }
                HStack {
                    Text("Nota do autor: \(receita.notaDoAutor)")
                        .font(.caption)
                        .padding([.leading])
                    Spacer()
                }
//                Text("Nota do autor: \(receita.notaDoAutor)")
            }
        }
    }
}

//struct cardComidaView_Previews: PreviewProvider {
//    static var previews: some View {
////        let r: Receita = {
////            let r = Receita()
////            r.notaDoAutor = 5.0
////            return r
////        }()
//        
//        cardComidaView(receita: Receita())
//    }
//}
