//
//  ContentView.swift
//  CoredataDemo
//
//  Created by Sumit on 14/07/24.
//

import SwiftUI
import CoreData
import Swift

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ProductInfo.id, ascending: true)],
        animation: .default)
    
    private var productInfo: FetchedResults<ProductInfo>
    
    @State var index: Int = 0
    @State var deleteIndex: Int = 0

    var body: some View {
        ZStack {
            VStack {
                 Text("Offline adding items")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding([.top,.bottom],16)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(productInfo) { result in
                            HStack {
                                VStack {
                                    Image(result.imaName ?? "image6")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(30)
                                    Text(result.name ?? "")
                                        .font(.system(size: 20, weight: .bold, design: .default))
                                }
                                Spacer()
                            }.frame(height:100)
                        }
                     }
                  }
                HStack {
                    Button {
                        if index == 0 { deleteIndex = 0 }
                        addItem()
                    } label: {
                        HStack {
                            Text("Adding Items")
                                .foregroundStyle(.white)
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .clipShape(Rectangle())
                                .padding([.leading,.trailing,.top,.bottom], 10)
                                .background(.red)
                                .cornerRadius(40)
                        }
                    }
                  Button {
                      if index == 0 { deleteIndex = 0
                          return }
                        deleteIndex =  deleteIndex + 1
                        index =  index - 1
                       delectedFormCode(deleteIndex)
                    } label: {
                        Text("Deleting Items")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .clipShape(Rectangle())
                            .padding([.leading,.trailing,.top,.bottom], 10)
                            .background(.red)
                            .cornerRadius(40)
                    }
                }.padding([.top],70)
                 Spacer()
            }
            .padding([.leading,.trailing])
        }
    }

     func addItem() {
         withAnimation {
             index = index + 1
             let finalValue = index
             let listData = ProductInfo(context: viewContext)
                 listData.name = "Icon" + finalValue.description
                 listData.imaName = "image" + finalValue.description
                 listData.id = index.description
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    func delectedFormCode(_ Id: Int) {
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ProductInfo")
        do {
             let results   = try viewContext.fetch(fetchRequest)
             let arr = results as! [ProductInfo]
             for item in arr {
                 let id = item.id
                 if id == Id.description {
                     viewContext.delete(item)
                 }
             }

        } catch let error as NSError {
          print("Could not fetch \(error)")
        }
    }
    
    
 }


#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
