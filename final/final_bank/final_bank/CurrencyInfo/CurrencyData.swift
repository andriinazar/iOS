//
//  CurrencyData.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/9/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import Foundation

class CurrencyData: Codable {
    let sourceID: String?
    let date: Date?
    let organizations: [Organization]?
    let orgTypes: [String: String]?
    let currencies: [String: String]?
    let regions: [String: String]?
    let cities: [String: String]?
    
    enum CodingKeys: String, CodingKey {
        case sourceID = "sourceId"
        case date, organizations, orgTypes, currencies, regions, cities
    }
    
    init(sourceID: String?, date: Date?, organizations: [Organization]?, orgTypes: [String: String]?, currencies: [String: String]?, regions: [String: String]?, cities: [String: String]?) {
        self.sourceID = sourceID
        self.date = date
        self.organizations = organizations
        self.orgTypes = orgTypes
        self.currencies = currencies
        self.regions = regions
        self.cities = cities
    }
}

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

// MARK: - URLSession response handlers

extension URLSession {
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
        }
    }
    
    func currencyDataTask(with url: URL, completionHandler: @escaping (CurrencyData?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
}
