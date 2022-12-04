//
//  FuelConsumptionSelectionView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/15/22.
//

import SwiftUI

struct FuelConsumptionSelectionView: View {
    
    @ObservedObject var addNewRatingVM = AddNewRatingViewModel()
    
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

            Picker(selection: $addNewRatingVM.newRating.transmission, label: Text("Fuel type: ")) {
                ForEach(FuelType.allCases, id: \.id) { item in
                        Text(item.rawValue)
                }
            }
            
            HStack{
                Text("Fuel Consumption (city): ")
                TextField("City", value: $addNewRatingVM.newRating.fuelConsumptionCity, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
            }
            
            HStack{
                Text("Fuel Consumption (highway): ")
                TextField("Highway", value: $addNewRatingVM.newRating.fuelConsumptionHighway, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
            }
            
            HStack{
                Text("Fuel Consumption (combined): ")
                TextField("Combined", value: $addNewRatingVM.newRating.fuelConsumtionCombined, formatter: decimalFormatter)
                        .keyboardType(.decimalPad)
            }
            
        }
    }
}

struct FuelConsumptionSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        FuelConsumptionSelectionView()
    }
}
