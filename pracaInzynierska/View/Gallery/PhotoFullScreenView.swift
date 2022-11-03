//
//  PhotoFullScreenView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/3/22.
//

import SwiftUI

struct PhotoFullScreenView: View {
    var body: some View {
        ZStack{
            Image("bmwg30")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationBarTitle("BMW Series 5")
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
}

struct PhotoFullScreenView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoFullScreenView()
    }
}
