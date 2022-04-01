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
        apartManager.filteredApartments
    }
    
    var body: some View {
        NavigationView {
            
            // If apartments still not loaded show Progress View
            if apartments.isEmpty {
                ProgressView().scaleEffect(2)
                .navigationTitle("List of Apartments")

            } else {
                // Showing the List of Apartments
                GeometryReader { geometry in
                    VStack {
                        // Filter Items
                        HStack {
                            // Location Filter Picker
                            Picker("City", selection: $apartManager.location) {
                                ForEach(ApartmentsManager.selectedCities, id:\.self) { city in
                                    Text(city)
                                }
                            }
                            Spacer()
                            // No.OfRooms Filter Picker
                            Picker("No. Of Rooms", selection: $apartManager.noOfRooms) {
                                ForEach(ApartmentsManager.numberOfRoomsArray, id:\.self) { room in
                                    Text(room)
                                }
                            }
                            
                            
                        }
                        // List of Apartments
                        List {
                            
                            ForEach(apartments, id: \.self) { apartment in
                                NavigationLink(destination: DetailView(apartment: apartment)) {
                                    CardView(apartment: apartment)
                                        .aspectRatio(2/3, contentMode: .fit)
                                }
                            }
                        }
                        .refreshable {
                            self.apartManager.getAppartments()
                        }
                        .listStyle(.plain)
                    }
                }
                .navigationTitle("List of Apartments")

            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ApartmentListView()
    }
}
