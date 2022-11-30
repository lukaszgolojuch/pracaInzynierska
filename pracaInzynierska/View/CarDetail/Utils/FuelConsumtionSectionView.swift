//
//  FuelConsumtionSectionView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/7/22.
//

import SwiftUI

struct FuelConsumtionSectionView: View {
    
    let car: Car
    
    var body: some View {
        Section(header: Text("Fuel consuption").foregroundColor(.white)) {
            HStack {
                Text("City (minimum):")
                    .bold()
                Text(String(car.fuelConsumptionCityMin) + "l/100km")
            }
            HStack {
                Text("City (maximum):")
                    .bold()
                Text(String(car.fuelConsumptionCityMax) + "l/100km")
            }
            HStack {
                Text("Highway (minimum):")
                    .bold()
                Text(String(car.fuelConsumptionHighwayMin) + "l/100km")
            }
            HStack {
                Text("Highway (maximum):")
                    .bold()
                Text(String(car.fuelConsumptionHighwayMax) + "l/100km")
            }
            HStack {
                Text("Combined (minimum):")
                    .bold()
                Text(String(car.fuelConsumtionCombinedMin) + "l/100km")
            }
            HStack {
                Text("Combined (maximum):")
                    .bold()
                Text(String(car.fuelConsumtionCombinedMax) + "l/100km")
            }

        }
    }
}
