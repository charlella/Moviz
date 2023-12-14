//
//  ProfileHost.swift
//  Moviz
//
//  Created by charlene hoareau on 13/12/2023.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile = Profile.default
    @Environment(\.editMode) var editMode
    @EnvironmentObject var dataManager: DataManager

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = dataManager.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                    .foregroundColor(Color.secondary)
                }
                Spacer()
                EditButton()
                    .foregroundColor(Color.primary)
            }
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: dataManager.profile)
                    //.background(Color.background)
                    
            } else {
                ProfileEditor(profile: $draftProfile)
                    .background(Color.background)
                    .onAppear {
                        draftProfile = dataManager.profile
                    }
                    .onDisappear {
                        dataManager.profile = draftProfile
                    }

            }
        }
        //.background(Color.background)
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
           .environmentObject(DataManager())
           //.preferredColorScheme(.dark)
    }
}
