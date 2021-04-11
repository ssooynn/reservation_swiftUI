//
//  MapView.swift
//  reservation_swiftUI
//
//  Created by 이수연 on 2020/06/17.
//  Copyright © 2020 이수연. All rights reserved.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
    
  @Binding var checkpoints: [Checkpoint]
  
  var locationManager = CLLocationManager()
    
  func setupManager() {
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestAlwaysAuthorization()
  }
  
  func makeUIView(context: Context) -> MKMapView {
    setupManager()
    let mapView = MKMapView(frame: UIScreen.main.bounds)
    mapView.showsUserLocation = true
    mapView.userTrackingMode = .follow
    return mapView
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    uiView.addAnnotations(checkpoints)
  }
}

final class Checkpoint: NSObject, MKAnnotation {
  let title: String?
  let coordinate: CLLocationCoordinate2D
  
  init(title: String?, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.coordinate = coordinate
  }
}
