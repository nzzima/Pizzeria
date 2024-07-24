//
//  Pizzeria.swift
//  Pizzeria
//
//  Created by Nikita Krylov on 24.07.2024.
//

import Foundation

protocol EmployeeProtocol {
    var name: String {get}
    var salary: Double {get}
}

struct Employee: EmployeeProtocol {
    enum JobTitle {
        case cashier
        case cook
        case administrator
        case manager
    }
    var name: String
    var salary: Double
    var jobTitle: JobTitle
}

class Table {
    weak var pizzeria: Pizzeria?
    var places: Int
    init(places: Int) {
        self.places = places
    }
    func placesForGuests(guests: Int) -> Bool {
        places >= guests ? true : false
    }
    
    func getPlaces() -> Int {
        return places
    }
}

class Pizzeria {
    var employees: [EmployeeProtocol]
    var tables: [Table] = []
    
    init(employees: [EmployeeProtocol]) {
        self.employees = employees
        self.tables.append(Table(places: 2))
        self.tables.append(Table(places: 4))
        self.tables.append(Table(places: 5))
        self.tables.append(Table(places: 2))
        self.tables.append(Table(places: 3))
    }
    
    func addEmployee(employee: EmployeeProtocol) {
        self.employees.append(employee)
    }
    
    func getEmployees() -> [EmployeeProtocol] {
        return employees
    }
}
