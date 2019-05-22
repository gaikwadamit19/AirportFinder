//
//  AirporteTableViewCell.swift
//  AirportFinder
//
//  Created by amee on 21/05/19.
//  Copyright © 2019 amee. All rights reserved.
//

import UIKit

class  AirporteTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var cityNameLabel: UILabel?
    
    //MARK: Configure View
    /**
     This method configure the view for setting images and texts
     
     - Parameter cellViewModel: view model which is responsible for managing that view.
     */
    func configureView(cellViewModel: AirportTableViewCellViewModel) {
        cityNameLabel?.text = cellViewModel.getCityName()
    }
}
