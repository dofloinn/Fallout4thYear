v<mark style="background: #C900FFA6;">This section will cover:</mark>  
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