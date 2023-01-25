//
//  PromoSectionCell.swift
//  Restaurant
//
//  Created by Иван Пономарев on 25.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class PromoSectionCell: UICollectionViewCell {
    static let identyfier = "PromoSectionCell"

    private let sectionImage: UIImageView = {
        let sectionImage = UIImageView()
        return sectionImage
    }()

    private let sectionLabel: UILabel = {
        let sectionLabel = UILabel()
        return sectionLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(sectionImage)
        contentView.addSubview(sectionLabel)
        sectionLabel.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(15)
        }
        sectionImage.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }
    }
}
