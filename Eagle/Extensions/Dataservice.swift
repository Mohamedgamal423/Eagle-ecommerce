//
//  Dataservice.swift
//  Eagle
//
//  Created by moh on 2/22/21.
//  Copyright © 2021 moh. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

let uid = Auth.auth().currentUser?.uid

class Dataservice {
    
    static let instance = Dataservice()
    
    private let Categories = Firestore.firestore().collection("Categories")
    public private(set) var Products = Firestore.firestore().collection("Products")
    private let Orders = Firestore.firestore().collection("Orders")
    private let Users = Firestore.firestore().collection("Users")
    private let Cartref = Firestore.firestore().collection("Cart")
    private let Favref = Firestore.firestore().collection("Favourites")
    
    func saveCategory(title: String, imgurl: String, handler: @escaping(_ status: Bool) ->()) {
        Categories.addDocument(data: ["title" : title, "imgurl": imgurl]) { (error) in
            if let error = error {
                print(error.localizedDescription)
                handler(false)
            }
            handler(true)
            
        }
    }
    func getCategories(handler: @escaping(_ categories: [Category]) ->()) {
        var categArr = [Category]()
        Categories.getDocuments { (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            let documents = snapshot?.documents
            for docu in documents! {
                let data = docu.data()
                let title = data["title"] as! String
                let imgurl = data["imgurl"] as! String
                let url = URL(string: imgurl)
                DispatchQueue.main.async {
                    guard let imdata = NSData(contentsOf: url!)  else {return}
                    let image = UIImage(data: imdata as Data)
                    let cat = Category(title: title, id: docu.documentID, image: image!)
                    categArr.append(cat)
                    if categArr.count == documents?.count {
                        handler(categArr)
                    }
                
                }
            }
        }
    }
    func saveProduct(Catid: String, title: String, colors: [String], descrip: String, size: String, price: Int, imageurl: [String], handler: @escaping(_ status: Bool) ->()) {
        let prodata: [String: Any] = ["categoryid": Catid, "title": title, "description": descrip, "price": price, "colors": colors, "size": size, "imagesurl": imageurl, "time": FieldValue.serverTimestamp()]
        Products.addDocument(data: prodata) { (error) in
            if let error = error {
                print(error.localizedDescription)
                handler(false)
            }
            else {
                handler(true)
            }
        }
        
    }
//    func saveProductimages(imagesarr: [String], handler: @escaping(_ imgurlarr: Bool) -> ()) {
//        for item in imagesarr {
//
//            let ref = Storage.storage().reference().child("images4/\(item)")
//                    guard let imgdata = UIImage(named: item)?.jpegData(compressionQuality: 0.5) else { return }
//                    ref.putData(imgdata, metadata: nil) { (_, error) in
//                        if let error = error {
//                            print(error.localizedDescription)
//                            return
//                        }
//                    }
//              }
//              handler(true)
//    }
//    func getimgsurl(imagespath: [String], handler: @escaping(_ imurls: [String]) -> ()) {
//        var imgurlsarr = [String]()
//        for path in imagespath {
//            let ref = Storage.storage().reference().child("images4/\(path)")
//
//            ref.downloadURL { (url, error) in
//                if let url = url {
//                    let urlst = url.absoluteString
//                    imgurlsarr.append(urlst)
//                }
//                if imgurlsarr.count == imagespath.count {
//                    handler(imgurlsarr)
//                    
//                }
//            }
//        }
//    }
    
    func getProducts(handler: @escaping(_ prodarr: [Product]) -> ()) {
        var products = [Product]()
        var colorsarr = [String]()
        var images = [UIImage]()
        var image: UIImage!
            var compon: DateComponents {
                
                var components = DateComponents()
                components.month = 3
                components.day = 30
                components.year = 2021
                components.hour = 12
                components.minute = 30
                components.timeZone = TimeZone(abbreviation: "MST")
                return components
            }
            let calend = Calendar(identifier: .gregorian)
            let somedate = calend.date(from: compon)
            let inter = Timestamp(date: somedate!)
            Products.whereField("time", isGreaterThan: inter).getDocuments { (snapshot, error) in
                guard let snapshotdocs = snapshot?.documents else {return}
                for doc in snapshotdocs {
                    colorsarr = []
                    images = []
                    let id = doc.documentID
                    let data = doc.data()
                    let title = data["title"] as! String
                    let descrip = data["description"] as! String
                    let catid = data["categoryid"] as! String
                    let price = data["price"] as! Int
                    let size = data["size"] as! [String]
                    let colors = data["colors"] as! [String]
                    for color in colors {
                        colorsarr.append(color)
                    }
                    let imurls = data["imagesurl"] as! [String]
                    let imurl = URL(string: imurls[0])
                    DispatchQueue.main.async {
                        guard let imdata = NSData(contentsOf: imurl!)  else {return}
                        image = UIImage(data: imdata as Data)
                        let product = Product(title: title, id: id, images: [image], size: size, colors: colorsarr, price: price, descrip: descrip, catID: catid, imagesurls: imurls)
                        products.append(product)
                        if products.count == snapshotdocs.count {
                            handler(products)
                        }
                      }
                        
                    }
            }
    }
    func getbestproducts(handler: @escaping(_ prodarr: [Product]) -> ()) {
        var products = [Product]()
        var colorsarr = [String]()
        //var images = [UIImage]()
        
        Products.whereField("price", isLessThan: 25).getDocuments { (snapshot, error) in
            guard let snapshotdocs = snapshot?.documents else {return}
            for doc in snapshotdocs {
                colorsarr = []
                //images = []
                let id = doc.documentID
                let data = doc.data()
                let title = data["title"] as! String
                let descrip = data["description"] as! String
                let catid = data["categoryid"] as! String
                let price = data["price"] as! Int
                let size = data["size"] as! [String]
                let colors = data["colors"] as! [String]
                for color in colors {
                    colorsarr.append(color)
                }
                let imurls = data["imagesurl"] as! [String]
                let imurl = URL(string: imurls.first!)
                DispatchQueue.main.async {
                    guard let imdata = NSData(contentsOf: imurl!)  else {return}
                    if let image = UIImage(data: imdata as Data) {
                        let product = Product(title: title, id: id, images: [image], size: size, colors: colorsarr, price: price, descrip: descrip, catID: catid, imagesurls: imurls)
                        products.append(product)
                    }
                    if products.count == snapshotdocs.count {
                        handler(products)
                    }
                }
            }
        }
    }
    func getprods(forCatid id: String, handler: @escaping(_ products: [Product]) -> ()) {
        var products = [Product]()
        var colorsarr = [String]()
        var images = [UIImage]()
        Products.whereField("categoryid", isEqualTo: id).getDocuments { (snapshot, error) in
            if let snap = snapshot?.documents {
                for doc in snap {
                    colorsarr = []
                    images = []
                    let id = doc.documentID
                    let data = doc.data()
                    let title = data["title"] as! String
                    let descrip = data["description"] as! String
                    let catid = data["categoryid"] as! String
                    let price = data["price"] as! Int
                    let size = data["size"] as! [String]
                    let colors = data["colors"] as! [String]
                    for color in colors {
                        colorsarr.append(color)
                    }
                    let imurls = data["imagesurl"] as! [String]
                    let imurl = URL(string: imurls.first!)
                    guard let imdata = NSData(contentsOf: imurl!)  else {return}
                    if let image = UIImage(data: imdata as Data) {
                        images.append(image)
                        
                    }
                    let product = Product(title: title, id: id, images: images, size: size, colors: colorsarr, price: price, descrip: descrip, catID: catid, imagesurls: imurls)
                    products.append(product)
                    if products.count == snap.count {
                        handler(products)
                    }
                }
            }
        }
    }
    func CreateDBuser(uid: String, userdata: Dictionary<String, String>) {
        Users.document(uid).setData(userdata)
    }
//    func getCart(uid: String, completion: @escaping(_ Ids: [String]) ->()) {
//        Cartref.document(uid).getDocument { (docsnap, error) in
//            if let data = docsnap?.data() {
//                let Ids = data["itemsid"] as! [String]
//                completion(Ids)
//            }
//            else {
//                completion([])
//            }
//        }
//    }
    
    func saveCard(uid: String, cartdata: [String: Any]) {
        Cartref.document(uid).setData(cartdata)
    }
    func updateCart(uid: String, cartdata: [String: Any]) {
        Cartref.document(uid).updateData(cartdata)
    }
    func downloadCart(uid: String, handler: @escaping(_ prodIds: [String]?) -> ()) {
        Cartref.document(uid).getDocument { (docsnap, error) in
            if let data = docsnap?.data() {
                let productsIDS = data["itemsid"] as! [String]
                handler(productsIDS)
            }
            else {
                print("there is not Data")
                handler(nil)
            }
        }
    }
    func saveFavour(uid: String, Ids: [String]) {
        Favref.document(uid).setData(["prodids" : Ids])
    }
    func updateFavour(uid: String, prodIds: [String]) {
        Favref.document(uid).updateData(["prodids": prodIds])
    }
    func downloadFavour(uid: String, handler: @escaping(_ prodIds: [String]?) -> ()) {
        Favref.document(uid).getDocument { (docsnap, error) in
            if let data = docsnap?.data() {
                let productsIDS = data["prodids"] as! [String]
                handler(productsIDS)
            }
            else {
                print("there is not Data")
                handler(nil)
            }
        }
    }
    
    func getprodswith(prodids: [String], handler: @escaping(_ products: [Product]) -> ()) {
        var products = [Product]()
        var colorsarr = [String]()
        var images = [UIImage]()
        
        for id in prodids {
            Products.document(id).getDocument { (document, error) in
                
                if let doc = document {
                    images = []
                    let data = doc.data()
                    let title = data!["title"] as! String
                    let descrip = data!["description"] as! String
                    let catid = data!["categoryid"] as! String
                    let price = data!["price"] as! Int
                    let size = data!["size"] as! [String]
                    let colors = data!["colors"] as! [String]
                    for color in colors {
                        colorsarr.append(color)
                    }
                    let imurls = data!["imagesurl"] as! [String]
                    let url = URL(string: imurls[0])
                    DispatchQueue.main.async {
                        images = []
                        guard let imgdata = NSData(contentsOf: url!) else {return}
                        if let image = UIImage(data: imgdata as Data) {
                            images.append(image)
                        }
                        let product = Product(title: title, id: id, images: images, size: size, colors: colorsarr, price: price, descrip: descrip, catID: catid, imagesurls: [])
                        products.append(product)
                        if products.count == prodids.count {
                            handler(products)
                        }
                    }
//                    guard let imgdata = NSData(contentsOf: url!) else {return}
//                    if let image = UIImage(data: imgdata as Data) {
//                        images.append(image)
//                    }
                    
                }
                    
            }
          }
        }
    func makeorder(order: Order, handler: @escaping(_ statua: Bool) -> ()) {
        Orders.addDocument(data: ["ownerID": uid!, "prodsIDS": order.productsIds, "shipping Address": order.shippingAddress, "price": order.price, "ownerAddress": order.ownerAddress]) { (error) in
            if error != nil {
                handler(false)
            }
            handler(true)
        }

    }
}
    

