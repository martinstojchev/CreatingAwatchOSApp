//
//  LandmarkWatchDetail.swift
//  WatchLandmarks Watch App
//
//  Created by Martin Stojcev on 2023-03-06.
//  Copyright © 2023 Apple. All rights reserved.
//

import SwiftUI

struct LandmarkWatchDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                
                Divider()
                
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                
                Text(landmark.state)
                    .font(.caption)
                
                Divider()
                
                MapView(coordinate: landmark.locationCoordinate)
            }
            .padding(16)
        }
        .navigationTitle("Landmarks")
    }
}

struct LandmarkWatchDetail_Previews: PreviewProvider {

    static var previews: some View {
        let modelData = ModelData()
        
        return Group {
            LandmarkWatchDetail(landmark: modelData.landmarks[0])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 44mm")
            
            LandmarkWatchDetail(landmark: modelData.landmarks[1])
                .environmentObject(modelData)
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
