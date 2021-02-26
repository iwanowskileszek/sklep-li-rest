//
//  ContentView.swift
//  sklep-li-rest
//
//  Created by Leszek Iwanowski on 24/02/2021.
//

import SwiftUI
import CoreData

struct ProduktView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    let kategoria: Kategoria

    var body: some View {
        Text("Hello World")
    }
}

extension ProduktView {
    
    func loadProdukt() {
        let request = NSFetchRequest<Produkt>(entityName: "Produkt")
        request.predicate = NSPredicate(format: "kategoria == %@", self.kategoria)
        
        let result = try! self.viewContext.fetch(request)
    }
}

struct ProduktView_Previews: PreviewProvider {
    static var previews: some View {
        ProduktView(kategoria: Kategoria()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
