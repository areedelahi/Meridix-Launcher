import Cocoa

input_path = "macos/Runner/Assets.xcassets/AppIcon.appiconset/dark_1024.png"
output_path = "macos/Runner/Assets.xcassets/AppIcon.appiconset/dark_icon_base.png"

# Load the image
image = Cocoa.NSImage.alloc().initWithContentsOfFile_(input_path)

if not image:
    print("Failed to load image")
    exit(1)

size = image.size()
new_image = Cocoa.NSImage.alloc().initWithSize_(size)

new_image.lockFocus()

# Apple standard dark background (approx #1C1C1E)
Cocoa.NSColor.colorWithSRGBRed_green_blue_alpha_(28/255.0, 28/255.0, 30/255.0, 1.0).set()
Cocoa.NSRectFill(Cocoa.NSMakeRect(0, 0, size.width, size.height))

# Draw the transparent icon over it
image.drawInRect_(Cocoa.NSMakeRect(0, 0, size.width, size.height))

new_image.unlockFocus()

# Save out
cg_ref = new_image.CGImageForProposedRect_context_hints_(None, None, None)[0]
bitmap = Cocoa.NSBitmapImageRep.alloc().initWithCGImage_(cg_ref)
data = bitmap.representationUsingType_properties_(Cocoa.NSPNGFileType, None)
data.writeToFile_atomically_(output_path, True)

print("Dark base generated.")
