//
//  DatabaseHandler.swift
//  SaveImageinCoredata
//
//  Created by Mac on 25/08/23.
//

import Foundation
import CoreData
import UIKit

class DatabaseHandler {
    
    var image: UIImage?=nil
    
    func saveImage()
    {
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDe.persistentContainer.viewContext
        let photoObject = NSEntityDescription.insertNewObject(forEntityName: "PhotoGallary", into: context) as! PhotoGallary
        photoObject.savedImage = image?.jpegData(compressionQuality: 1) as Data?
        
        do
        {
            try context.save()
            print("Data Has Been Saved")
        }
        catch
        {
            print("Error Occured While Saving Data")
        }
    }
    func retriveDat() -> [PhotoGallary]
    {
        var photos = [PhotoGallary]()
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDe.persistentContainer.viewContext
        
        do
        {
            photos = try (context.fetch(PhotoGallary.fetchRequest()))
        }
        catch
        {
            print("Error While Fetching data")
        }
        return photos
    }
}
