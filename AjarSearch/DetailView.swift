//
//  DetailView.swift
//  AjarSearch
//
//  Created by Yousef Zuriqi on 21/12/2021.
//

import SwiftUI


struct DetailView: View {
    var apartment: Apartment
    
    
    @State private var fullScreenMode = false
    var body: some View {
        GeometryReader { geomtry in
            VStack {
                ScrollView {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(uiColor: .systemGray5))
                        
                        TabView {
                            ForEach(apartment.imgArray, id: \.self) { url in
                                asyncImage(url)
                                    .onTapGesture {
                                        fullScreenMode.toggle()
                                    }
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .always))
                        
                        .padding()
                    }
                    .frame(height: geomtry.size.height / (fullScreenMode ? 1 : 3/2) )
                    .padding(.all, fullScreenMode ? .zero : nil)
                    
                    informationBoard
                    Divider()
                    Text(apartment.name)
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
                    Text( apartment.surfaceArea)
                        .font(.headline)
                }
                Divider()
                Text("No. Of Rooms = \(apartment.numberOfRooms) Rooms")
                    .font(.headline)
                Divider()
                Text("Rent = \(apartment.price) KD")
                    .font(.headline)
            }
        }
        .padding([.top, .horizontal])
    }
    
    func asyncImage(_ url: URL) -> some View {
        
        AsyncImage(url: url) { phase in
            if let image = phase.image, let image = image  {
                image.resizable().scaledToFit() // Displays the loaded image.
            } else if phase.error != nil {
                Image(systemName: "exclamationmark.icloud").scaleEffect(2)// Indicates an error.
            } else {
                ProgressView().scaleEffect(2) // Acts as a placeholder.
            }
        }
    }
    
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(apartment: ApartmentsManager().apartments.first!)
    }
}
