//
//  AirportTableViewController.swift
//  AirportFinder
//
//  Created by amee on 21/05/19.
//  Copyright © 2019 amee. All rights reserved.
//

import UIKit

class AirportTableViewController: UIViewController {

    @IBOutlet weak var airportListTableView: UITableView?
    @IBOutlet weak var airportListSearchBar: UISearchBar?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    private let airportTableViewModel: AirportTableViewModel = AirportTableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = kSearchScreenTitle
        
        //Notification on favorite updated
        NotificationCenter.default.addObserver(self, selector: #selector(airportDataUpdated), name: Notification.Name(NOTIFICATION_DATASOURCE_UPDATED), object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == kDetailSegueIdentifire else {
            return
        }
        let cellViewModelList: Array<AirportTableViewCellViewModel> = airportTableViewModel.getAirportListDataSource(searchText: airportListSearchBar?.text ?? "")
        if let viewController: AirportDetailsTableViewController = segue.destination as? AirportDetailsTableViewController, let indexPath = sender as? IndexPath, !cellViewModelList.isEmpty {
            let airportCellViewModel: AirportTableViewCellViewModel = cellViewModelList[indexPath.row]
            viewController.setTopFiveNearbyAirport(airports: airportTableViewModel.getTopFiveNearestAirports(lat: airportCellViewModel.getLatitude(), long: airportCellViewModel.getLongitude()))            
        }
    }
    
    /**
     This method updates the Datasource when any save operation with Database
     */
    @objc private func airportDataUpdated() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator?.stopAnimating()
            self?.airportListTableView?.reloadData()
        }
    }
}

//MARK: TableViewDatasource
extension AirportTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airportTableViewModel.getAirportListDataSource(searchText: airportListSearchBar?.text ?? "").count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: kAirportTableViewCellIdentifire, for: indexPath)
        (tableViewCell as? AirporteTableViewCell)?.configureView(cellViewModel: airportTableViewModel.getAirportListDataSource(searchText: airportListSearchBar?.text ?? "")[indexPath.row])
        return tableViewCell
    }
}

//MARK: TableViewDelegate
extension AirportTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: kDetailSegueIdentifire, sender: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: Search
extension AirportTableViewController: UISearchBarDelegate {
    
    /**
     This delegate Method handles cancel button action and clear search UI
     */
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        airportListTableView?.reloadData()
    }
    
    /**
     This delegate Method hit get called for each character change
     */
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        airportListTableView?.reloadData()
    }
    
    /**
     This delegate Method returns the keyboard on selection of keyboard Done button
     */
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}