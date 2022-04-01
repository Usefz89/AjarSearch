//
//  ApartmentsManager.swift
//  SwiftSoupTest
//
//  Created by Yousef Zuriqi on 21/12/2021.
//

import SwiftUI

class ApartmentsManager: ObservableObject {
    @Published var apartments: [ApartmentDetail] = []
    
    init() {
        self.getAppartments()
    }
    
    // Get the shared instance from NetworkController
    // Run the ParseHtml function.
    func getAppartments() {
        let shared = NetworkController.shared
        shared.parseHtml(number: 1) { [weak self] ApartmentDetailArray in
            if let apartArray = ApartmentDetailArray {
                self?.apartments = apartArray
            }
        }
    }
}
