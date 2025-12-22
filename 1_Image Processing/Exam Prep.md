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

Showing images on the screen can be achieved using OpenCV or MatPlotLib.  

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

### <mark style="background: #C900FFA6;">Drawing on Images:</mark>

<mark style="background: #C900FFA6;">Keep a Copy:</mark>  
- Before you start doodling on your image, you may want to keep a backup copy to revert if things get messy.  
- To do this, call the copy function:  ``Original = I.copy()``  
- Original is now a copy of the image I.

### <mark style="background: #C900FFA6;">Drawing a Line</mark>  

To draw a line, we need the endpoints, colour and thickness...  

```python
cv2.line(img = I, pt1 = (200,200), pt2 =  
(500,600), color = (255,255,255), thickness = 5)
```  

This will draw a 5-pixel thick white line from (200,200) to (500,600).*

<mark style="background: #C900FFA6;">*Note:</mark> images start counting from the top left as they are matrices and these are (x,y) coordinates.

![[Pasted image 20251001141803.png]]

### <mark style="background: #C900FFA6;">Drawing a Circle</mark>

To draw a circle, we need the centre, radius, colour and thickness...  

```python
cv2.circle(img = I, center = (800,400), radius =  
50, color = (0,0,255), thickness = -1)
```

This will draw a red circle at (800,400) with radius 50.  

A thickness of -1 leads to a filled circle.  

Otherwise, thickness behaves as before in the line function.

### <mark style="background: #C900FFA6;">Drawing a Rectangle</mark> 

To draw a rectangle, we need the top-left and bottom-right corners, colour and thickness...  

```
cv2.rectangle(img = I, pt1 = (500,100), pt2 = (800,300), color = (255,0,255), thickness = 10)
```

This will draw a 10-pixel thick, magenta rectangle from (500,100) to (800,300).

![[Pasted image 20251001142011.png]]

### <mark style="background: #C900FFA6;">Drawing on Images</mark>

There are many other drawing tools available, including text boxes, ellipses, polygons, etc.  

These and more drawing and plotting functions can also be performed in MatPlotLib.  

For more specific drawing, we need to know how to access the pixels.

### <mark style="background: #C900FFA6;">User Input</mark>

Capturing user input can be a very useful thing in designing a user interface.  

We can access the location where a user has clicked using mouse events.  

To do this, we need to initialise a <mark style="background: #C900FFA6;">window</mark> for the image and a callback <mark style="background: #C900FFA6;">function</mark> for the mouse event.  

This involves a bit more coding ...

![[Pasted image 20251001142135.png]]

<mark style="background: #C900FFA6;">Task:</mark>
1. Open a user-selected image (if easygui is available on your platform)
2. Show this image on the screen;  
3. Capture the user’s click on the image;  
4. Draw a 201 x 201, 5-pixel thick red square around this location;  
5. Convert the pixels within the square to YUV.  

<mark style="background: #C900FFA6;">Advanced Task:</mark> Don’t fall off the edge!

<mark style="background: #C900FFA6;">In this section you have learned about:</mark>  
- Digital Images  
- Colour Spaces  
- Reading and Writing Images  
- Showing Images  
- Pixels  
- Drawing on Images  
- User Input  

These topics were implemented and tested in Python with OpenCV.

<mark style="background: #C900FFA6;">This section will cover:</mark>  
- Histograms  
- Image Adjustments  
- Image Maths  
- Kernels  

These topics will be <mark style="background: #C900FFA6;">implemented</mark> and <mark style="background: #C900FFA6;">tested</mark> in Python with OpenCV.

### <mark style="background: #C900FFA6;">Histograms</mark>

Histograms are used to understand more about the distribution of pixel values in an image.  

A histogram shows the frequency of occurrence of each pixel value from 0 to 255.  

This allows the brightness and contrast of an image to be clearly seen.

![[Pasted image 20251008141427.png]]

The balance in an image can be directly observed from the histogram.  

From an intensity histogram, the brightness is given by the location of the pixels on the 0 to 255 scale.  

The contrast describes how well these are distributed.

![[Pasted image 20251008141505.png]]

<mark style="background: #C900FFA6;">Histogram Equalisation:</mark>
- Any imbalances in a histogram (poor lighting or contrast) can be corrected using histogram equalisation.  
- The simplest form of this is also known as contrast stretching.  
- This simply redistributes the pixel values across the full range.

![[Pasted image 20251008141624.png]]

![[Pasted image 20251008141633.png]]

<mark style="background: #C900FFA6;">The new intensity is given by:</mark>
``𝐈 = 𝟐𝟓𝟓 × 𝐈𝐈𝐍 − 𝐈𝐌𝐈𝐍 / 𝐈𝐌𝐀𝐗 − 𝐈𝐌𝐈𝐍``

Where 𝐈𝐈𝐍 is the original image intensity and 𝐈𝐌𝐈𝐍 and 𝐈𝐌𝐀𝐗 are the original minimum and maximum intensities.

### <mark style="background: #C900FFA6;">Applications</mark>

Don’t forget this can apply to any colour channel so can be used for other equalisations besides brightness and contrast.  

Histograms are also used to construct appropriate filtering kernels or select thresholds.

### <mark style="background: #C900FFA6;">Plotting Histograms</mark> 

To plot a histogram, we use Matplotlib’s ``hist`` function.  

The pixel values need to first be unravelled from matrix form to a 1D array by using the ``ravel`` function :  

```python
Values = G.ravel()  
plt.hist(Values,bins=256,range=[0,256]);
```  

<mark style="background: #C900FFA6;">Values</mark> are the pixel values of the greyscale image G.

### <mark style="background: #C900FFA6;">Histogram Equalisation</mark>

To equalise a histogram, we use the ``equalizeHist`` function: 

```python
H = cv2.equalizeHist(G)
```  

H is the equalised version of the greyscale image G.

### <mark style="background: #C900FFA6;">Image Adjustments:</mark>

