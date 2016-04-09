import UIKit

let fileManager = NSFileManager.defaultManager()

do {
    var documents = try fileManager.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
    var url = NSURL(string: "quote.txt", relativeToURL: documents)
    let quote = "Four score and sever years ago."
    if let url = url {
        try quote.writeToURL(url, atomically: true, encoding: NSUTF8StringEncoding)
        var text = try String(contentsOfURL: url)
    }
} catch {
    print("error: \(error)")
}

if let bee = UIImage(named: "bee.jpg") {
    let imageData = UIImagePNGRepresentation(bee)
    do {
        var documents = try fileManager.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
        var url = NSURL(string: "bee.bin", relativeToURL: documents)
        imageData?.writeToURL(url!, atomically: true)
        if let beeData = NSData(contentsOfURL: url!) {
            let newImage = UIImage(data: beeData)!
        }
    } catch {
        print("error: \(error)")
    }
}