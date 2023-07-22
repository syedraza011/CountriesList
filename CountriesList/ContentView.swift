//
//  ContentView.swift
//  CountriesList
//
//  Created by Syed Raza on 7/22/23.
//

import SwiftUI


//struct ContentView: View {
//    @StateObject var viewModel = CountriesViewModel()
//
//    var body: some View {
//
//        ForEach(viewModel.countries,id: \.self) { country in
//            Text(country.name)
//                .foregroundColor(.black)
//        }
//
//
//    }
//        .onAppear {
//            viewModel.getCountries()
//        }
//}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CountriesViewModel()

    var body: some View {
        VStack {
            if viewModel.countries.isEmpty {
                Text("Loading countries...")
                    .foregroundColor(.black)
            } else {
                List(viewModel.countries) { country in
                    Text(country.name)
                        .foregroundColor(.black)
                }
            }
        }
        .padding()
        .task {
            await viewModel.getCountries()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
