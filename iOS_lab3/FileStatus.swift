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
    var progress: String;
    var task: URLSessionDownloadTask? = nil;
    
    init(filename: String, progress: String, task: URLSessionDownloadTask) {
        self.filename = filename;
        self.progress = progress;
        self.task = task;
    }
}
