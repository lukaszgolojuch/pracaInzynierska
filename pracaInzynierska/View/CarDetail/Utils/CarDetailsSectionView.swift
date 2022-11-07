//
//  CarDetailsSectionView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/7/22.
//

import SwiftUI

struct CarDetailsSectionView: View {
    var body: some View {
        Section(header: Text("Car details")) {
            HStack {
                Text("Type:")
                    .bold()
                Text("Sedan")
            }
            HStack {
                Text("Production years:")
                    .bold()
                Text("2009 - 2018")
            }
            HStack {
                Text("Engine power:")
                    .bold()
                Text("150 - 600 hp")
            }
            HStack {
                Text("Price (new):")
                    .bold()
                Text("$25000 - $150000")
            }
        }
    }
}

struct CarDetailsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailsSectionView()
    }
}
