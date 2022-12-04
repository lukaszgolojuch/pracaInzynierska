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
                Text(String(format: "%.1f", car.fuelConsumptionCityMin) + "l/100km")
            }
            HStack {
                Text("City (maximum):")
                    .bold()
                Text(String(format: "%.1f", car.fuelConsumptionCityMax) + "l/100km")
            }
            HStack {
                Text("Highway (minimum):")
                    .bold()
                Text(String(format: "%.1f", car.fuelConsumptionHighwayMin) + "l/100km")
            }
            HStack {
                Text("Highway (maximum):")
                    .bold()
                Text(String(format: "%.1f", car.fuelConsumptionHighwayMax) + "l/100km")
            }
            HStack {
                Text("Combined (minimum):")
                    .bold()
                Text(String(format: "%.1f", car.fuelConsumptionCombinedMin) + "l/100km")
            }
            HStack {
                Text("Combined (maximum):")
                    .bold()
                Text(String(format: "%.1f", car.fuelConsumptionCombinedMax) + "l/100km")
            }

        }
    }
}