<mark style="background: #C900FFA6;">Scaling:</mark>
- Scaling simply means resizing an image.  
- Note however that the image will not be re-sampled.  
- This means that the pixel values will be interpolated when expanding and averaged when shrinking.  
- Scaling can retain aspect ratio or warp the image to a different shape.

![[Pasted image 20251008145457.png]]

Scale = 0.5 x width, 0.5 x height:
![[Pasted image 20251008145524.png]]

Scale = 1.5 x height, 1.5 x width:
![[Pasted image 20251008145632.png]]

<mark style="background: #C900FFA6;">Cropping:</mark> 
- In cropping an image, a smaller section of the image is extracted.  
- Cropping differs from scaling in that some image information is lost.  
- The new image can be either the size of the smaller section or can be buffered with zeros to retain the same size as the original.

Cropped Image:
![[Pasted image 20251008145744.png]]

Cropped image with buffer:
![[Pasted image 20251008145813.png]]

<mark style="background: #C900FFA6;">Rotating:</mark>
- An image can be rotated by creating a rotation matrix.  
- Note that a rotation may leave blank spaces.  
- These will be filled with zeros by default.

![[Pasted image 20251008145851.png]]

Rotation =60
![[Pasted image 20251008145914.png]]

Rotation =90
![[Pasted image 20251008145933.png]]

### <mark style="background: #C900FFA6;">Scaling</mark>

Scaling can be performed in OpenCV using the resize function.  

It is useful to know the original size first:  

```python
h, w, d = I.shape  
S = cv2.resize(I, dsize=(2*w, 2*h))
```  

S is the new image, twice the size of the original image, I.  

h, w, d are the height, width and depth of the original.  

<mark style="background: #C900FFA6;">Note:</mark> The new size can only be an integer number of rows and columns

### <mark style="background: #C900FFA6;">Cropping</mark>

We have actually seen cropping before when investigating pixels:  

```python
C = I[0:180,0:270]
```  

C is the new cropped image, with dimensions 270 x 180.  

The height and width of the original can be used here to crop to a specific fraction of the original.

### <mark style="background: #C900FFA6;">Rotating</mark>

To rotate an image, we have to first create a rotation matrix using the ``getRotationMatrix2D`` function.  

Then this is can be applied using the ``warpAffine`` function.  

```python
M = cv2.getRotationMatrix2D(center=(cx,cy), angle=d, scale=s)  
R = cv2.warpAffine(I, M = M, dsize=(w,h))
```  

M is the rotation matrix with centre of rotation, ``(cx,cy)``, degrees, d and scaling factor, s. R is the new rotated image with size, ``(w,h)``.

### <mark style="background: #C900FFA6;">Segmentation</mark>

<mark style="background: #C900FFA6;">This section will cover:</mark>  
- Binary Images  
- Thresholding  
- Masking  
- Morphology  

These topics will be <mark style="background: #C900FFA6;">implemented</mark> and <mark style="background: #C900FFA6;">tested</mark> in Python with OpenCV.

### <mark style="background: #C900FFA6;">Binary Images</mark>

We have already seen binary images, but producing meaningful binary images requires some image understanding.  

Often, we are interested in separating something in the foreground from the background.  

The area we are interested in is call a <mark style="background: #C900FFA6;">region of interest (ROI)</mark>.  

Generally, the ROI is set to white while the rest is set to black.  

To achieve this segmentation, we begin with a simple process called <mark style="background: #C900FFA6;">thresholding</mark>.

![[Pasted image 20251022141345.png]]

### <mark style="background: #C900FFA6;">Thresholding</mark>

By selecting a threshold, we set the boundary between the ROI and the background.  

Generally, thresholding is performed on a single channel (often the intensity, but any channel can be used).  

This means the image must first be converted to grayscale (2D)

![[Pasted image 20251022141429.png]]

<mark style="background: #C900FFA6;">Thresholding is then performed as:</mark>

![[Pasted image 20251022141457.png]]

Where ``B`` is the binary image output, ``G`` is the grayscale input and ``T`` is the threshold.

By selecting different thresholds, we can set how inclusive or exclusive the ROI is.  

For example, a low threshold will let more pixels into the ROI while a high threshold will exclude more pixels.  

Threshold selection is often a challenge

![[Pasted image 20251022141906.png]]

### <mark style="background: #C900FFA6;">Threshold Selection</mark>

Thresholds can be selected in various ways.  

Using prior knowledge (what you already know about the image) can be reasonable in some applications.  

When little is known, a threshold is often selected by statistical analysis of the image.  

<mark style="background: #C900FFA6;">For example, a suitable threshold might be:</mark>  

![[Pasted image 20251022142010.png]]

### <mark style="background: #C900FFA6;">Other Channels</mark>

The thresholding here has been done on the intensity of the image but as mentioned, thresholding can be performed on any channel.  

For example, thresholding the Hue channel can lead to colour  
segmentation.

### <mark style="background: #C900FFA6;">Multiple Thresholds</mark>

It can be useful to combine segmentations.  

For example, we may want to find areas that have a particular colour and brightness.  

Or perhaps, we are looking for a colour in a range.  

Multiple thresholds can be combined using Boolean logic. e.g. 
``𝐵 = 𝐻 < 20 & (𝐼 > 150)``  

This would give a ROI with low hue and high intensity (bright red).

![[Pasted image 20251022142256.png]]

### <mark style="background: #C900FFA6;">Global Threshold</mark> 

Using a global threshold means having the same threshold for the whole image.  

This works well for images with good distinction between the ROI and the background.  

However, where there are lighting variations, it can cause problems...

![[Pasted image 20251022142452.png]]

![[Pasted image 20251022142504.png]]

### <mark style="background: #C900FFA6;">Adaptive Thresholding</mark>

Adaptive thresholding is a handy solution to the variable lighting problem.  

In this method, a local threshold is found for each region of the image.  

Each threshold is the mean of the region plus a constant offset.  

