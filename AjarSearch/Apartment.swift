//
//  Apartment.swift
//  AjarSearch
//
//  Created by Yousef Zuriqi on 21/12/2021.
//

import Foundation



struct ApartmentDetail: Codable, Hashable {
    var link: URL
    var name: String
    var imgArray: [URL]
    var city: String
    var neighborhood: String
    var numberOfRooms: String
    var numberOfBathrooms: String
    var surfaceArea: String
    var floor: String
    var price: String
    var number: String
    
    enum CodingKeys: String, CodingKey {
        case link
        case name
        case imgArray = "img_array"
        case city
        case neighborhood
        case numberOfRooms
        case numberOfBathrooms
        case surfaceArea
        case floor
        case price
        case number
    }
}

struct ApartmentsStruct: Codable {
    var apartments: [ApartmentDetail]
}
