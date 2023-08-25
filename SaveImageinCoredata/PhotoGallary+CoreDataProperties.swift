//
//  PhotoGallary+CoreDataProperties.swift
//  SaveImageinCoredata
//
//  Created by Mac on 25/08/23.
//
//

import Foundation
import CoreData


extension PhotoGallary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhotoGallary> {
        return NSFetchRequest<PhotoGallary>(entityName: "PhotoGallary")
    }

    @NSManaged public var savedImage: Data?

}

extension PhotoGallary : Identifiable {

}
