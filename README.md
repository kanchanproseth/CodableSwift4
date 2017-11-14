# CodableSwift4
Encoding, Decoding and Serialization in Swift 4
- You need to encode (or serialize) an instance before you can save it to a file or send it over the web.
- Your type should conform to the Codable protocol to make it codable. If all properties are codable, then the type is automatically codable as well.
- JSON is the most common encoding in modern applications and web services, and you can use JSONEncoder and JSONDecoder to encode and decode your types to and from JSON.
