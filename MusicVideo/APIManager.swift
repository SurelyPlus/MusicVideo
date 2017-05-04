//
//  APIManager.swift
//  MusicVideo
//
//  Created by Helge Fahlbusch on 05.06.16.
//  Copyright © 2016 Helge Fahlbusch. All rights reserved.
//

import Foundation

class APIManager {
    
    func loadData(_ urlString: String, completion: @escaping ([Videos]) -> Void) {
        
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        
        //let session = NSURLSession.sharedSession()
        let url = URL(string: urlString)!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) -> Void in
            
            if error != nil {
                print (error!.localizedDescription)
                /**dispatch_async(dispatch_get_main_queue()) {
                    completion(result: (error!.localizedDescription))
                }**/
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? JSONDictionary,
                        let feed = json["feed"] as? JSONDictionary,
                        let entries = feed["entry"] as? JSONArray {
                            var videos = [Videos]()
                        for entry in entries {
                            let entry = Videos(data: entry as! JSONDictionary)
                           
                            videos.append(entry)
                        }
                        let priority = DispatchQueue.GlobalQueuePriority.high
                        DispatchQueue.global(priority: priority).async {
                            DispatchQueue.main.async {
                                completion(videos)
                            }
                        }
                    }
                } catch {
                   print("error in NSJSONSerialization")
                }
            }
            
        }) 
        task.resume()
 
    }
}
