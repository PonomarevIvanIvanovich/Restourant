//
//  File.swift
//  Restaurant
//
//  Created by Иван Пономарев on 28.01.2023.
//

import Foundation

final class NetworkDataFetcher {
    private var queryCreator = QueryCreator()

    func fetchAddres(searchTerm: String, complition: @escaping(Addres?) -> ()) {
        queryCreator.createRequest(search: searchTerm, completion: { data, error in
            if let error = error {
                print("Error received request data: \(error.localizedDescription)")
                complition(nil)
            }
            let decode = self.decodeJSONE(type: Addres.self, from: data)
            complition(decode)
        })
    }

    private func decodeJSONE<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let object = try decoder.decode(type.self, from: data)
            return object
        } catch let jsoneError {
            print("Failed to decode JSONE", jsoneError)
            return nil
        }
    }
}
