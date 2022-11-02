//
//  RecentRatingsView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct RecentRatingsView: View {
    var ratings: [Rating]
    
    var body: some View {
        ScrollView{
            ForEach(ratings) { rating in
                SingleRatingView()
            }
        }
    }
}

struct RecentRatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RecentRatingsView(ratings: [Rating(car: car, stars: 5, description: "This is car description")])
    }
}
