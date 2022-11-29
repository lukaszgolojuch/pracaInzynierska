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
                    .padding(30)
                
            List {
                CarDetailsSectionView(car: car)
                FuelConsumtionSectionView(car: car)
                RecentCarRatingsView(ratings: [defaultRating,defaultRating,defaultRating])
            }.background(Color.white)
        }
    }
}
