import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct AutoLogMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        
        guard let argument = node.arguments.first?.expression else {
            return "print(\"[LOG] dipanggil\")"
        }
        
        return """
        print("[LOG] Function \\(\(argument)) dipanggil")
        """
    }
}
