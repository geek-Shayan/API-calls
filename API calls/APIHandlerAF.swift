//
//  API handler AF.swift
//  API calls
//
//  Created by MD. SHAYANUL HAQ SADI on 18/5/23.
//

import Foundation
import Alamofire


class APIHandlerAF{
    
    
    static let sharedInstance = APIHandlerAF()
    
    
    func fetchingAPIData(handler: @escaping (_ apiData: [Model]) ->(Void)) {
        
        let url = "https://jsonplaceholder.typicode.com/posts"
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in
            switch response.result {
                
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode([Model].self, from: data!)
                    print(jsonData)
                    //closure calling
                    handler(jsonData)
                    
                } catch {
                    print(error.localizedDescription)
                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    func sendingPostRequest(parameters: ModelPost, handler: @escaping (_ apiData: [ModelPostResponse]) ->(Void)) {
        
        let url = "https://trains.p.rapidapi.com/"
        
        
        let headers: HTTPHeaders = [
            "content-type": "application/json",
            "X-RapidAPI-Key": "673863e70bmsha87f2365e90006ap1121dejsndbc6f2100d28",
            "X-RapidAPI-Host": "trains.p.rapidapi.com"
        ]
        
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).response { response in
            switch response.result {
                
            case .success(let data):
                do {
//                    dump(response)
                    
                    let jsonData = try JSONDecoder().decode([ModelPostResponse].self, from: data!)
//                    print(jsonData)
                    
//                    closure calling
                    handler(jsonData)
                    
//                    let json = try JSONSerialization.jsonObject(with: data!)
//                    print(json)
//
                    
                } catch {
                    print(error.localizedDescription)
                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}

// MARK: - ModelPost

struct ModelPost: Codable {
    let search: String

    enum CodingKeys: String, CodingKey {
        case search = "search"
    }
}

// only an object of the response from serialization

//{
//data =         {
//    arriveTime = "18:25 +1 night";
//    classes =             (
//        3A,
//        2A,
//        1A
//    );
//    days =             {
//        Fri = 1;
//        Mon = 1;
//        Sat = 1;
//        Sun = 1;
//        Thu = 1;
//        Tue = 1;
//        Wed = 1;
//    };
//    departTime = "06:25";
//    "from_id" = 664;
//    id = 35131;
//    "to_id" = 401;
//};
//name = "Andhra Pradesh AC SF Express";
//"train_from" = NDLS;
//"train_num" = 22416;
//"train_to" = VSKP;
//}


// MARK: - ModelPostResponse
struct ModelPostResponse: Codable {
    let trainNum: Int
    let name: String
    let trainFrom: String
    let trainTo: String
    let data: DataClass

    enum CodingKeys: String, CodingKey {
        case trainNum = "train_num"
        case name = "name"
        case trainFrom = "train_from"
        case trainTo = "train_to"
        case data = "data"
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: String
    let days: Days
    let toID: String
    let classes: [String]
    let fromID: String
    let arriveTime: String
    let departTime: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case days = "days"
        case toID = "to_id"
        case classes = "classes"
        case fromID = "from_id"
        case arriveTime = "arriveTime"
        case departTime = "departTime"
    }
}

// MARK: - Days
struct Days: Codable {
    let fri: Value
    let mon: Value
    let sat: Value
    let sun: Value
    let thu: Value
    let tue: Value
    let wed: Value

    enum CodingKeys: String, CodingKey {
        case fri = "Fri"
        case mon = "Mon"
        case sat = "Sat"
        case sun = "Sun"
        case thu = "Thu"
        case tue = "Tue"
        case wed = "Wed"
    }
}

enum Value: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Value.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Value"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}


// MARK: - Model
struct Model: Codable {
    let userID: Int
    let id: Int
    let title: String
    let body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}
