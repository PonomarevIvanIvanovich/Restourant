//
//  ExstrnsionCatalogCollectionView.swift
//  Resturant
//
//  Created by Иван Пономарев on 12.12.2023.
//

import Foundation

extension NSObject {
    func smSearch(text: String, action: Selector, afterDelay: Double = 0.3) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        perform(action, with: text, afterDelay: afterDelay)
    }
}
