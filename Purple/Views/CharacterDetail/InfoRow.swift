//
//  InfoRow.swift
//  Purple
//
//  Created by Work on 27.07.2023.
//

import SwiftUI

// Custom Info Row
struct InfoRow: View {
    var label: String
    var icon: String
    var value: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color(uiColor: .label))
            Text(label + ":")
                .fontWeight(.semibold)
            Text(value)
        }
        
    }
}
