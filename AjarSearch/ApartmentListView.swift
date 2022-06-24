//
//  ContentView.swift
//  AjarSearch
//
//  Created by Yousef Zuriqi on 20/12/2021.
//

import SwiftUI

struct ApartmentListView: View {
    @EnvironmentObject var apartManager: ApartmentsManager
    
    
    var apartments: [Apartment] {
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
                        Divider()
                        
                        // Filter Row 
                        HStack {
                            // Location Filter Picker
                            HStack {
                                Text("City:")
                                    .font(.headline)
                                Picker("City", selection: $apartManager.location) {
                                    ForEach(ApartmentsManager.selectedCities, id:\.self) { city in
                                        Text(city)
                                    }
                                }
                            }
                            Spacer()
                            
                            // No.Of Rooms Filter Picker
                            HStack {
                                Text("No. of Rooms:")
                                    .font(.headline)
                                Picker("No. Of Rooms", selection: $apartManager.noOfRooms) {
                                    ForEach(ApartmentsManager.numberOfRoomsArray, id:\.self) { room in
                                        Text(room)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
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
                            apartManager.removeAllApartments()
                            apartManager.getAppartments()
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
