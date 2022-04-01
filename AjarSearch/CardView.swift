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
                    Text(apartment.name).font(.headline)
                    Spacer()
                    Text( apartment.surfaceArea).font(.headline)
                }
                Group {
                    Divider()
                    HStack {
                        Text(apartment.numberOfRooms).font(.headline)
                        Spacer()
                        Text(apartment.numberOfBathrooms).font(.headline)
                    }
                }

                Group {
                    Divider()
                    HStack {
                        Text("Rent = \(apartment.price) KD")
                            .font(.headline)
                        Spacer()
                        Text(apartment.neighborhood).font(.headline)
                    }
                }
            }
        }
        .padding([.top, .horizontal])
    }
    
}

struct CardView_Previews: PreviewProvider {
   
    static let apartment = ApartmentsManager().apartments.first!
    static var previews: some View {
        CardView(apartment: apartment)
    }
}


