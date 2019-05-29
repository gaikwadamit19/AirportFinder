//
//  JSONHelper.swift
//  AirportFinder
//
//  Created by amee on 21/05/19.
//  Copyright © 2019 amee. All rights reserved.
//

import Foundation

struct JSONHelper {
    
    /**
     This method returns array containing Airport structure
     
     - Parameter filePath: file path from which json need to read.
     - Parameter isBundleFile: if true, search file into bundle else directly use path considering as server file path.
     - Returns: Array of Airport objects.
     */
    static func loadJson(filePath: String, isBundleFile: Bool = false, completionHandler: @escaping ([Airport]?) -> Void) {
        
        guard let jsonUrl = isBundleFile ? Bundle.main.url(forResource: filePath, withExtension: nil) :  URL(string: filePath) else {
            completionHandler(nil)
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            let decoder = JSONDecoder()
            do {
                let jsonData: Data = try Data(contentsOf: jsonUrl)
                let airportDataArray: Array<Airport> = try decoder.decode([Airport].self, from: jsonData)
                completionHandler(airportDataArray)
            } catch {
                completionHandler([])
            }
        }
    }
}
