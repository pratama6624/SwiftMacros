//import SwiftSyntax
//import SwiftSyntaxBuilder
//import SwiftSyntaxMacros
//
//public struct AutoLogMacro: ExpressionMacro {
//    public static func expansion(
//        of node: some FreestandingMacroExpansionSyntax,
//        in context: some MacroExpansionContext
//    ) throws -> ExprSyntax {
//        guard let argument = node.argumentList.first?.expression else {
//            return "print(\"[LOG] dipanggil\")"
//        }
//
//        return """
//        print("[LOG] Function \\(\(argument)) dipanggil")
//        """
//    }
//}
//
//struct UserService {
//    func login(username: String, password: String) -> Bool {
//        #AutoLog("login")   // ini bakal expand jadi print("[LOG] Function login dipanggil")
//        return username == "admin" && password == "123"
//    }
//}
