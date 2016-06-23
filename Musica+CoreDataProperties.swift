//
//  Musica+CoreDataProperties.swift
//  TocaAiOficial
//
//  Created by Victor Nogueira on 03/02/16.
//  Copyright © 2016 Victor Nogueira. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Musica {

    @NSManaged var artista: String?
    @NSManaged var nome: String?
    @NSManaged var codSet: NSNumber?
    @NSManaged var voto: NSNumber?

}
