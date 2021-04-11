//
//  MapContentView.swift
//  reservation_swiftUI
//
//  Created by 이수연 on 2020/06/17.
//  Copyright © 2020 이수연. All rights reserved.
//

import SwiftUI
import MapKit

struct MapContentView: View {
    @State var checkpoints: [Checkpoint] = [
      Checkpoint(title: "우리동물병원", coordinate: .init(latitude: 37.519853, longitude: 127.024149)),
      Checkpoint(title: "우정동물병원", coordinate: .init(latitude: 37.520270, longitude: 127.022089)),
      Checkpoint(title: "나리동물병원", coordinate: .init(latitude: 37.523514, longitude: 127.019384)),
      Checkpoint(title: "사랑동물병원", coordinate: .init(latitude: 37.523179, longitude: 127.021365)),
      Checkpoint(title: "별동물병원", coordinate: .init(latitude: 37.524660, longitude: 127.019627))
    ]
    
    var body: some View {
      MapView(checkpoints: $checkpoints)
    }
}

struct MapContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapContentView()
    }
}
