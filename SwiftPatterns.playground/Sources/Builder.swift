import Foundation

class PersonBuilder {
    
    let person:Person
    
    init(name: String) {
        self.person = Person()
        self.person.name = name
    }
    
    init(_ person: Person) {
        self.person = person
    }
    
    var lives: PersonAddressBuilder {
        PersonAddressBuilder(person)
    }
    
    var works: PersonEmploymentBuilder {
        PersonEmploymentBuilder(person)
    }
    
    func build() -> Person {
        // Можно так же инвалидировать билдер после билда.
        return person
    }
}

class PersonAddressBuilder : PersonBuilder {
    func onStreet(_ street: String) -> PersonAddressBuilder {
        person.street = street
        return self
    }
    
    func inHouse(_ house: String) -> PersonAddressBuilder {
        person.house = house
        return self
    }
}

class PersonEmploymentBuilder : PersonBuilder {
    
    func at(_ companyName: String) -> PersonEmploymentBuilder {
        person.companyName = companyName
        return self
    }
    
    func `for`(_ months: Int) -> PersonEmploymentBuilder {
        person.monthsEmployed = months
        return self
    }
    
    func paid(_ salary: Int) -> PersonEmploymentBuilder {
        person.annualIncome = salary
        return self
    }
}


public class Builder {
    
    public init() {}
    
    public func main() {
        let me = PersonBuilder(name: "Sergey")
            .works
                .at("Raiffeisen")
                .for(10)
                .paid(10_000)
            .lives
                .onStreet("Leninskaya st.")
                .inHouse("123")
            .build()
        
        print("Done: \(me)")
    }
}
