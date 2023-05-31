//
//  MenuPage.swift
//  CoffeeShop
//
//  Created by Witold on 30/05/2023.
//

import SwiftUI

struct MenuPage: View {
    @EnvironmentObject var menuManager: MenuManager
    
    var body: some View {
        NavigationView
            {
                List {
                    ForEach(menuManager.menu) { category in
                        Text(category.name)
                        
                        ForEach(category.products) { product in
                            NavigationLink {
                                DetailsPage(product: product)
                            } label: {
                                ProductItem(product: product)
                            }
                        }
                    }
                }.navigationTitle("Products").refreshable {
                    menuManager.refreshItemsFromNetwork()
                }
            }
    }
}

struct MenuPage_Previews: PreviewProvider {
    static var previews: some View {
        MenuPage().environmentObject(MenuManager())
    }
}