Setting the region size and constant offset allows control over the exclusivity of the ROI.

![[Pasted image 20251022142534.png]]

### <mark style="background: #C900FFA6;">Simple Thresholding</mark>  

Simple binary thresholding can be performed in OpenCV using the threshold function:  

```python
T, B = cv2.threshold(G, thresh = T, maxval = 255,  type = cv2.THRESH_BINARY)
```  

``T`` is the threshold, ``B`` is the binary output image and ``G`` is the grayscale input image.

### <mark style="background: #C900FFA6;">Threshold Selection</mark>  

To select better thresholds based on statistical analysis of the image, we use Numpy.
For example, to implement a threshold of ![[Pasted image 20251022142944.png]] 

```python
T = np.mean(G) + np.std(G)
```  

G is the grayscale version of the image I.

### <mark style="background: #C900FFA6;">Multiple Thresholds</mark>

To use multiple thresholds, the inRange function can be useful:  

```python
RangeLower = (0, 150, 150)  
RangeUpper = (50, 255, 255)  
B = cv2.inRange(I, RangeLower, RangeUpper)
```

This would give an ROI with low blue and high green and red values (if I is a standard BGR image).

### <mark style="background: #C900FFA6;">Adaptive Thresholding</mark>

Adaptive thresholding is performed in OpenCV using the ``adaptiveThreshold`` function:  

```python
B = cv2.adaptiveThreshold(G, maxValue = 255,  
adaptiveMethod = cv2.ADAPTIVE_THRESH_GAUSSIAN_C,  
thresholdType = cv2.THRESH_BINARY,  
blockSize = 5,C = 15)
```  

This will use adaptive thresholding with a 5 x 5 region for calculating each mean and a value of 15 for the constant offset.

### <mark style="background: #C900FFA6;">Task : Thresholding</mark>

<mark style="background: #C900FFA6;">Task 1: Simple Thresholding</mark>  
1. Open image “Googly.jpg”;  
2. Use thresholding to separate Googly and his friend from the background;  
3. Use statistical analysis to choose a threshold for better results;  
4. Try multiple thresholds on different channels.  

![[Pasted image 20251022143216.png]]

<mark style="background: #C900FFA6;">Task 2: Adaptive Thresholding</mark>  
1. Open image “Sudoku.jpg”;  
2. Use adaptive thresholding to create a black & white image;  
3. Modify the region size and constant for better results.

![[Pasted image 20251022143226.png]]

### <mark style="background: #C900FFA6;">Masking</mark>

Once an ROI has been identified in a binary image or ``mask``, this can be used to eliminate the areas that are not of interest.  

This means that the original pixel information can be retained for the ROI while the rest of the image is ignored.  

It also allows operations to be performed on specific sections of an image.  

This technique is referred to as masking.

### <mark style="background: #C900FFA6;">ROIs</mark>

Masking is achieved by using Boolean logic.  

Remember that the mask is white (or 1 in logic) while the background is black (or 0 in logic).  

By combining this using a Boolean AND (similar to multiplying) we will get an image with zeroes outside the ROI:  

```python
𝑅𝑂𝐼 = 𝐼 𝐴𝑁𝐷 𝐵
```  

Where 𝑅𝑂𝐼 is the output image, 𝐼 is the input image and 𝐵 is the binary mask.

![[Pasted image 20251022143347.png]]

### <mark style="background: #C900FFA6;">Reverse Masks</mark>

Using the reverse of a binary mask allows holes to be cut in background images.  

This allows composite images to be created by combining an ROI from one image with a background from another.  

Reverse masks are achieved using a Boolean NOT:  

![[Pasted image 20251022143421.png]]

![[Pasted image 20251022143438.png]]

### <mark style="background: #C900FFA6;">Combining ROIs</mark>

Since the background of an ROI is black (zero), ROIs can be combined by simply adding them or by again using a Boolean OR:  

``𝑅𝑂𝐼 = 𝑅𝑂𝐼1 + 𝑅𝑂𝐼2``  
or  
``𝑅𝑂𝐼 = 𝑅𝑂𝐼1 𝑂𝑅 𝑅𝑂𝐼2``  

This allows an ROI from one image to be inserted in another.  

<mark style="background: #C900FFA6;">*Note:</mark> The images here must be the same size.

![[Pasted image 20251105121433.png]]
![[Pasted image 20251105121447.png]]
![[Pasted image 20251105121457.png]]
![[Pasted image 20251105121513.png]]

### <mark style="background: #C900FFA6;">Combining Masks</mark>

Using the same Boolean logic, masks can be combined to give a total ROI made of different components.  

If we have masks which extract different aspects of an image that are of interest, these can be combined using Boolean OR:  

𝐵 = 𝐵1 𝑂𝑅 𝐵2

![[Pasted image 20251105121609.png]]
𝐵1 = 𝑤ℎ𝑖𝑡𝑒
𝐵2 = 𝑟𝑒𝑑  
𝐵 = 𝑟𝑒𝑑 𝑜𝑟 𝑤ℎ𝑖𝑡𝑒  
𝑅𝑂𝐼

### <mark style="background: #C900FFA6;">Reverse Masks</mark>

Reverse masks can be created using the ``bitwise_not`` function:  

```python
BN = cv2.bitwise_not(B)
```  

The same can be achieved by simply subtracting from 255:  
```python
BN = 255 - B
```  

B is the original mask and BN is its reverse.

### <mark style="background: #C900FFA6;">Combining ROIs</mark>  

ROIs can also be combined using the ``bitwise_or`` function:  

```python
ROI = cv2.bitwise_or(ROI1,ROI2)
```  

The same can be achieved by simply adding:  
```python
ROI = ROI1 + ROI2
```  

ROI is the combined ROI and ROI1 and ROI2 are the originals.  

<mark style="background: #C900FFA6;">*Note:</mark> Remember, images here must be the same size

