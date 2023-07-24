//
//  CountryResponse.swift
//  CounriesList
//
//  Created by Syed Raza on 7/22/23.
//

import Foundation

struct CountryResponse: Decodable,Identifiable,Hashable {
  let id = UUID()
    let name: String
    let region:String
    let code: String
    let capital:String
}
//struct Countries: Decodable, Hashable {
//    var countries: [CountryResponse]
//}

