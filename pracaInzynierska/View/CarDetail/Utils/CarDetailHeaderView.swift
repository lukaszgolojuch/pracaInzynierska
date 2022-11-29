//
//  CarDetailHeaderView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/4/22.
//

import SwiftUI

struct CarDetailHeaderView: View {
    let car: Car
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(car.make)
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 25))
                Text(car.model)
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 20))
            }
            Spacer()
            Image(car.make)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(maxWidth: 100.0, maxHeight: 100.0)
        }
    }
}
