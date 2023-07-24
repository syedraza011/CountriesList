//
//  CountryService.swift
//  CounriesList
//
//  Created by Syed Raza on 7/22/23.
//

import Foundation
enum APIError: Error {
    case invalidUrl
    case invalidResponse
    case emptyData
    case serviceUnavailable
    case decodingError
    
    var description: String {
        switch self {
        case .invalidUrl:
            return "invalid url"
        case .invalidResponse:
            return "invalid response"
        case .emptyData:
            return "empty data"
        case .serviceUnavailable:
            return "service unavailable"
        case .decodingError:
            return "decoding error"
        }
    }
}

 protocol CountriesServiceProtocol {
     func fetchCountries () async throws -> [CountryResponse]
 }

class CountryService: CountriesServiceProtocol{
   
    
    let urlString = "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
    
    func fetchCountries () async throws -> [CountryResponse] {
        guard let url = URL (string: urlString) else {
            throw APIError.invalidUrl
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        guard let resp = response as? HTTPURLResponse, resp.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        do {
            return try JSONDecoder().decode([CountryResponse].self, from: data)
        } catch {
            print(error)
            throw APIError.decodingError
        }
    }
}
