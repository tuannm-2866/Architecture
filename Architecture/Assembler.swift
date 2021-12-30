//
//  Assembler.swift
//  Architecture
//
//  Created by Ngô Minh Tuấn on 28/12/2021.
//

protocol Assembler: AnyObject,
                    MainAssembler,
                    AppAssembler,
                    ProductsAssembler,
                    ProductDetailAssembler,
                    GatewaysAssembler {
    
}

final class DefaultAssembler: Assembler {

}
