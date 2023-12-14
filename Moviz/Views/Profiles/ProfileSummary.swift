//
//  ProfileSummary.swift
//  Moviz
//
//  Created by charlene hoareau on 13/12/2023.
//

import SwiftUI

struct ProfileSummary: View {
    var profile: Profile

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                Text("Hello \(profile.username)")
                    .bold()
                    .font(.title)
                    .padding(.top, 50)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                    Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                    Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                }
                .padding(.top, 50)
                .padding(.horizontal,20)
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .preferredColorScheme(.dark)

    }
}
