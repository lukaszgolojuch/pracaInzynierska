//
//  MainView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct MainView: View {
    @State var selection = 1
    @State var isPresenting: Bool = false
    @State var moveToDetailView: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @ObservedObject var classifier: ImageClassfier = ImageClassfier()
    
    init() {
        UITabBar.appearance().barTintColor = UIColor(.blue)
        UITabBar.appearance().backgroundColor = UIColor(.blue)
        UITabBar.appearance().unselectedItemTintColor = UIColor(.black)
    }

    
    let ratings = [defaultRating]
    var body: some View {
        
        NavigationView {
            ZStack {
                TabView(selection: $selection) {
                    CarListView()
                        .tabItem{
                            Label("Cars List", systemImage: "doc.plaintext.fill")
                        }
                        .tag(1)
          
                    RecentRatingsView()
                        .tabItem{
                            Label("Recent Ratings", systemImage: "star.fill")
                        }
                        .tag(2)
                    
                    GalleryView()
                        .tabItem{
                            Label("Gallery", systemImage: "photo.artframe")
                        }
                        .tag(3)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                        }
                    }
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(action: {
                            isPresenting = true
                            sourceType = .camera

                        }) {
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
                .sheet(isPresented: $isPresenting){
                    ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                        .onDisappear{
                            if uiImage != nil {
                                classifier.detect(uiImage: uiImage!)
                                print(classifier.imageClass)
                                moveToDetailView = true
                            }
                        }
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
        default:
            return("Gallery")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
