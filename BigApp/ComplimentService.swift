//
//  ComplimentService.swift
//  BigApp
//
//  Created by Hugh Jarvis on 14/11/2019.
//  Copyright © 2019 Hugh. All rights reserved.
//

import Foundation


class ComplimentService {
    
    
    
    func getCompliment() -> Void {
        
        
        //only using force unwrap because I know hard-coded url is correct
        let url = URL(string: "https://bigappyourselfspring.herokuapp.com/compliment")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: {data, response, error in
            
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }

            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                if let compliment = json?["content"] as? String {
                    print(compliment)
                    
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
            
        })
    
        task.resume()
        
    }
    
    
}
