import Foundation

@objc public class Printer: NSObject {

        @objc public func print(_ value: String) -> String {
              print(value)
              return value
          }
}
