<mark style="background: #C900FFA6;">What we will learn:</mark>
- Digital Images
- Colour Spaces
- Reading and Writing Images
- Showing Images
- Pixels
- Drawing on Images
- User Input

These topics will be implemented and tested in Python with OpenCV
### <mark style="background: #C900FFA6;">Digital Images:</mark>

Images are originally captured as light and converted to a signal.  

These signals are then broken down into discrete pixels (sampled), creating digital images.  

Capture technologies can vary from photographic, to X-Ray, to infra-red and beyond.

![[Pasted image 20251001091139.png]]

The first digital images, called dot <mark style="background: #C900FFA6;">matrix</mark> images, were produced in the early 1920s and introduced the predecessor of the pixel

![[Pasted image 20251001091257.png]]

Gray-scale images have a single channel: each pixel has a value between 0 (black) and 255(white)
![[Pasted image 20251001091333.png]]
![[Pasted image 20251001091425.png]]

RGB has three colour channels (Red, Green, Blue), that each have a value between 0 and 255

![[Pasted image 20251001095956.png]]
Images are actually matrices.  

Each element (pixel) represents the colour or brightness at that location.  

An 8-bit (or 24-bit for colour) image will have values from 0 to 255.  

A grayscale image has 1 value per pixel, a colour image has 3:

![[Pasted image 20251001100034.png]]

Numpy is optimised for working with matrices. Don't double-nest your for-loops.

### <mark style="background: #C900FFA6;">Colour Spaces:</mark>

The value that is used to represent the pixels will help describe the visual appearance of the image at that point.  

We have already seen two examples of pixel representation – grayscale (2D) and RGB (3D).  

There are many other ways to represent a pixel, in different colour spaces.

<mark style="background: #C900FFA6;">Main colour spaces we will investigate:</mark>
- RGB - Red Green Blue.
- HSV - Hue, Saturation, Value.
- YUV - Luminance (Y) and Chrominance (UV). Good for flesh detection.
- Gray-scale - Not 'Black and white' as it has shades of gray.
- Binary - 'Black or white' only has two values -> black or white
- YMCK - Yellow, Magenta, Cyan, Black

### <mark style="background: #C900FFA6;">RGB</mark>  

RGB* stands for Red, Green, Blue.  

Each pixel in RGB has three values – a Red value, a Green value and a Blue value.  

When combined, these make up a unique colour.  

A 24-bit image has 8 bits per channel which makes 16.7 million colours!  

<mark style="background: #C900FFA6;">*Note:</mark> in OpenCV, the order is BGR. Why is a mystery....

![[Pasted image 20251001100520.png]]
![[Pasted image 20251001100557.png]]
![[Pasted image 20251001100620.png]]

### <mark style="background: #C900FFA6;">HSV</mark>

HSV (or HSI) stands for Hue, Saturation and Value (or Intensity).  

<mark style="background: #C900FFA6;">Hue:</mark> describes the colour of a pixel on a colour wheel, ranging from red through green to blue  

<mark style="background: #C900FFA6;">Saturation:</mark> describes the depth of the colour – is it rich or faded? 

<mark style="background: #C900FFA6;">Intensity / Value:</mark> describes the brightness of the pixel

![[Pasted image 20251001100734.png]]
![[Pasted image 20251001100804.png]]

### <mark style="background: #C900FFA6;">YUV</mark>

YUV contains information about the luminance (Y) and the chrominance (UV) of an image.  

This can be useful in improving the apparent quality of an image as humans see luminance variations more clearly than chrominance.  

It can also work well for distinguishing particular colour ranges, for example, in flesh detection

![[Pasted image 20251001100916.png]]
![[Pasted image 20251001100935.png]]

### <mark style="background: #C900FFA6;">Grayscale:</mark>

Grayscale images are often referred to as ‘black & white’ by the uninitiated.  

Unlike the other colour spaces, a grayscale image has only one value per pixel, rather than three.  

Often, grayscale represents the intensity of the image but it can represent any pixel value.

![[Pasted image 20251001101030.png]]

### <mark style="background: #C900FFA6;">Binary</mark>

Binary images are actually ‘black & white’ since their pixels can have only two values – black or white.  

Like a grayscale image, a binary image has only one value per pixel. 

Usually, binary images are created using some type of segmentation.

![[Pasted image 20251001101138.png]]

### <mark style="background: #C900FFA6;">Other Colour Spaces</mark>

<mark style="background: #C900FFA6;">There are other colour spaces besides these such as:</mark>  
- YMCK (Yellow, Magenta, Cyan, Black) – used in printing  
- Lab and YCbCr – both variations on YUV

