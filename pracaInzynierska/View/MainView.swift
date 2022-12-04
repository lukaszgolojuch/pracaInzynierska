//
//  MainView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import CoreML
import Vision
import CoreImage
import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct MainView: View {
     
    @State var selected = 0
    @State var isPresenting: Bool = false
    @State var moveToDetailView: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var recognizedaCar: Car = car
    @ObservedObject var classifier: ImageClassfier = ImageClassfier()
     
    var body: some View {
     
        ZStack(alignment: .bottom){
             
            VStack{
                if self.moveToDetailView == false {
                    if self.selected == 0 {
                        GeometryReader{_ in
                            CarListView()
                        }
                    }
                    else if self.selected == 1 {
                        GeometryReader{_ in
                            
                            RecentRatingsView()
                        }
                    }
                    else {
                        GeometryReader{_ in
                            GalleryView()
                        }
                    }
                }
                else {
                    GeometryReader{_ in
                        CarDetailView(car: recognizedaCar)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $isPresenting){
                ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                    .onDisappear{
                        if uiImage != nil {
                            classifier.detect(uiImage: uiImage!)
                            print("[Debug][Image Classfier]" + (classifier.imageClass ?? "nil"))
                            getDocument(documentID: classifier.imageClass!)
                            moveToDetailView = true
                    }
                }
            }
             
            FloatingTabbar(selected: self.$selected, isPresenting: self.$isPresenting, moveToDetailView: self.$moveToDetailView)
        }
    }
    
    private func getDocument(documentID: String) {
        let db = Firestore.firestore()
        let docRef = db.collection("Cars").document(documentID)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                DispatchQueue.main.async {
                    recognizedaCar = Car(id: document.documentID,
                                  make: document["make"] as? String ?? "",
                                  model: document["model"] as? String ?? "",
                                  type: document["type"] as? String ?? "",
                                  description: document["description"] as? String ?? "",
                                  fuelConsumptionCityMin: document["fuelConsumptionCityMin"] as? Float ?? 0.0,
                                  fuelConsumptionCityMax: document["fuelConsumptionCityMax"] as? Float ?? 0.0,
                                  fuelConsumptionHighwayMin: document["fuelConsumptionHighwayMin"] as? Float ?? 0.0,
                                  fuelConsumptionHighwayMax: document["fuelConsumptionHighwayMax"] as? Float ?? 0.0,
                                  fuelConsumptionCombinedMin: document["fuelConsumptionCombinedMin"] as? Float ?? 0.0,
                                  fuelConsumptionCombinedMax: document["fuelConsumptionCombinedMax"] as? Float ?? 0.0,
                                  productionYearFrom: document["productionYearFrom"] as? Int ?? 2022,
                                  productionYearTo: document["productionYearTo"] as? Int ?? 2022,
                                  enginePowerFrom: document["enginePowerFrom"] as? Int ?? 0,
                                  enginePowerTo: document["enginePowerTo"] as? Int ?? 0,
                                  priceFrom: document["priceFrom"] as? Float ?? 0.0,
                                  priceTo: document["priceTo"] as? Float ?? 0.0
                    )
                }
            } else {
                print("Document does not exist")
            }
        }
    }
}
 
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
