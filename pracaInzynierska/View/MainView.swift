//
//  MainView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct MainView: View {
     
    @State var selected = 0
    @State var isPresenting: Bool = false
    @State var moveToDetailView: Bool = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @ObservedObject var classifier: ImageClassfier = ImageClassfier()
     
    var body: some View {
     
        ZStack(alignment: .bottom){
             
            VStack{
                 
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
            .edgesIgnoringSafeArea(.all)
            .sheet(isPresented: $isPresenting){
                ImagePicker(uiImage: $uiImage, isPresenting:  $isPresenting, sourceType: $sourceType)
                    .onDisappear{
                        if uiImage != nil {
                            classifier.detect(uiImage: uiImage!)
                            print("[Debug][Image Classfier]" + (classifier.imageClass ?? "nil"))
                            moveToDetailView = true
                    }
                }
            }
             
            FloatingTabbar(selected: self.$selected, isPresenting: self.$isPresenting)
            
        }
    }
}
 
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
