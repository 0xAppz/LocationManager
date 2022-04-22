//
//  WeatherModel.swift
//  Check My Location
//
//  Created by Robert C on 4/2/22.
//

import Foundation
import SwiftUI



struct WeatherModel: Codable {
    let data: WeatherData
}

struct WeatherData: Codable {
    let timelines: [WeatherTimelines]
}

struct WeatherTimelines: Codable {
    let intervals: [WeatherIntervals]
}

struct WeatherIntervals: Codable {
    let startTime: String
    let values: WeatherValue
}

struct WeatherValue: Codable {
    var temperature: Double
    var weatherCode: Int
}
enum WeatherCode: String, Codable {
    case clear = "1000"
    case mostlyClear = "1100"
    case partlyCloudy = "1101"
    case mostlyCloudy = "1102"
    case cloudy = "1001"
    case fog = "2000"
    case lightFog = "2100"
    case lightWind = "3000"
    case wind = "3001"
    case strongWind = "3002"
    case drizzle = "4000"
    case rain = "4001"
    case lightRain = "4200"
    case heavyRain = "4201"
    case snow = "5000"
    case flurries = "5001"
    case lightSnow = "5100"
    case heavySnow = "5101"
    case freezingDrizzle = "6000"
    case freezingRain = "6001"
    case lightFreezingRain = "6200"
    case heavyFreezingRain = "6201"
    case icePellets = "7000"
    case heavyIcePellets = "7101"
    case lightIcePellets = "7102"
    case thunderstorm = "8000"
    
    var description: String {
        switch self {
        case .clear:
            return ""
        case .cloudy, .mostlyCloudy:
            return ""
        case .mostlyClear, .partlyCloudy:
            return ""
        case .fog, .lightFog:
            return ""
        case .lightWind:
            return ""
        case .wind, .strongWind:
            return ""
        case .drizzle, .lightRain:
            return ""
        case .rain, .heavyRain:
            return ""
        case .snow, .flurries, .lightSnow, .heavySnow:
            return ""
        case .freezingDrizzle:
            return ""
        case .freezingRain, .lightFreezingRain, .heavyFreezingRain:
            return ""
        case .icePellets:
            return ""
        case .heavyIcePellets:
            return ""
        case .lightIcePellets:
            return ""
        case .thunderstorm:
            return ""
        }
    }
    
    var image: Image {
        switch self {
        case .clear:
            return Image(systemName: "cloud.sun.fill")
                .renderingMode(.original)
        case .cloudy:
            return Image(systemName: "cloud.fill")
                .renderingMode(.original)
        case .mostlyClear, .partlyCloudy, .mostlyCloudy:
            return Image(systemName: "cloud.sun.fill")
                .renderingMode(.original)
        case .fog, .lightFog:
            return Image(systemName: "cloud.fog.fill")
                .renderingMode(.original)
        case .lightWind, .wind:
            return Image(systemName: "wind")
                .renderingMode(.original)
        case .strongWind:
            return Image(systemName: "tornado")
                .renderingMode(.original)
        case .drizzle:
            return Image(systemName: "cloud.drizzle.fill")
                .renderingMode(.original)
        case .lightRain, .rain:
            return Image(systemName: "cloud.rain.fill")
                .renderingMode(.original)
        case .heavyRain:
            return Image(systemName: "cloud.heavyrain.fill")
                .renderingMode(.original)
        case .snow, .flurries, .lightSnow, .heavySnow:
            return Image(systemName: "snow")
                .renderingMode(.original)
        case .freezingDrizzle:
            return Image(systemName: "thermometer.snowflake")
                .renderingMode(.original)
        case .freezingRain, .lightFreezingRain, .heavyFreezingRain:
            return Image(systemName: "cloud.rain.fill")
                .renderingMode(.original)
        case .icePellets, .heavyIcePellets, .lightIcePellets:
            return Image(systemName: "cloud.hail.fill")
                .renderingMode(.original)
        case .thunderstorm:
            return Image(systemName: "cloud.bolt.fill")
                .renderingMode(.original)
        }
    }
}
struct Weather: Identifiable {
    let id = UUID()
    
    let temperature: Int
    let weatherCode: WeatherCode
}
