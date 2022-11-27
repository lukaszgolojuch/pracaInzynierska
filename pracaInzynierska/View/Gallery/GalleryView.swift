//
//  GalleryView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct GalleryView: View {
    
    @ObservedObject var galleryVM = GalleryViewModel()

    init() {
        galleryVM.fetchImagesData()
    }
    
    var body: some View {
        ScrollView{
            ForEach(galleryVM.imagesData, id: \.self) { imageData in
                PhotoTileView(for: imageData.imageURL)
                Divider()
                    .frame(height: 1)
                    .background(.blue)
                    .padding()
            }
        }
    }
    
    
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
