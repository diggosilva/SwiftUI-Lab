//
//  Usuario.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 01/06/26.
//

import SwiftUI

struct Usuario: Identifiable, Codable, Equatable {
    var id = UUID()
    // Alterado de 'let' para 'var' para permitir a edição através de Bindings
    var nome: String
    var username: String
    var fotoIcone: Data?
    var favorito: Bool
}
