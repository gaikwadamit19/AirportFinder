//
//  AirportDetailsTableModel.swift
//  AirportFinder
//
//  Created by amee on 22/05/19.
//  Copyright © 2019 amee. All rights reserved.
//

import Foundation

class AirportDetailsTableModel {
    
    private var topFiveNearestAirports: [Airport]?
    
    init(airports: [Airport]) {
        topFiveNearestAirports = airports
    }
    
    //MARK: Get Nearby Airport
    /**
     This method provides Five Nearby airports
     
     - Returns: Array containing list of Airport Objects.
     */

    func getTopFiveNearestAirports() -> [Airport] {
        return topFiveNearestAirports ?? []
    }
}
