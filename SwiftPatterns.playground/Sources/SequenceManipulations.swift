import Foundation

public struct Product {
    let name: String
    let price: Int
}

public class ProductList : Sequence {
    
    private var products:[Product] = []
    
    init() {
        
    }
    
    func addProduct(_ p:Product) {
        products.append(p)
    }
    
    var totalPrice:Int {
        products.reduce(0) { partialResult, product in
            return partialResult + product.price
        }
    }
    
    public func makeIterator() -> some IteratorProtocol {
        ProductIterator(products)
    }

}

public class ProductIterator: IteratorProtocol {
    public typealias Element = Product
    
    private let products:[Product]
    private var count:Int = 0
    
    init(_ products:[Product]) {
        self.products = products
    }
    
    public func next() -> Element? {
        if count < products.count {
            self.count += 1
            return products[count]
        } else {
            return nil
        }
    }
}


public class SequenceManipulations {
    
    public init() {}
    
    public func main() {
        let productList = ProductList()
        
        let p1 = Product(name: "mac", price: 180)
        let p2 = Product(name: "iphone", price: 56)
        
        productList.addProduct(p1)
        productList.addProduct(p2)
        
        print(productList.totalPrice)
        
        // reduce on sequence
        let items = [1.0, 2.0, 3.3, 4.4]
        print( items.reduce(0, +) )
        
        // count ratings in dictionary (non optimal)
        let ratings = [4, 8.5, 9.5, 2, 6, 5.5, 7, 2.8, 9.8, 5.9, 1.5]
        
        let results1 = ratings.reduce([:]) { (results: [String: Int], rating:Double) in
            var copy = results // non optimal!
            switch rating {
                case 1..<4: copy["Very bad", default: 0] += 1
                case 4..<6: copy["Ok", default: 0] += 1
                case 6..<8: copy["Good", default: 0] += 1
                case 8..<11: copy["Excellent", default: 0] += 1
                default: break
            }
            return copy
        }
        
        print(results1)
        
        // count ratings in dictionary (optimal way)
        let results2 = ratings.reduce(into: [:]) { (results: inout [String: Int], rating:Double) in
            switch rating {
                case 1..<4: results["Very bad", default: 0] += 1
                case 4..<6: results["Ok", default: 0] += 1
                case 6..<8: results["Good", default: 0] += 1
                case 8..<11: results["Excellent", default: 0] += 1
                default: break
            }
        }
        
        print(results2)
    }
}
