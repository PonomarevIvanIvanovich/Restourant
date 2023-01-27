//
//  CatalogCell.swift
//  Restaurant
//
//  Created by Иван Пономарев on 27.01.2023.
//

import Foundation
import UIKit

final class CatalogView: UIView {

    let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "catalog6")
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        layer.cornerRadius = 15
        backgroundColor = UIColor(red: 1, green: 0.882, blue: 0.678, alpha: 1)
        addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.equalTo(80)
        }
    }

}
