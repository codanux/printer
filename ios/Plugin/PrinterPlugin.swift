import Foundation
import Capacitor
import Starscream

@objc(PrinterPlugin)
public class PrinterPlugin: CAPPlugin {
    private let implementation = Printer()

    @objc func print(_ call: CAPPluginCall)  {
            guard let text = call.getString("text"),
                  let url = call.getString("url") else {
                call.reject("Missing parameters")
                return
            }

            let request = URLRequest(url: URL(string: url)!)

            let client = WebSocket(request: request)
            client.connect()

            let result: () = client.write(string: text)
            if result == nil {
                call.reject("Send failed")
                return
            }

            client.disconnect()
            call.resolve([
                "message": "ok"
            ]);
    }
}
