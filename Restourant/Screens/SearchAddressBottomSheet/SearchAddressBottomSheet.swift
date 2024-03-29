//
//  SearchAddressBottomSheet.swift
//  Restourant
//
//  Created by Иван Пономарев on 25.01.2023.
//

import Foundation
import UIKit
import SnapKit

final class SearchAddressBottomSheet: UIViewController {
    private let defaults = UserDefaults.standard
    private var networkDataFetch: NetworkDataFetcherLogic?
    private var addressArray = [DataClass]()


    private let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    var clouse: ((String) -> ())?

    lazy var searchBar:UISearchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSearchBar()
        setupTableView()
        searchBar.text = defaults.string(forKey: "cityKey")
        postRequest(searchText: searchBar.text ?? "")
    }

    deinit{
        print("deinit searchBottomSheet")
    }

    private func postRequest(searchText: String) {
        networkDataFetch = NetworkDataFetcher()
        networkDataFetch?.fetchAddres(searchTerm: searchText) { result in
            guard let result = result else { return }
            let arrayModels = result.suggestions.map({$0.data})
            self.addressArray = arrayModels.filter{ i in i.street_with_type != nil}
            self.tableView.reloadData()
        }
    }

    private func setupTableView() {
        tableView.rowHeight = 50
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchAddressCell.self, forCellReuseIdentifier: SearchAddressCell.identifier)
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
        view.backgroundColor = .white
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

extension SearchAddressBottomSheet: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        addressArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SearchAddressCell.identifier,
            for: indexPath
        ) as? SearchAddressCell else {
            return UITableViewCell()
        }
        cell.configurCell(model: addressArray[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let streetString = addressArray[indexPath.row].street_with_type ?? ""
        let houseString = addressArray[indexPath.row].house ?? ""
        let address = streetString + " " + houseString
        let city = addressArray[indexPath.row].city ?? ""
        if addressArray[indexPath.row].house != nil {
            defaults.set(city, forKey: "citiKey")
            clouse?(address)
            dismiss(animated: true)
        } else {
            searchBar.text = city + " " + address + " "
            postRequest(searchText:city + " " + address + " ")
        }
    }
}

extension SearchAddressBottomSheet: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        smSearch(text: searchText, action: #selector(delaySearch(with:)), afterDelay: 0.3)
    }

    @objc func delaySearch(with: String) {
        self.postRequest(searchText: with)
    }
}
