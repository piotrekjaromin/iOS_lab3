//
//  ViewController.swift
//  iOS_lab3
//
//  Created by Admin on 14/01/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {
	
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                downloadPhoto()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

    
    func downloadAsync() {
        let queue = DispatchQueue(label: "pl.edu.agh.kis.queue1")
        
        queue.async {
            for i in 1..<100 {
                print("1 \(i)")
            }
            
            for j in 1..<100 {
                print("2 \(j)")
            }
        }
    }
    
    func downloadPhoto() {
        print("1");
        let imageURL: URL =
            URL(string: "https://upload.wikimedia.org/wikipedia/commons/0/04/Dyck,_Anthony_van_-_Family_Portrait.jpg")!
        let config = URLSessionConfiguration.background(
            withIdentifier: "pl.edu.agh.kis.bgDownload")
        print("2");
        config.sessionSendsLaunchEvents = true
        config.isDiscretionary = true
        print("3");
        let session = URLSession(configuration: config, delegate: self,
                                 delegateQueue: OperationQueue.main)
        print("4");
        let task = session.downloadTask(with: imageURL)
        print("5");
        task.resume()

    }
    
    public func urlSession(_ session: URLSession,
                           downloadTask: URLSessionDownloadTask,   didFinishDownloadingTo location: URL) {
        print("7")
        print(location)
    }


    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64){


        let url = downloadTask.currentRequest?.url
        let downloadRatio = Double(totalBytesWritten)/Double(totalBytesExpectedToWrite);
        //self.updateTask(downloadTask: downloadTask, desc: "Downloaded \(Int(round(downloadRatio*100)))%")
        
        print(downloadRatio)
        
        
        
    }
}




