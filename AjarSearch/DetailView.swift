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
                            ForEach(apartment.imgArray, id: \.self) { stringURL in
                                asyncImage(URL(string: stringURL)!)
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
                    
                    Divider()
                    
                    contactButton
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
                Text("No. Of Rooms = \(apartment.numberOfRooms)")
                    .font(.headline)
                Divider()
                if !apartment.price.isEmpty {
                    Text("Rent = \(apartment.price) KD")
                        .font(.headline)
                }
            }
        }
        .padding([.top, .horizontal])
    }
    
    //Display Image from URL
    func asyncImage(_ url: URL) -> some View {
        
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image.resizable().scaledToFit()
            case .failure(_):
                Image(systemName: "exclamationmark.icloud").scaleEffect(3)// Indicates an error.
            case .empty:
                ProgressView().scaleEffect(2)
            @unknown default:
                Image(systemName: "exclamationmark.icloud").scaleEffect(3)// Indicates an error.



                
                
            }
        }
    }
    
    private var contactButton: some View {
        Button {
            UIApplication.shared.open(URL(string:apartment.link)!)
            
        } label: {
            Label("Get Phone Number", systemImage: "phone.fill")
                .font(.headline)
                .padding()
                .background(Color.green)
                .cornerRadius(10)
                .foregroundColor(.white)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(apartment: ApartmentsManager().apartments.first!)
    }
}
