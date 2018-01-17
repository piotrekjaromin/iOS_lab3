//
//  FaceDetectedData.swift
//  iOS_lab3
//
//  Created by Admin on 17/01/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class FaceDetectedData {
    var path: String;
    var numberOfFaces: String;
    
    init(path: String, numberOfFaces: String) {
        self.path = path;
        self.numberOfFaces = numberOfFaces;
    }
}
