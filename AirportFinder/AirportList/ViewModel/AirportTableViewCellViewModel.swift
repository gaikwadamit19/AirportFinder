//
//  AirportTableViewCellViewModel.swift
//  AirportFinder
//
//  Created by amee on 21/05/19.
//  Copyright © 2019 amee. All rights reserved.
//

import UIKit

class AirportTableViewCellViewModel {
    
    private var cityName: String?
    private var latitude: Double
    private var longitude: Double
    
    init(cityName: String?, latitude: Double, longitude: Double) {
        self.cityName = cityName
        self.latitude = latitude
        self.longitude = longitude        
    }
    
    //MARK: Getters property
    /**
     This method provides City Name for cell view model
     
     - Returns: City Name string value
     */
    func getCityName() -> String? {
        return cityName
    }
    
    /**
     This method provides Latitude for cell view model
     
     - Returns: Latitude string value
     */
    func getLatitude() -> Double {
        return latitude
    }

    /**
     This method provides Longitude for cell view model
     
     - Returns: Longitude string value
     */
    func getLongitude() -> Double {
        return longitude
    }

}
