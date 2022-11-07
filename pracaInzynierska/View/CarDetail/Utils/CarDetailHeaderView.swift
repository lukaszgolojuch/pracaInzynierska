//
//  CarDetailHeaderView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/4/22.
//

import SwiftUI

struct CarDetailHeaderView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("BMW")
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 25))
                Text("Series 5")
                    .font(.custom(
                            "Helvetica Neue",
                            fixedSize: 20))
            }
            Spacer()
            Image("BMWLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(maxWidth: 100.0, maxHeight: 100.0)
        }
    }
}

struct CarDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailHeaderView()
    }
}