### <mark style="background: #C900FFA6;">Combining Masks</mark>

Masks can be combined using the bitwise_or function:  

```python
B = cv2.bitwise_or(B1,B2)
```  

B is the combined mask and B1 and B2 are the originals.

### <mark style="background: #C900FFA6;">Task : Masking</mark>
1. Open image “Orange.png”;  
2. Using thresholding, create a mask with the orange as ROI;  
3. Use this mask to extract the orange from the image;  
4. Open “Water.jpg”;  
5. Use the inverse of the orange mask to cut an orange-shaped hole in the water picture; 
6. Combine the orange and water masked images to create a composite image.

### <mark style="background: #C900FFA6;">Morphology</mark>

In real images, ROIs are not so easily defined.  

Thresholding will give a general segmentation but there are likely to be imperfections.  

These include holes (missing ROI pixels) and blobs (extra ROI pixels).  

To fix these issues, we use a technique called morphology.

<mark style="background: #C900FFA6;">Morphology</mark> means shape analysis.  

In image processing, we use morphology to look at the shape of the ROI.  

This can then be modified using morphological processing.  

This is useful for clearly delineating the ROI and removing any imperfections in the shape.

<mark style="background: #C900FFA6;">Here we will look at a few basic morphological processes, including:</mark>
- Erosion  
- Dilation  
- Opening  
- Closing  

These can be combined and extended to develop morphological algorithms such as Boundary Extraction.

### <mark style="background: #C900FFA6;">Structuring Elements:</mark> 

To perform morphological processing, we use a <mark style="background: #C900FFA6;">structuring element</mark>.  

This is the razor with which we will tidy the ROI.  

The shape of this structuring element will determine the look of the final ROI.  

A sharp shape such as a rectangle will give a blocky result while an ellipse can give a curvy result.

### <mark style="background: #C900FFA6;">Erosion</mark>

As it’s name suggests, erosion erodes the ROI.  

This is achieved by shaving away the boundaries of the ROI using a razor in the shape of the structuring element.  

This is useful for smoothing boundaries and eliminating blobs.  

However, in eroding, it is important not to lose too much of our ROI.

![[Pasted image 20251112140738.png]]

![[Pasted image 20251112140750.png]]

![[Pasted image 20251112140806.png]]

![[Pasted image 20251112140822.png]]

### <mark style="background: #C900FFA6;">Dilation</mark>

As it’s name suggests, dilation dilates the ROI.  

This is achieved by shaving away the <mark style="background: #C900FFA6;">background</mark> of the ROI using a razor in the shape of the structuring element.  

This is useful for smoothing boundaries and filling gaps.  

However, in dilating, it is important not to accentuate unwanted blobs.

![[Pasted image 20251112140940.png]]
![[Pasted image 20251112140955.png]]![[Pasted image 20251112141005.png]]

### <mark style="background: #C900FFA6;">Opening</mark>

In both Erosion and Dilation, there are gains and losses to the ROI.  

Also, in both cases, the general size of the ROI is changed.  

Because of this, it is better to use a combination of the two processes to achieve the desired results.  

An <mark style="background: #C900FFA6;">Opening</mark> is an Erosion followed by a Dilation.  

This is useful for removing unwanted blobs.

![[Pasted image 20251112141126.png]]

![[Pasted image 20251112141343.png]]

### <mark style="background: #C900FFA6;">Closing</mark>

<mark style="background: #C900FFA6;">Closing</mark> is a Dilation followed by an Erosion.  

This is useful for filling small holes.

![[Pasted image 20251112141422.png]]

![[Pasted image 20251112141454.png]]

### <mark style="background: #C900FFA6;">Final ROI</mark>

Again, both Opening and Closing have their merits but to achieve a final satisfying ROI, a combo of the two gives best results.  

Good results can also be achieved by iteratively repeating morphological operations.  

Finally, the size and shape of the structuring element plays a significant part in determining the quality of the ROI.

![[Pasted image 20251112141654.png]]
![[Pasted image 20251112141704.png]]

### <mark style="background: #C900FFA6;">Boundary Extraction</mark>

The Boundary of an ROI can be useful.  

This is very easily extracted by subtracting the eroded mask from the original:  

```
𝐵 = 𝑀 − 𝑒𝑟𝑜𝑑𝑒𝑑 𝑀
```  

The thickness of the boundary will be determined by the size of the structuring element.

![[Pasted image 20251112141802.png]]
![[Pasted image 20251112141814.png]]

![[Pasted image 20251112141830.png]]

### <mark style="background: #C900FFA6;">Structuring Elements</mark>

Structuring Elements can be constructed manually but are much easier created using the getStructuringElement function:  

```python
shape = cv2.getStructuringElement(cv2.MORPH_RECT,(2,2))
```  

This will create a 2x2 rectangular structuring element, shape.  

The type ``MORPH_RECT`` can be replaced by ``MORPH_ELLIPSE`` for an elliptical element.

### <mark style="background: #C900FFA6;">Erosion</mark>

Erosion is achieved using the erode function:  

```
NewMask = cv2.erode(OldMask,shape)
```

Where ``OldMask`` is the original binary mask and ``NewMask`` is the eroded version and shape is the structuring element used.

### <mark style="background: #C900FFA6;">Dilation</mark>

Dilation is achieved using the dilate function:  

```python
NewMask = cv2.dilate(OldMask,shape)
```

Where ``OldMask`` is the original binary mask and ``NewMask`` is the dilated version and shape is the structuring element used.

### <mark style="background: #C900FFA6;">Opening</mark>

Opening is part of the ``morphologyEx`` function:  

```python
NewMask = cv2.morphologyEx(OldMask,cv2.MORPH_OPEN,shape)
```  

Where ``OldMask`` is the original binary mask and ``NewMask`` is the opened version and <mark style="background: #C900FFA6;">shape</mark> is the structuring element used.

### <mark style="background: #C900FFA6;">Closing</mark>

