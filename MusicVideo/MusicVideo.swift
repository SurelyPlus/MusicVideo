//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Helge Fahlbusch on 05.06.16.
//  Copyright © 2016 Helge Fahlbusch. All rights reserved.
//

import Foundation

class Videos {
    
    fileprivate var _vName:String
    fileprivate var _vRights:String
    fileprivate var _vPrice:String
    fileprivate var _vImageUrl:String
    fileprivate var _vArtist:String
    fileprivate var _vVideoUrl:String
    fileprivate var _vImid:String
    fileprivate var _vGenre:String
    fileprivate var _vLinkToiTunes:String
    fileprivate var _vReleaseDate:String
    
    var vImageData: Data?
    
    var vName:String {
        return _vName
    }
    
    var vRights:String {
        return _vRights
    }
    
    var vPrice:String {
        return _vPrice
    }
    
    var vImageUrl:String {
        return _vImageUrl
    }
    
    var vArtist:String {
        return _vArtist
    }
    
    var vVideoUrl:String {
        return _vVideoUrl
    }
    
    var vImid:String {
        return _vImid
    }
    
    var vGenre:String{
        return _vGenre
    }
    
    var vLinkToiTunes:String {
        return _vLinkToiTunes
    }
    
    var vReleaseDate:String {
        return _vReleaseDate
    }
    
    
    init (data: JSONDictionary) {
        if let name = data["im:name"] as? JSONDictionary,
            let vName = name["label"] as? String {
            self._vName = vName
        } else {
            _vName = ""
        }
        
        if let rights = data["rights"] as? JSONDictionary,
            let rightsLabel = rights["label"] as? String {
            self._vRights = rightsLabel
        } else {
            self._vRights = ""
        }
        
        if let price = data["im:price"] as? JSONDictionary,
            let vPrice = price["label"] as? String {
            self._vPrice = vPrice
        } else {
            self._vPrice = ""
        }
        
        if let img = data["im:image"] as? JSONArray,
            let image = img[2] as? JSONDictionary,
            let immage = image["label"] as? String {
            _vImageUrl = immage.replacingOccurrences(of: "100x100", with: "600x600")
        } else {
            _vImageUrl = ""
        }
        
        if let artist = data["im:artist"] as? JSONDictionary,
            let vArtist = artist["label"] as? String {
            self._vArtist = vArtist
        } else {
            self._vArtist = ""
        }
        
        if let video = data["link"] as? JSONArray,
            let vUrl = video[1] as? JSONDictionary,
            let vHref = vUrl["attributes"] as? JSONDictionary,
            let vVideoUrl = vHref["href"] as? String {
                self._vVideoUrl = vVideoUrl
        
        } else {
            _vVideoUrl = ""
        }
        
        if let imid = data["id"] as? JSONDictionary,
            let vid = imid["attibutes"] as? JSONDictionary,
            let vImid = vid["im:id"] as? String {
            self._vImid = vImid
        } else {
            _vImid = ""
        }
        
        if let genre = data["category"] as? JSONDictionary,
            let rel2 = genre["attributes"] as? JSONDictionary,
            let vGenre = rel2["term"] as? String {
            self._vGenre = vGenre
        } else {
            _vGenre = ""
        }
        
        if let link = data["id"] as? JSONDictionary,
            let vLinkToiTunes = link["label"] as? String {
            self._vLinkToiTunes = vLinkToiTunes
        } else {
            _vLinkToiTunes = ""
        }
        if let release2 = data["im:releaseDate"] as? JSONDictionary,
            let rel2 = release2["attributes"] as? JSONDictionary,
            let vReleaseDate = rel2["label"] as? String {
            self._vReleaseDate = vReleaseDate
        } else {
            _vReleaseDate = ""
        }
    }
}
