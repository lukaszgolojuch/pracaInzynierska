//
//  PhotoFullScreenView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/3/22.
//

import SwiftUI

struct PhotoFullScreenView: View {
    
    let image: UIImage
    
    var body: some View {
        ZStack{
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}
