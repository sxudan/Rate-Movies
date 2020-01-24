//
//  MyHttp.swift
//  Rate Movies
//
//  Created by Sudan Suwal on 1/24/20.
//  Copyright © 2020 Sudan Suwal. All rights reserved.
//

import Foundation

class MyHttp{
    func fetchMovies() throws ->[Movie]{
        var movies = [Movie]()
         if let path = Bundle.main.path(forResource: "movies", ofType: "json") {
             do {
                   let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                if let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String:Any],let mov = jsonResult["movies"] as? [[String:Any]]{
                    
                    for x in mov{
                        let moviedata = Movie()
                        moviedata.title = x["title"] as? String ?? ""
                        moviedata.genre = x["genre"] as? [String] ?? []
                        moviedata.rating = x["rating"] as? Int ?? 0
                        moviedata.image = x["image"] as? String ?? ""
                        
                        movies.append(moviedata)
                    }
                    return movies
                }else{
                    throw MyHttpError.InvalidJson
                }
                
               } catch {
                throw MyHttpError.InvalidJson
               }
         }else{
             return movies
         }
     }
}

enum MyHttpError: Error {
    case InvalidJson
}
