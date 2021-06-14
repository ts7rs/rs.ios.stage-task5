import UIKit

class MessageDecryptor: NSObject {
    
  func decryptMessage(_ message: String) -> String {
    let stringIncoming = message
    var stringResult = ""
    var stringAdd = ""
    var stringNumber = ""
    var num = 0
    let arraySplit1 = stringIncoming.components(separatedBy: "]")
        
    func matches(for regex: String, in text: String) -> [String] {
      do {
        let regex = try NSRegularExpression(pattern: regex)
        let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
      return results.map {
        String(text[Range($0.range, in: text)!])
      }
      } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
        }
    }
        
    func checkStringNumber(str: String, str2: String) -> String   {
      var stringWithoutDigit = (str.components(separatedBy: CharacterSet.decimalDigits)).joined(separator: "")
      let part = str.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        if !part.isEmpty {
          let numInner = Int(part) ?? 1
          stringWithoutDigit.append(String(repeating: str2, count: numInner))
        }
        return stringWithoutDigit
    }
        
    for element in arraySplit1 {
    let arraySplit2 = element.components(separatedBy: "[")
        
    if arraySplit2.count == 1 {
      stringResult.append(arraySplit2[0])
    }
    if arraySplit2.count > 1 {
      stringNumber = arraySplit2[0]
      num = Int(stringNumber) ?? 1

      if num == 1{
        let matchedNumber = matches(for: "[0-9]", in: stringNumber)
        let stringSliceWithoutNumber = matchedNumber[0 ..< matchedNumber.endIndex]
        let stringNum = stringSliceWithoutNumber.joined(separator: "")
        let matchedString = matches(for: "[a-z]", in: stringNumber)
        let stringSliceWithoutNumber1 = matchedString[0 ..< matchedString.endIndex]
        let string = stringSliceWithoutNumber1.joined(separator: "")
        num = Int(stringNum) ?? 1
        stringResult.append(string)
      }
        
     if arraySplit2.count > 2 {
       let stringTest = checkStringNumber(str: arraySplit2[1], str2: arraySplit2[2])
       stringAdd = String(repeating: stringTest, count: num)
       stringResult.append(stringAdd)
     }
    else {
      stringAdd = String(repeating: arraySplit2[1], count: num)
      stringResult.append(stringAdd)
    }
   }
  }
return stringResult
 }
}
