//
//  AddImageToGallery.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/27/22.
//

import SwiftUI
import FirebaseStorage
import Firebase

struct AddImageToGallery: View {
    
    @State var isPickerShowing: Bool = false
    @State var selectedImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var car: String = "BMW Series 5 2016"
    @State var date: Date = Date.now

    var body: some View {
        VStack {
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            
            Button {
                //show the image picker
                isPickerShowing = true
            } label: {
                Text("Select a Photo")
            }
            
            if selectedImage != nil {
                Button {
                    uploadPhoto()
                } label: {
                    Text("Upload photo")
                }
            }
        }
        .foregroundColor(.black)
        .sheet(isPresented: $isPickerShowing){
            ImagePicker(uiImage: $selectedImage, isPresenting:  $isPickerShowing, sourceType: $sourceType)
        }
    }
    
    func uploadPhoto() {
        //Make sure selectedImage is not nil
        guard selectedImage != nil else {
            return
        }
        
        //Create storage reference
        let storageRef = Storage.storage().reference()
        
        //Turn our image into data
        let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
        
        guard imageData != nil else {
            return
        }
        
        //Specify the file path and name
        let path = "images/\(UUID().uuidString).jpg"
        let fileRef = storageRef.child(path)
        
        //Upload that data
        let uploadTask = fileRef.putData(imageData!,metadata: nil) { metadata, error in
            if error == nil && metadata != nil {
                let db = Firestore.firestore()
                let docData: [String: Any] = [
                    "car": car,
                    "imageURL": path,
                    "date": date,
                ]
                
                db.collection("Images").document().setData(docData)
            }
        }
        
    }
}

struct AddImageToGallery_Previews: PreviewProvider {
    static var previews: some View {
        AddImageToGallery()
    }
}
