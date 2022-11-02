//
//  StarViews.swift
//  pracaInzynierska
//
//  Created by Łukasz Gołojuch on 11/2/22.
//

import SwiftUI

struct StarViews {
    func numberOfStarsView(numberOfStars: Int) -> AnyView {
        switch numberOfStars {
        case 1:
            return AnyView(OneStar())
        case 2:
            return AnyView(TwoStars())
        case 3:
            return AnyView(ThreeStars())
        case 4:
            return AnyView(FourStars())
        default:
            return AnyView(FiveStars())
        }
    }
}

struct OneStar : View {
    var body: some View {
        HStack{
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star")
                .labelStyle(.iconOnly)
        }
    }
}

struct TwoStars : View {
    var body: some View {
        HStack{
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star")
                .labelStyle(.iconOnly)
        }
    }
}

struct ThreeStars : View {
    var body: some View {
        HStack{
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star")
                .labelStyle(.iconOnly)
        }
    }
}

struct FourStars : View {
    var body: some View {
        HStack{
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star")
                .labelStyle(.iconOnly)
        }
    }
}

struct FiveStars : View {
    var body: some View {
        HStack{
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
            Label("", systemImage: "star.fill")
                .labelStyle(.iconOnly)
        }
    }
}
