//
//  PromoSectionView.swift
//  Restaurant
//
//  Created by Иван Пономарев on 25.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class PromoSectionView: UIView {

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

    //MARK: - Setup constraint

    private func setupUI() {
        addSubview(sectionImage)
        addSubview(sectionLabel)
        sectionLabel.snp.makeConstraints { make in
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
            make.bottom.equalTo(snp.bottom)
            make.height.equalTo(15)
        }
        sectionImage.snp.makeConstraints { make in
            make.top.equalTo(snp.top)
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
        }
    }
}
