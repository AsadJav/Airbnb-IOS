//
//  AirbnbListingsResponse.swift
//  Airbnb
//
//  Created by AALA mac on 24/11/2023.
//

import Foundation


struct AirbnbListingsResponse: Codable{
    let totel_count: Int?
    let results: [AirbnbListing]
}
