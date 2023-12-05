//
//  AirbnbListingsView.swift
//  Airbnb
//
//  Created by AALA mac on 24/11/2023.
//

import SwiftUI

struct AirbnbListingsView: View {
    @StateObject var viewModel = AirbnbListingsViewViewModel()
    var body: some View {
        NavigationView {
            VStack{
                if viewModel.listings.isEmpty{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                else{
                    List(viewModel.listings){ listings in
                        NavigationLink(destination: AirbnbDetailsView(model: listings)) {
                            AirbnbListingCardView(model: listings)
                        }
                        .navigationTitle("Airbnb")
                    }
                }
            }
            
        }
        .onAppear{
            viewModel.fetchListings()
        }
        
    }
}

struct AirbnbListingsView_Previews: PreviewProvider {
    static var previews: some View {
        AirbnbListingsView()
    }
}
