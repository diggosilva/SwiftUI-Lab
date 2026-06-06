//
//  CadastroContatoView.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 06/06/26.
//

import SwiftUI

struct CadastroContatoView: View {
    @State private var nome = ""
    @State private var username = ""
    @State private var urlFoto = ""
    
    @Binding var contatos: [Usuario]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Informações do Contato")) {
                    TextField("Nome", text: $nome).autocapitalization(.words)
                    
                    TextField("Username", text: $username)
                        .onChange(of: username) { oldValue, newValue in
                            username = newValue.lowercased()
                        }
                    TextField("URL da Foto (Internet)", text: $urlFoto)
                }
            }
            .scrollDismissesKeyboard(.interactively)
            
            Button(action: {
                // Criar o novo usuário com os dados digitados
                guard !nome.isEmpty, !username.isEmpty, !urlFoto.isEmpty else { return }
                
                let novoUsuario = Usuario(
                    nome: nome,
                    username: username,
                    fotoIcone: urlFoto,
                    favorito: false
                )
                
                // Adicionar na lista global
                contatos.append(novoUsuario)
                
                // Fecha a tela de cadastro
                dismiss()
            }) {
                Text("Salvar Contato")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
        }
    }
}

#Preview {
    CadastroContatoView(contatos: .constant([]))
}
