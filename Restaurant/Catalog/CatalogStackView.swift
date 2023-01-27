//
//  CatalogCollectionView.swift
//  Restaurant
//
//  Created by Иван Пономарев on 27.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class CatalogStackView: UIStackView {

    let view = CatalogView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
        setupUI()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupScrollView() {
        axis = .vertical
        alignment = .fill
        distribution = .fill
        spacing = 10
    }

    private func setupUI() {
        backgroundColor = .lightGray
        addSubview(view)
        view.snp.makeConstraints { make in
            make.width.equalTo(108)
            make.height.equalTo(135)
        }

        addSubview(view)
        view.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(120)
        }
    }
}
