//
//  CountriesAdaptor.swift
//  CountriesAPI
//
//  Created by Myrddin-Evans, Lysander (JD) on 22/03/2023.
//

import Foundation

class CountriesAdaptor {
    let baseUrl = "https://restcountries.com/v3.1/all?fields=name,"
    
    func getNames(target: String, completion: @escaping ([Country]?) -> Void) {
        guard let url = URL(string: self.baseUrl + ("\(target)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? baseUrl + "names"))
        else {
            print("Invalid URL")
            completion(nil)
            return
        }
        let request = URLRequest(url: url)
        print(request)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    completion(response.results)
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }
    
    func parseJson(json: Data) -> CountryResponse? {
        let decoder = JSONDecoder()
        
        if let countryResponse = try? decoder.decode(CountryResponse.self, from: json) {
            return countryResponse
        } else {
            print("Error decoding JSON")
            return nil
        }
    }
    
}
