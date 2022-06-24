//
//  AjarSearchApp.swift
//  AjarSearch
//
//  Created by Yousef Zuriqi on 20/12/2021.
//

import SwiftUI

@main
struct AjarSearchApp: App {
    @StateObject var apartManager = ApartmentsManager()
    
    var body: some Scene {
        WindowGroup {
            ApartmentListView()
                .environmentObject(apartManager)
        }
    }
}
