//
//  RecentRatingsView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct RecentRatingsView: View {
    
    @ObservedObject var RecentRatingsVM = RecentRatingsViewModel()

    init() {
        RecentRatingsVM.fetchRatingData()
    }
    
    var body: some View {
        ScrollView{
        
            NavigationLink {
                AddNewRatingView()
            } label: {
                Label("Add New Rating", image: "plus")
            }.padding()
            .background(.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .padding(30)
            
            ForEach(RecentRatingsVM.ratings) { rating in
//                SingleRatingView()
                Text(rating.car)
                Divider()
                    .frame(height: 1)
                    .background(.blue)
                    .padding()
            }
        }
    }
}

//struct RecentRatingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecentRatingsView(ratings: [rating, rating, rating])
//    }
//}
