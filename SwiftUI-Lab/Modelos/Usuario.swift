//
//  Usuario.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 01/06/26.
//

import SwiftUI

struct Usuario: Identifiable, Codable, Equatable {
    var id = UUID()
    let nome: String
    let username: String
    let fotoIcone: Data?
    var favorito: Bool
}