Closing is also part of the ``morphologyEx`` function:  

```python
NewMask = cv2.morphologyEx(OldMask,cv2.MORPH_CLOSE,shape)
```

Where ``OldMask`` is the original binary mask and ``NewMask`` is the closed version and <mark style="background: #C900FFA6;">shape</mark> is the structuring element used.

### <mark style="background: #C900FFA6;">Boundary Extraction</mark>

Boundary extraction is included in the ``morphologyEx`` function as ``MORPH_GRADIENT``:  

```python
Boundary = cv2.morphologyEx(mask,cv2.MORPH_GRADIENT,shape)
```  

Where ``mask`` is the original binary mask and ``Boundary`` is the extracted boundary (as a binary mask) and ``shape`` is the structuring element used.

<mark style="background: #C900FFA6;">This section will cover:</mark>  
- Edges & Gradients  
- Corners  
- Contours  

These topics will be <mark style="background: #C900FFA6;">implemented</mark> and <mark style="background: #C900FFA6;">tested</mark> in Python with OpenCV.

### <mark style="background: #C900FFA6;">Edges & Gradients</mark>

<mark style="background: #C900FFA6;">What is an Edge?</mark>
- Who’s asking?  
- A better question might be: What does a <mark style="background: #C900FFA6;">human</mark> think an edge is?  
- or, What does a <mark style="background: #C900FFA6;">machine</mark> think an edge is?

<mark style="background: #C900FFA6;">What do humans think an edge is?</mark>

![[Pasted image 20251116161339.png]]

Subject 2

\*Source: Berkeley Segmentation Data Set and Benchmarks 500 (BSDS500)  

P. Arbelaez, M. Maire, C. Fowlkes and J. Malik., “Contour Detection and Hierarchical Image Segmentation”, IEEE TPAMI, Vol. 33,  
No. 5, pp. 898-916, May 2011.

<mark style="background: #C900FFA6;">What do machines think an edge is?</mark>

![[Pasted image 20251116161429.png]]
Algorithm 2

### <mark style="background: #C900FFA6;">What causes edges?</mark>

<mark style="background: #C900FFA6;">Edges come from various sources:</mark>
- Lighting discontinuities  
- Shadows  
- Surface variations  
- Noise  
- Viewpoint (invisibility of the other side) <- Human "Edges"

![[Pasted image 20251116161524.png]]

### <mark style="background: #C900FFA6;">So what is an Edge?</mark>

An edge is a sharp change in the image.  

This can be found by first examining the <mark style="background: #C900FFA6;">gradients</mark> of the image.  

This gradient is then thresholded to identify the edges.

### <mark style="background: #C900FFA6;">Mathematically Speaking</mark>

The gradient of the image can be calculated in a specific direction 

![[Pasted image 20251116161620.png]]

<mark style="background: #C900FFA6;">The magnitude of these is the gradient image:</mark>
![[Pasted image 20251116161643.png]]

<mark style="background: #C900FFA6;">And the edge image is achieved by thresholding:</mark>
![[Pasted image 20251116161705.png]]

### <mark style="background: #C900FFA6;">What is an Edge?</mark>

This is a hedge:
![[Pasted image 20251116161814.png]]

<mark style="background: #C900FFA6;">In theory:</mark> 
- The gradient of an image is the rate of change of the intensity.  
- It is usually calculated in a specific direction and defined by the partial derivatives:

![[Pasted image 20251116161932.png]]

<mark style="background: #C900FFA6;">In Practice:</mark> 
- Digital images are not continuous signals so derivatives make no sense.
- Instead, they are approximated by simply subtracting the pixel intensity by its neighbour in the specific direction.

![[Pasted image 20251116162021.png]]

<mark style="background: #C900FFA6;">As Kernels</mark>
- This discrete approximation can be described as kernels.
- The gradients are then calculated as convolutions of the image with these kernels.

![[Pasted image 20251116162119.png]]

<mark style="background: #C900FFA6;">These graphs show the intensity along a row and along a column:</mark>
![[Pasted image 20251116162145.png]]

<mark style="background: #C900FFA6;">These graphs show the gradient along a row and along a column:</mark>
![[Pasted image 20251116162407.png]]

<mark style="background: #C900FFA6;">Intensity along a row and along a column:</mark>
![[Pasted image 20251116162442.png]]

<mark style="background: #C900FFA6;">Gradient along the same row and column:</mark>
![[Pasted image 20251116162534.png]]

<mark style="background: #C900FFA6;">Noise Effects</mark>
- In the real image, the problem of noise is apparent.  
- Firstly, the intensity variation is affected.  
- Then, this is accentuated when the intensity gradient is calculated.

<mark style="background: #C900FFA6;">Noise Filtering:</mark> To overcome effects of noise, the image is first filtered using a noise filter, e.g. a Gaussian filter:

![[Pasted image 20251116162632.png]]

<mark style="background: #C900FFA6;">Filtered intensity along a row and along a column:</mark>
![[Pasted image 20251116164302.png]]

<mark style="background: #C900FFA6;">Unfiltered intensity along the same row and column:</mark>
![[Pasted image 20251116164337.png]]

<mark style="background: #C900FFA6;">Filtered gradients along a row and along a column:</mark>
![[Pasted image 20251116164354.png]]

<mark style="background: #C900FFA6;">Unfiltered gradients along the same row and column:</mark>
![[Pasted image 20251116164444.png]]

<mark style="background: #C900FFA6;">Gradient Filters:</mark>
- The effect of filtering is most dramatic in the gradient profile.
- Noise filtering is sometimes done separate from gradient calculation.
- More often, the two are combined into improved gradient filters.

<mark style="background: #C900FFA6;">Better Filters:</mark> 
- The gradient approximation kernels can be improved.
- They are crude, sensitive to noise and directionally biased.
- Better filters exist, including Sobel, Prewitt, Roberts Cross, etc.
- Here, we will investigate the Sobel filter as an example

