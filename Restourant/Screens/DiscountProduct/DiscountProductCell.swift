//
//  DiscountProductCell.swift
//  Restourant
//
//  Created by Иван Пономарев on 26.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class  DiscountProductCell: UICollectionViewCell {
    static let identyfier = " DiscountProductCell"

    let discountImage: UIImageView = {
        let discountImage = UIImageView()
        discountImage.sizeToFit()
        return discountImage
    }()

    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 3
        titleLabel.textAlignment = .left
        titleLabel.font = FontManager.sfRegular11
        return titleLabel
    }()

    let discountLabel: UILabel = {
        let discountLabel = UILabel()
        discountLabel.layer.masksToBounds = true
        discountLabel.textColor = .white
        discountLabel.textAlignment = .center
        discountLabel.font = FontManager.sfRegular10
        discountLabel.text = "25%"
        discountLabel.backgroundColor = ColorManager.backgroundColorElement
        discountLabel.layer.cornerRadius = 8
        return discountLabel
    }()

    let newProductLabel: UILabel = {
        let newProductLabel = UILabel()
        newProductLabel.layer.masksToBounds = true
        newProductLabel.textColor = .white
        newProductLabel.textAlignment = .center
        newProductLabel.font = FontManager.sfRegular10
        newProductLabel.text = "Новинка"
        newProductLabel.backgroundColor = ColorManager.backgroundColorNew
        newProductLabel.layer.cornerRadius = 8
        return newProductLabel
    }()

    let weightLabel: UILabel = {
        let weightLabel = UILabel()
        weightLabel.textColor = ColorManager.greyText
        weightLabel.textAlignment = .center
        weightLabel.font = FontManager.sfRegular10
        weightLabel.text = "230г"
        return weightLabel
    }()

    let oldPriceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.textColor = ColorManager.backgroundColorElement
        priceLabel.font = FontManager.sfRegular12
        priceLabel.text = "360р"
        return priceLabel
    }()

    let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = FontManager.sfPromedium16
        priceLabel.text = "200р"
        return priceLabel
    }()

    private let addProductButton: UIButton = {
        let addProductButton = UIButton()
        addProductButton.setTitleColor(.black, for: .normal)
        addProductButton.titleLabel?.font =  FontManager.sfRegular18
        addProductButton.backgroundColor = ColorManager.addProductColor
        addProductButton.setTitle("+", for: .normal)
        addProductButton.layer.cornerRadius = 15
        addProductButton.contentVerticalAlignment = .bottom
        return addProductButton
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func strikethroughText(text: String) -> NSMutableAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: text)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        return attributeString
    }

    func configCell(model: DiscountProductModel) {
        titleLabel.text = model.titleLabel
        discountLabel.text = model.discount
        priceLabel.text = model.price
        oldPriceLabel.attributedText = strikethroughText(text: model.oldPrice ?? "")
        discountImage.image = model.image
    }

    private func setupUI() {
        layer.cornerRadius = 15
        backgroundColor = ColorManager.accentBackground
        contentView.addSubview(discountImage)
        discountImage.image = UIImage(named: "discount1")
        discountImage.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview().inset(5)
            make.height.equalTo(92)
        }

        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(discountImage.snp.bottom)
            make.left.right.equalToSuperview().inset(4)
            make.height.equalTo(45)
        }

        contentView.addSubview(discountLabel)
        discountLabel.snp.makeConstraints { make in
            make.top.left.equalToSuperview().inset(5)
            make.width.equalTo(38)
            make.height.equalTo(15)
        }

        contentView.addSubview(newProductLabel)
        newProductLabel.snp.makeConstraints { make in
            make.top.right.equalToSuperview().inset(5)
            make.left.equalTo(discountLabel.snp.right).inset(-5)
            make.height.equalTo(15)
        }

        contentView.addSubview(weightLabel)
        weightLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalToSuperview().inset(5)
            make.height.equalTo(15)
            make.width.equalTo(30)
        }

        contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(5)
            make.left.equalToSuperview().inset(5)
            make.height.equalTo(16)
            make.width.equalTo(60)
        }

        contentView.addSubview(oldPriceLabel)
        oldPriceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(priceLabel.snp.top)
            make.left.equalToSuperview().inset(5)
            make.height.equalTo(20)
            make.width.equalTo(37)
        }

        contentView.addSubview(addProductButton)
        addProductButton.snp.makeConstraints { make in
            make.bottom.right.equalToSuperview().inset(5)
            make.height.width.equalTo(30)
        }
    }
}


