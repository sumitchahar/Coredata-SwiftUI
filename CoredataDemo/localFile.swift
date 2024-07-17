//
//  localFile.swift
//  CoredataDemo
//
//  Created by Sumit on 16/07/24.
//

import UIKit
import CoreData
/*class CoreDataHandler: NSObject {

    private class func getContext() -> NSManagedObjectContext
    {
        let delegate = UIApplication.shared.delegate as? AppDelegate

        return (delegate?.persistentContainer.viewContext)!
    }


    class func saveObeject (name:String,roll:String,college:String)
    {
        let context =  getContext()
        let entity = NSEntityDescription.entity(forEntityName: "CountryInfo", in: context)

        let manageObjet = NSManagedObject(entity: entity!, insertInto: context)

        manageObjet.setValue(name, forKey: "name")
        manageObjet.setValue(roll, forKey: "roll")
        manageObjet.setValue(college, forKey: "college")


        do
        {
            try context.save()
        }catch
        {
            print("unable to save data")
        }
    }

    class func getCountryDetail(name:String) ->Array<Any>?
    {

        // return "http://1.bp.blogspot.com/-J9emWhBZ_OM/TtQgVQmBHRI/AAAAAAAAD2w/j7JJMRMiuAU/s1600/Al_Ain_FC.png"
        let contecxt = getContext()
        let fetchRequest:NSFetchRequest<CountryInfo> = CountryInfo.fetchRequest()

        var user:[CountryInfo] = []
        let predicate = NSPredicate(format: "name LIKE[cd] %@",name)
        fetchRequest.predicate = predicate
        do{
            user =  try contecxt.fetch(fetchRequest)
            let ClubInfoBO = user
            print(ClubInfoBO)
            return (ClubInfoBO) as? Array<Any>
        }catch
        {
            return nil

        }

    }


    class func deleteObject(user:CountryInfo) ->Bool{
        let context = getContext()
        context.delete(user)
        do
        {
            try context.save()
            return true
        }catch{
            return false
        }
    }

    //Clean delete

    class func cleanDelete () ->Bool
    {
        let context = getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: CountryInfo.fetchRequest())

        do{
            try context.execute(delete)
            return true
        }catch
        {
            return false
        }
    }
}*/
