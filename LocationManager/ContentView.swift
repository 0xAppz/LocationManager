//
//  ContentView.swift
//  WeatherApp
//
//  Created by Bahalek on 2021-12-24.
//
import SwiftUI
import MapKit



struct ContentView: View {
    @StateObject  var viewModel = ContentViewModel()
    @State private var weatherAPIClient = WeatherAPIClient()
    
    
    
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
            }
        
        if let currentWeather = weatherAPIClient.currentWeather  {
            VStack {
                currentWeather.weatherCode.image
                    .font(.system(size: 180))
                Text("\(currentWeather.temperature)º")
                    .font(.system(size: 44, weight: .medium, design: .default))
                    .foregroundColor(   .white)
                
            }
            Text(currentWeather.weatherCode.description)
                .font(.body)
                .multilineTextAlignment(.center)
            }
    }
final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
            
            @Published var region = MKCoordinateRegion(center:
                                                        CLLocationCoordinate2D(latitude: 33.7222, longitude: -116.3745), span: MKCoordinateSpan(latitudeDelta: 0.05 , longitudeDelta: 0.05))
            
            
            var locationManager: CLLocationManager?
            func checkIfLocationServicesIsEnabled() {
                if CLLocationManager.locationServicesEnabled() {
                    locationManager = CLLocationManager()
                    locationManager!.delegate = self
                    
                } else {
                    print("Show an alert letting them know if this is on and to go turn it on.")
                }
                
                func checkLocationAuthorization() {
                    guard let locationManager = locationManager else { return }
                    
                    switch locationManager.authorizationStatus {
                        
                    case .notDetermined:
                        locationManager.requestWhenInUseAuthorization()
                    case .restricted:
                        print("Your location is restricted likely due to parental controls.")
                    case .denied:
                        print("You have denied app location permission.")
                    case .authorizedAlways, .authorizedWhenInUse:
                        region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05 , longitudeDelta: 0.05))
                    @unknown default:
                        break
                    }
                    
                    
                }
                
                
                func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
                    checkLocationAuthorization()
    
    
    
    
    
    
    
    
    
    }
        
    }
    
        

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
        }
        
    }
    
    


