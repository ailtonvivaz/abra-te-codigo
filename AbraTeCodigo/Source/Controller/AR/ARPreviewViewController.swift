//
//  ARPreviewViewController.swift
//  AbraTeCodigo
//
//  Created by Ailton Vieira Pinto Filho on 24/10/20.
//

import UIKit
import QuickLook
import ARKit

class ARPreviewViewController: QLPreviewController {
    
    let dataContainer = UIView()
    
    let objects: [String] = [
        "6368",
        "136997",
        "137140",
        "137201",
        "137214",
        "137253",
        "137272",
    ]
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        
        setupDataContainer()
    }
    
    func setupDataContainer() {
        
        dataContainer.backgroundColor = .tertiarySystemBackground
        dataContainer.layer.cornerRadius = 20
        view.addSubview(dataContainer)
        dataContainer.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dataContainer.heightAnchor.constraint(equalToConstant: 100),
            dataContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dataContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dataContainer.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20),
        ])
        
        let previousButton = UIButton()
        previousButton.setTitle("Anterior", for: .normal)
        previousButton.addAction(UIAction { _ in
            self.index -= 1
            self.reloadData()
        }, for: .touchUpInside)
        dataContainer.addSubview(previousButton)
        
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            previousButton.centerYAnchor.constraint(equalTo: dataContainer.centerYAnchor),
            previousButton.leadingAnchor.constraint(equalTo: dataContainer.leadingAnchor, constant: 20)
        ])
        
        let nextButton = UIButton()
        nextButton.setTitle("Próximo", for: .normal)
        nextButton.addAction(UIAction { _ in
            self.index += 1
            self.reloadData()
        }, for: .touchUpInside)
        dataContainer.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.centerYAnchor.constraint(equalTo: dataContainer.centerYAnchor),
            nextButton.trailingAnchor.constraint(equalTo: dataContainer.trailingAnchor, constant: -20)
        ])
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        view.subviews[0].subviews[2].removeFromSuperview()
        print("update constraints")
    }
}

extension ARPreviewViewController: QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int { 1 }

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let object: String
        if self.index >= 0 && self.index < objects.count {
            object = objects[self.index]
        } else {
            self.index = 0
            object = "coin"
        }
        print("index \(index)")
        guard let path = Bundle.main.path(forResource: object, ofType: "usdz") else { fatalError("Couldn't find the supported input file.") }
        let url = URL(fileURLWithPath: path)
        let item = ARQuickLookPreviewItem(fileAt: url)
        return item
    }
}

extension ARPreviewViewController: QLPreviewControllerDelegate {
    func previewControllerWillDismiss(_ controller: QLPreviewController) {
        print("dismiss")
    }
}
