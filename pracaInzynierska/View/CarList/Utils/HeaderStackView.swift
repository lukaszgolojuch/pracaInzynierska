//
//  HeaderStackView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/20/22.
//

import SwiftUI

struct HeaderStackView: View {
    
    var carObject: Car
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            HStack {
                VStack(alignment: .leading, spacing: 10.0) {
                    Text(carObject.make + " " + carObject.model)
                        .font(.title3).bold()
                    Text(carObject.type)
                    Text(String(carObject.productionYearFrom) + " - " + String(carObject.productionYearTo))
                }
                Spacer()
                Image(carObject.make)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(maxWidth: 100.0, maxHeight: 100.0)
            }
        }.padding(20)
            .frame(width: UIScreen.main.bounds.width - 50, height: 150, alignment: .center)
            .background(Color(red: 255/255, green: 252/255, blue: 243/255,opacity: 0.9))
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .stroke(.black, lineWidth: 2))
            .shadow(radius: 5.0)
    }
}

struct HeaderStackView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderStackView(carObject: car)
    }
}
