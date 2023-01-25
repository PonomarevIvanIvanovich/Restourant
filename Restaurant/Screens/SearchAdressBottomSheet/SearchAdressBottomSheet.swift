//
//  SearchAdressViewController.swift
//  Restaurant
//
//  Created by Иван Пономарев on 25.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class SearchAdressBottomSheet: UIViewController, UISearchBarDelegate {
    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    lazy var searchBar:UISearchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupSearchBar()
        setupTableView()
    }

    private func setupTableView() {
        tableView.rowHeight = 50
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchArdessCell.self, forCellReuseIdentifier: SearchArdessCell.identifier)
    }

    private func setupSearchBar() {
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = "Введите адрес"
        searchBar.delegate = self
    }

    private func setupUI() {
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
        }

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }
    }
}

extension SearchAdressBottomSheet: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        50
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchArdessCell.identifier,
            for: indexPath
        ) as? SearchArdessCell else {
            return UITableViewCell()
        }
        return cell
    }
}
