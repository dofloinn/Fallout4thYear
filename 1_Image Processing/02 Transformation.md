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