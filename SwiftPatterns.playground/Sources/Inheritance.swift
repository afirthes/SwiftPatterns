import Foundation


/* Проблема такого решения - оно одностороннее.
    например, если в BodyPass не должно быть price, мы не можем его убрать
    т.е. мы не можем играться атрибутами во время наследования.
 */

/*
class Ticket {
    var departure: String
    var arrival: String
    var price: Double
    
    init(departure: String, arrival: String, price: Double) {
        self.departure = departure
        self.arrival = arrival
        self.price = price
    }
}

class BodyPass: Ticket {
    
}

class Economy: Ticket {
    
}

class FirstClass: Ticket {
    var meal: Bool
    
    init(departure: String, arrival: String, price: Double, meal: Bool) {
        self.meal = meal
        super.init(departure: departure, arrival: arrival, price: price)
    }
}

class Business: Ticket {
    var meal: Bool
    var chargingPorts: Bool
    
    init(departure: String, arrival: String, price: Double, meal: Bool, chargingPorts: Bool) {
        self.meal = meal
        self.chargingPorts = chargingPorts
        super.init(departure: departure, arrival: arrival, price: price)
    }
}
 
*/

// --- Решение на енумах ---

struct Economy {
    let departure: String
    let arrival: String
}

struct FirstClass {
    let departure: String
    let arrival: String
    let meal: Bool
}

struct Business {
    let departure: String
    let arrival: String
    let meal: Bool
    let chargingPorts: Bool
}

enum Ticket {
    case economy(Economy)
    case firstClass(FirstClass)
    case business(Business)
}

public class Inheritance {
    
    public init() {}
    
    func checkIn(_ ticket:Ticket) {
        switch ticket {
            // Не делаем никакого кастинга, все автоматом понимается !!!
            case .business(let economy):
                print("Business ticket to \(economy.departure) is checkedin")
            case .firstClass(_):
                    break
            case .economy(_):
                    break
            
            /* Не нужно дефолта
            default:
                print("Checkedin unknow type of ticket")
             */
        }
    }
    
    public func main() {
        let ticket = Ticket.business(Business(departure: "Houston", arrival: "Denver", meal: true, chargingPorts: true))
        
        checkIn(ticket)
    }
}
