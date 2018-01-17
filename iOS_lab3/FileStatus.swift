//
//  FileStatus.swift
//  iOS_lab3
//
//  Created by Admin on 15/01/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import  UIKit

class FileStatus {
    var filename: String;
    var progress: String;
    var task: URLSessionDownloadTask? = nil;
    var isHalf = false;
    var image: UIImage? = nil;
    
    init(filename: String, progress: String, task: URLSessionDownloadTask, isHalf: Bool, image: UIImage?) {
        self.filename = filename;
        self.progress = progress;
        self.task = task;
        self.isHalf = isHalf;
        self.image = image;
    }
}
