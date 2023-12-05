//
//  AirbnbListingsViewViewModel.swift
//  Airbnb
//
//  Created by AALA mac on 24/11/2023.
//

import Foundation


class AirbnbListingsViewViewModel: ObservableObject{
    @Published var listings: [AirbnbListing] = []
    
    private let service = APIService()
    
    public func fetchListings(){
        service.getListings { result in
            switch result{
            case .success(let models):
                self.listings = models
            case .failure(_):
                break
            }
        }
    }
}
