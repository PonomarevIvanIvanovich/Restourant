//
//  ExstensionString.swift
//  Resturant
//
//  Created by Иван Пономарев on 12.12.2023.
//

import Foundation
import Alamofire

extension String: ParameterEncoding {
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
}
