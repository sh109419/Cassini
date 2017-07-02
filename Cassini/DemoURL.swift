//
//  URL.swift
//
//  Created by CS193p Instructor.
//  Copyright (c) 2016 Stanford University. All rights reserved.
//

import Foundation

struct DemoURL
{
    //static let Earth = "http://is4.mzstatic.com/image/thumb/Purple69/v4/4a/db/3d/4adb3da9-e40a-cc9f-f5bd-3f33683dd1da/pr_source.png/0x0ss-85.jpg"
    
    static let Earth = "https://www.evl.uic.edu/pape/data/Earth/2048/BigEarth.jpg"
    
    static let Stanford = "http://comm.stanford.edu/wp-content/uploads/2013/01/stanford-campus.png"

    static let NASA = [
        "Cassini" : "https://upload.wikimedia.org/wikipedia/commons/b/b2/Cassini_Saturn_Orbit_Insertion.jpg",
        //"http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
        "Earth" : "https://www.evl.uic.edu/pape/data/Earth/2048/BigEarth.jpg",
            //"http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
        "Saturn" : "https://upload.wikimedia.org/wikipedia/commons/c/c7/Saturn_during_Equinox.jpg" 
        //"http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
    ]
    
    static func NASAImageNamed(_ imageName: String?) -> URL? {
        if let urlstring = NASA[imageName ?? ""] {
            return URL(string: urlstring)
        } else {
            return nil
        }
    }
}
