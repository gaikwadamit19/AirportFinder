//
//  AirportDetailsTableCellViewModel.swift
//  AirportFinder
//
//  Created by amee on 22/05/19.
//  Copyright © 2019 amee. All rights reserved.
//

import UIKit

class AirportDetailsTableCellViewModel {
    
    private var airportName: String?
    private var airportRunwayLenght: String?
    private var airportCity: String?
    
    init(airportName: String?, airportRunwayLenght: String?, airportCity: String?) {
        self.airportName = airportName
        self.airportRunwayLenght = airportRunwayLenght
        self.airportCity = airportCity
    }
    
    //MARK: Getters property
    /**
     This method provides Airport Name for cell view model
     
     - Returns: Airport Name string value
     */
    func getAirportName() -> String? {
        return airportName
    }
    
    //MARK: Getters property
    /**
     This method provides Airport Runway Lenght for cell view model
     
     - Returns: Runway Lenght string value
     */
    func getAirportRunwayLenght() -> String? {
        return airportRunwayLenght
    }

    //MARK: Getters property
    /**
     This method provides Airport City Name for cell view model
     
     - Returns: City Name string value
     */
    func getAirportCity() -> String? {
        return airportCity
    }
}
