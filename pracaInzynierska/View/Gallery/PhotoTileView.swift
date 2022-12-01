//
//  PhotoTileView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/3/22.
//

import SwiftUI
import UIKit
import FirebaseStorage

struct PhotoTileView: View {
    
    @State var image: UIImage = UIImage(systemName: "questionmark.folder")!
    var imageData: ImageStruct
    var imageURL: String
    let colors = AppColors()
    
    let dateFormatter = DateFormatter()
    
    init(for imageDateStruct: ImageStruct, with URL: String) {
        imageURL = URL
        imageData = imageDateStruct
        getUIImage(for: URL)
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
    }
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                NavigationLink(destination: PhotoFullScreenView(image: image)) {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 120, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                }
                
                Spacer()
                VStack(alignment: .trailing, spacing: 7){
                    Text(imageData.car)
                    Text(dateFormatter.string(from: imageData.date))
                    Spacer()
                }.padding(.vertical)
                
            }.padding()
        }.background(colors.lightGrey)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .padding()
            .frame(height: 160)
    }
    
    func getUIImage(for imageURL: String) {
            //let storageRef = Storage.storage().reference()
            //let fileRef = storageRef.child(imageURL)
        
            let reference = Storage.storage().reference(withPath: imageURL)
            reference.getData(maxSize: 5 * 1024 * 1024) { data, error in
                print("[DEBUG] 1 get image")
            if error == nil && data != nil {
                if let img = UIImage(data: data!) {
                    print("[DEBUG] 2 get image")
                    print(imageURL)
                    //print(storageRef)
                    image = img
                }
            }
        }
    }
}
