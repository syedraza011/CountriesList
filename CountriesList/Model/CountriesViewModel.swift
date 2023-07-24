//
//  CountriesViewModel.swift
//  CounriesList
//
//  Created by Syed Raza on 7/22/23.
//

import Foundation

@MainActor class CountriesViewModel: ObservableObject {
    @Published var countries = [CountryResponse]() // Use an array for countries
    let service: CountriesServiceProtocol

    init(service: CountriesServiceProtocol = CountryService()) {
        self.service = service
    }

    func getCountries() {
        Task {
            do {
                let allCountries = try await self.service.fetchCountries()
//                DispatchQueue.main.async {
                    self.countries = allCountries
//                }
               
            } catch {
                print(error)
            }
        }
    }
}
