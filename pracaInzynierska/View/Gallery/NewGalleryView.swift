//
//  NewGalleryView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/27/22.
//

import SwiftUI

struct NewGalleryView: View {
    let colors = AppColors()
    
    var body: some View {
    
        VStack(alignment: .leading){
            Spacer()
            HStack{
                VStack(alignment: .leading){
                    Text("Title")
                    Text("description")
                }
                
                Spacer()
                
                NavigationLink {
                    AddImageToGallery()
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .frame(maxWidth: 50.0, maxHeight: 50.0)
                        .foregroundColor(colors.darkGrey)

                }
            }.padding(20)
                .frame(width: UIScreen.main.bounds.width, height: getStackTwoHeight(), alignment: .center)
                        
            VStack{
                Text("Images taken by users")
                    .padding()
                    .foregroundColor(.white)
                ScrollView{
                    VStack{
//                        HStack(alignment: .center){
//                            NavigationLink(destination: PhotoFullScreenView(image: <#UIImage#>)) {
//                                Image("bmwg30")
//                                    .resizable()
//                                    .frame(width: 120, height: 100)
//                                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
//                            }
//                            
//                            Spacer()
//                            VStack(alignment: .trailing, spacing: 7){
//                                Text("BMW Series 5 2016")
//                                Text("22.11.2022")
//                                //Text(String(Date.now))
//                                Spacer()
//                            }.padding(.vertical)
//                            
//                        }.padding()
                    }.background(colors.lightGrey)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
                        .padding()
                        .frame(height: 160)
                        
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: getStackOneHeight(), alignment: .top)
            .background(colors.darkGrey)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .ignoresSafeArea(edges: .bottom)
        }
    }
    
    func getStackOneHeight() -> CGFloat {
        return (UIScreen.main.bounds.height * 0.80)
    }
    
    func getStackTwoHeight() -> CGFloat {
        return (UIScreen.main.bounds.height * 0.20)
    }
}

struct NewGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        NewGalleryView()
    }
}
