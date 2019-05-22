//
//  AirportTableNetworkDataDao.swift
//  AirportFinder
//
//  Created by amee on 22/05/19.
//  Copyright © 2019 amee. All rights reserved.
//

protocol IAirportTableNetworkDataDao {
    func getAirportList(completionHandler: @escaping (Array<Airport>?) -> Void)
}

//MARK: Fetch Data
class AirportTableNetworkDataDao: IAirportTableNetworkDataDao {
    /**
     This method provides Airport List Data loaded from Network
     
     - Returns: Airport list of type Array.
     */
    func getAirportList(completionHandler: @escaping (Array<Airport>?) -> Void) {
        // Server json file
        return JSONHelper.loadJson(filePath: kAirportServerFilePath, isBundleFile: false) { (airportList) in
            guard !(airportList?.isEmpty ?? true) else {
                completionHandler(nil)
                return
            }
            completionHandler(airportList?.filter { !($0.name?.isEmpty ?? true) } ?? [])
        }
        
        // Bundle Json file
        /*
         return JSONHelper.loadJson(filePath: kAirportBundleFileName, isBundleFile: true) { (airportList) in
         completionHandler(airportList?.filter{ !($0.name?.isEmpty ?? true) } ?? [])
         }
         */
    }
}
