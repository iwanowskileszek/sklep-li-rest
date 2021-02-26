//
//  ContentView.swift
//  sklep-li-rest
//
//  Created by Leszek Iwanowski on 24/02/2021.
//

import SwiftUI
import CoreData

struct MainView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Kategoria.title, ascending: true)],
        animation: .default)
    
    private var kategorie: FetchedResults<Kategoria>

    var body: some View {
        NavigationView {
        List {
            ForEach(kategorie) { kategoria in
                HStack{
                    NavigationLink(kategoria.value(forKey: "title") as! String, destination: ProduktView(kategoria: kategoria))
                }
            }
        }
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
