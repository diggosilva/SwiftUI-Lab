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
        List {
            ForEach(contatos) { amigo in
                CardPerfilView(usuario: amigo)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    ListaContatosView()
}
