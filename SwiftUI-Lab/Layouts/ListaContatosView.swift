//
//  ListaContatosView.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 30/05/26.
//

import SwiftUI

struct ListaContatosView: View {
    
    @State private var contatos = [
        Usuario(nome: "Mario Bros", username: "@mariobros", fotoIcone: "person.circle.fill", favorito: false),
        Usuario(nome: "Luigi Bros", username: "@luigibros", fotoIcone: "laptopcomputer", favorito: false),
        Usuario(nome: "Link Zelda", username: "@linkzelda", fotoIcone: "iphone", favorito: false),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($contatos) { $amigo in
                    NavigationLink(destination: DetalheContatoView(usuario: amigo)) {
                        CardPerfilView(usuario: $amigo)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle("Contatos")
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    ListaContatosView()
}
