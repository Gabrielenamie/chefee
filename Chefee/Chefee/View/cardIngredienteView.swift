//
//  cardIngredienteView.swift
//  Chefee
//
//  Created by Vitor Cheung on 09/09/22.
//

import SwiftUI

struct cardIngredienteView: View {
    var ingrediente: Ingrediente
    var color: CGColor
    var body: some View {
        ZStack{
            Color(color)
            HStack{
                Text(ingrediente.nome ?? "maracuja")
                Spacer()
            }
        }
        
    }
}


