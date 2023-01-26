//
//  PromoSectionCollectionView.swift
//  Restaurant
//
//  Created by Иван Пономарев on 25.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class PromoSectionCollectionView: UICollectionView {
    var cell = [PromoSectionModel]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        setupPromoCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupPromoCollectionView() {
        backgroundColor = #colorLiteral(red: 0.9589126706, green: 0.9690223336, blue: 0.9815708995, alpha: 1)
        register(PromoSectionCell.self, forCellWithReuseIdentifier: PromoSectionCell.identyfier)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        delegate = self
        dataSource = self
    }

    func set(cell: [PromoSectionModel]) {
        self.cell = cell
    }
}
//MARK: - UICollectionViewDelegate

extension PromoSectionCollectionView: UICollectionViewDelegate {

}

//MARK: - UICollectionViewDataSource

extension PromoSectionCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cell.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PromoSectionCell.identyfier,
            for: indexPath
        ) as? PromoSectionCell else {
            return UICollectionViewCell()
        }
        cell.sectionLabel.text = self.cell[indexPath.row].name
        cell.sectionImage.image = self.cell[indexPath.row].mainImage
        return cell
    }
}

//MARK: - UICollectionViewDataSource

extension PromoSectionCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: collectionView.frame.height)
    }
}