### <mark style="background: #C900FFA6;">Getting started:</mark>

General format for pixel access in numpy:
`I[i,j,c]`

Colon operator (:) in python allows a range of values to be selected.

### <mark style="background: #C900FFA6;">Input Images</mark>

<mark style="background: #C900FFA6;">Images can be acquired for processing in three handy ways:</mark>
- Direct input
- User input
- Image capture

### <mark style="background: #C900FFA6;">Direct Input</mark>

Direct input is the quickest option when you know the filename...  

```python
I = cv2.imread('image.jpg')
```  

``I`` is the image and ``'image.jpg'`` is the filename.  

<mark style="background: #C900FFA6;">Note:</mark> quotation marks (“) can also be used around the filename

### <mark style="background: #C900FFA6;">User Input</mark>

User input allows the user to select a file. This is made easy using the EasyGUI module...  

```python
f = easygui.fileopenbox()  
I = cv2.imread(f)
``` 

``f`` is the filename acquired by user selection

### <mark style="background: #C900FFA6;">Image Capture</mark>  

Image capture allows images to be grabbed directly from a webcam...  

```python
camera = cv2.VideoCapture(0)  
(grabbed, I) = camera.read()
```  

``camera`` is the camera object, ``grabbed`` is a variable used to check whether the frame was captured correctly.

### <mark style="background: #C900FFA6;">Video Capture</mark>  

This capture can be expanded to grab live video from a webcam or frames from a video file. This is just the same code but in a while loop. 

```python
camera = cv2.VideoCapture(0)  
grabbed = True  
while grabbed:  
	(grabbed, I) = camera.read()  
	# process or show I here  
camera.release()
```

### <mark style="background: #C900FFA6;">Write Images</mark>

Writing images is straightforward in OpenCV...  

```python
cv2.imwrite('image.jpg', I)
```

### <mark style="background: #C900FFA6;">Showing Images</mark>

Showing images on the screen can be achieved using OpenCV or MatPlotLib...  

```python
OpenCV : cv2.imshow("image", I)  
MatPlotLib : plt.imshow(I)
```

<mark style="background: #C900FFA6;">OpenCV:</mark>
- OpenCV’s imshow is compatible with OpenCV’s bizarre BGR order. 
- However, it requires a ``waitKey`` function to be called to stay on the screen.  
- This ``waitKey`` function waits for you to press a key before proceeding:  

```python
cv2.imshow("image", I)  
key = cv2.waitKey(0)
```

<mark style="background: #C900FFA6;">MatPlotLib:</mark>
- MatPlotLib offers many advantages in plotting and drawing.  
- However, it shows images as RGB (proper order!).  
- This requires images to be converted from BGR to RGB.  
- It also requires a show function to be called at the end of the code:  

```python
I = cv2.cvtColor(I, cv2.COLOR_BGR2RGB)  
plt.imshow(I)  
plt.show()
```

<mark style="background: #C900FFA6;">Switching Colorspaces</mark> This ``cvtColor`` (convert colour) function is handy for switching colour spaces from BGR...  

```python
RGB = cv2.cvtColor(I, cv2.COLOR_BGR2RGB)  
HSV = cv2.cvtColor(I, cv2.COLOR_BGR2HSV)  
YUV = cv2.cvtColor(I, cv2.COLOR_BGR2YUV)  
G = cv2.cvtColor(I, cv2.COLOR_BGR2GRAY)
```

### <mark style="background: #C900FFA6;">Pixels</mark>

Most processing we have seen so far is happening to the whole image.  

However, it can be useful to be able to access or change specific pixels or a set of pixels.  

The general format for pixel access is:  
```python
I[i,j,c]
```  

``i`` and ``j`` are the row and column locations* and ``c`` is the colour channel.  

<mark style="background: #C900FFA6;">*Note:</mark> i is equivalent to y while j is equivalent to x

To access a pixel’s value, we can either look at each colour channel separately or at all three as a tuple...  

```python
B = I[i,j,0]  
BGR = I[i,j]
```

``B`` is the blue value at location ``(i,j)``.  

<mark style="background: #C900FFA6;">BGR</mark> is a tuple containing the red, green and blue values  

i.e. BGR = (blue , green, red).

The colon operator (:) allows a range of values to be selected. 

It can also be used on its own to mean “all values”...  

```python
I[100:200,300:400] = (255,0,0)  
I[i,j,:] = 255 
``` 

The first fills all the pixels in the rectangle from (300, 100) to (400, 200) in blue.  

The second sets the pixel at location (i,j) to white