//
//  DownloadTableTableViewController.swift
//  iOS_lab3
//
//  Created by Admin on 15/01/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class DownloadTableTableViewController: UITableViewController, URLSessionDownloadDelegate{
    
    var filesStatus: [FileStatus] = []
    
    @IBAction func startDownload(_ sender: UIBarButtonItem) {
        downloadPhoto(url: "https://upload.wikimedia.org/wikipedia/commons/0/04/Dyck,_Anthony_van_-_Family_Portrait.jpg")
        downloadPhoto(url: "https://upload.wikimedia.org/wikipedia/commons/c/ce/Petrus_Christus_-_Portrait_of_a_Young_Woman_-_Google_Art_Project.jpg")
        downloadPhoto(url: "https://upload.wikimedia.org/wikipedia/commons/3/36/Quentin_Matsys_-_A_Grotesque_old_woman.jpg")
        downloadPhoto(url: "https://upload.wikimedia.org/wikipedia/commons/c/c8/Valmy_Battle_painting.jpg")
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    func downloadPhoto(url: String) {
        print("1 \(url)");
        let imageURL: URL = URL(string: url)!
        let config = URLSessionConfiguration.background(withIdentifier: String(url))
        config.sessionSendsLaunchEvents = true
        config.isDiscretionary = true
        let session = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        let task = session.downloadTask(with: imageURL)
        task.resume()
        let fileName = String(describing: url).components(separatedBy: "/").last!
        filesStatus.append(FileStatus(filename: fileName, progress: "Downloading, 0% done...", task: task))
        
    }
    
    public func urlSession(_ session: URLSession,
                           downloadTask: URLSessionDownloadTask,   didFinishDownloadingTo location: URL) {
        print(location)
        
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let url = downloadTask.currentRequest!.url!
        
        let fileName = String(describing: url).components(separatedBy: "/").last!
        
        
        let dowloadedFilePath = URL(fileURLWithPath: docDir.appending("/\(fileName)"));
        print(dowloadedFilePath)
        let fileManager = FileManager.default
        
        do {
         try fileManager.moveItem(at: location, to: dowloadedFilePath)
        } catch {
            let err = error as NSError
            print(err)
        }
        
        for i in 0 ..< self.filesStatus.count {
            let filename = String(self.filesStatus[i].filename)
            if filename == String(describing: url).components(separatedBy: "/").last! {
                self.filesStatus[i].progress = "Downloading finished."
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
    
    public func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64){
        
        let url = downloadTask.currentRequest!.url!
        let downloadStatus = Double(totalBytesWritten)/Double(totalBytesExpectedToWrite);
        
        
        
        for i in 0 ..< self.filesStatus.count {
            let filename = String(self.filesStatus[i].filename)
            if filename == String(describing: url).components(separatedBy: "/").last! {
                self.filesStatus[i].progress = "Downloading, \(Int(downloadStatus * 100))% done..."
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filesStatus.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "DownloadTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DownloadTableViewCell
        
        let fileStatus = self.filesStatus[indexPath.row]
        cell.fileName.text = fileStatus.filename;
        cell.progress.text = String(fileStatus.progress)


        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
