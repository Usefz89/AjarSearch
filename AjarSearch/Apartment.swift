//
//  Apartment.swift
//  AjarSearch
//
//  Created by Yousef Zuriqi on 21/12/2021.
//

import Foundation



struct Apartment: Codable, Hashable, Identifiable {
    var id: UUID
    var link: String
    var name: String
    var imgArray: [String]
    var city: String
    var neighborhood: String
    var numberOfRooms: String
    var numberOfBathrooms: String
    var surfaceArea: String
    var floor: String
    var price: String
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case link
//        case name
//        case imgArray
//        case city
//        case neighborhood
//        case numberOfRooms
//        case numberOfBathrooms
//        case surfaceArea
//        case floor
//        case price
//        case number
//    }
}

//struct ApartmentsStruct: Codable {
//    var apartments: [Apartment]
//
//    enum CodingKeys: String, CodingKey {
//        case apartments = "resultApartments"
//    }
//}
