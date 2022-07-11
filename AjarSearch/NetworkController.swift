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
    
    
    // Load the URL from AWS Lamda.
    // Decoded the data to Apartment struct.
    func loadApartments(completion: @escaping(([Apartment]?) -> Void)) {
        
        guard let url = URL(string: "https://ajarsearch-vapro-api.herokuapp.com/apartments")
//         guard let url = URL(string: "http://127.0.0.1:8080/apartments")
        
        else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data , response , error  in
            
            if let error = error {
                print(error.localizedDescription)
            }else {
                print("Successful data task")
            }
            
            if let data = data {
                print("There is data... Waiting for decoding")
                do {
                    let decodedData = try JSONDecoder().decode([Apartment].self, from: data)
                    completion(decodedData)
                    print("Decoding is successful")
                    
                } catch {
                    print(error)
                }
              
            } else {
                print("Invalid Data")
            }
        }.resume()
    }
    
    
    //    func loadApartments() async {
    //        guard let url = URL(string: "https://74xtvtmfwf5nfmhdxnwnk42o6i0iveso.lambda-url.us-east-1.on.aws/hello") else {
    //            print("Invalid URL")
    //            return
    //        }
    //        do {
    //            let (data, _) = try await URLSession.shared.data(from: url)
    //            if let decodedData = try? JSONDecoder().decode([ApartmentDetail].self, from: data) {
    //                self.apartments = decodedData
    //                print("Data = \(decodedData)")
    //            }
    //        }
    //        catch {
    //            print("invalid Data")
    //        }
    //
    //    }
    
    
    //    func autoLogin() {
    //        let url = URL(String:"")
    //    }
    
    //    func parseHtml (number: Int, completion: @escaping  ([ApartmentDetail]?) -> Void ) {
    //        //        let group = DispatchGroup()
    //        //        group.enter()
    //        DispatchQueue.global(qos: .userInitiated).async {
    //
    //
    //            let url = URL(string: "https://kw.opensooq.com/en/real-estate-for-rent/apartments-for-rent?page=\(number)&per-page=30")!
    //
    //            do {
    //                // Parse the html document
    //                let html = try String(contentsOf: url)
    //                let doc: Document = try SwiftSoup.parse(html)
    //
    //                //Get all cities and save to array.
    //                let cities = try doc.select("span[class=cityNameSpan] > span").array()
    //                for city in cities {
    //                    let cityString = try city.text()
    //                    self.cities.append(cityString)
    //
    //                }
    //                print(self.cities)
    //
    //                // Get the list of apartments in html and convert it to array.
    //                let apartmentsList = try  doc.select("li[data-key]").array()
    //
    //                // For each apartment get the required information.
    //                for apartment in apartmentsList {
    //                    // Go to the link for the apartment.
    //                    let linkTag = try apartment.select("div > h2 > a").first()
    //                    // Get the link in string.
    //                    let linkString = try linkTag?.attr("href") ?? ""
    //                    // Get the full url path in string.
    //                    let linkStringComplete = "https://kw.opensooq.com" + linkString
    //                    // Convert the url string to URL.
    //                    if let link = URL(string: linkStringComplete ) {
    //
    //                        // Parse the html document.
    //                        let html = try String(contentsOf: link)
    //                        let doc = try SwiftSoup.parse(html)
    //
    //                        // Get the description of the apartment
    //                        let name = try doc.select("h1[class=postSpanTitle noEmojiText postTitle mb8]").first()?.text() ?? ""
    //
    //
    //                        // Get the phone number.
    //                        let phoneNumberElement = try doc.select("span[class=showPhone inline ltr cursor noWrap").first()
    //                        let phoneNumber = try phoneNumberElement?.attr("data-phone-id") ?? ""
    //
    //                        // Get the number of rooms.
    //                        let numberOfRooms = try doc.select("li[class=inline vTop relative mb15][data-icon=PostDynamicAttribute[Rooms]] > a")
    //                            .first()?.text() ?? ""
    //                        //Get the number of Bathrooms
    //                        let numberOfBathrooms = try doc.select("li[class=inline vTop relative mb15][data-icon=PostDynamicAttribute[Bathrooms]] > a")
    //                            .first()?.text() ?? ""
    //
    //                        // Get the surface area of the apartment
    //                        let surfaceArea = try doc.select("li[class=inline vTop relative mb15][data-icon=PostDynamicAttribute[Surface]] > a")
    //                            .first()?.text() ?? ""
    //
    //                        // Get the Floor number of the apartment.
    //                        let floor = try doc.select("li[class=inline vTop relative mb15][data-icon=PostDynamicAttribute[Floors]] > a")
    //                            .first()?.text() ?? ""
    //
    //                        // Get the Rent Price
    //                        let price = try doc.select("li[class=inline vTop relative mb15] > a > strong[class=priceCurrencyMiddle]")
    //                            .first()?.text() ?? ""
    //
    //                        // Get the goverment name
    //                        let city = try doc.select("li[class=inline vTop relative mb15] > a")
    //                            .first()?.text() ?? ""
    //
    //                        // Get the City Name
    //                        // The html parse is dubplicate for city and neighboorhood.
    //                        // Thats why we got the array of elements then we chose the second element.
    //                        // Which is the city.
    //                        var neighborhood = ""
    //                        let listOfElements = try doc.select("li[class=inline vTop relative mb15] > a").array()
    //                        if listOfElements.count > 1 {
    //                            neighborhood = try listOfElements[1].text()
    //
    //                        }
    //
    //                        // Get the images galleries.
    //
    //                        var imgArray:[URL] = []
    //
    //                        // Get the list of img elements from the html. and loop through them
    //                        let imgElementArray = try doc.select("li[data-au=smallImg-AU][class=relative] > a > img").array()
    //
    //                        for imgElement in imgElementArray {
    //
    //                            //Get the string Value from the element.
    //                            var imgStringURL = try imgElement.attr("src")
    //
    //                            // change the string value from 75x75 to 1024x0 to get the full resolution image
    //                            // Get the start and end index of string slice 75x75
    //                            let startIndex = imgStringURL.index(imgStringURL.startIndex, offsetBy: 44)
    //                            let endIndex = imgStringURL.index(imgStringURL.startIndex, offsetBy: 49)
    //
    //                            // Add the 1024x0 before the endIndex
    //                            imgStringURL.insert(contentsOf: "1024x0", at: endIndex)
    //                            // Remove the 75x75 string from start index offset by 5
    //                            imgStringURL.removeSubrange(startIndex ..< imgStringURL.index(startIndex, offsetBy: 5))
    //
    //                            // Convert to url.
    //                            if let imgURL = URL(string: imgStringURL) {
    //                                imgArray.append(imgURL)
    //                            }
    //                        }
    //
    //
    //                            // Add the data to apartement instance.
    //
    //                            let apartment = ApartmentDetail(link: link, name: name, imgArray: imgArray, city: city, neighborhood: neighborhood, numberOfRooms: numberOfRooms, numberOfBathrooms: numberOfBathrooms, surfaceArea: surfaceArea, floor: floor, price: price, number: phoneNumber)
    //                            self.apartments.append(apartment)
    //
    //
    //                    }
    //                }
    //
    //            }catch let error {
    //                print(error)
    //            }
    //
    //            completion(self.apartments)
    //            print("Success")
    //
    //        }
    //    }
}
