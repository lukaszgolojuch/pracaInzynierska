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
    
    @State var fetchedData = [UIImage]()

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
            
            Divider()
            HStack {
                ForEach(fetchedData, id: \.self) { image in
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .frame(width: 200, height: 200)
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
                
                db.collection("Images").document().setData(docData, completion: { error in
                    if error == nil {
                        DispatchQueue.main.async {
                            fetchImageData()
                        }
                    }
                })
            }
        }
    }
    
    func fetchImageData() {
        let db = Firestore.firestore()
        db.collection("Images").getDocuments { snapshot, error in
            
            var paths = [String]()
            
            if error == nil && snapshot != nil {
                for doc in snapshot!.documents {
                    paths.append(doc["imageURL"] as! String)
                }
                
                for path in paths {
                    let storageRef = Storage.storage().reference()
                    let fileRef = storageRef.child(path)
                    
                    fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                        
                        if error == nil && data != nil {
                            if let image = UIImage(data: data!) {
                                DispatchQueue.main.async {
                                    fetchedData.append(image)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct AddImageToGallery_Previews: PreviewProvider {
    static var previews: some View {
        AddImageToGallery()
    }
}