<mark style="background: #C900FFA6;">Sobel Filters:</mark> To improve on the basic filters, Sobel (and poor forgotten Feldman!) came up with an improvement on the simple filters:
![[Pasted image 20251116164559.png]]

<mark style="background: #C900FFA6;">Sobel Gradients:</mark>  

These operators are used in the same way as the simple filters:
![[Pasted image 20251116164630.png]]

The gradient magnitude and direction can also be found:
![[Pasted image 20251116164651.png]]

### <mark style="background: #C900FFA6;">Polarity</mark>

As a result of using a gradient filter, the output will have not only gradient magnitude and direction but also <mark style="background: #C900FFA6;">polarity</mark>, i.e. positive and negative edges.  

This can cause problems with visualisation and so the resultant gradient images are often normalised to the range 0 to 255 with mid-grey representing homogeneity (zero gradient) . . . .

![[Pasted image 20251116164757.png]]

![[Pasted image 20251116164810.png]]

### <mark style="background: #C900FFA6;">From Gradients to Edges</mark> 

The result of applying a gradient filter will be the gradient of the image.  

From this, we can acquire the magnitude of the gradient.  

However, while this suggests the “edginess” of a pixel, it does not specify which pixels are on edges. 

For that we need an edge detector.

### <mark style="background: #C900FFA6;">Edge Detectors</mark> 

An edge detector should return a result of “edge” or “not an edge” for every pixel in the image.  

The easiest step from a gradient to an edge detector is by thresholding.  

In more sophisticated designs, the issues of noise and threshold selection are addressed.  

Examples include Marr, Haralick and Canny detectors.

### <mark style="background: #C900FFA6;">Canny Edge Detector</mark>

<mark style="background: #C900FFA6;">The Canny Edge Detector sorts edges into three categories:</mark> 
- “definitely edges”, 
- “maybe edges” and 
- “definitely not edges”.  

This reduces the problem to dealing only with the “maybe edges”.  

It also includes noise smoothing and edge thinning for added clarity.

### <mark style="background: #C900FFA6;">Sobel - OpenCv</mark>

<mark style="background: #C900FFA6;">To extract the gradients, we can use the Sobel function:</mark>  

```python
Ix = cv2.Sobel(G,ddepth=cv2.CV_64F,dx=1,dy=0)  
Iy = cv2.Sobel(G,ddepth=cv2.CV_64F,dx=0,dy=1)
```  

``G`` is the original grayscale image.  

The 64-bit ``ddepth`` (``ddepth=cv2.CV_64F``) allows for the handling of negative numbers.  

The parameters ``dx`` and ``dy`` set the orders of the x and y derivatives.

### <mark style="background: #C900FFA6;">Canny - OpenCV</mark>

<mark style="background: #C900FFA6;">To extract the edges, we can use the Canny function:</mark>
```python
E = cv2.Canny(I,threshold1=100,threshold2=200)
```  

``I`` is the original image.  

``threshold1`` and ``threshold2`` set the upper and lower thresholds for “definitely edges” and “definitely not edges”.  

This code will return the strongest edges with gradients above 100

### <mark style="background: #C900FFA6;">Corners:</mark>

<mark style="background: #C900FFA6;">What is a good feature to track?</mark> 
- A good feature is interesting.  
- While edges are distinctive features in an image, they are not necessarily uniquely identifiable.  
- This makes them less ideal for computer vision algorithms such as matching and tracking.
- For this we need corners

![[Pasted image 20251116165306.png]]
![[Pasted image 20251116165319.png]]

### <mark style="background: #C900FFA6;">Defining Good Features</mark> 

<mark style="background: #C900FFA6;">A good feature has the following attributes:</mark>  
- Distinct from other image areas;  
- Robust to occlusion or clutter;  
- Insensitive to noise;  
- Insensitive to brightness variations;  
- Invariant to scale and orientation.  
- Corners fit all these criteria and so make perfect features.

### <mark style="background: #C900FFA6;">Corner Detectors</mark>

Many corner detectors exist including Hessian, Harris, Laplacian,  

Difference of Gaussian (DoG), etc.  

Here, we will investigate some commonly used ones.  

Generally, corner detection begins with a look at <mark style="background: #C900FFA6;">Autocorrelation</mark>.

<mark style="background: #C900FFA6;">Autocorrelation:</mark>
- Autocorrelation, also known as <mark style="background: #C900FFA6;">self similarity</mark>, describes how interesting an image region is.
- It looks at the horizontal and vertical gradients in the image area and determines whether the area is homogenous or variant.
- Autocorrelation can pick up edges and texture but it is often used to seek out corners which are good image features.

### <mark style="background: #C900FFA6;">Mathematically speaking:</mark> 

Autocorrelation can be described for a given image, pixel or region by the <mark style="background: #C900FFA6;">autocorrelation matrix</mark>:

![[Pasted image 20251116172751.png]]

I<sub>x</sub> and I<sub>y</sub> are the horizontal and vertical gradients respectively.

### <mark style="background: #C900FFA6;">Interpretation</mark>

The eigenvalues of this matrix, 𝜆1 and 𝜆2, give a lot of information about the image area:  
- No large eigenvalues suggests homogeneity;  
- One large eigenvalue suggests an edge;  
- Two large eigenvalues suggests a corner.  

Corners are interesting.

![[Pasted image 20251116172857.png]]

### <mark style="background: #C900FFA6;">‘Cornerness’</mark>

Harris and Stephens (1988) came up with an approximation of the eigenvalues and returned a ‘cornerness’ measure.  

This eliminated the need for calculation and testing of the eigenvalues.  

The ‘cornerness’ measure, H, includes a tuneable parameter, 𝛼, which is almost always set to 0.04:

![[Pasted image 20251116172942.png]]

### <mark style="background: #C900FFA6;">Harris Algorithm</mark>

