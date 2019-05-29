//
//  Constant.swift
//  AirportFinder
//
//  Created by amee on 21/05/19.
//  Copyright © 2019 amee. All rights reserved.
//


//MARK: Airport Model Constants
let kWoeId: String = "woeid"

//MARK: Notification
let NOTIFICATION_DATASOURCE_UPDATED = "DATASOURCE_UPDATE"

//MARK: JSON Data
struct FilePath {
    static let AirportServer: String = "https://gist.githubusercontent.com/tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588/airports.json"
    static let AirportBundle: String = "Airports.txt"
}

//MARK: Screen Title
struct ScreenTitles {
    static let Search: String = "Search Airport"
    static let Detail: String = "Near By Airport"
}

//MARK: Cell Identifires
struct Identifires {
    static let AirportTableView = "AirportTableViewCellIdentifire"
    static let DetailSegue: String = "DetailSegueIdentifire"
}

//MARK: Cell Labels
struct CellLabels {
    static let AirportName: String = "Airport Name:"
    static let RunwayLenght: String = "Runway Lenght:"
    static let CountryName: String = "Country Name:"
    static let NotAvailable: String = "Not Available"
}

//MARK: Alert Utility
struct AlertStrings {
    static let Alert: String = "Alert"
    static let AlertButton: String = "OK"
    static let UnableToLoadJsonErrorMessage: String = "Sorry!! Unable to load Airport Data. Please try again later"
    static let NoJsonDataAvailableMessage: String = "Sorry!! No data available. Please try again later"
}
