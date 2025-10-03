A hardware write blocker is <mark style="background: #00ECFFA6;">HARDWARE</mark>

It prevents any writes being made to what's plugged in.

<mark style="background: #00ECFFA6;">Class example:</mark>
- USB is plugged into the "Hardware Write Blocker" (Jonathan's cardboard box)
- "Hardware Write Blocker" is plugged into laptop
- USB appears in laptop
- Cannot make any changes to the USB contents
- This is a forensically sound process

### <mark style="background: #00ECFFA6;">EXIF Metadata</mark>

<mark style="background: #00ECFFA6;">Overview:</mark>
- What is EXIF Data?  
- What does EXIF store?  
- Categories of Data Stored in EXIF  
- Forensic Importance  
- Forensics Usefulness  
- EXIF – What to look for  
- In-Class Demo

### <mark style="background: #00ECFFA6;">What is EXIF Data?</mark>

<mark style="background: #00ECFFA6;">EXIF</mark> stands for Exchangeable Image File Format.  

It’s a metadata standard that stores information about a digital image or media file, usually embedded directly into the file itself.  

Exif is supported by almost all camera manufacturers.  

<mark style="background: #00ECFFA6;">Example:</mark> When you take a photo with a digital camera or smartphone, the device automatically records details about the picture — this is the EXIF metadata.

### <mark style="background: #00ECFFA6;">What does EXIF store</mark>

<mark style="background: #00ECFFA6;">The metadata tags defined in the Exif standard cover a wide range:</mark>
- Camera settings (camera model and make, lens, shutter speed etc...)  
- Image metrics (Pixel dimensions, resolution, colorspace, and filesize)  
- Date and time information  
- Location Information  
- A thumbnail for previewing the picture  
- Description (text)  
- Copyright Info

### <mark style="background: #00ECFFA6;">Categories of Data Stored in EXIF</mark>

<mark style="background: #00ECFFA6;">Camera / Device Information:</mark>
- Camera make and model (e.g., Nikon D3500, iPhone 14 Pro)  
- Lens type and serial number  
- Firmware or software version  

<mark style="background: #00ECFFA6;">Image Capture Settings:</mark>
- Resolution and dimensions (e.g., 4000 × 3000 pixels)  
- Orientation (portrait/landscape)  
- Exposure time (shutter speed)  
- Aperture (f-stop)  
- ISO sensitivity  
- White balance  
- Focal length  
- Flash (on/off, fired/not fired)  

<mark style="background: #00ECFFA6;">Date & Time:</mark>
- Date and time of capture  
- Time zone (sometimes)  

<mark style="background: #00ECFFA6;">Geolocation (if GPS is enabled):</mark>
- Latitude & longitude  
- Altitude  
- GPS timestamp  
- Direction (compass heading)  

<mark style="background: #00ECFFA6;">File & Image Info:</mark>
- File size  
- Compression type (JPEG, RAW, etc.)  
- Colour space (sRGB, Adobe RGB)  
- Thumbnail preview image  

<mark style="background: #00ECFFA6;">Editing / Software Info:</mark>
- Software used to edit/save the photo (e.g., Adobe Photoshop, GIMP, Snapseed)  
- History of edits (sometimes limited)

### <mark style="background: #00ECFFA6;">Forensic Importance</mark>

Identify device used (helps link suspect’s phone/camera to photos).  

Reconstruct events (timestamps, GPS tags).  

<mark style="background: #00ECFFA6;">Detect tampering</mark> (metadata inconsistencies → possible  
manipulation).  

Chain of evidence (proves authenticity if metadata aligns with logs).

### <mark style="background: #00ECFFA6;">Forensics Usefulness</mark>

<mark style="background: #00ECFFA6;">What can be useful to a forensic investigation:</mark>
- Camera make and model  
- Device name  
- Time when the picture was taken  
- GPS coordinates describing where the picture was taken  
- Serial number of the device that took the picture  
- Name of the person who took the image  
- EXIF data is the information that was available to the device when the picture was taken.

### <mark style="background: #00ECFFA6;">EXIF – What to look for</mark>

Some EXIF data features can be turned off.  

When files are uploaded to web platforms the EXIF metadata can be removed.  

For a forensic investigation it is always good to find pictures relating to the case.  

It will be important to determine where, when, and with what device the pictures were taken.