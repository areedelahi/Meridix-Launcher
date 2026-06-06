import os
import subprocess
import json

base_dir = "macos/Runner/Assets.xcassets/AppIcon.appiconset"
sizes = [
    (16, 1, "16"),
    (16, 2, "32"),
    (32, 1, "32"),
    (32, 2, "64"),
    (128, 1, "128"),
    (128, 2, "256"),
    (256, 1, "256"),
    (256, 2, "512"),
    (512, 1, "512"),
    (512, 2, "1024"),
]

variants = {
    "main": ("main-icon.svg.png", None),
    "dark": ("dark_icon_base.png", "dark"),
    "tinted": ("white-icon.svg.png", "tinted"),
}

images = []

for variant_name, (src_name, appearance_value) in variants.items():
    src_path = os.path.join(base_dir, src_name)
    for base_size, scale, px_size in sizes:
        dest_name = f"{variant_name}_{px_size}.png"
        dest_path = os.path.join(base_dir, dest_name)
        subprocess.run(["sips", "-z", px_size, px_size, src_path, "--out", dest_path], check=True, capture_output=True)
        
        entry = {
            "size": f"{base_size}x{base_size}",
            "idiom": "mac",
            "filename": dest_name,
            "scale": f"{scale}x"
        }
        if appearance_value:
            entry["appearances"] = [
                {
                    "appearance": "luminosity",
                    "value": appearance_value
                }
            ]
        images.append(entry)

contents = {
    "images": images,
    "info": {
        "version": 1,
        "author": "xcode"
    },
    "properties" : {
        "creates-macos-icon-variants" : True
    }
}

with open(os.path.join(base_dir, "Contents.json"), "w") as f:
    json.dump(contents, f, indent=2)

print("Icons generated and Contents.json updated.")
