import Foundation
import CoreServices

let query = CommandLine.arguments.dropFirst().joined(separator: " ")

guard !query.isEmpty else {
    fputs("usage: dict WORD [WORD ...]\n", stderr)
    exit(64)
}

let range = CFRange(location: 0, length: (query as NSString).length)

guard let unmanagedDefinition = DCSCopyTextDefinition(
    nil,
    query as CFString,
    range
) else {
    fputs("No definition found for: \(query)\n", stderr)
    exit(1)
}

let raw = unmanagedDefinition.takeRetainedValue() as String

let definition = raw
    .replacingOccurrences(
        of: #"[ \t]+\n"#,
        with: "\n",
        options: .regularExpression
    )
    .replacingOccurrences(
        of: #"\n{3,}"#,
        with: "\n\n",
        options: .regularExpression
    )
    .trimmingCharacters(in: .whitespacesAndNewlines)

let wrapProcess = Process()
wrapProcess.executableURL = URL(fileURLWithPath: "/usr/bin/fold")
wrapProcess.arguments = ["-s", "-w", "76"]

let wrapInput = Pipe()
let wrapOutput = Pipe()

wrapProcess.standardInput = wrapInput
wrapProcess.standardOutput = wrapOutput

try wrapProcess.run()

wrapInput.fileHandleForWriting.write(
    definition.data(using: .utf8)!
)
wrapInput.fileHandleForWriting.closeFile()

let wrappedData = wrapOutput.fileHandleForReading.readDataToEndOfFile()
wrapProcess.waitUntilExit()

let wrapped = String(data: wrappedData, encoding: .utf8) ?? definition
let indent = "  "

let output = wrapped
    .split(separator: "\n", omittingEmptySubsequences: false)
    .map { line in
        line.isEmpty ? "" : indent + line
    }
    .joined(separator: "\n")
    .trimmingCharacters(in: .whitespacesAndNewlines)

print("\n\(output)\n")
