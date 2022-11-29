//
//  PhotoTileView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/3/22.
//

import SwiftUI
import FirebaseStorage

struct PhotoTileView: View {
    
    @State var image: UIImage = UIImage(systemName: "questionmark.folder")!
    let colors = AppColors()
    
    init(for imageURL: String) {
        getUIImage(for: imageURL)
    }
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                NavigationLink(destination: PhotoFullScreenView()) {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 120, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                }
                
                Spacer()
                VStack(alignment: .trailing, spacing: 7){
                    Text("BMW Series 5 2016")
                    Text("22.11.2022")
                    //Text(String(Date.now))
                    Spacer()
                }.padding(.vertical)
                
            }.padding()
        }.background(colors.lightGrey)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .padding()
            .frame(height: 160)
    }
    
    func getUIImage(for imageURL: String) {
            let storageRef = Storage.storage().reference()
            let fileRef = storageRef.child(imageURL)
            
            fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                
            if error == nil && data != nil {
                if let img = UIImage(data: data!) {
                    image = img
                }
            }
        }
    }
}

//struct PhotoTileView_Previews: PreviewProvider {
//    static var previews: some View {
//        PhotoTileView()
//    }
//}
