//
//  DiscountProductCollectionView.swift
//  Restaurant
//
//  Created by Иван Пономарев on 26.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class DiscountProductCollectionView: UICollectionView {
    private var cellArray = [DiscountProductModel]()

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        setupDiscountProductCollectionView()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func strikethroughText(text: String) -> NSMutableAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: text)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        return attributeString
    }

    private func setupDiscountProductCollectionView() {
        register(DiscountProductCell.self, forCellWithReuseIdentifier: DiscountProductCell.identyfier)
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        delegate = self
        dataSource = self
    }

    func set(cell: [DiscountProductModel]) {
        self.cellArray = cell
    }
}

//MARK: - UICollectionViewDelegate

extension DiscountProductCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped discount product")
    }
}

//MARK: - UICollectionViewDataSource

extension DiscountProductCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DiscountProductCell.identyfier,
            for: indexPath
        ) as? DiscountProductCell else {
            return UICollectionViewCell()
        }
        cell.titleLabel.text = cellArray[indexPath.row].titleLabel
        cell.discountLabel.text = cellArray[indexPath.row].discount
        cell.priceLabel.text = cellArray[indexPath.row].price
        cell.oldPriceLabel.attributedText = strikethroughText(text: cellArray[indexPath.row].oldPrice ?? "")
        cell.discountImage.image = cellArray[indexPath.row].image
        return cell
    }
}

//MARK: - UICollectionViewDataSource

extension DiscountProductCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 102 , height: collectionView.frame.height)
    }
}
