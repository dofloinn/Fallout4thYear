<mark style="background: #C900FFA6;">What we will learn:</mark>
- Digital Images
- Colour Spaces
- Reading and Writing Images
- Showing Images
- Pixels
- Drawing on Images

### <mark style="background: #C900FFA6;">Digital Images:</mark>

Images are actually matrices

Numpy is optimised for working with matrices. Don't double-nest your for-loops.

### <mark style="background: #C900FFA6;">Colour Spaces:</mark>

Main ones to look at:
- RGB - Red Green Blue.
- HSV - Hue, Saturation, Value.
- YUV - Luminance (Y) and Chrominance (UV). Good for flesh detection.
- Grayscale - Not 'Black and white' as it has shades of gray.
- Binary - 'Black or white' only has two values -> black or white
- YMCK - Yellow, Magenta, Cyan, Black

Open CV uses BGR.

### <mark style="background: #C900FFA6;">Getting started:</mark>

General format for pixel access in numpy:
`I[i,j,c]`

Colon operator (:) in python allows a range of values to be selected.