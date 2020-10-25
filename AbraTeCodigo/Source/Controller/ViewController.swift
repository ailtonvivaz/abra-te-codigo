//
//  ViewController.swift
//  AbraTeCodigo
//
//  Created by Ailton Vieira Pinto Filho on 24/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let vc = ARPreviewViewController.loadFromNib()
            vc.itemDigital = Acervo.shared.getItensBy(instituicao: Acervo.shared.mhn)[0]
            self.present(vc, animated: true, completion: nil)
        }
    }

}
