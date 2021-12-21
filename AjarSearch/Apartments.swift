//
//  Apartments.swift
//  AjarSearch
//
//  Created by Yousef Zuriqi on 21/12/2021.
//

import SwiftUI

class Apartments: ObservableObject {
    
    var apartments: [Apartment] = []
    
    static var url = Bundle.main.url(forResource: "rentSample", withExtension: "webp")!
    static var url2 = Bundle.main.url(forResource: "ajarSample2", withExtension: "webp")!
    static var url3 = Bundle.main.url(forResource: "ajarSample3", withExtension: "webp")!
    static var url4 = Bundle.main.url(forResource: "ajarSample4", withExtension: "webp")!
    static var description = "شقة للايجار غرفتين وصالة وحمامين ومطبخ تكييف مركزي فقط عائلات حولي شرحبيل موقع متميز وعمارة ممتازةً قريبة من جميع الخدمات وقريبة علي مدرسة النجاة ومدرسة الابداع الامريكية والمدرسة الباكستانية شامل الصيانة والكهرباء والماء"
    
    
    static var example: Apartment = Apartment(name: "Unit A", area: "Salmiya", NoOfRooms: 2, rent: 350, thumbnailURL: url, imagesURLs: [url, url2, url3, url4], description: description)
    
    static var apartmentsExample = [example, example, example, example]
    
}
