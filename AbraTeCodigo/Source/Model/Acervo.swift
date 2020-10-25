//
//  Acervo.swift
//  AbraTeCodigo
//
//  Created by Ailton Vieira Pinto Filho on 24/10/20.
//

import Foundation

class Acervo {
    static let shared = Acervo()
    
    let mhn = Instituicao(nome: "Museu Histórico Nacional", logo: "", fotoCapa: "", categoria: .museu)
    let eav = Instituicao(nome: "EAV Parque Lage", logo: "", fotoCapa: "", categoria: .museu)
    let casaPovo = Instituicao(nome: "Casa do Povo", logo: "", fotoCapa: "", categoria: .museu)
    let bienal = Instituicao(nome: "Bienal São Paulo", logo: "", fotoCapa: "", categoria: .museu)
    let macUSP = Instituicao(nome: "MAC-USP", logo: "", fotoCapa: "", categoria: .museu)
    let museuFutebol = Instituicao(nome: "Museu do Futebol", logo: "", fotoCapa: "", categoria: .museu)
    
    lazy var instituicoes: [Instituicao] = [mhn, eav, casaPovo, bienal, macUSP, museuFutebol]
    
    private lazy var itens: [ItemDigital] = [
        // MARK: - Moedas
        Moeda(fileName: "136997", nome: "Moeda de 4.000 réis", descricao: "Anverso: Ao centro, as armas do Reino, cortando a legenda; à esquerda o número 4000 entre pontos, e à direita três florões entre pontos. Legenda: PETRUS . II . DG . PORTVG . REX  . Reverso: Ao centro, a cruz de São Jorge, vazada circundada por quatro arcos unidos por florões. Legenda: ET . BRASILLIAE . DOMINVS . ANNO . 1699 .", local: "Rio de Janeiro", data: "1699", tecnica: "Cunhagem", material: "Ouro", governante: "D. Pedro II (1683-1706)", diametro: 13.91, licenca: .cc, instituicao: mhn),
        Moeda(fileName: "137140", nome: "Moeda de 4.000 réis", descricao: "Anverso: Ao centro, escudo das armas portuguesas sob coroa cortando a legenda; à esquerda entre pontos valor 4000 réis e a direita entre pontos três florões. Legenda: ao redor, JOANNES . D . G . PORT . E . ALG . P . REGENS . Reverso: Ao centro, a cruz de São Jorge, vazada e circundada por quatro arcos unidos por florões dentro de anel de aspas. Legenda entre florões: ao redor, ET . BRASILIÆ . DOMINUS . ANNO . 1808 .", local: "Rio de Janeiro", data: "1808", tecnica: "Cunhagem", material: "Ouro", governante: "D. João Príncipe Regente (1799-1816) ", diametro: 27.30, licenca: .cc, instituicao: mhn),
        Moeda(fileName: "137201", nome: "Moeda de 4.000 réis", descricao: "Anverso: Ao centro, escudo das armas portuguesas sob coroa cortando a legenda; à esquerda entre pontos valor 4000 réis e a direita três florões. Legenda: ao redor, JOANNES . D . G . PORT . BRAS . ET . ALG . Reverso: Ao centro, a cruz de São Jorge, vazada circundada por quatro arcos unidos por florões dentro de anel de aspas.  Legenda entre florões: ao redor, PRINCEPS . REGENS . ANNO . 1816 .", local: "Rio de Janeiro", data: "1816", tecnica: "Cunhagem", material: "Ouro", governante: "D. João Príncipe Regente (1799-1816)", diametro: 26.29, licenca: .cc, instituicao: mhn),
        Moeda(fileName: "137214", nome: "Moeda de 6.400 réis", descricao: "Anverso: No campo Busto do Príncipe Regente D. João VI, orientado à direita, orlado pela legenda JOANNES. D. G. PORT. BRAS. ET. ALG. P. REG, 1816 e letra monetária “R”. Reverso: Escudo nacional português encimado por Coroa Real. Sem legenda. (Série especial)", local: "Rio de Janeiro", data: "1816", tecnica: "Cunhagem", material: "Ouro", governante: "D. João Príncipe Regente (1799-1816)", diametro: 32.04, licenca: .cc, instituicao: mhn),
        Moeda(fileName: "137253", nome: "Moeda de 6.400 réis", descricao: "Anverso: Efígie do Imperador D. Pedro I, de perfil à esquerda, laureada e de busto nu. Legenda: PETRUS.I.D.G. BRASILIAE.IMPERATOR + 1822 + R +  Reverso: Escudo das armas imperiais brasileiras, com a coroa real portuguesa. Inscrição IN HOC SIG VIN. O escudo está entre dois ramos, o da esquerda de café e o da direita de tabaco. A união dos dois ramos é feito pelo Laço Nacional.", local: "Rio de Janeiro", data: "1822", tecnica: "Cunhagem", material: "Ouro", governante: "D. Pedro I (1822-1831)", diametro: 32.2, licenca: .cc, instituicao: mhn),
        Moeda(fileName: "137272", nome: "Moeda de 6.400 réis", descricao: "Anverso: Ao centro, busto de D. Pedro II ainda menino, voltado para a direita. Legenda: ao redor, PETRUS . II . D . G . CONST . IMP . ET . PERP . BRAS . DEF e 1832 . R entre florões. Reverso: Ao centro, brasão do Império sobre o valor 6400 entre florões. Legenda: ao redor, IN * HOC * SIGNO * VINCES", local: "Rio de Janeiro", data: "1832", tecnica: "Cunhagem", material: "Ouro", governante: "D. Pedro II (1831-1889)", diametro: 32, licenca: .cc, instituicao: mhn),
        
        // MARK: - Quadros
        Quadro(fileName: "6368", denominacao: .pinturaDocumental, nome: "Convento de Santa Teresa", descricao: "Exterior de arquitetura religiosa. Do lado esquerdo, uma escadaria que leva à igreja. Esta é branca, com cunhais de pedra, frontão retilíneo encimado por uma cruz. Corpo formado por uma janela longa e retangular, ladeada por outras duas janelas menores. Torre lateral única. Parte da entrada colocada na lateral. Do lado esquerdo, ao fundo, vegetação formando jardim. Assinatura do autor e datação no canto inferior esquerdo em tinta vermelha sobre incisão: Ruy Campello/946. Moldura em madeira estucada, dourada, abaulada no centro, com florões nos cantos.", local: "Rio de Janeiro", data: "1946", autor: "Rui Alves Campelo", tecnica: "Óleo sobre tela", tamanho: .init(largura: 66.5, altura: 77.3), licenca: .cc, instituicao: mhn)
    ]
    
    lazy var exposicoes: [Exposicao] = [
        Exposicao(titulo: "Moedas", itens: itens.filter { $0 is Moeda })
    ]
    
    let categorias: [Categoria] = [
        Categoria(titulo: "Arte Indígena", subtitulo: "Arte dos Povos Indígenas", imagem: ""),
        Categoria(titulo: "Período Colonial", subtitulo: "Objetos do Brasil Colonial", imagem: "")
    ]
    
    private init() {}
    
    func getItensBy(instituicao: Instituicao) -> [ItemDigital] {
        itens.filter { $0.instituicao == instituicao }
    }
    
    func getExposicoesBy(instituicao: Instituicao) -> [Exposicao] {
        exposicoes.filter { $0.itens.map { $0.instituicao }.contains(instituicao) }
    }
}
