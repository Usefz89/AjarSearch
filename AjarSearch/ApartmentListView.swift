//
//  ContentView.swift
//  AjarSearch
//
//  Created by Yousef Zuriqi on 20/12/2021.
//

import SwiftUI

struct ApartmentListView: View {
    var apartments = Apartments.apartmentsExample
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    List {
                        ForEach(apartments) { apartment in
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
