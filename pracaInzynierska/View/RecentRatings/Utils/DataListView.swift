//
//  DataListView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct DataListView: View {
    let rating: Rating
    
    var body: some View {
        List {
            Section(header: Text("Description").foregroundColor(.white)) {
                Text(rating.description)
            }
            
            Section(header: Text("Fuel consuption").foregroundColor(.white)) {
                HStack {
                    Text("City:")
                        .bold()
                    Text(String(rating.fuelConsumptionCity) + " l/100km")
                }
                HStack {
                    Text("Highway:")
                        .bold()
                    Text(String(rating.fuelConsumptionHighway) + " l/100km")
                }
                HStack {
                    Text("Combined:")
                        .bold()
                    Text(String(rating.fuelConsumtionCombined) + " l/100km")
                }
            }
            
            Section(header: Text("Car data").foregroundColor(.white)) {
                HStack {
                    Text("Production year:")
                        .bold()
                    Text(String(rating.productionYear))
                }
                HStack {
                    Text("Millage:")
                        .bold()
                    Text(String(rating.millage) + " km")
                }
                HStack {
                    Text("Transmission:")
                        .bold()
                    Text(rating.transmission)
                }
                HStack {
                    Text("Fuel type:")
                            .bold()
                    Text(rating.fuelType)
                }
            }
        }
    }
}
