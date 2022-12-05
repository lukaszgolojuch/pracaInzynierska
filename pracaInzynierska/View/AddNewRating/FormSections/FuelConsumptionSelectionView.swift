//
//  FuelConsumptionSelectionView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/15/22.
//

import SwiftUI

struct FuelConsumptionSelectionView: View {
    
    @Binding var rating: Rating
    
    let decimalFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter
        }()
    
    enum FuelType: String, CaseIterable, Identifiable {
        case Petrol, Diesel, Hybrid, Electric
        var id: String { return self.rawValue }
    }
    
    var body: some View {
        Section(header: Text("Fuel Consumption").foregroundColor(.white)) {

            Picker(selection: $rating.fuelType, label: Text("Fuel type: ")) {
                ForEach(FuelType.allCases, id: \.id) { item in
                        Text(item.rawValue)
                }
            }
            
            HStack{
                Text("Fuel Consumption (city): ")
                TextField("City", value: $rating.fuelConsumptionCity, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
            }
            
            HStack{
                Text("Fuel Consumption (highway): ")
                TextField("Highway", value: $rating.fuelConsumptionHighway, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
            }
            
            HStack{
                Text("Fuel Consumption (combined): ")
                TextField("Combined", value: $rating.fuelConsumtionCombined, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
            }
            
        }
    }
}
