//
//  APIService.swift
//  Airbnb
//
//  Created by AALA mac on 24/11/2023.
//

import Foundation


final class APIService{
    
    init(){
        
    }
    
    struct Constants{
        static let apiUrl = URL(string: "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=100&refine=city%3A%22New%20York%22&refine=room_type%3A%22Entire%20home%2Fapt%22")
    }
    
    public func getListings(completion: @escaping (Result<[AirbnbListing], Error>) -> Void){

//        let url = URL(string: "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=100&refine=city%3A%22New%20York%22&refine=room_type%3A%22Entire%20home%2Fapt%22")!
//                URLSession.shared.dataTask(with: url) { data, response, error in
//                    guard let data = data else { return }
//                    do {
//                        let decodedData = try JSONDecoder().decode(AirbnbListingsResponse.self, from: data)
//                        print(decodedData)
//                    } catch {
//                        print(error)
//                    }
//                }.resume()
        
        guard let url = Constants.apiUrl else{
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in

            guard let data, error == nil else{
                if let error{
                    completion(.failure(error))
                }
                return
            }
            do{
                let response = try JSONDecoder().decode(AirbnbListingsResponse.self, from: data)
                completion(.success(response.results))
            }
            catch{
                //let json = try? JSONSerialization.jsonObject(with: data)
                //print(String(describing: json))
                print("Decoding error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
    

}
