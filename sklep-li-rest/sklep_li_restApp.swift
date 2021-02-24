//
//  sklep_li_restApp.swift
//  sklep-li-rest
//
//  Created by Leszek Iwanowski on 24/02/2021.
//

import SwiftUI

@main
struct sklep_li_restApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
