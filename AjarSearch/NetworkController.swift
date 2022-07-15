//
//  NetworkController.swift
//  AjarSearch
//
//  Created by yousef zuriqi on 5/2/20.
//  Copyright © 2020 yousef zuriqi. All rights reserved.
//

import Foundation
import SwiftSoup
import SwiftUI

class NetworkController {
    
    static var shared = NetworkController()
    
    var apartments: [Apartment] = []
    var apartmentDetail: Apartment?
    var cities = [String]()
    
    private init() {}
    
    
    // Load the URL from AWS Lamda.
    // Decoded the data to Apartment struct.
   
    func loadApartments() async  -> [Apartment]? {
        do {
            guard let url = URL(string: "https://newajarsearch-vapor-api.herokuapp.com/apartments")
            else {return nil}
            
                let (data, _) = try await  URLSession.shared.data(from: url)
                let apartments = try JSONDecoder().decode([Apartment].self, from: data)
                return apartments
               
            
        } catch {
            print("❌ Error loading data: \(error)")
            return nil
        }
    }
}
