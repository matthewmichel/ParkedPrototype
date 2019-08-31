//
//  CircleView.swift
//  Parked
//
//  Created by Matthew Michel on 8/12/19.
//  Copyright © 2019 Matthew Michel. All rights reserved.
//


import SwiftUI

struct CircleImage: View {
    
    var truckObject: TruckItem
    
    var body: some View {
        truckObject.truckImage
            .resizable()
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            .frame(width: 175, height: 175)
    }
}

struct CircleImage_Preview: PreviewProvider {
    static var previews: some View {
        CircleImage(truckObject: testTruckList.truck1)
    }
}
