//
//  ContentView.swift
//  CountriesList
//
//  Created by Syed Raza on 7/22/23.
//
import SwiftUI
struct ContentView: View {
    @ObservedObject var viewModel = CountriesViewModel()

    var body: some View {
        VStack {
            List(viewModel.countries, id: \.id) { country in
                Text(country.name) // Access the name property of the language struct
                    .foregroundColor(.black)
            }
        }
        .onAppear {
      
            viewModel.getCountries()
           
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
