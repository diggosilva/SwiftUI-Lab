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
            AsyncImage(url: URL(string: usuario.fotoIcone)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            
            Text(usuario.nome)
                .font(.headline)
        }
    }
}

#Preview {
    DetalheContatoView(usuario: Usuario(nome: "Sonic The Hedgehog", username: "@sonichedgehog", fotoIcone: "https://caua1000.wordpress.com/wp-content/uploads/2012/11/sonic-the-hedgehog-classic-2.jpg", favorito: false))
}
