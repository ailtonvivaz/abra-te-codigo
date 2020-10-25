//
//  Quadro.swift
//  AbraTeCodigo
//
//  Created by Ailton Vieira Pinto Filho on 24/10/20.
//

import Foundation

class Quadro: ItemDigital {
    struct Tamanho {
        var largura: Float
        var altura: Float
    }
    
    let autor: String
    let tecnica: String
    let tamanho: Tamanho
    
    internal init(fileName: String, denominacao: Denominacao, nome: String, descricao: String, local: String, data: String, autor: String, tecnica: String, tamanho: Quadro.Tamanho, licenca: Licenca, instituicao: Instituicao) {
        self.autor = autor
        self.tecnica = tecnica
        self.tamanho = tamanho
        super.init(fileName: fileName, denominacao: denominacao, nome: nome, descricao: descricao, local: local, data: data, licenca: licenca, instituicao: instituicao)
    }
}
