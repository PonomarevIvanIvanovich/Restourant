//
//  SearchAdressViewController.swift
//  Restaurant
//
//  Created by Иван Пономарев on 25.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class SearchAdressBottomSheet: UIViewController {

    var timer = Timer()

    let networkDataFetcher = NetworkDataFetcher()
    var addresArray = [DataClass]()

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
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = "Введите адрес"
        searchBar.delegate = self
        searchBar.isTranslucent = true
        searchBar.barTintColor = .white
        searchBar.tintColor = .white
    }

    private func setupUI() {
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().inset(20)
        }

        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.left.right.equalToSuperview()
        }
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension SearchAdressBottomSheet: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        addresArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchArdessCell.identifier,
            for: indexPath
        ) as? SearchArdessCell else {
            return UITableViewCell()
        }
        let streeRender = addresArray[indexPath.row].street_with_type ?? ""
        let houseRender = addresArray[indexPath.row].house ?? ""
        cell.citylabel.text = streeRender
        cell.streetlabel.text = streeRender + " " + houseRender
        if cell.streetlabel.text == nil {
            return UITableViewCell()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension SearchAdressBottomSheet: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        networkDataFetcher.fetchAddres(searchTerm: searchText) { result in
            self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { _ in
                guard let result = result else { return }
                self.addresArray = result.suggestions.map({$0.data!})
                self.tableView.reloadData()
            })
        }

    }
}