The implementation of the Harris algorithm involves the following steps:  
1. Calculate I<sub>x</sub> and I<sub>y</sub> by applying horizontal and vertical gradient filters (e.g. Sobel);  
2. Calculate ![[Pasted image 20251116173024.png]]
3. Apply a Gaussian smoothing filter to each of these;  
4. Calculate the Harris image, H.  
5. Apply a threshold to isolate the strongest corners

### <mark style="background: #C900FFA6;">Example</mark>

Let’s try this with the following image...
![[Pasted image 20251116173153.png]]

<mark style="background: #C900FFA6;">Gradients:</mark>
- First, the horizontal and vertical gradients, I<sub>x</sub> and I<sub>y</sub>, of the image are found by applying horizontal and vertical Sobel filters.  
- I<sub>x</sub> is the horizontal gradient and highlights strong vertical edges.
- I<sub>y</sub> is the vertical gradient and highlights strong horizontal edges.
- Both can be in the range -1 to 1 since gradients have polarity.

![[Pasted image 20251116173336.png]]![[Pasted image 20251116173351.png]]

### <mark style="background: #C900FFA6;">Autocorrelation Matrix</mark>

Next, the elements of ![[Pasted image 20251116173445.png]] are found.  

Once I<sub>x</sub> and I<sub>y</sub> have been found, these can be multiplied by themselves and each other to create ![[Pasted image 20251116173701.png]] 

A Gaussian filter is applied to these to smooth them. 

![[Pasted image 20251116173754.png]] are both positive due to the squaring while I<sub>x</sub>I<sub>y</sub> is in the range -1 to 1.

![[Pasted image 20251116173831.png]]![[Pasted image 20251116173844.png]]
![[Pasted image 20251116173857.png]]

### <mark style="background: #C900FFA6;">Harris Image</mark>

Finally, the Harris image H, showing the ‘cornerness’ of each pixel, is constructed.  

The Harris image is calculated using the previous images combined with the tuneable 𝛼 factor:  

![[Pasted image 20251116173943.png]]

This is in the range -1 to 1 with high negative values denoting edges and high positive values meaning corners

![[Pasted image 20251116174004.png]]

### <mark style="background: #C900FFA6;">Corner Map</mark>

A threshold is applied to find only the strongest corners.  

This threshold is usually set by examining the statistical properties of the image, H.  

<mark style="background: #C900FFA6;">The thresholded image, 𝐶 is a map of the corners in the image:</mark>
![[Pasted image 20251116174035.png]]

![[Pasted image 20251116174050.png]]

![[Pasted image 20251116174102.png]]

<mark style="background: #C900FFA6;">Improvements:</mark>
- The Harris Detector does a good job of finding the corners which make good features. However, it misses some corners and finds multiple corners in the same location.
- To improve on this, we return to the eigenvalues of the autocorrelation matrix.
- This leads us to the <mark style="background: #C900FFA6;">Shi-Tomasi</mark> Detector.

### <mark style="background: #C900FFA6;">Shi-Tomasi Corners</mark>

Six years after Harris and Stephens, Shi and Tomasi (1994) introduced a small change that made a noticeable improvement.  

They returned to the Autocorrelation eigenvalues and noted that only the minimum eigenvalue need be found and tested to identify a corner.

𝑆𝑇 = min 𝜆<sub>1</sub>, 𝜆<sub>2</sub>  

This added better discrimination without significantly increasing computation.

<mark style="background: #C900FFA6;">Shi-Tomasi also introduced a number of additional features:</mark>
- The minimum distance between corners can be set;
- Non-maximal suppression retains only the local maximum (best corner) in each area;  
- A fixed number of corners can be retained.


### <mark style="background: #C900FFA6;">Shi-Tomasi Algorithm</mark>  

The implementation of the Shi-Tomasi algorithm extends beyond the calculation of their corner measure, ST :  
1. Calculate ST (similar to calculation of H previously).  
2. Perform non-maximal suppression.  
3. Threshold using a set quality level to find corners.  
4. Sort corners by quality measure in descending order.  
5. Remove each corner where there is a stronger corner at a distance less than the set minimum distance.  
6. Retain only the N strongest corners where N is set by the user

![[Pasted image 20251116174413.png]]

![[Pasted image 20251116174544.png]]

### <mark style="background: #C900FFA6;">Harris</mark> 

To extract the cornerness, we can use the ``cornerHarris`` function:  
```python
H = cv2.cornerHarris(G,blockSize=5,ksize=3,k=0.04)
```  

<mark style="background: #C900FFA6;">Explanation:</mark>
- ``G`` is the original grayscale image.
- ``blockSize`` sets the size of the Gaussian filter.
- ``ksize`` sets the Sobel kernel size.
- ``k`` is the alpha factor.
- ``H`` is the Harris image showing the ‘cornerness’.

### <mark style="background: #C900FFA6;">Shi-Tomasi</mark>

For Shi-Tomasi corners, we use the ``goodFeaturesToTrack`` function:  
```python
Corners = cv2.goodFeaturesToTrack(G,maxCorners=50, qualityLevel=0.1,minDistance=10)
```

<mark style="background: #C900FFA6;">Explanation:</mark>
- ``G`` is the original grayscale image.
- ``maxCorners`` sets number of corners to find.
- ``qualityLevel`` sets threshold for the strength of the corners.
- ``minDistance`` sets the minimum distance between corners.
- ``Corners`` is the output vector of corners in the form (X,Y).

### <mark style="background: #C900FFA6;">Contours</mark>

Both edges and corners are useful features for tracking, matching and other computer vision algorithms.

However, we often also want to know about the shapes in an image and select one that is of interest.  

Morphology can be used to clean up extracted binary shapes but for larger-scale shape analysis, contours are more useful.

<mark style="background: #C900FFA6;">What is a contour?</mark>
- A contour is a curve which outlines the boundary of a shape. 
- It is a set of continuous, connected points.
- By investigating the parameters of the contour, we can find out about the shape it outlines.
- This can help us find the object we want and eliminate the rest.

