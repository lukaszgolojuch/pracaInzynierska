//
//  CarDetailView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct CarDetailView: View {
    let car: Car
    var body: some View {

        VStack(alignment: .leading) {
                
            CarDetailHeaderView(car: car)
                .padding(.horizontal, 20)
                
            List {
                CarDetailsSectionView(car: car)
                FuelConsumtionSectionView(car: car)
            }.background(Color.white)
        }
    }
}
