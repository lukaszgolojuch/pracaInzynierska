//
//  CarDetailView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct CarDetailView: View {
    var body: some View {

        VStack(alignment: .leading) {
                
            CarDetailHeaderView()
                    .padding(30)
                
            List {
                CarDetailsSectionView()
                FuelConsumtionSectionView()
                RecentCarRatingsView(ratings: [defaultRating,defaultRating,defaultRating])
            }.background(Color.white)
        }
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView()
    }
}
