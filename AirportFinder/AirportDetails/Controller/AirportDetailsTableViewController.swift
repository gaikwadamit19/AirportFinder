//
//  AirportDetailsViewController.swift
//  AirportFinder
//
//  Created by amee on 22/05/19.
//  Copyright © 2019 amee. All rights reserved.
//

import UIKit

class AirportDetailsTableViewController: UIViewController {

    @IBOutlet weak var airportListTableView: UITableView?
    private var airportDetailsTableViewModel: AirportDetailsTableViewModel?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ScreenTitles.Detail
    }
    
    /**
     This method sets model data for Nearby Airport
     
     - Parameter: airports: Array list
     */
    func setTopFiveNearbyAirport(airports: [Airport]) {
        airportDetailsTableViewModel = AirportDetailsTableViewModel(airports: airports)
    }
}

//MARK: TableViewDatasource
extension AirportDetailsTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airportDetailsTableViewModel?.getAirportListDataSource().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: Identifires.AirportTableView, for: indexPath)
        (tableViewCell as? AirportDetailsTableViewCell)?.configureView(cellViewModel: airportDetailsTableViewModel?.getAirportListDataSource()[indexPath.row])
        return tableViewCell
    }
}

//MARK: TableViewDelegate
extension AirportDetailsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
