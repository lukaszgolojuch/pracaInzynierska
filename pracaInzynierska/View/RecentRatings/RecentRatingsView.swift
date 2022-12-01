//
//  RecentRatingsView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct RecentRatingsView: View {
    
    @ObservedObject var RecentRatingsVM = RecentRatingsViewModel()

    let colors = AppColors()
    
    init() {
        RecentRatingsVM.fetchRatingData()
    }
        
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Spacer()
                HStack{
                    VStack(alignment: .leading){
                        Text("Revent Ratings")
                            .bold()
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        AddNewRatingView()
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(maxWidth: 50.0, maxHeight: 50.0)
                            .foregroundColor(colors.gold)

                    }
                }.padding(20)
                    .frame(width: UIScreen.main.bounds.width, height: getStackTwoHeight(), alignment: .center)
                            
                VStack{
                    Text("Recent ratings")
                        .padding()
                        .foregroundColor(.white)
                    ScrollView{
                        ForEach(RecentRatingsVM.ratings) { rating in
                            SingleRatingView(rating: rating)
                                .foregroundColor(.black)
                            Divider()
                                .frame(height: 1)
                                .padding()
                        }
                    }
                }
                .frame(width: UIScreen.main.bounds.width, height: getStackOneHeight(), alignment: .top)
                .background(colors.darkGrey)
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
    
    func getStackOneHeight() -> CGFloat {
        return (UIScreen.main.bounds.height * 0.80)
    }
    
    func getStackTwoHeight() -> CGFloat {
        return (UIScreen.main.bounds.height * 0.20)
    }
}
