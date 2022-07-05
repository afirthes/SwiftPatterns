import Foundation

public class Person : CustomStringConvertible{
    
    public init() {}
    
    var name: String = ""
    
    var street: String = "<na>"
    var house: String = "<na>"
    
    var companyName = "<na>"
    var monthsEmployed = 0
    var annualIncome = 0
    
    public var description: String {
        "\(name) lives in \(street) \(house). S(he) " +
        "works at \(companyName) for \(monthsEmployed) months and has " +
        "annual salary \(annualIncome) rubles."
    }
}
