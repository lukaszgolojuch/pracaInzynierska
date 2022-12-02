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
    
    @State var imagesos: UIImage = UIImage(systemName: "star")!
    var imageData: ImageStruct
    let colors = AppColors()
    
    let dateFormatter = DateFormatter()
    
    init(for imageDateStruct: ImageStruct) {
        imageData = imageDateStruct
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
    }
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                NavigationLink(destination: PhotoFullScreenView(image: imagesos)) {
                    Image(uiImage: imagesos)
                        .resizable()
                        .frame(width: 120, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                }
                
                Spacer()
                VStack(alignment: .trailing, spacing: 7){
                    Text(imageData.car)
                        .bold()
                    Text(dateFormatter.string(from: imageData.date))
                    Spacer()
                }.padding(.vertical)
                
            }.padding()
        }.onAppear{
            getUIImage(for: imageData.imageURL)
        }
        .background(colors.lightGrey)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .padding()
            .frame(height: 160)
    }
    
    func getUIImage(for imageURL: String) {
        // Get a reference to the storage service using the default Firebase App
        let storage = Storage.storage()

        // Create a storage reference from our storage service
        let storageRef = storage.reference()
        let fileRef = storageRef.child(imageURL)
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        fileRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error == nil && data != nil {
                if let img = UIImage(data: data!) {
                    DispatchQueue.main.async {
                        imagesos = img
                    }
                }
            }
        }
    }
}
