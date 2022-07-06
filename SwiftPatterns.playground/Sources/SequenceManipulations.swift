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
    }
}
