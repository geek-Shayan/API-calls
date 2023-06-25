//
//  APIHandlerUS.swift
//  API calls
//
//  Created by MD. SHAYANUL HAQ SADI on 18/5/23.
//

import UIKit


class APIHandlerUS {
    
    static let sharedInstance = APIHandlerUS()
    

    
    func getData(handler: @escaping (_ apiData: MyResults) ->(Void)) {
        
        let url = "https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400"
        
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            
            // have data
            
            var results: Response?
            
            do {
                results = try JSONDecoder().decode(Response.self, from: data)
            } catch  {
                print("failed \(error.localizedDescription)")
            }
            
            
            guard let json = results else {
                return
            }
            
            print("status",json)
//            print("status",json.status)
//            print("sunset",json.results.sunset)
//            print("sunrise",json.results.sunrise)
//            print("dayLength",json.results.dayLength)
//            print("results",json.results)
            
            //closure calling
            handler(json.results)

            
        })
        
        task.resume()
    }
}




struct Response: Codable {
    let results: MyResults
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case status = "status"
    }
}

// MARK: - Results
struct MyResults: Codable {
    
    let sunrise: String
    let sunset: String
    let solarNoon: String
    let dayLength: String
    let civilTwilightBegin: String
    let civilTwilightEnd: String
    let nauticalTwilightBegin: String
    let nauticalTwilightEnd: String
    let astronomicalTwilightBegin: String
    let astronomicalTwilightEnd: String

    
    enum CodingKeys: String, CodingKey {
        case sunrise = "sunrise"
        case sunset = "sunset"
        case solarNoon = "solar_noon"
        case dayLength = "day_length"
        case civilTwilightBegin = "civil_twilight_begin"
        case civilTwilightEnd = "civil_twilight_end"
        case nauticalTwilightBegin = "nautical_twilight_begin"
        case nauticalTwilightEnd = "nautical_twilight_end"
        case astronomicalTwilightBegin = "astronomical_twilight_begin"
        case astronomicalTwilightEnd = "astronomical_twilight_end"
    }
}


//https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400

//https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&date=today

//https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&date=2023-05-12

//https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400&formatted=0


//    {
//          "results":
//          {
//            "sunrise":"7:27:02 AM",
//            "sunset":"5:05:55 PM",
//            "solar_noon":"12:16:28 PM",
//            "day_length":"9:38:53",
//            "civil_twilight_begin":"6:58:14 AM",
//            "civil_twilight_end":"5:34:43 PM",
//            "nautical_twilight_begin":"6:25:47 AM",
//            "nautical_twilight_end":"6:07:10 PM",
//            "astronomical_twilight_begin":"5:54:14 AM",
//            "astronomical_twilight_end":"6:38:43 PM"
//          },
//           "status":"OK"
//    }
