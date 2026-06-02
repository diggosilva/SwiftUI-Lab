//
//  DetalheContatoView.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 31/05/26.
//

import SwiftUI

struct DetalheContatoView: View {
    
    let usuario: Usuario
    
    var body: some View {
        VStack {
            Image(systemName: usuario.fotoIcone)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            
            Text(usuario.nome)
                .font(.headline)
        }
    }
}

#Preview {
    DetalheContatoView(usuario: Usuario(nome: "Sonic The Hedgehog", username: "@sonichedgehog", fotoIcone: "spigot.fill", favorito: false))
}
