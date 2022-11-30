//
//  CarDetailsSectionView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/7/22.
//

import SwiftUI

struct CarDetailsSectionView: View {
    let car: Car
    
    var body: some View {
        Section(header: Text("Car details")
            .foregroundColor(.white)) {
            HStack {
                Text("Type:")
                    .bold()
                Text(car.type)
            }
            HStack {
                Text("Production years:")
                    .bold()
                Text(String(car.productionYearFrom) + "-" + String(car.productionYearTo))
            }
            HStack {
                Text("Engine power:")
                    .bold()
                Text(String(car.enginePowerFrom) + "KM - " + String(car.enginePowerTo) + "KM")
            }
            HStack {
                Text("Price from (new):")
                    .bold()
                Text(String(car.priceFrom) + "PLN")
            }
            HStack {
                Text("Price to (new):")
                    .bold()
                Text(String(car.priceTo) + "PLN")
            }
        }
    }
}
