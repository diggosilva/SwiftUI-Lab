//
//  CadastroContatoView.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 06/06/26.
//

import SwiftUI
import PhotosUI

struct CadastroContatoView: View {
    @State private var nome = ""
    @State private var username = ""
    
    // Variáveis para a Galeria de Fotos
    @State private var itemSelecionado: PhotosPickerItem? = nil
    @State private var dadosDaFoto: Data? = nil
    
    var formularioValido: Bool {
        !nome.isEmpty && username.hasPrefix("@") && username.count >= 3
    }
    
    @Binding var contatos: [Usuario]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Foto de Perfil")) {
                    HStack {
                        Spacer()
                        PhotosPicker(selection: $itemSelecionado, matching: .images) {
                            if let dados = dadosDaFoto, let uiImage = UIImage(data: dados) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                            } else {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .foregroundStyle(Color.gray)
                            }
                        }
                        Spacer()
                    }
                }
                
                Section(header: Text("Informações do Contato")) {
                    TextField("Nome", text: $nome).autocapitalization(.words)
                    
                    TextField("Username", text: $username)
                        .onChange(of: username) { oldValue, newValue in
                            username = newValue.lowercased()
                        }
                }
            }
            .scrollDismissesKeyboard(.interactively)
            
            // Fica vigiando quando o usuário escolhe uma foto para convertê-la em dados (Data)
            .onChange(of: itemSelecionado) { oldValue, newValue in
                Task {
                    if let data = try? await newValue?.loadTransferable(type: Data.self) {
                        dadosDaFoto = data
                    }
                }
            }
            
            Button(action: {
                // Criar o novo usuário com os dados digitados
                guard !nome.isEmpty, !username.isEmpty else { return }
                
                let novoUsuario = Usuario(
                    nome: nome,
                    username: username,
                    fotoIcone: dadosDaFoto,
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
                    .background(
                        formularioValido ? Color.blue : Color.gray
                    )
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding()
            .disabled(!formularioValido)
        }
    }
}

#Preview {
    CadastroContatoView(contatos: .constant([]))
}
