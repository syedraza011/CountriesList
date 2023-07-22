//
//  ContentView.swift
//  CountriesList
//
//  Created by Syed Raza on 7/22/23.
//

import SwiftUI


struct ContentView: View {
    @StateObject var viewModel = CountriesViewModel()
    
    var body: some View {
       
            ForEach(viewModel.countries,id: \.self) { country in
                Text(country.name)
                    .foregroundColor(.black)
            }
 
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
