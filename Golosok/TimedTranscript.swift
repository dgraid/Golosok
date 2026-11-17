import Foundation

enum TimedTranscript {
    /// Строки для экспорта md/txt. nil, если словарных таймингов нет.
    static func lines(from words: [TimedWord]) -> String? {
        let cues = AudioCapture.makeSubtitleCues(from: words)
        guard !cues.isEmpty else { return nil }
        return cues.map { "\(stamp($0.start))  \($0.text)" }.joined(separator: "\n")
    }

    static func stamp(_ seconds: Double) -> String {
        let total = max(0, Int(seconds.rounded(.down)))
        let h = total / 3600
        let m = (total % 3600) / 60
        let s = total % 60
        return String(format: "%02d:%02d:%02d", h, m, s)
    }
}
