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

Using a priori knowledge (what you already know about the image) can be reasonable in some applications.  

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

# <mark style="background: #FFB8EBA6;">DO MORPHOLOGY</mark>

