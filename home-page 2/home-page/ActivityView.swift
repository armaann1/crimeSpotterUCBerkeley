//
//  ActivityView.swift
//  home-page
//
//  Created by Armaann  on 12/03/24.
//

import SwiftUI
import MapKit

struct ActivityView: View {
    @Binding var activityView: MKMapItem?
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ActivityView(activityView: .constant(nil))
}
