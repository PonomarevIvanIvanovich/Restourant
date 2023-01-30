//
//  SearchAdressCell.swift
//  Restaurant
//
//  Created by Иван Пономарев on 25.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class SearchArdessCell: UITableViewCell {
    static let identifier = "SearchArdessCell"

    var modelAddres: DataClass?

    private let pinImage: UIImageView = {
        let pinImage = UIImageView()
        pinImage.image = UIImage(named: "pin")
        return pinImage
    }()

    let streetlabel: UILabel = {
        let streetlabel = UILabel()
        streetlabel.font = FontManager.sfRegular16
        return streetlabel
    }()

    let citylabel: UILabel = {
        let citylabel = UILabel()
        citylabel.textColor = .lightGray
        citylabel.font = FontManager.sfRegular14
        return citylabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareForReuse()
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    private func addressChoice() {
//        guard let modelAddres = modelAddres else { return }
//        if modelAddres.street != nil && modelAddres.street != "" {
//            citylabel.text = modelAddres.city
//            streetlabel.text = modelAddres.street
//            if modelAddres.city != "" {
//                streetlabel.text = modelAddres.city
//            }
//        }
//
//    }

    private func setupUI() {
        contentView.addSubview(pinImage)
        pinImage.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(20)
        }

        contentView.addSubview(streetlabel)
        streetlabel.snp.makeConstraints { make in
            make.left.equalTo(pinImage.snp.right).inset(-8)
            make.top.equalToSuperview().inset(5)
            make.bottom.equalTo(contentView.snp.centerY)
            make.right.equalToSuperview().inset(-20)
        }

        contentView.addSubview(citylabel)
        citylabel.snp.makeConstraints { make in
            make.left.equalTo(pinImage.snp.right).inset(-8)
            make.top.equalTo(streetlabel.snp.bottom)
            make.height.equalTo(20)
            make.right.equalToSuperview().inset(-20)
        }
    }
}
