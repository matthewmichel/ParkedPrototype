//
//  truckHorizontal.swift
//  Parked
//
//  Created by Matthew Michel on 8/31/19.
//  Copyright © 2019 Matthew Michel. All rights reserved.
//

import SwiftUI

struct truckHorizontal: View {
    
    var truck: TruckItem
    
    var body: some View {
        VStack(alignment: .leading) {
            truck.truckImage
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(15)
            Text(truck.truckName)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct truckHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        truckHorizontal(truck: testTruckList.truck1)
    }
}
