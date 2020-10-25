//
//  Instituicao.swift
//  AbraTeCodigo
//
//  Created by Ailton Vieira Pinto Filho on 24/10/20.
//

import Foundation

struct Instituicao {
    enum Categoria { case museu }
    
    let name: String
    let icone: String
    let fotoCapa: String
    let categoria: Categoria
    let itens: [ItemDigital]
    let exposicoes: [Exposicao]
}
