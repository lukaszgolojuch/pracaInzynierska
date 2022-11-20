//
//  CarListView.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct CarListView: View {
    
    @ObservedObject var carListVM = CarListViewModel()
    
    
    init() {
        carListVM.fetchCarData()
    }
    
    var body: some View {
//        VStack{
//            ScrollView(.horizontal) {
//                ScrollViewReader { proxy in
//                    HStack(spacing: 20) {
//                        ForEach(carListVM.cars, id: \.id) { carObject in
//                            HeaderStackView(carObject: carObject)
//                                .padding()
//                                .id(carObject)
//                        }
//                    }
//                }
//            }
//            Spacer()
//        }.onAppear {
//            UIScrollView.appearance().isPagingEnabled = true
//        }
//        .onDisappear {
//            UIScrollView.appearance().isPagingEnabled = false
//        }
        
//        TrackableScrollView(.vertical, showIndicators: false, contentOffset: $scrollViewContentOffset) {
//                            Text("\(scrollViewContentOffset)")
//                                    .onChange(of: scrollViewContentOffset, perform: { value in
//                                                print("scrollViewContentOffset", scrollViewContentOffset)
//                                                // Do something
//                                    })
//                }
    }
}

struct CarListView_Previews: PreviewProvider {
    static var previews: some View {
        CarListView()
    }
}
