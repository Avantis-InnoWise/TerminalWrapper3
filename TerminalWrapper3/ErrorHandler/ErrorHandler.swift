import Foundation

final class ErrorHandler {
    
    // function for secure command processing
    func transformation(_ dnst: String, ComOp: CommandOptions) throws -> String {
        /* Using the Process class, your program can run another program as a subprocess and can monitor that program’s execution.
         A Process object creates a separate executable entity; it differs from Thread in that it does not share memory space with the process that creates it. */
        let process = Process()
        /* Pipe objects provide an object-oriented interface for accessing pipes.
         An Pipe object represents both ends of a pipe and enables communication through the pipe. */
        let pipe = Pipe()
        /* If file is an NSPipe object, launching the receiver automatically closes the write end of the pipe in the current task.
         Don’t create a handle for the pipe and pass that as the argument, or the write end of the pipe won’t be closed automatically.*/
        process.standardOutput = pipe
        /* If file is an NSPipe object, launching the receiver automatically closes the write end of the pipe in the current task.
         Don’t create a handle for the pipe and pass that as the argument, or the write end of the pipe won’t be closed automatically.*/
        process.standardError = pipe
        /* - c flag - Use Cscore processing of the scorefile
         The NSTask object converts both path and the strings in arguments to appropriate C-style strings (using fileSystemRepresentation) before passing them to the task via argv[] .
         The strings in arguments do not undergo shell expansion, so you do not need to do special quoting, and shell variables, such as $PWD, are not resolved.*/
        process.arguments = [CommandsMtd.mtdDec(with: "126FGG12", slat: Commands.saltVl), dnst]
        if #available(macOS 10.13, *) {
            process.executableURL = URL(fileURLWithPath: ComOp.rawValue)
        } else {
            process.launchPath = ComOp.rawValue
        }
        return try runMtd(mtd: process, pipe: pipe)
    }

    // run shell/bash command
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
        // The descriptor represented by this object is deleted, and the object itself is automatically deallocated when the receiver is deallocated.
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: .utf8) {
            return output
        } else {
            return "command execution failed"
        }
    }
}
