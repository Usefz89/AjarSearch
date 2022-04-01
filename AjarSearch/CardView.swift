//
//  CardView.swift
//  AjarSearch
//
//  Created by Yousef Zuriqi on 21/12/2021.
//

import SwiftUI

struct CardView: View {
    
    var apartment: ApartmentDetail
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(uiColor: .systemGray5))
            
            VStack {
                asyncImage
                informationBoard
            }
            .padding()
        }
    }
    
    //Async Image
    private var asyncImage: some View {
        AsyncImage(url: apartment.imgArray.first) { image  in
            image.resizable().scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
    
    //Information Board
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
                Group {
                    Divider()
                    Text("No. Of Rooms = \(apartment.numberOfRooms) Rooms").font(.headline)
                    Text("No. Of Bathrooms = \(apartment.numberOfBathrooms)").font(.headline)
                    Text("Floor Number = \(apartment.floor)").font(.headline)
                }
                
                Group {
                    Divider()
                    Text("Rent = \(apartment.price) KD")
                        .font(.headline)
                }
                
                Divider()
                Text("Goverment = \(apartment.city)").font(.headline)
                Text("City = \(apartment.neighborhood)").font(.headline)
            }
        }
        .padding([.top, .horizontal])
    }
    
}

struct CardView_Previews: PreviewProvider {
   
    static var previews: some View {
        CardView(apartment: ApartmentsManager().apartments.first!)
    }
}

extension Image {
    static func imageFromURL(_ url: URL) -> Image? {
        if let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
             return Image(uiImage: uiImage)
        } else {
           return nil
        }
    }
}

struct OptionalImage: View {
    var image: Image?
    
    var body: some View {
        if image != nil {
            image
        }
    }
}
