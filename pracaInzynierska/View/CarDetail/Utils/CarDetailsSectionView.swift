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
        Section(header: Text("Car details")) {
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
                Text("Price (new):")
                    .bold()
                Text(String(car.priceFrom) + "PLN - " + String(car.priceTo) + "PLN")
            }
        }
    }
}
