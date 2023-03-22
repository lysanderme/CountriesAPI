//
//  ContentView.swift
//  CountriesAPI
//
//  Created by Myrddin-Evans, Lysander (JD) on 22/03/2023.
//

import SwiftUI

struct ContentView: View {
    let adaptor = CountriesAdaptor()
    
    @State private var nameOfCountry: String = ""
    
    var body: some View {
        Text("Country: \(nameOfCountry)")
            .onAppear {
                adaptor.getNames(target: "names", completion: { countries in
                    if let countries = countries {
                        nameOfCountry = countries.first?.name ?? "No countries found"
                    }
                })
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
