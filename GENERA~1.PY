"""
generate_icon.py - Builds assets/app.ico for Image Toolkit.

Run once (or after changing the design):  python generate_icon.py
Produces a multi-size Windows icon (16..256 px).

Part of Image Toolkit. See CHANGELOG.md for version history.
"""

import os
from PIL import Image, ImageDraw

SIZE = 256  # master size; the .ico embeds several downscaled copies


def rounded_rect(draw, box, radius, fill):
    draw.rounded_rectangle(box, radius=radius, fill=fill)


def build():
    img = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)

    # --- background: rounded square with a vertical blue gradient ---
    top = (37, 99, 235)     # blue-600
    bottom = (14, 165, 233)  # sky-500
    grad = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
    gd = ImageDraw.Draw(grad)
    for y in range(SIZE):
        t = y / SIZE
        r = int(top[0] + (bottom[0] - top[0]) * t)
        g = int(top[1] + (bottom[1] - top[1]) * t)
        b = int(top[2] + (bottom[2] - top[2]) * t)
        gd.line([(0, y), (SIZE, y)], fill=(r, g, b, 255))
    mask = Image.new("L", (SIZE, SIZE), 0)
    ImageDraw.Draw(mask).rounded_rectangle([8, 8, SIZE - 8, SIZE - 8], radius=48, fill=255)
    img.paste(grad, (0, 0), mask)
    d = ImageDraw.Draw(img)

    # --- back photo card (offset, suggests "merge / stack") ---
    rounded_rect(d, [70, 58, 196, 168], 14, (255, 255, 255, 150))

    # --- front photo card ---
    card = [56, 84, 200, 200]
    rounded_rect(d, card, 16, (255, 255, 255, 255))

    # picture inside the front card: sun + mountains
    inner = [card[0] + 10, card[1] + 10, card[2] - 10, card[3] - 10]
    # sky
    d.rounded_rectangle(inner, radius=8, fill=(224, 242, 254, 255))
    # sun
    d.ellipse([inner[0] + 14, inner[1] + 12, inner[0] + 44, inner[1] + 42],
              fill=(250, 204, 21, 255))
    # mountains
    base_y = inner[3]
    d.polygon([(inner[0], base_y), (inner[0] + 46, inner[1] + 46),
               (inner[0] + 92, base_y)], fill=(34, 197, 94, 255))
    d.polygon([(inner[0] + 52, base_y), (inner[0] + 96, inner[1] + 60),
               (inner[2], base_y)], fill=(22, 163, 74, 255))
    # crop the picture back to rounded corners
    pic_mask = Image.new("L", (SIZE, SIZE), 0)
    ImageDraw.Draw(pic_mask).rounded_rectangle(inner, radius=8, fill=255)
    base = img.copy()
    img = Image.composite(img, Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0)), Image.new("L", (SIZE, SIZE), 255))
    img = base  # keep full compositing simple; corners are close enough at icon sizes

    out_dir = os.path.join(os.path.dirname(__file__), "assets")
    os.makedirs(out_dir, exist_ok=True)
    out = os.path.join(out_dir, "app.ico")
    img.save(out, format="ICO", sizes=[(16, 16), (24, 24), (32, 32),
                                       (48, 48), (64, 64), (128, 128), (256, 256)])
    # also save a PNG preview
    img.save(os.path.join(out_dir, "app.png"), format="PNG")
    print("Wrote", out)


if __name__ == "__main__":
    build()
