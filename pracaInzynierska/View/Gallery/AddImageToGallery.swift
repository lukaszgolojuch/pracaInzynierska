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
    
    let colors = AppColors()
    
    enum CarModels: String, CaseIterable {
        case BmwSeries52016 = "BMW Series 5 2016"
        case CupraFormentor2021 = "Cupra Formentor 2021"
        case Fiat5002007 = "Fiat 500 2007"
        case MercedesBenzGClass2018 = "Mercedes-Benz G Class 2018"
        case PorscheCayenne2019 = "Porsche Cayenne 2019"
        case JeepWrangler2017 = "Jeep Wrangler 2017"
        case Porsche9112019 = "Porsche 911 2019"
        var id: String { return self.rawValue }
    }
    
    @State var fetchedData = [UIImage]()

    var body: some View {
        VStack(alignment: .leading){
            Spacer()
            HStack{
                VStack(alignment: .center){
                    Text("Add new image")
                        .bold()
                }
            }.padding(20)
                .frame(width: UIScreen.main.bounds.width, height: getStackTwoHeight(), alignment: .center)
                        
            VStack{
                List {
                    Section{
                        Picker(selection: $car, label: Text("Car model: ")) {
                            ForEach(CarModels.allCases, id: \.id) { item in
                                        Text(item.rawValue)
                            }
                        }
                        
                        Button {
                            isPickerShowing = true
                        } label: {
                            Text("Select a Photo")
                        }
                    }
                    
                    if selectedImage != nil {
                        Section {
                            Button {
                                uploadPhoto()
                            } label: {
                                HStack{
                                    Spacer()
                                    Text("Upload photo")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: getStackOneHeight(), alignment: .top)
            .background(colors.darkGrey)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .ignoresSafeArea(edges: .bottom)
            .sheet(isPresented: $isPickerShowing){
                ImagePicker(uiImage: $selectedImage, isPresenting:  $isPickerShowing, sourceType: $sourceType)
            }
        }
    }
    
    func getStackOneHeight() -> CGFloat {
        return (UIScreen.main.bounds.height * 0.80)
    }
    
    func getStackTwoHeight() -> CGFloat {
        return (UIScreen.main.bounds.height * 0.20)
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
