//
//  ApartmentsManager.swift
//  SwiftSoupTest
//
//  Created by Yousef Zuriqi on 21/12/2021.
//

import SwiftUI

class ApartmentsManager: ObservableObject {
    @Published var apartments: [ApartmentDetail] = []
    @Published var location = "All"
    @Published var noOfRooms = "All"
    
    // Array of Apartments which is filtered based on Area and Size.
    var filteredApartments: [ApartmentDetail] {
        if location == "All" && noOfRooms == "All"   {
            return apartments
        } else if location != "All" && noOfRooms == "All" {
            return apartments.filter {$0.neighborhood == location}
        }
        else if noOfRooms != "All" && location == "All" {
            return apartments.filter {$0.numberOfRooms == noOfRooms}
        } else if location != "All" && noOfRooms != "All" {
            return apartments.filter {$0.neighborhood == location}.filter {$0.numberOfRooms == noOfRooms}
        } else {
            return apartments
        }
    }
    
    // List of all cities.
    static let cities = ["Al-Bedae", "Bayan", "Hitteen", "Jabriya", "Maidan Hawally", "Mishrif", "Rumaithiya", "Salam", "Salmiya", "Salwa", "Shaab", "Shuhada", "Siddiq", "Zahra", "Hawally",  "Al Naem", "Amgarah Industrial", "Kabd", "Nasseem", "Oyoun", "Qairawan", "Qasr", "Saad Al Abdullah", "Sulaibiya", "Taima", "Waha", "Matla'", "Al-Sabiya", "Al Jahra Industrial", "Abbasiya", "Abdullah Al-Mubarak", "Abraq Khaitan", "Andalous", "Ardhiya", "Ardiya Small Industrial", "Ashbeliah", "Dhajeej", "Ferdous", "Jleeb Al-Shiyoukh", "Khaitan", "Omariya", "Rabiya", "Rai", "Reggai", "Rehab", "Sabah Al-Nasser", "Farwaniya", "Al-Shadadiya", "Abu Halifa", "Dhaher", "East Al Ahmadi", "Eqaila", "Fahad Al Ahmad", "Fintas", "Hadiya", "Jaber Al-Ali", "Julayah", "Khairan", "Magwa", "Mahboula", "Mangaf", "Mina Abdullah", "Nuwaiseeb", "Riqqa", "Sabah Al Ahmad residential", "Sabahiya", "Shuaiba Port", "Umm Al Hayman", "Bnaider", "Ali Sabah Al-Salim", "Sabah Al Ahmad Sea City", "Abdullah Al-Salem", "Adailiya", "Bnaid Al-Qar", "Daiya", "Dasma", "Dasman", "Doha", "Faiha", "Ghornata", "Jaber Al-Ahmad", "Kaifan", "Khaldiya", "Mansouriya", "Mirqab", "Mubarakiya Camps", "Nahda", "Nuzha", "Qadsiya", "Qibla", "Qortuba", "Rawda", "Salhiya", "Shamiya", "Sharq", "Shuwaikh", "Sulaibikhat", "Surra", "Yarmouk", "Shuwaikh Residential", "Shuwaikh Industrial"]
    
    // List of selected cities to use in Filter.
    static let selectedCities = [ "All", "Jabriya", "Maidan Hawally", "Salmiya", "Salwa", "Shaab", "Siddiq", "Zahra", "Hawally", "Dhajeej", "Jleeb Al-Shiyoukh", "Khaitan", "Farwaniya", "Abu Halifa", "East Al Ahmadi", "Eqaila", "Fintas", "Khairan", "Mahboula", "Mangaf", "Sabah Al Ahmad Residential", "Shuwaikh", "Sharq"]
    
    // List of Number Of rooms. to use it in Filter.
    static let numberOfRoomsArray = ["All", "Studio", "1 Bedroom", "2 Bedrooms", "3 Bedrooms", "4 Bedrooms", "5 Bedrooms", "6+ Bedrooms"]
    
    init() {
        self.getAppartments()
    }
    
    // Get the shared instance from NetworkController
    // Run the ParseHtml function.
    func getAppartments() {
        let shared = NetworkController.shared
        shared.parseHtml(number: 1) { [weak self] ApartmentDetailArray in
            if let apartArray = ApartmentDetailArray {
                DispatchQueue.main.async {
                    self?.apartments = apartArray
                }
            }
        }
    }
    
    // MARK: - USER INDENT
    
    
}
