//
//  ViewController.swift
//  Restaurant
//
//  Created by Иван Пономарев on 24.01.2023.
//

import UIKit
import SnapKit

final class MainScreen: UIViewController, UISearchBarDelegate {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
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
        deliveryLabel.textColor = UIColor(red: 0.443, green: 0.443, blue: 0.443, alpha: 1)
        deliveryLabel.text = "Доставка"
        deliveryLabel.font = UIFont(name: "SFProDisplay-Regular", size: 12)
        return deliveryLabel
    }()

    private let adressLabel: UILabel = {
        let adressButton = UILabel()
        adressButton.text = "Пискунова,24"
        adressButton.font = UIFont(name: "SFProDisplay-Regular", size: 16)
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
        hearhButton.backgroundColor = UIColor(red: 0.957, green: 0.957, blue: 0.957, alpha: 1)
        hearhButton.setImage(UIImage(named: "imageHeartBlack"), for: .normal)
        return hearhButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSearchBar()
        setupTargetButton()
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
        searchBar.barTintColor = UIColor(red: 0.957, green: 0.957, blue: 0.957, alpha: 1)
        searchBar.delegate = self
    }

    @objc func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {

    }

// MARK: - Setup constraints

    private func setupUI() {
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
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
    }
}

