//
//  ContentView.swift
//  AjarSearch
//
//  Created by Yousef Zuriqi on 20/12/2021.
//

import SwiftUI

struct ApartmentListView: View {
    @EnvironmentObject var apartManager: ApartmentsManager
    var apartments: [ApartmentDetail] {
        apartManager.apartments
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    List {
                        ForEach(apartments, id: \.self) { apartment in
                            NavigationLink(destination: DetailView(apartment: apartment)) {
                                CardView(apartment: apartment)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("List of Apartments")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ApartmentListView()
    }
}
