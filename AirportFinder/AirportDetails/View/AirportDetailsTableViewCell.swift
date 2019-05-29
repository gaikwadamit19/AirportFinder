//
//  AirportDetailsTableViewCell.swift
//  AirportFinder
//
//  Created by amee on 22/05/19.
//  Copyright © 2019 amee. All rights reserved.
//

import UIKit

class  AirportDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var airportNameLabel: UILabel?
    @IBOutlet private weak var airportRunwayLenghtLabel: UILabel?
    @IBOutlet private weak var airportCountryNameLabel: UILabel?
    
    //MARK: Configure
    /**
     This method configure the view for setting texts to labels
     
     - Parameter cellViewModel: view model which is responsible for providing data to view.
     */
    func configureView(cellViewModel: AirportDetailsTableCellViewModel?) {
        airportNameLabel?.text = "\(CellLabels.AirportName) \(cellViewModel?.getAirportName() ?? CellLabels.NotAvailable)"
        airportRunwayLenghtLabel?.text = "\(CellLabels.RunwayLenght) \(cellViewModel?.getAirportRunwayLenght() ?? CellLabels.NotAvailable)"
        airportCountryNameLabel?.text = "\(CellLabels.CountryName) \(cellViewModel?.getAirportCity() ?? CellLabels.NotAvailable)"
    }
}
