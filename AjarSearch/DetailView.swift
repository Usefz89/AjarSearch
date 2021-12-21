//
//  DetailView.swift
//  AjarSearch
//
//  Created by Yousef Zuriqi on 21/12/2021.
//

import SwiftUI

struct DetailView: View {
    var apartment = Apartments.example
    
    
    @State private var fullScreenMode = false
    var body: some View {
        GeometryReader { geomtry in
            VStack {
                ScrollView {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(uiColor: .systemGray5))

                        TabView {
                            ForEach(apartment.imagesURLs, id: \.self) { url in
                               asyncImage(url)
                                .onTapGesture {
                                    fullScreenMode.toggle()
                                }
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .automatic))
                        .padding()
                    }
                    .frame(height: geomtry.size.height / (fullScreenMode ? 1 : 3/2) )
                    .padding(.all, fullScreenMode ? .zero : nil)
                    
                    informationBoard
                    Divider()
                    Text(apartment.description)
                        .multilineTextAlignment(.trailing)
                        .padding()
                }
               
            }
        }
    }
    
    private var informationBoard: some View {
        
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(apartment.name)
                        .font(.headline)
                    Spacer()
                    Text( apartment.area)
                        .font(.headline)
                }
                Divider()
                Text("No. Of Rooms = \(apartment.NoOfRooms) Rooms")
                    .font(.headline)
                Divider()
                Text("Rent = \(apartment.rent) KD")
                    .font(.headline)
            }
        }
        .padding([.top, .horizontal])
    }
    
    func asyncImage(_ url: URL) -> some View {
        AsyncImage(url: url) { image in
            image.resizable().scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
