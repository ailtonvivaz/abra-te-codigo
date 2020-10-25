//
//  ViewController.swift
//  AbraTeCodigo
//
//  Created by Ailton Vieira Pinto Filho on 24/10/20.
//

import UIKit

class CategoryHeader: UICollectionReusableView {

    let textLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        textLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        textLabel.textColor = UIColor(named: "darkText") ?? .gray
        
        textLabel.text = "Categoria"
        addSubview(textLabel)
    }

    func configure(text: String, hidden: Bool) {
        textLabel.isHidden = hidden
        textLabel.text = text
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.frame = bounds
    }
}

private let categoryHeader = "headerCategory"

class HomeViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!

    var instituicoes: [Instituicao] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            let vc = ARPreviewViewController.loadFromNib()
//            self.present(vc, animated: true, completion: nil)
//        }

        instituicoes = Acervo.shared.instituicoes

        setupCollectionLayout()

        collectionView.register(UINib(nibName: "\(ExposicaoViewCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(ExposicaoViewCell.self)")

        collectionView.register(CategoryHeader.self, forSupplementaryViewOfKind: categoryHeader, withReuseIdentifier: "\(CategoryHeader.self)")

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    fileprivate func setupCollectionLayout() {
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in

            let section : NSCollectionLayoutSection

            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 20
                item.contentInsets.bottom = 20

                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.7), heightDimension: .fractionalHeight(0.32)), subitems: [item])
                group.contentInsets.leading = 0
                group.contentInsets.top = 0
                group.contentInsets.trailing = 0

                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous

                section.contentInsets.leading = 24
                section.contentInsets.trailing = 4

            } else if sectionNumber == 1 {

                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalWidth(1/3)))
                item.contentInsets.trailing = 24
                item.contentInsets.bottom = 20

                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300)), subitems: [item])

                group.contentInsets.top = 20
                group.contentInsets.leading = 0
                group.contentInsets.trailing = 0

                section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .gro
                section.contentInsets.leading = 24
                section.contentInsets.trailing = 0
            } else {

                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(120)))
                item.contentInsets.bottom = 16
                item.contentInsets.trailing = 0

                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200)), subitems: [item])

                group.contentInsets.top = 20
                group.contentInsets.leading = 0
                group.contentInsets.trailing = 0

                group.interItemSpacing = .none

                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .none
                section.contentInsets = .zero

                section.contentInsets.leading = 24
                section.contentInsets.trailing = 24
            }

            if sectionNumber > 0 {
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(40)), elementKind: categoryHeader, alignment: .topLeading)

                header.contentInsets.bottom = 20

                section.boundarySupplementaryItems = [
                    header
                ]
            }

            return section
        }

        collectionView.setCollectionViewLayout(layout, animated: false)
    }

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? 3 : section == 1 ? instituicoes.count : 5
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ExposicaoViewCell.self)", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "\(CategoryHeader.self)", for: indexPath)

        let texto = indexPath.section == 1 ? "Acervos e Instituições" : "Categorias"

        if let header = header as? CategoryHeader {
            header.configure(text: texto, hidden: indexPath.section == 0)
        }
        return header
    }
}
