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
                Divider()
                    .frame(height: 1)
                    .background(.blue)
                    .padding()
            }
        }
    }
}

struct RecentRatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RecentRatingsView(ratings: [rating, rating, rating])
    }
}
