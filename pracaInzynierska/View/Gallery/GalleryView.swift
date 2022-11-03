//
//  GalleryView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView{
            ForEach(1...15, id: \.self) { i in
                PhotoTileView()
                Divider()
            }
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
