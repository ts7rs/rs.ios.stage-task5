import Foundation

class StockMaximize {

  func countProfit(prices: [Int]) -> Int {
    let newArray = prices
    var profit = 0
    let maxV = newArray.max()
    let indexOfMax = newArray.lastIndex(of: maxV ?? 0)
    let arraySlice = newArray.prefix(indexOfMax ?? 0)
    let newArray1 = Array(arraySlice)
        
      for value in newArray1 {
        profit += (maxV ?? 0) - value
      }
      if (newArray.count - arraySlice.count) > 1 {
        let arraySlice1 = newArray.suffix(from: (indexOfMax ?? 0) + 1)
        let newArray2 = Array(arraySlice1)
        let maxV = newArray2.max()
          for value in newArray2 {
            profit += (maxV ?? 0) - value
          }
      }
        return profit
  }
}
