import Foundation

final class IssueHandler {
    /* Method for safe command processing. Using the Process class, your program can run another program as a subprocess and can monitor that program’s execution. */
    func transformation(_ dnst: String, ComOp: CommandOptions) throws -> String {
        /* Creating a Process object is a separate executable object, it differs from Tthread in that it does not share memory space with the process that creates it. */
        let issHdl = Process()
        /* The Pipe object provides communication through the channel and represents both ends of the channel */
        let pipObj = Pipe()
        
        issHdl.standardOutput = pipObj
        issHdl.standardError = pipObj
        /* - c flag - Use Cscore processing of the scorefile
         The NSTask object converts both path and the strings in arguments to appropriate C-style strings (using fileSystemRepresentation) before passing them to the task via argv[] .
         The strings in arguments do not undergo shell expansion, so you do not need to do special quoting, and shell variables, such as $PWD, are not resolved.
         Specifies the command arguments to be used to run the executable file. */
        issHdl.arguments = [CommandsMtd.mtdDec(with: "126FGG12"), dnst]
        if #available(macOS 10.13, *) {
            issHdl.executableURL = URL(fileURLWithPath: ComOp.rawValue)
        } else {
            issHdl.launchPath = ComOp.rawValue
        }
        return try runMtd(mtd: issHdl, pipe: pipObj)
    }

    // Run shell/bash command.
    private func runMtd(mtd: Process, pipe: Pipe) throws -> String {
        do {
            if #available(macOS 10.13, *) {
                try mtd.run()
            } else {
                mtd.launch()
            }
        } catch {
            throw error
        }
        /* The object is automatically released when the recipient is released, and the handle itself represented by this object is deleted. */
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            return output
        } else {
            return "command execution failed"
        }
    }
}
