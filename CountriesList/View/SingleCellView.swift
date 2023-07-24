//
//  SingleCellView.swift
//  CountriesList
//
//  Created by Syed Raza on 7/24/23.
//

import SwiftUI

//struct SingleCellView: View {
//    let countries: [CountryResponse]
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                ForEach(countries, id: \.self) { individualCountry in
//                    VStack { // Place the stock.name here to make it topmost
//                        Text(individualCountry.name) // Stock name displayed at the top
//                            .font(.system(size: 20))
//                            .foregroundColor(.white)
//                            .bold()
//                        
////                        Text("\(individualCountry.flag)")
////                            .font(.system(size: 25))
////                            .bold()
////                            .foregroundColor(.white)
////                            .padding(.bottom, 5)
//                        
//                        Text(individualCountry.capital)
//                            .font(.subheadline)
//                            .foregroundColor(.white)
//                            .padding(.horizontal)
//                            .bold()
////                        
////                        Text(individualCountry.capital)
////                            .font(.subheadline)
////                            .foregroundColor(.white)
////                            .padding(.horizontal)
////                            .bold()
//
//                       }
//                    .frame(width: 390, height: 420)
//                    .background(Color.blue)
//                    .cornerRadius(16)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 16)
//                            .stroke(Color.white, lineWidth: 3)
//                    )
//                    .padding(.vertical, 2)
//                }
//            }
//            .navigationBarTitle("New York Stocks")
//        }
//    }
//    }
//
//
//
//
//struct SingleCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        let mockData = CountryResponse(
//            capital: "Kabul",
//            code: "AF",
//            currency: CountryResponse.Currency(code: "AFN", name: "Afghan afghani", symbol: "؋"),
//            flag: "https://restcountries.eu/data/afg.svg",
//            language: CountryResponse.Language(code: "ps", name: "Pashto"),
//            name: "Afghanistan",
//            region: "AS"
//        )
//        
//        SingleCellView(countries: [mockData])
//    }
//}

