//
//  Usuario.swift
//  SwiftUI-Lab
//
//  Created by Diggo Silva on 01/06/26.
//

import SwiftUI

struct Usuario: Identifiable {
    let id = UUID()
    let nome: String
    let username: String
    let fotoIcone: String
    var favorito: Bool
}
