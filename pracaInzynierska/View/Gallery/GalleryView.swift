//
//  GalleryView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct GalleryView: View {
    
    @ObservedObject var galleryVM = GalleryViewModel()
    let colors = AppColors()
    
    init() {
        galleryVM.fetchImagesData()
    }
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                Spacer()
                HStack{
                    VStack(alignment: .leading){
                        Text("Gallery")
                            .bold()
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        AddImageToGallery()
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
                    Text("Images taken by users")
                        .padding()
                        .foregroundColor(.white)
                    ScrollView{
                        ForEach(galleryVM.imagesData, id: \.self) { imageData in
                            PhotoTileView(for: imageData)
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

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
