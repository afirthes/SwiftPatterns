import Foundation


class FruitShop {
    
    func buyFruits() -> String {
        return "fruits"
    }
}

class MeatShop {
    func buyMeat() -> String {
        return "meat"
    }
}

class MilkShop {
    func buyMilk() -> String {
        return "milk"
    }
}

class SweetShop {
    func buySweet() -> String {
        return "sweets"
    }
}

class BreadShop {
    func buyBread() -> String {
        return "bread"
    }
}

// facade
class Supermarket {
    let fruitShop = FruitShop()
    let meatShop = MeatShop()
    let milkShop = MilkShop()
    let sweetShop = SweetShop()
    let breadShop = BreadShop()
    
    func buyProducts() -> String {
        var products = ""
        products += fruitShop.buyFruits() + ", "
        products += meatShop.buyMeat()  + ", "
        products += milkShop.buyMilk() + ", "
        products += sweetShop.buySweet() + ", "
        products += breadShop.buyBread() + ", "
        return products
    }
}

public func facade() {
    let market = Supermarket()
    print("Bought: \(market.buyProducts())")
}
