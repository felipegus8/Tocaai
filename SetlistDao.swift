//
//  SetlistDao.swift
//  TocaAiOficial
//
//  Created by Victor Nogueira on 03/02/16.
//  Copyright © 2016 Victor Nogueira. All rights reserved.
//

import Foundation
import CoreData

class SetlistDao {
    
    static func insert(setlist: Setlist) {
        DatabaseManager.sharedInstance.managedObjectContext.insertObject(setlist)
        
        do {
            try DatabaseManager.sharedInstance.managedObjectContext.save()
        } catch let error as NSError {
            print("Erro ao alterar tarefa ", error)
        }
    }
    
    // update existing object
    static func update(setlist :Setlist) {
        do {
            try DatabaseManager.sharedInstance.managedObjectContext.save()
        } catch let error as NSError {
            print("Erro ao alterar tarefa: ", error)
        }
        
    }
    
    // delete object
    static func delete(setlist: Setlist) {
        DatabaseManager.sharedInstance.managedObjectContext.deleteObject(setlist)
        do {
            try DatabaseManager.sharedInstance.managedObjectContext.save()
        } catch let error as NSError {
            print("Erro ao deletar tarefa: ", error)
        }
        
        
    }
    
    // fetch all existing objects
    static func fetchAllSetlists() -> [Setlist] {
        let request = NSFetchRequest(entityName: "Setlist" )
        request.sortDescriptors = [NSSortDescriptor(key: "codSet", ascending: true)]
        
        var results = [Setlist]()
        
        do{
            results = try DatabaseManager.sharedInstance.managedObjectContext.executeFetchRequest(request) as! [Setlist]
        } catch let error as NSError {
            print("Erro ao buscar tarefas", error)
        }
        return results
    }
    
    
}