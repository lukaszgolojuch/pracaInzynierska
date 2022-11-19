//
//  PhotoTileView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/3/22.
//

import SwiftUI

struct PhotoTileView: View {
    var body: some View {
        HStack{
            
            NavigationLink(destination: PhotoFullScreenView()) {
                Image("bmwg30")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200.0, height: 200.0, alignment: .center)
                    .clipped()
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 10){
                Text("BMW")
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 25))
                Text("Series 5")
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 20))
                Text("11.11.2022")
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 15))
            }
        }.padding(20)
    }
}

struct PhotoTileView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoTileView()
    }
}
