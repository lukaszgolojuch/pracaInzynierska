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
    
    init(for imageURL: String) {
        getUIImage(for: imageURL)
    }
    
    var body: some View {
        HStack{
            
            NavigationLink(destination: PhotoFullScreenView()) {
                //Image("bmwg30")
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200.0, height: 200.0, alignment: .center)
                    .clipped()
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 10){
                Text("BMW")
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 25))
                Text("Series 5")
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 20))
                Text("11.11.2022")
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 15))
            }
        }.padding(20)
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
