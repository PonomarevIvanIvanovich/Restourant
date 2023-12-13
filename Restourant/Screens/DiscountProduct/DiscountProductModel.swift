//
//  DiscountProductModel.swift
//  Restourant
//
//  Created by Иван Пономарев on 26.01.2023.
//

import Foundation
import UIKit

struct DiscountProductModel {
    var image: UIImage?
    var discount: String?
    var titleLabel: String?
    var weight: String?
    var oldPrice: String?
    var price: String?

    static func fetchPromo() -> [DiscountProductModel] {
        let firstItem = DiscountProductModel(image: UIImage(named: "discount1"),
                                             discount: "35%",
                                             titleLabel: "Черные спагетти с морепродуктами (большая порция)",
                                             weight: "230г",
                                             oldPrice: "360р",
                                             price: "200р")
        let secondItem = DiscountProductModel(image: UIImage(named: "discount2"),
                                             discount: "25%",
                                             titleLabel: "Казаречче с индейкой и томатами",
                                             weight: "230г",
                                             oldPrice: "360р",
                                             price: "200р")
        let thirdItem = DiscountProductModel(image: UIImage(named: "discount3"),
                                             discount: "25%",
                                             titleLabel: "Равиолли с грибами",
                                             weight: "230г",
                                             oldPrice: "1360р",
                                             price: "1200р")
        return [firstItem, secondItem, thirdItem,firstItem, secondItem, thirdItem, firstItem ]
    }
}
