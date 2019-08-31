//
//  Truck.swift
//  MySampleApp
//
//
// Copyright 2019 Amazon.com, Inc. or its affiliates (Amazon). All Rights Reserved.
//
// Code generated by AWS Mobile Hub. Amazon gives unlimited permission to 
// copy, distribute and modify it.
//
// Source code generated from template: aws-my-sample-app-ios-swift v0.21
//

import Foundation
import UIKit
import AWSDynamoDB
import SwiftUI
import MapKit

class Truck: AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    
    @objc var _truckID: String?
    @objc var _truckFoodType: String?
    @objc var _truckLatitude: String?
    @objc var _truckLongitude: String?
    @objc var _truckName: String?
    @objc var _truckPricing: String?
    
    class func dynamoDBTableName() -> String {

        return "parked-mobilehub-74568133-Truck"
    }
    
    class func hashKeyAttribute() -> String {

        return "_truckID"
    }
    
    override class func jsonKeyPathsByPropertyKey() -> [AnyHashable: Any] {
        return [
               "_truckID" : "truckID",
               "_truckFoodType" : "truckFoodType",
               "_truckLatitude" : "truckLatitude",
               "_truckLongitude" : "truckLongitude",
               "_truckName" : "truckName",
               "_truckPricing" : "truckPricing",
        ]
    }
}

struct TruckItem: Identifiable {
    var id: String
    var truckFoodType: String
    var truckLatitude: Double
    var truckLongitude: Double
    var truckName: String
    var truckPricing: String
    var truckImage: Image
    
    init(TruckID: String, TruckFoodType: String, TruckLongitude: Double, TruckLatitude: Double, TruckName: String, TruckPricing: String, TruckImage: Image) {
        id = TruckID
        truckFoodType = TruckFoodType
        truckLongitude = TruckLongitude
        truckLatitude = TruckLatitude
        truckName = TruckName
        truckPricing = TruckPricing
        truckImage = TruckImage
    }
    
    func prepareForDynamo() -> Truck {
        let newTruck = Truck()
        newTruck?._truckID = id
        newTruck?._truckFoodType = truckFoodType
        newTruck?._truckLatitude = String(truckLatitude)
        newTruck?._truckLongitude = String(truckLongitude)
        newTruck?._truckName = truckName
        newTruck?._truckPricing = truckPricing
        
        return newTruck!
    }
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: truckLatitude, longitude: truckLongitude)
    }
    
}
