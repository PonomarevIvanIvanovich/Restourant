//
//  ViewController.swift
//  Restaurant
//
//  Created by Иван Пономарев on 24.01.2023.
//

import UIKit
import SnapKit

final class MainScreenViewControler: UIViewController, UISearchBarDelegate {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = ColorManager.accentColor
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = ColorManager.accentColor
        contentView.frame.size = contentSize
        return contentView
    }()

    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 400)
    }

    private let leftMenuButton: UIButton = {
        let leftMenuButton = UIButton()
        leftMenuButton.setImage(UIImage(named: "leftMenu"), for: .normal)
        leftMenuButton.sizeToFit()
        return leftMenuButton
    }()

    private let deliveryLabel: UILabel = {
        let deliveryLabel = UILabel()
        deliveryLabel.textColor = ColorManager.greyText
        deliveryLabel.text = "Доставка"
        deliveryLabel.font = FontManager.sfRegular12
        return deliveryLabel
    }()

    private let adressLabel: UILabel = {
        let adressButton = UILabel()
        adressButton.text = "Пискунова,24"
        adressButton.font = FontManager.sfRegular16
        return adressButton
    }()

    private let searchAdressButton: UIButton = {
        let dropMenuButton = UIButton()
        dropMenuButton.setImage(UIImage(named: "down"), for: .normal)
        dropMenuButton.sizeToFit()
        return dropMenuButton
    }()

    lazy var searchBar:UISearchBar = UISearchBar()

    private let hearhButton: UIButton = {
        let hearhButton = UIButton()
        hearhButton.layer.cornerRadius = 15
        hearhButton.backgroundColor = ColorManager.accentBackground
        hearhButton.setImage(UIImage(named: "love"), for: .normal)
        return hearhButton
    }()

    private let promoSectionCollectionView = PromoSectionCollectionView()
    private let promoBannerCollection = PromoBannerCollection()

    private let discountLabel: UILabel = {
        let discountLabel = UILabel()
        discountLabel.text = "Акции"
        discountLabel.font = FontManager.sfRegular20
        return discountLabel
    }()

    private let lookButton: UIButton = {
        let lookButton = UIButton()
        lookButton.titleLabel?.font =  FontManager.sfRegular12
        lookButton.setTitle("Смотреть все >", for: .normal)
        lookButton.setTitleColor(.black, for: .normal)
        lookButton.layer.cornerRadius = 15
        lookButton.backgroundColor = ColorManager.accentBackground
        return lookButton
    }()

    private let discountProductCollectionView = DiscountProductCollectionView()

    private let catalogLabel: UILabel = {
        let catalogLabel = UILabel()
        catalogLabel.text = "Каталог"
        catalogLabel.font = FontManager.sfRegular20
        return catalogLabel
    }()

    private let catalogStackView = CatalogStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSearchBar()
        setupTargetButton()
        appendPromoSection()
    }

// MARK: - Setup action

    private func setupTargetButton() {
        searchAdressButton.addTarget(self, action: #selector(tappedSearchAdressButton), for: .touchUpInside)
        leftMenuButton.addTarget(self, action: #selector(tappedLeftMenuButton), for: .touchUpInside)
    }

    @objc func tappedSearchAdressButton() {
        let searchAdressVC = SearchAdressBottomSheet()
        if let sheet = searchAdressVC.sheetPresentationController {
            sheet.prefersGrabberVisible = true
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            sheet.detents = [.large()]
        }
        present(searchAdressVC, animated: true)
    }

    @objc func tappedLeftMenuButton() {

    }

    private func setupSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = "Поик товаров"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.showsScopeBar = true
        searchBar.barTintColor = ColorManager.accentBackground
        searchBar.delegate = self
    }

    @objc func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {

    }

    private func appendPromoSection() {
        promoSectionCollectionView.set(cell: PromoSectionModel.fatchPromo())
        promoBannerCollection.set(cell: PromoBannerModel.fatchPromo())
        discountProductCollectionView.set(cell: DiscountProductModel.fatchPromo())
    }

// MARK: - Setup constraints

    private func setupUI() {
        view.backgroundColor = ColorManager.accentColor
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(leftMenuButton)
        leftMenuButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(11)
            make.height.width.equalTo(25)
        }

        contentView.addSubview(deliveryLabel)
        deliveryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().inset(65)
            make.height.equalTo(20)
            make.width.equalTo(85)
        }

        contentView.addSubview(adressLabel)
        adressLabel.snp.makeConstraints { make in
            make.top.equalTo(deliveryLabel.snp.bottom)
            make.left.equalToSuperview().inset(65)
            make.height.equalTo(20)
            make.width.equalTo(102)
        }

        contentView.addSubview(searchAdressButton)
        searchAdressButton.snp.makeConstraints { make in
            make.centerY.equalTo(adressLabel.snp.centerY)
            make.left.equalTo(adressLabel.snp.right).inset(-6)
            make.height.equalTo(10)
            make.width.equalTo(12)
        }

        contentView.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(adressLabel.snp.bottom).inset(-16)
            make.height.equalTo(35)
            make.right.equalToSuperview().inset(55)
            make.left.equalToSuperview().inset(15)
        }

        contentView.addSubview(hearhButton)
        hearhButton.snp.makeConstraints { make in
            make.centerY.equalTo(searchBar.snp.centerY)
            make.height.width.equalTo(30)
            make.left.equalTo(searchBar.snp.right)
        }

        contentView.addSubview(promoSectionCollectionView)
        promoSectionCollectionView.backgroundColor = ColorManager.accentColor
        promoSectionCollectionView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(15)
            make.right.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom).inset(-20)
            make.height.equalTo(80)
        }
        contentView.addSubview(promoBannerCollection)
        promoBannerCollection.backgroundColor = ColorManager.accentColor
        promoBannerCollection.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(15)
            make.right.equalToSuperview()
            make.top.equalTo(promoSectionCollectionView.snp.bottom).inset(-20)
            make.height.equalTo(110)
        }

        contentView.addSubview(discountLabel)
        discountLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(15)
            make.top.equalTo(promoBannerCollection.snp.bottom).inset(-20)
            make.height.equalTo(20)
            make.width.equalTo(70)
        }

        contentView.addSubview(lookButton)
        lookButton.snp.makeConstraints { make in
            make.centerY.equalTo(discountLabel.snp.centerY)
            make.right.equalToSuperview().inset(15)
            make.height.equalTo(25)
            make.width.equalTo(103)
        }

        contentView.addSubview(discountProductCollectionView)
        discountProductCollectionView.backgroundColor = ColorManager.accentColor
        discountProductCollectionView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(15)
            make.right.equalToSuperview()
            make.top.equalTo(discountLabel.snp.bottom).inset(-20)
            make.height.equalTo(208)
        }

        contentView.addSubview(catalogLabel)
        catalogLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(15)
            make.top.equalTo(discountProductCollectionView.snp.bottom).inset(-20)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }

        contentView.addSubview(catalogStackView)
        catalogStackView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview().inset(15)
            make.top.equalTo(catalogLabel.snp.bottom).inset(-20)
        }
    }
}

