//
//  ImageClassfier.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/17/22.
//

import SwiftUI

class ImageClassfier: ObservableObject {
    
    @Published private var classifier = Classifier()
    
    var imageClass: String? {
        classifier.results
    }
        
    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage (image: uiImage) else { return }
        classifier.detect(ciImage: ciImage)
    }
        
}
