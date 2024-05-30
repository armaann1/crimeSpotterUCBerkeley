//
//  ReportButtonView.swift
//  home-page
//
//  Created by ashley fung on 3/13/24.
//

import SwiftUI

struct ReportButtonView: View {
    var body: some View {
        NavigationLink(destination: Text("Report Page")) {
            ZStack {
                Circle()
                    .fill(Color(red: 0.0, green: 0.196, blue: 0.384))
                    .frame(width: 50, height: 50)
                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                Text("📣")
                    .font(.system(size: 32))
            }
            .frame(width: 50, height: 50)
        }
    }
}
