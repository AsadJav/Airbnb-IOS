//
//  AirbnbDetailsView.swift
//  Airbnb
//
//  Created by AALA mac on 24/11/2023.
//

import SwiftUI

struct AirbnbDetailsView: View {
    public let model: AirbnbListing
    var body: some View {
        VStack(alignment: .leading){
            GeometryReader { proxy in
                ScrollView(.vertical){
                    AsyncImage(url: URL(string: model.xl_picture_url ?? ""))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: proxy.frame(in: .global).width,height: proxy.frame(in: .global).width)
                        .clipped()
                
                    Text("Name: \(model.name ?? "")")
                        .bold()
                        .padding()
                    if let price = model.price{
                        Text("Nightly Rate \(price.formatted(.currency(code: "USD")))")
                    }
                    Text("Description: \(model.description ?? "")")
                        .padding()
                    Text("Summary: \(model.summary ?? "")")
                        .padding()
                    Text("House Rules: \(model.house_rules ?? "")")
                        .padding()
                    Text("Space: \(model.space ?? "")")
                        .padding()
                    Text("About your Host:")
                        .bold()
                        .padding()
                    
                    HStack{
                        AsyncImage(url: URL(string: model.host_thumbnail_url ?? ""))
                            .frame(width: 75,height: 75)
                            .aspectRatio( contentMode: .fill)
                            .clipShape(Circle())
                        Text(model.host_name)
                            .bold()
                            .padding()
                    }
                    .padding()
                    Text("Hosting Since: \(model.host_since)")
                        .padding()
                }
                .frame(maxWidth: proxy.frame(in: .global).width)
            }
        }
        .navigationTitle(model.name ?? "Listing")
    }
}

//struct AirbnbDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AirbnbDetailsView(model: )
//    }
//}
