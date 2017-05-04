//
//  ViewController.swift
//  MusicVideo
//
//  Created by Helge Fahlbusch on 04.06.16.
//  Copyright © 2016 Helge Fahlbusch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var videos = [Videos]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func didLoadData(_ videos: [Videos]) {
        print(reachabilityStatus)
        self.videos = videos

        
        for(index, item) in videos.enumerated() {
            print("[\(index)] name=\(item.vName)")
        }
    }

}

