//
//  ContentView.swift
//  home-page
//
//  Created by Armaann  on 03/03/24.
//

import SwiftUI
import MapKit


struct ContentView: View {
    @State private var searchText = ""
    
    let mlk = CLLocationCoordinate2D(
        latitude: 37.869320337794825,
        longitude: -122.25946205977108)
    
    let sproul = CLLocationCoordinate2D(
        latitude: 37.86949035625546,
        longitude: -122.25875603231735)
    
    let rd = CLLocationCoordinate2D(
        latitude: 37.87003566131263,
        longitude: -122.25944712067735)
    
    let bancrft = CLLocationCoordinate2D(
        latitude: 37.868528234241104,
        longitude: -122.26017707206479)

    var body: some View {
        Map(){
            Annotation("", coordinate: mlk){
                Image("marker-low-danger")
            }
            
            Annotation("", coordinate: sproul){
            }
            
            Annotation("", coordinate: rd){
                Image("marker-extreme-danger")
            }
            
            Annotation("", coordinate: bancrft){
                Image("marker-medium-danger")
            }
        }
        
        
        .overlay(alignment: .top) {
            TextField("search for a location", text: $searchText)
                .font(.subheadline)
                .padding(12.0)
                .background(.white)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .padding(.leading, 46)
                .padding()
        }
        
        .overlay(alignment: .bottomTrailing) {
                Image("ic - report")
                .padding(.top, 80)
        } //need to add some sort of padding to make it down (without changing anything else!!!)
        
        .overlay(alignment: .topTrailing) {
            Image("ic")
                .position(CGPoint(x: 362.0, y: 86.0))
        }
        .overlay(alignment: .topLeading) {
            Image("ic - menuburguer")
                .padding(.top, 23)
                .padding(.leading)
        }
        
        .mapControls {
            MapCompass()
            MapUserLocationButton()
        }
        
        ZStack(alignment: .bottomLeading, content: {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(ReportItem.sampleData) { item in
                            ReportRow(item: item)
                        }
                    }
                    .padding(.horizontal, 7)
                }
            }
            
            .overlay(alignment: .bottom) {
                Image("recents")
                    .padding(.bottom, 325)
            }
        })
        .frame(width: 400,height: 330)
    }
}

struct ReportItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let statusColor: Color
}

extension ReportItem {
    static let sampleData: [ReportItem] = [
        ReportItem(title: " Aggravated Assault with weapon", subtitle: " 02/25/24: 40 minutes ago...", statusColor: .red),
        ReportItem(title: " Robbery near RSF", subtitle: " 02/25/24: 56 minutes ago...", statusColor: .orange),
        ReportItem(title: " Homeless Man Verbally Harassing, MLK", subtitle: " 02/25/24: 40 minutes ago...", statusColor: .yellow),
        ReportItem(title: " Aggravated Assault with weapon", subtitle: " 01/25/24: a day ago...", statusColor: .red),
        ReportItem(title: " Aggravated Assault with weapon", subtitle: " 01/25/24: a day ago...", statusColor: .yellow)
    ]  // i put a space here for each of the strings.
}

struct ReportRow: View {
    let item: ReportItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 7) {
                Text(item.title)
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                    .lineLimit(2)
                    .foregroundColor(.white)
                Text(item.subtitle)
                    .font(.system(size: 13))
                    .fontWeight(.regular)
                    .lineLimit(1)
                    .foregroundColor(.white)
            }
            Spacer()
            Circle()
                .fill(item.statusColor)
                .frame(width: 60, height: 35)
        }
        .frame(height: 80)
        .background(Color(red: 20/255, green: 96/255, blue: 166/255))
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 1)
        )
    }
    
}



#Preview {
    ContentView()

}
