//
//  WeightDataModels.swift
//  Flex
//
//  Created by Oscar Garcia Vazquez on 11/21/20.
//

import Foundation


struct weightSubmmision {
    let weight : Int
    let weightDenomenation : weightClass
    let dateSubmited : Date?
    let pecentageChange : Double
    let percentageToGoal : Double
}

struct weightClass {
    let kilos = "Kgs"
    let pounds = "Lbs"
}
