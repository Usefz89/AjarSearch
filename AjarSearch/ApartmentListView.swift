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
            if apartManager.apartmentState == .empty {
                emptyApartments
                    .navigationTitle("List of Apartments")
                
            // Showing the List of Apartments
            } else if apartManager.apartmentState == .notEmpty {
                filledApartments
                    .navigationTitle("List of Apartments")
            // If apartments are filled but filter result is empty
            } else {
                filterApartmentIsEmpty
                    .navigationBarTitle("List of Apartments")
                
            }
        }
    }
    
    // Varibales for each apartment state
    // If apartments are empty
    var emptyApartments: some View {
        VStack {
            Text("Loading Apartments.")
                .font(.title.bold())
                .foregroundColor(.blue)
            Text("Please wait...")
                .font(.title.bold())
                .foregroundColor(.blue)
            ProgressView().scaleEffect(2)
        }
    }
    
    var filledApartments: some View {
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
                    
                    ForEach(apartments) { apartment in
                        NavigationLink(destination: DetailView(apartment: apartment)) {
                            CardView(apartment: apartment)
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
                .refreshable {
                    await apartManager.getApartments()
                }
                .listStyle(.plain)
            }
        }
    }
    
    var filterApartmentIsEmpty: some View {
        VStack {
            Text("Filter is empty")
                .font(.title.bold())
            Button {
                // Return filters to original state.
                apartManager.noOfRooms = "All"
                apartManager.location = "All"
            } label: {
                Label("Back", systemImage: "arrowshape.turn.up.backward.fill")
                    .padding()
                    .background(.red)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ApartmentListView()
    }
}
