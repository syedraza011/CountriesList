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
    case decodingError
    
    
}

class CountryService{
    
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
            throw APIError.decodingError
        }
    }
}
