//
//  NetworkService.swift
//  Restaurant
//
//  Created by Иван Пономарев on 28.01.2023.
//

import Foundation
import Alamofire

final class QueryCreator {

    func createRequest(search: String, completion: @escaping(Data?, Error?) -> Void){
        guard let url = createURL() else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = """
                           {"query" : "\(search)"}
                           """
                           .data(using: .utf8)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("Token " + "be1cdfdbf5849ff688fae0aa87e776cd3fdc45d3", forHTTPHeaderField: "Authorization")
        let session = URLSession.shared
        session.dataTask(with: request){data,response,error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }.resume()
    }

    private func createURL() -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "suggestions.dadata.ru"
        components.path = "/suggestions/api/4_1/rs/suggest/address"
        guard let componentsURL = components.url else { return nil }
        return componentsURL
    }
}