<mark style="background: #C900FFA6;">Extracting Contours</mark>
- Since natural images have less distinct boundaries, it’s often useful to extract edges or regions of interest before finding contours.
- So contour extraction is usually done on binary images.
- Once the contours are extracted, their features are examined to find the one that we want, e.g. the longest contour.

![[Pasted image 20251116175047.png]]

<mark style="background: #C900FFA6;">Cleaning the Contour</mark>
- Often an extracted contour can be a bit squiggly.
- In order to fix this, we can look at the <mark style="background: #C900FFA6;">convex hull</mark> of the contour.
- This is the outer part of the contour that never turns inwards.
- This ensures that any interior contours are ignored.
- This technique is useful with tricky shapes and is also often used in gesture analysis.

![[Pasted image 20251116175126.png]]

The Convex Hull points are shown in blue. These can be used to identify the fingertips.

![[Pasted image 20251116175156.png]]

<mark style="background: #C900FFA6;">Bounding the Contour</mark>
- Bounding the contour or fitting a known shape can help extract even more parameters.
- The dimensions, ratios and orientation can be extracted this way.  
- There are many shape fitting algorithms available but the most useful are bounding rectangles and ellipses.

![[Pasted image 20251116175229.png]]

<mark style="background: #C900FFA6;">Contour Features:</mark>  
- The purpose of contour extraction is to find features that describe the shape of an object.
- To do this, we need to access the contour’s features.
- The main features of interest are the area and length but others including the orientation and centroid can also be found.
- These can help identify the contour of interest and can tell us something about the shape of the object.

### <mark style="background: #C900FFA6;">In Python with OpenCV</mark>

To extract the contours, we can use the ``findContours`` function:  

```python
contours,_ = cv2.findContours(B,  
mode=cv2.RETR_EXTERNAL,  
method=cv2.CHAIN_APPROX_NONE)
```

<mark style="background: #C900FFA6;">Explanation:</mark>
- ``B`` is the original image (usually binary).
- ``contours`` is the output vector of contours.
- ``mode`` sets the output listing order for the contours.
- ``method`` allows approximation of the contour by less points.

### <mark style="background: #C900FFA6;">Draw Contours</mark>

To draw the contours, we can use the ``drawContours`` function:  

```python
I = cv2.drawContours(I, c, contourIdx=-1,  
color=(0,0,255), thickness=5)
```  

<mark style="background: #C900FFA6;">Explanation:</mark>
- ``I`` is the original image. 
- ``c`` is the contour or contours to be drawn.
- ``contourIdx`` specifies which contour. If negative, all are drawn.
- ``color`` and thickness set the drawing style.
- <mark style="background: #C900FFA6;">Note:</mark> this function also alters the input image so keep a copy

### <mark style="background: #C900FFA6;">Convex Hull</mark> 

To draw the contours, use the convexHull function. The hull points can be drawn as a contour but to connect them, use the polylines function:  

```python
hull = cv2.convexHull(c)  
cv2.polylines(I, pts=hull, isClosed=True,  
color=(0,255,255))
```  

<mark style="background: #C900FFA6;">Explanation:</mark>
- ``c`` is the contour of interest and hull is its convex hull.
- ``isClosed`` specifies whether the contour is closed.  

This code will connect the points of the convex hull of the contour ``c`` with a yellow line.

### <mark style="background: #C900FFA6;">Bounding Rectangle</mark>

To bound the contour with a rectangle, use the boundingRect function.  

<mark style="background: #C900FFA6;">This can then be drawn using the rectangle function:</mark>  
```python
x,y,w,h = cv2.boundingRect(c)  
cv2.rectangle(I,(x,y),(x+w,y+h),(0,255,0),2)
```  

<mark style="background: #C900FFA6;">Explanation:</mark>
- ``c`` is the contour of interest.
- ``x,y,w,h`` are the coordinates ``(x,y)`` of the top left corner and the width and height of the bounding rectangle respectively.
- This code draws the bounding rectangle of the contour ``c`` in green.

### <mark style="background: #C900FFA6;">Ellipse Fitting</mark>

To find the best-fit ellipse, use the ``fitEllipse`` function. This can then be drawn using the ellipse function:  
```python
ellipse = cv2.fitEllipse(c)  
cv2.ellipse(I,ellipse, color=(0,255,0))
``` 
 
<mark style="background: #C900FFA6;">Explanation:</mark>
- ``c`` is the contour of interest. 
- The ``ellipse`` object is the rotated rectangle that bounds the ellipse.  

This code draws the best-fit ellipse of the contour ``c`` in green.

### <mark style="background: #C900FFA6;">Contour Length</mark>

To find the length of the contour, use the ``arcLength`` function:  
```python
L = cv2.arcLength(c, closed=True)
```  

<mark style="background: #C900FFA6;">Explanation:</mark>
- ``L`` is the length in pixels of the contour c. 
- ``closed`` specifies whether the contour is closed.  

The length feature is extremely useful in finding the object of interest.

### <mark style="background: #C900FFA6;">Contour Area</mark>

<mark style="background: #C900FFA6;">To find the area of the contour, use the contourArea function:</mark>
```python
A = cv2.contourArea(c)
```  

``A`` is the area in pixels of the contour c.  

The area feature is also useful in finding the object of interest.

### <mark style="background: #C900FFA6;">Sorting Contours</mark> 

There is a sorted function in Python that can help order the contours in order of size (using either length or area):  

```python
contours = sorted(contours, key=cv2.contourArea, reverse=True)
```  

``contours`` is the list of contours extracted previously.  

Now, ``contours[0]``will represent the largest contour, ``contours[1]`` the next largest, etc.

### <mark style="background: #C900FFA6;">Features</mark>

<mark style="background: #C900FFA6;">In this section you have learned about:</mark>  
- Edges & Gradients  
- Corners  
- Contours  

These topics were ``implemented`` and ``tested`` in Python with OpenCV