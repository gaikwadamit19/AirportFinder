//
//  AirportDetailsViewModel.swift
//  AirportFinder
//
//  Created by amee on 22/05/19.
//  Copyright © 2019 amee. All rights reserved.
//

import UIKit

class AirportDetailsTableViewModel {
    
    private let airporterTableModel: AirportDetailsTableModel?
    private var airportTableViewCellViewModelList: Array<AirportDetailsTableCellViewModel> = []

    init(airports: Array<Airport>) {
        airporterTableModel = AirportDetailsTableModel(airports: airports)
        createCellViewModels()
    }
    
    //MARK: Data Source Get
    /**
     This function returns data source for drawing cells
     
     - Returns: Array of AirportTableViewCellViewModel.
     */
    func getAirportListDataSource() -> Array<AirportDetailsTableCellViewModel> {
        return airportTableViewCellViewModelList
    }
    
    //MARK: Data Source Create
    /**
     This function create list for cell view model and store into  array
     */
    private func createCellViewModels() {
        for airport in airporterTableModel?.getTopFiveNearestAirports() ?? [] {
            let airportDetailsCellViewModel: AirportDetailsTableCellViewModel = AirportDetailsTableCellViewModel(airportName: airport.name, airportRunwayLenght: airport.runway_length, airportCity: airport.city)
            airportTableViewCellViewModelList.append(airportDetailsCellViewModel)
        }
    }
}
