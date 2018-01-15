//
//  FileStatus.swift
//  iOS_lab3
//
//  Created by Admin on 15/01/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation

class FileStatus {
    var filename: String;
    var progress: Double;
    
    init(filename: String, progress: Double) {
        self.filename = filename;
        self.progress = progress;
    }
}
