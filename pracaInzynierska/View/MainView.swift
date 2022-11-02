//
//  MainView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct MainView: View {
    @State var selection = 1
    
    let ratings = [rating]
    var body: some View {
        
        NavigationView {
            ZStack {
                TabView(selection: $selection) {
                    CarListView()
                        .tabItem{
                            Label("Cars List", systemImage: "doc.plaintext.fill")
                        }
                        .tag(1)
                    
                    RecentRatingsView(ratings: ratings)
                        .tabItem{
                            Label("Recent Ratings", systemImage: "star.fill")
                        }
                        .tag(2)
                    
                    PhotoRecognitionView()
                        .tabItem{
                            Label("Photo Recognition", systemImage: "camera.fill")
                        }
                        .tag(3)
                    
                    GalleryView()
                        .tabItem{
                            Label("Gallery", systemImage: "photo.artframe")
                        }
                        .tag(4)
                    
                    VinCheckView()
                        .tabItem{
                            Label("Check VIN", systemImage: "info.circle.fill")
                        }
                        .tag(5)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                        }
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
