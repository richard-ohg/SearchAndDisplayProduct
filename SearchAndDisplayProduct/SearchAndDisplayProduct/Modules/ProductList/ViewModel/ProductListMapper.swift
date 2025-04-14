//
//  ProductListMapper.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 14/04/25.
//

import Foundation

struct ProductListMapper {
    func map(entity: Product) -> ProductListViewModel {
        
        return ProductListViewModel(
            id: entity.catalogProductID,
            name: entity.name,
            imageURL: URL(string: (entity.pictures.first?.url).orEmpty))
    }
}
