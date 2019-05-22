//
//  Airport.swift
//  AirportFinder
//
//  Created by amee on 22/05/19.
//  Copyright © 2019 amee. All rights reserved.
//

//Structure as per provided JSON
struct Airport : Codable, Hashable {
    var code: String?
    var lat: String?
    var lon: String?
    var name: String?
    var city: String?
    var state: String?
    var country: String?
    var woeid: String?
    var tz: String?
    var phone: String?
    var type: String?
    var email: String?
    var url: String?
    var runway_length: String?
    var elev: String?
    var icao: String?
    var direct_flights: String?
    var carriers: String?
}
