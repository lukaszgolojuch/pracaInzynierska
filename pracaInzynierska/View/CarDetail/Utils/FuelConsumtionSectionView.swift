//
//  FuelConsumtionSectionView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/7/22.
//

import SwiftUI

struct FuelConsumtionSectionView: View {
    var body: some View {
        Section(header: Text("Fuel consuption")) {
            HStack {
                Text("City:")
                    .bold()
                Text("12l/100km")
            }
            HStack {
                Text("Highway:")
                    .bold()
                Text("12l/100km")
            }
            HStack {
                Text("Combined:")
                    .bold()
                Text("12l/100km")
            }
        }
    }
}

struct FuelConsumtionSectionView_Previews: PreviewProvider {
    static var previews: some View {
        FuelConsumtionSectionView()
    }
}
