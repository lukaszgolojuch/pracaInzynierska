//
//  GalleryViewModel.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/27/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class GalleryViewModel: ObservableObject {
    
    @Published var imagesData = [ImageStruct]()
    
    private let db = Firestore.firestore()
    
    func fetchImagesData() {
        //Read the documents at a specific path
        db.collection("Images").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        self.imagesData = snapshot.documents.map { d in
                            return ImageStruct(id: d.documentID,
                                        car: d["car"] as? String ?? "",
                                        date: d["date"] as? Date ?? Date.now,
                                        imageURL: d["imageURL"] as? String ?? ""
                            )
                        }
                    }
                }
            } else {
                print("[ERROR] Error Occured while fetching Recent Ratings Data from Firestore")
            }
        }
    }
}

