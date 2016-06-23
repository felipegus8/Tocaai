//
//  Musica.swift
//  TocaAiOficial
//
//  Created by Victor Nogueira on 03/02/16.
//  Copyright © 2016 Victor Nogueira. All rights reserved.
//

import Foundation
import CoreData


class Musica: NSManagedObject {

    convenience init() {
        let context: NSManagedObjectContext = DatabaseManager.sharedInstance.managedObjectContext
        
        
        let entityDescription: NSEntityDescription? = NSEntityDescription.entityForName("Musica", inManagedObjectContext: context)
        self.init(entity: entityDescription!, insertIntoManagedObjectContext: context)
    }
}
