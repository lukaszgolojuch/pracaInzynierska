//
//  MainView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct MainView: View {
    @State var selection = 1
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(.blue)
        UITabBar.appearance().backgroundColor = UIColor(.blue)
        UITabBar.appearance().unselectedItemTintColor = UIColor(.black)
    }

    
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
                    
                    SingleRatingView()
                        .tabItem{
                            Label("Recent Ratings", systemImage: "star.fill")
                        }
                        .tag(2)
                    
                    GalleryView()
                        .tabItem{
                            Label("Gallery", systemImage: "photo.artframe")
                        }
                        .tag(3)
                    
                    VinCheckView()
                        .tabItem{
                            Label("Check VIN", systemImage: "info.circle.fill")
                        }
                        .tag(4)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                        }
                    }
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        NavigationLink(destination: PhotoRecognitionView()) {
                            Image(systemName: "camera")
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.large)
                .navigationBarTitle(navigationBarTitle(selected: $selection))
                .accentColor(.white)
                .onAppear {
                    let appearance = UINavigationBarAppearance()
                    appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                    appearance.backgroundColor = UIColor(.blue)
                    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                    appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

                    // Inline appearance (standard height appearance)
                    UINavigationBar.appearance().standardAppearance = appearance
                    // Large Title appearance
                    UINavigationBar.appearance().scrollEdgeAppearance = appearance
                }
            }
        }.accentColor(.white)
    }
    
    private func navigationBarTitle(selected: Binding<Int>) -> String {
        
        switch selected.wrappedValue {
        case 1:
            return("Cars List")
        case 2:
            return("Recent Ratings")
        case 3:
            return("Gallery")
        default:
            return("Check VIN")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
