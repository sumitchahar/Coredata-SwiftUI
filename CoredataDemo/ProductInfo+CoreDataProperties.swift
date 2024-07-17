//
//  ProductInfo+CoreDataProperties.swift
//  CoredataDemo
//
//  Created by Sumit on 14/07/24.
//
//

import Foundation
import CoreData


extension ProductInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductInfo> {
        return NSFetchRequest<ProductInfo>(entityName: "ProductInfo")
    }

    @NSManaged public var name: String?
    @NSManaged public var imaName: String?
    @NSManaged public var id: String?

}

extension ProductInfo : Identifiable {

}
