import Cocoa

let inputPath = "macos/Runner/Assets.xcassets/AppIcon.appiconset/dark_1024.png"
let outputPath = "macos/Runner/Assets.xcassets/AppIcon.appiconset/dark_icon_base.png"

guard let image = NSImage(contentsOfFile: inputPath) else {
    print("Failed to load image")
    exit(1)
}

let size = image.size
let newImage = NSImage(size: size)

newImage.lockFocus()

let color = NSColor(red: 28/255.0, green: 28/255.0, blue: 30/255.0, alpha: 1.0)
color.set()
let rect = NSRect(origin: .zero, size: size)
rect.fill()

image.draw(in: NSRect(origin: .zero, size: size))

newImage.unlockFocus()

guard let cgImage = newImage.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
    exit(1)
}
let bitmap = NSBitmapImageRep(cgImage: cgImage)
if let data = bitmap.representation(using: .png, properties: [:]) {
    try? data.write(to: URL(fileURLWithPath: outputPath))
}
print("Dark base generated.")
