//
//  HeaderStackView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/20/22.
//

import SwiftUI

struct HeaderStackView: View {
    
    var carObject: Car
    let colors = AppColors()
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    
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
        .frame(width: UIScreen.main.bounds.width - 40, height: 150, alignment: .center)
        .background(colors.lightGrey)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .stroke(.black, lineWidth: 2))
            .shadow(color: colors.gold, radius: 1.0)
            
    }
}

struct HeaderStackView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderStackView(carObject: car)
    }
}
