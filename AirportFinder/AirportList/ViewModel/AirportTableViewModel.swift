//
//  AirportTableViewModel.swift
//  AirportFinder
//
//  Created by amee on 21/05/19.
//  Copyright © 2019 amee. All rights reserved.
//

import Foundation
import CoreLocation

class AirportTableViewModel {
    
    fileprivate let airportTableNetworkDataDao: AirportTableNetworkDataDao = AirportTableNetworkDataDao()
    fileprivate var airportTableViewCellViewModelList: Array<AirportTableViewCellViewModel> = []
    fileprivate var airportList: Array<Airport>?
    
    init() {
        createCellViewModels()
    }
    
    //MARK: Table Data Source Getter
    /**
     Returns data source for drawing cells
     
     - Returns: Array of AirportTableViewCellViewModel.
     */
    func getAirportListDataSource(searchText: String) -> Array<AirportTableViewCellViewModel> {
        return searchText.isEmpty ?
            airportTableViewCellViewModelList :
            airportTableViewCellViewModelList.filter { return isPropertyContainsMatchingText(parentString: ("\($0.getCityName() ?? "")"), subString: searchText) }
    }
    
    //MARK: Create Cell View Model
    /**
     This function create list for cell view model and store into  array
     */
    private func createCellViewModels() {
        airportTableNetworkDataDao.getAirportList { [weak self] (airportList) in
            guard let airportList = airportList  else {
                UtilityHelper.showAlertView(message: kUnableToLoadJsonErrorMessage)
                return
            }
            
            guard !airportList.isEmpty else {
                UtilityHelper.showAlertView(message: kNoJsonDataAvailableMessage)
                return
            }
            
            self?.airportList = airportList
            for airport in airportList {
                let airportCellViewModel: AirportTableViewCellViewModel = AirportTableViewCellViewModel(cityName: airport.name ?? "", latitude: Double(airport.lat ?? "0") ?? 0, longitude: Double(airport.lon ?? "0") ?? 0)
                self?.airportTableViewCellViewModelList.append(airportCellViewModel)
                
                //Once JSON fully get loaded
                NotificationCenter.default.post(name: Notification.Name(rawValue: NOTIFICATION_DATASOURCE_UPDATED), object: nil)
            }
        }
    }
}

//MARK: Search Helpers
extension AirportTableViewModel {
    /**
     This method check if string contains substring or not
     
     - Parameter parentString: Main string in which we need to search.
     - Parameter subString: String which we need to search.
     - Returns: Boolean value as tru or false.
     */
    private func isPropertyContainsMatchingText(parentString: String, subString: String) -> Bool {
        let range = parentString.range(of: subString, options: .caseInsensitive)
        return range != nil
    }
}

//MARK: Near By Airports Getter
extension AirportTableViewModel {
    /**
     This method provides top five nearby airport
     
     - Parameter parentString: Main string in which we need to search.
     - Parameter subString: String which we need to search.
     - Returns: Boolean value as tru or false.
     */
    func getTopFiveNearestAirports(lat: Double, long: Double) -> Array<Airport> {
            let selectedAirportLocation: CLLocation = CLLocation(latitude: lat, longitude: long)
            var airportWithDistance: [[Airport: Double]] = []
            airportWithDistance = airportList?.reduce([]) { distance, airport  in
                let airportLocation: CLLocation = CLLocation(latitude: Double(airport.lat ?? "0") ?? 0, longitude: Double(airport.lon ?? "0") ?? 0)
                let distance = selectedAirportLocation.distance(from: airportLocation)
                airportWithDistance.append([airport: distance])
                return airportWithDistance
                } ?? []
            let sortedAirportWithDistance = airportWithDistance.sorted { $0.values.first ?? 0 < $1.values.first ?? 0 }
            let keys = sortedAirportWithDistance.map { $0.first?.key }
            let slice = keys.dropFirst().prefix(5)  //Dropping first as it is self Airport
            return Array(slice) as? [Airport] ?? []
    }
    
}
