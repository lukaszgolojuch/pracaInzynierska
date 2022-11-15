//
//  RecentCarRatingsView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/7/22.
//

import SwiftUI

struct RecentCarRatingsView: View {
    var ratings: [Rating]
    
    var body: some View {
        ForEach(ratings) { rating in
            SingleRatingView(rating: rating)
            Divider()
                .frame(height: 1)
                .background(.blue)
                .padding()
        }
    }
}

struct RecentCarRatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RecentCarRatingsView(ratings: [rating, rating, rating])
    }
}
