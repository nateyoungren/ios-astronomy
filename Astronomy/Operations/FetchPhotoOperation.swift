//
//  FetchPhotoOperation.swift
//  Astronomy
//
//  Created by Nathanael Youngren on 2/28/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class FetchPhotoOperation: ConcurrentOperation {
    
    var photoReference: MarsPhotoReference
    var imageData: Data?
    private var dataTask: URLSessionDataTask?
    
    init(photoReference: MarsPhotoReference) {
        self.photoReference = photoReference
    }
    
    override func start() {
        state = .isExecuting
        
        dataTask = URLSession.shared.dataTask(with: self.photoReference.imageURL.usingHTTPS!) { (data, _, error) in
            
            defer { self.state = .isFinished }
            
            if let error = error {
                NSLog("Error connecting to server: \(error)")
                return
            }
            
            guard let data = data else {
                NSLog("Error fetching data: \(NSError())")
                return
            }
            
            self.imageData = data
        }
        dataTask!.resume()
    }
    
    override func cancel() {
        dataTask!.cancel()
        super.cancel()
    }
}
