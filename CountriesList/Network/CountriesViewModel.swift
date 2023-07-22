//
//  CountriesViewModel.swift
//  CounriesList
//
//  Created by Syed Raza on 7/22/23.
//

import Foundation

class CountriesViewModel: ObservableObject {
    
    @Published var countries = [CountryResponse]()
    let service = CountryService()
    func getCountries () async {
        Task {
            do {
                countries = try await service.fetchCountries()
            }catch{
                print(error)
            }
        }
    }
}
