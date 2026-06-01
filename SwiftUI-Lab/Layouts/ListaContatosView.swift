//
//  ListaContatosView.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 30/05/26.
//

import SwiftUI

struct Usuario: Identifiable {
    let id = UUID()
    let nome: String
    let username: String
    let fotoIcone: String
}

struct ListaContatosView: View {
    
    let contatos = [
        Usuario(nome: "Mario Bros", username: "@mariobros", fotoIcone: "person.circle.fill"),
        Usuario(nome: "Luigi Bros", username: "@luigibros", fotoIcone: "laptopcomputer"),
        Usuario(nome: "Link Zelda", username: "@linkzelda", fotoIcone: "iphone"),
    ]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contatos) { amigo in
                    NavigationLink(destination: DetalheContatoView(usuario: amigo)) {
                        CardPerfilView(usuario: amigo)
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
