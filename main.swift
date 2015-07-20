import Foundation
import Darwin

func currentTimeMillis() -> Int64 {
    let nowDouble = NSDate().timeIntervalSince1970
    return Int64(nowDouble*1000)
}

let client = Client()
let startTime = currentTimeMillis()

client.getRequest { (response, data, error) -> Void in

    if (data != nil) {
        client.parseToJSONDictionary(data!, completionHandler: { (json, error) -> Void in
          print("Untyped response: \(json!)")
        })
        client.parse(data!, completionHandler: { (payload) -> Void in
          print("Typed response: \(payload!)")
        })

        print("\(currentTimeMillis() - startTime) ms post-parse")
        exit(0)
    } else {
        print("Error: \(error!)")
        exit(1)
  }
}

dispatch_main()
