<mark style="background: #04FF00A6;">CRS:</mark> Projection and Co-ordinate Reference Systems 

### <mark style="background: #04FF00A6;">Map Projections</mark> 


This will always be a distortion.  

<mark style="background: #04FF00A6;">A map projects a 3D surface onto a 2D plane:</mark>
- Area  
- Shape  
- Angles  
- Direction  
- Distance  
- Scale  

The metric properties of a map are:  

Different formulae or projections produce different results.

### <mark style="background: #04FF00A6;">Projection</mark>  

Earth -> Sphere (approx.)  

Map -> Flat  

Projection -> Mathematical transformation  

<mark style="background: #04FF00A6;">You cannot preserve:</mark>
- Area  
- Shape  
- Distance  
- Direction simultaneously

### <mark style="background: #04FF00A6;">Map Projections</mark> 

A <mark style="background: #04FF00A6;">conformal</mark> map is a type of map projection that preserves local angles and shapes but may distort area and size.  

This means that small features retain their correct shape, but the scale may vary across the map. e.g. Mercator projection

![[Pasted image 20260304170914.png]]

### <mark style="background: #04FF00A6;">Map Projections</mark>  

An <mark style="background: #04FF00A6;">equal-area map</mark> (or equivalent map projection) is a type of map projection that preserves area.  

All regions on the map are shown in correct proportional size relative to each other.  

However, it may distort shapes, angles, and distances. e.g. Gall-Peters projection

If wealthy countries are enlarged visually, what narrative effect occurs?

### <mark style="background: #04FF00A6;">Authagraph projection</mark>

![[Pasted image 20260304171116.png]]

### <mark style="background: #04FF00A6;">Hobo Dyer Projection</mark>

![[Pasted image 20260304171143.png]]

### <mark style="background: #04FF00A6;">Map Projections</mark>  

A <mark style="background: #04FF00A6;">map projection</mark> is a way of flattening the round Earth onto a 2D surface, like a map, which always introduces some distortion.  

<mark style="background: #04FF00A6;">Conformal:</mark>
- Preserves shapes but distorts sizes  
- e.g., Mercator, good for navigation.  

<mark style="background: #04FF00A6;">Equal-Area:</mark>
- Preserves area (size of landmasses) but distorts shape  
- (e.g., Mollweide, used for population maps).  

<mark style="background: #04FF00A6;">Equidistant:</mark> Preserves distances from specific points but distorts shape and size elsewhere.  

<mark style="background: #04FF00A6;">Pictorial:</mark> Focuses on a realistic or artistic view rather than accuracy (e.g., tourist maps).

![[Pasted image 20260304173322.png]]

### <mark style="background: #04FF00A6;">Azimuthal Projection – Plane Projection</mark> 


Preserves direction from one or two points to every other point.  

Also called Zenithal.

![[Pasted image 20260304174224.png]]

### <mark style="background: #04FF00A6;">Map Projections</mark>

Cylinder, plane, and cone projections

![[Pasted image 20260304174258.png]]

### <mark style="background: #04FF00A6;">Why Projection matters</mark>

<mark style="background: #04FF00A6;">If mapping:</mark>  
- Population  
- Climate  
- Inequality  

Area distortion changes perception.

### <mark style="background: #04FF00A6;">Co-ordinate Reference Systems</mark>  

<mark style="background: #04FF00A6;">CRS =</mark>  
- Datum (shape of Earth model)  
- Projection  
- Units  
- Coordinate system  

A CRS provides a framework for locating points on the Earth's surface.  

It defines how positions are measured and represented on a map.  

Projection = flattening method

![[Pasted image 20260304174351.png]]

  
<mark style="background: #04FF00A6;">CRS = full spatial reference framework</mark>
- Projection ≠ CRS  
- Projection is part of CRS.  

Geodesy (geodetics )=science of creating geoids

### <mark style="background: #04FF00A6;">Geographic CRS</mark>

Uses <mark style="background: #04FF00A6;">latitude (north/south)</mark> and <mark style="background: #04FF00A6;">longitude (east/west)</mark> in degrees to define locations on a spherical Earth (e.g., WGS84, used in GPS).  

Suitable for global positioning and referencing but not ideal for distance or area calculations due to distortions when used on flat maps

### <mark style="background: #04FF00A6;">Projected CRS</mark>

Converts latitude/longitude into <mark style="background: #04FF00A6;">X, Y coordinates</mark> on a flat surface using a specific <mark style="background: #04FF00A6;">map projection</mark> (e.g., Irish Transverse Mercator, EPSG:2157).  

Ideal for distance, area, and navigation calculations within a specific region but introduces distortions over large areas.

### <mark style="background: #04FF00A6;">Why CRS matters in practice</mark>

<mark style="background: #04FF00A6;">CRS determines:</mark>  
- Distance validity  
- Area calculation  
- Layer alignment  
- Buffer accuracy  

<mark style="background: #04FF00A6;">Example:</mark>  
- Dublin to Lisbon  
- Distance in Geographic CRS - EPSG:4326: 1641556 meters  
- Geodesic (true spherical) distance between Dublin and Lisbon.  
- Distance in Projected CRS Web Mercator - EPSG:3857: 2387979m  
- Larger because Web Mercator (EPSG:3857) is NOT distance-preserving.  
- It distorts distance, especially north–south.

Projection changes appearance.  

CRS changes measurement.

### <mark style="background: #04FF00A6;">Spatial Encoding Types - Chloropleth</mark>

From Greek choros (area) plethos (many).  

Maps based on themes  

Areas are shaded or patterned in proportion to a statistical variable  

Variable represents an aggregate summary of a geographic characteristic within each area

![[Pasted image 20260304175018.png]]

They show how a measurement varies across a geographic area.  

Published statistical data (from government or other sources) is generally aggregated into well-known geographic units, such as countries, states, provinces, and counties.

![[Pasted image 20260304175054.png]]

<mark style="background: #04FF00A6;">Colour</mark> encodes value  

<mark style="background: #04FF00A6;">Boundaries</mark> define units  

<mark style="background: #04FF00A6;">Area</mark> influences perception

![[Pasted image 20260304175129.png]]

### <mark style="background: #04FF00A6;">Choropleth Maps</mark> 

Most common approach to visualising area phenomena  

Display quantitative values for distinct, definable spatial regions on a map  

Also used for display of categorical values  

If quantitative measure is related to a numeric quantity, interpretations may be distorted  

Transformations into per capita or per acre could be used to standardise the data

![[Pasted image 20260304175208.png]]

### <mark style="background: #04FF00A6;">Choropleth Maps Recommendation</mark> 

<mark style="background: #04FF00A6;">Border colour</mark> for each spatial area should be distinguishable but not too prominent to dominate the attention  

<mark style="background: #04FF00A6;">Colour scale</mark> usually light to dark  

<mark style="background: #04FF00A6;">Map layer</mark> should be light in colour and possibly semi-transparent  

<mark style="background: #04FF00A6;">Direct labelling not necessary:</mark> Include only a limited number of regional labels to provide context and use a legend as close to the map as possible

<mark style="background: #04FF00A6;">Classification Effects:</mark>  
- Quantiles
- Equal intervals 
- Natural breaks 
- Which tells the strongest story?

![[Pasted image 20260304175339.png]]

### <mark style="background: #04FF00A6;">Equal Intervals</mark>

<mark style="background: #04FF00A6;">Numerically Neutral:</mark>
- Divides the full range into equal-width bins.
- Class boundaries are evenly spaced.  

<mark style="background: #04FF00A6;">What happens with skewed data:</mark>  
- Most counties fall into the lowest class.
- A few outliers occupy the highest classes.  

<mark style="background: #04FF00A6;">Visual effect:</mark>
- Large blocks of one colour. 
- A few “extreme” counties stand out dramatically.  

<mark style="background: #04FF00A6;">Story it tells:</mark> “Only a few counties are extreme.”

### <mark style="background: #04FF00A6;">Quantiles</mark> 

<mark style="background: #04FF00A6;">Visually Balanced:</mark>
- Forces the same number of counties into each class.
- Guarantees colour balance across the map.  

<mark style="background: #04FF00A6;">Visual effect:</mark>  
- Even distribution of colours. 
- Strong visual contrast across regions.  

<mark style="background: #04FF00A6;">Story it tells:</mark> “Variation is everywhere.”

![[Pasted image 20260304175649.png]]

### <mark style="background: #04FF00A6;">Jenks</mark>  

<mark style="background: #04FF00A6;">Data Optimised:</mark> 
- Minimises within-class variance. 
- Groups counties with similar values together.  
- Breaks occur where natural clusters exist.  

<mark style="background: #04FF00A6;">Visual effect:</mark>  
- Irregular class widths.
- Some classes may contain many counties. 
- Others very few.  

<mark style="background: #04FF00A6;">Story it tells:</mark> “There are real clusters in the data.”

![[Pasted image 20260304175758.png]]

### <mark style="background: #04FF00A6;">Which tells the strongest story?</mark> 

It depends what you mean by “strongest.”  

<mark style="background: #04FF00A6;">Most visually dramatic:</mark> Usually Quantiles.  

<mark style="background: #04FF00A6;">Most numerically faithful:</mark> Often Natural Breaks.  

<mark style="background: #04FF00A6;">Most neutral-looking:</mark> Equal intervals (but only if distribution isn’t skewed).

### <mark style="background: #04FF00A6;">Classification</mark> 

Classification is not formatting.  

It is <mark style="background: #04FF00A6;">narrative framing</mark>.  

The data did not change. The boundaries did not change. Only the class definition changed.  

<mark style="background: #04FF00A6;">Yet:</mark>  
- Regional contrast shifts.  
- Extremes appear or disappear.  
- The political interpretation changes.

### <mark style="background: #04FF00A6;">Modifiable Areal Unit Problem (MAUP)</mark>  

<mark style="background: #04FF00A6;">Occurs when:</mark>  
- The same underlying data  
- Aggregated into different spatial units  
- Produces different statistical or visual results  

<mark style="background: #04FF00A6;">It arises because:</mark>  
- Spatial boundaries are human constructs.  
- They are not natural divisions of reality.  
- Counties, electoral districts, health regions etc - all are modifiable.

### <mark style="background: #04FF00A6;">Why MAUP matters? Scaling</mark> 

<mark style="background: #04FF00A6;">Choropleths rely on:</mark> 
- Predefined administrative boundaries  
- Aggregated values  

<mark style="background: #04FF00A6;">That means:</mark>  
- The map is not showing natural spatial variation.  
- It is showing variation defined by chosen boundaries.  

<mark style="background: #04FF00A6;">So, when exploring you see:</mark> “This region has high deprivation”  

<mark style="background: #04FF00A6;">You must ask:</mark>  
- Relative to what boundary?  
- Could a different zoning show something else?

![[Pasted image 20260304180203.png]]

### <mark style="background: #04FF00A6;">Why MAUP matters? Zoning</mark>  

The zoning effect of MAUP means that even when the scale stays the same, changing how spatial units are grouped can alter:  
- Average values  
- Visual contrast  
- Apparent regional inequality  
- Statistical relationships  

Boundaries are not neutral.  

They shape interpretation.  

Maps don’t just reveal patterns — they help create them.

### <mark style="background: #04FF00A6;">Components of MAUP</mark>

<mark style="background: #04FF00A6;">SCALE EFFECT</mark>

<mark style="background: #04FF00A6;">When you change the size of spatial units:</mark>  
- County → Province  
- Electoral division → County  
- County → National  

Patterns smooth out.  

<mark style="background: #04FF00A6;">Example:</mark>  
- County-level deprivation may show variation.  
- At provincial level, variation disappears.  
- At national level, it vanishes entirely.  
- Larger units = smoother patterns.  

<mark style="background: #04FF00A6;">ZONE EFFECT</mark>  

<mark style="background: #04FF00A6;">Even at the same scale:</mark>  
- Changing how boundaries are drawn  
- Changing which areas are grouped together  
- → changes statistical results.  

<mark style="background: #04FF00A6;">Example:</mark> Two different ways of grouping the same neighbourhoods can produce different average values.

### <mark style="background: #04FF00A6;">Isarithmic Maps (isopleth)</mark>  

Isarithmic ( ‘ice’ arithmic) maps are an alternative to choropleth maps (also called isopleth maps).  

<mark style="background: #04FF00A6;">Display continuous data without political boundaries:</mark> The contours of some continuous phenomenon are shown over a map transcending geo-political boundaries

![[Pasted image 20260304180554.png]]

### <mark style="background: #04FF00A6;">Met Eireann Rainfall Radar</mark>

![[Pasted image 20260304180651.png]]

### <mark style="background: #04FF00A6;">Isolines</mark> 

Isolines are lines on a map that connect points of equal value, representing continuous data like elevation, temperature, or pressure

![[Pasted image 20260304180812.png]]

<mark style="background: #04FF00A6;">Isarithmic</mark> - What assumption does interpolation make?

<mark style="background: #04FF00A6;">Choropleth:</mark>
- Aggregated  
- Boundary dependent

<mark style="background: #04FF00A6;">Isarithmic:</mark>
- Continuous  
- Boundary independent  
- Interpolated

What assumption does interpolation make?

### <mark style="background: #04FF00A6;">Map By Dots</mark>  

<mark style="background: #04FF00A6;">Dot density:</mark> 
- Each dot = fixed quantity  
- Aggregated but visually granular  

<mark style="background: #04FF00A6;">Point location maps:</mark> Actual locations

![[Pasted image 20260304181024.png]]

<mark style="background: #04FF00A6;">Colour</mark> can be used to distinguish categorical classifications  

Colours should be visibly different  

<mark style="background: #04FF00A6;">Map layer</mark> should be light in colour and possibly semi-transparent  

<mark style="background: #04FF00A6;">Direct labelling</mark> not necessary for dot  
density

Use a legend as close to the map as possible

![[Pasted image 20260304181125.png]]

### <mark style="background: #04FF00A6;">Map By Bubbles</mark>  

<mark style="background: #04FF00A6;">Bubbles</mark> can be added to map visualisations for an extra dimension  

<mark style="background: #04FF00A6;">Colour can distinguish categorical classifications:</mark>
- Colours should be visibly different.  
- Map layer should be light in colour and possibly semi-transparent  

<mark style="background: #04FF00A6;">Direct labelling not necessary:</mark> Include only a limited number of regional labels to provide context and use a legend as close to the map as possible

![[Pasted image 20260304181553.png]]

<mark style="background: #04FF00A6;">Avoid bubble maps if you can:</mark>
- Bubbles use area.  
- Humans find it difficult to distinguish between areas.  
- Bubbles are likely to hide the underlying map.  
- When a bubble has a large value, its shape will transgress well beyond the origin of its geographical location, intruding and overlapping with other neighbouring values  
- How big is the map area being represented by the bubble area?  
- The use of outline borders and semi- transparent colours helps with the task of avoiding occlusion

<mark style="background: #04FF00A6;">Line Maps:</mark>

Often used for migration, trade, geographic connection and transportation data  

<mark style="background: #04FF00A6;">Great Circles: Shortest paths on a sphere</mark> 
- Great circles, or Riemannian circles, are shortest paths across the surface of the globe that appear as circles on amap projection  
- Drawing connections on a map as great circles rather than straight lines can lead to more appealing visualisations  
- This post shows how to connect sources and destinations in R: https://www.jessesadler.com/post/great-circles-sp-sf/

![[Pasted image 20260304181727.png]]

![[Pasted image 20260304181735.png]]

### <mark style="background: #04FF00A6;">Flow Maps</mark>

Show movement of information or objects from one location to another  

<mark style="background: #04FF00A6;">Often used for migration, trade, and transportation data:</mark>  
- Drawn from a point of origin and branch out of their “flow lines  
- Arrows can be used to show direction  
- Magnitude reflected by line thickness

![[Pasted image 20260304181849.png]]

### <mark style="background: #04FF00A6;">Map By Lines – Flow Map</mark>

Drawing flow lines without arrows can be used to represent trade going back-and-forth.  

Merging/bundling flow lines together and avoiding crossovers can help to reduce visual clutter on the map.

![[Pasted image 20260304181952.png]]

### <mark style="background: #04FF00A6;">Cartograms</mark>

Area Rescaling  
Distort geography to represent data values - Typically an area phenomenon (statistical value)  

Generalisations of ordinary thematic maps

![[Pasted image 20260304182103.png]]

![[Pasted image 20260304182153.png]]

### <mark style="background: #04FF00A6;">Contiguous Cartograms</mark>

Maintain topology (i.e contiguity)  

Produce the greatest distortion in shape.  

Areas are bloated or shrunk depending on the proportional attributes assigned.

![[Pasted image 20260304182238.png]]

### <mark style="background: #04FF00A6;">Non-contiguous Cartograms</mark>

Look like exploded maps with the individual polygons placed separately from each other.  

Tend to preserve the shape of the individual polygons but not the size or connectivity to other polygons.  

The sacrifice in non-contiguous cartograms is the topology or contiguity with adjacent areas.

![[Pasted image 20260304182309.png]]

### <mark style="background: #04FF00A6;">Circular/ Dorling Cartograms</mark>  

Easy to compare shape sizes.  

<mark style="background: #04FF00A6;">NOT easy to recognize:</mark>
- By position  
- By shape  
- By size  
- By Geographical map

![[Pasted image 20260304182337.png]]

### <mark style="background: #04FF00A6;">Equal area Cartogram</mark>

AKA grid / mosaic / tile cartogram  

<mark style="background: #04FF00A6;">Possible to:</mark>
- recognize by shape (not easy)  
- Compare by size  
- Plot accurately

![[Pasted image 20260304182652.png]]

### <mark style="background: #04FF00A6;">Mapping - Layering</mark>

When you create a map, think of it as building a digital painting.  

<mark style="background: #04FF00A6;">Each layer adds meaning:</mark>  
- Base map  
- Shapes  
- Overlays  
- Labels  
- Annotations  

But layering alone does not make a map correct.

![[Pasted image 20260304182724.png]]

### <mark style="background: #04FF00A6;">Shapes: Geometry Layer</mark>

Shapes define the physical features on a map.  

<mark style="background: #04FF00A6;">These could be:</mark>  
- Points (e.g., cities, landmarks)  
- Lines (e.g., roads, rivers, routes)  
- Polygons (e.g., country boundaries, lakes, regions)  

<mark style="background: #04FF00A6;">Each shape has:</mark>  
- A location  
- A coordinate reference system (CRS)  
- A projection  

<mark style="background: #04FF00A6;">Before you even draw a shape, you must decide:</mark>  
- What CRS is it in?  
- Is it appropriate for the task?  
- Does projection distort the interpretation?

### <mark style="background: #04FF00A6;">Mapping - Layering</mark> 

<mark style="background: #04FF00A6;">Example of Shapes:</mark>
- A point represents Dublin as a dot on the map.  
- A line shows a train route from Dublin to Galway.  
- A polygon outlines the shape of Ireland’s counties.

![[Pasted image 20260304182901.png]]

### <mark style="background: #04FF00A6;">Projection + CRS: The Invisible Layer</mark> 

<mark style="background: #04FF00A6;">Before layering anything, you must ask:</mark>  
- What CRS are my shapes in?  
- Are all layers in the same CRS?  
- Is this projection appropriate for the task?  
- Does this projection distort interpretation?  

<mark style="background: #04FF00A6;">If layers use different CRS:</mark>  
- They misalign  
- Distances are wrong  
- Areas are wrong  
- Spatial joins break  

Projection is the first design decision.  

CRS is the first technical validation check.

![[Pasted image 20260304182955.png]]

### <mark style="background: #04FF00A6;">Mapping - Overlays</mark>  

<mark style="background: #04FF00A6;">Overlays: Add Meaning</mark>  
- Overlays help visualise additional data. 
- Overlays do not change the shape itself but add details to make it more meaningful.  

<mark style="background: #04FF00A6;">Types of Overlays:</mark>  
- <mark style="background: #04FF00A6;">Colours and fills:</mark> Show income levels per county by colouring them differently.  
- <mark style="background: #04FF00A6;">Borders and Labels:</mark> Make boundaries clearer and add names.  
- <mark style="background: #04FF00A6;">Symbols and Icons:</mark> Highlight cities with different markers (e.g., red dots for capitals).  
- <mark style="background: #04FF00A6;">Arrows and Flow Lines:</mark> Show movement (e.g., migration, trade routes).  
- <mark style="background: #04FF00A6;">Heatmaps:</mark> Indicate density (e.g., population hotspots).

### <mark style="background: #04FF00A6;">Encoding Type Matters</mark>

<mark style="background: #04FF00A6;">Before colouring a shape ask:</mark>  
- Is this aggregated or continuous data?  
- Should it be choropleth or isarithmic?  
- What classification method is used?  
- What colour scale is appropriate?  
- Is the data skewed?  

<mark style="background: #04FF00A6;">Encoding choices influence:</mark>  
- Contrast  
- Narrative  
- Perceived inequality  
- Cognitive load  

Encoding is not decoration - It is argument.

### <mark style="background: #04FF00A6;">Mapping - Layering</mark> 

<mark style="background: #04FF00A6;">Example:</mark>  
- <mark style="background: #04FF00A6;">County Boundaries:</mark> The county shapes are outlined in blue, overlaid on the base map of Ireland.  
- <mark style="background: #04FF00A6;">Median Income Data:</mark> The counties are filled with colours representing median income values, using a colour scale from purple (low income) to yellow (high income).  
- <mark style="background: #04FF00A6;">Major Cities:</mark> Red points mark the locations of Dublin, Galway, Limerick, and Cork.  
- <mark style="background: #04FF00A6;">City Labels:</mark> Text annotations labelling each city.  
- <mark style="background: #04FF00A6;">North Arrow:</mark> The compass rose in the upper left.  
- <mark style="background: #04FF00A6;">Scale Bar:</mark> The black-and-white bar in the bottom left, providing a sense of distance.  
- <mark style="background: #04FF00A6;">Legend for Income Data:</mark> The colour gradient scale on the right explaining median income values

![[Pasted image 20260304183552.png]]

### <mark style="background: #04FF00A6;">When to use a map</mark> 

If it's part of the story.  

Not just because you have location data.  

Is the map here adding value?

![[Pasted image 20260304183644.png]]

### <mark style="background: #04FF00A6;">Considerations before using maps</mark>  

Do you need the map? Is there an easier way to display the information?  

What is the purpose of the map?  

How does the map fit into the overall story?  

Will you be able to format the maps to show what you need to show?  

Will the reader get the message?

### <mark style="background: #04FF00A6;">How to Make a Map Work for You</mark> 

Does the spatial information help or hinder the story?  

How can time be conveyed with maps? Animation? Layers?  

<mark style="background: #04FF00A6;">Make a clear, straightforward, and well-organised map:</mark>  
- Consider the size of the finished map and where it will be shown when deciding how detailed or generic to make it.  
- Give your map a distinct title, caption or scale, and data source.  
- To minimise congestion or vast vacant spots, experiment with alternative layouts.

### <mark style="background: #04FF00A6;">Cognitive Considerations before using a map</mark> 

Maps can suffer some of the same problems as Pie charts 

<mark style="background: #04FF00A6;">People can compare:</mark>  
- <mark style="background: #04FF00A6;">Position</mark> (is something higher than something else on the screen, or farther to one side?)  
- <mark style="background: #04FF00A6;">Length or relative distance</mark> (is one thing longer than something else, or is one pair of things farther apart than another pair of things?)  

<mark style="background: #04FF00A6;">People cannot compare:</mark>  
- <mark style="background: #04FF00A6;">Area</mark> (the relative size of circles, or comparing how two dimensions change simultaneously)  
- <mark style="background: #04FF00A6;">Intensity</mark> (how much bolder or more-faded-out is one colour than another)

### <mark style="background: #04FF00A6;">Considerations - Use of Colour</mark> 

<mark style="background: #04FF00A6;">One of the most important elements in map design:</mark> 
- Conveys meaning  
- Highlights trends  
- Distinguishes different data points.  

Poor colour choices can lead to misinterpretation.

### <mark style="background: #04FF00A6;">Considerations - Use of Colour</mark>

![[Pasted image 20260304184011.png]]

### <mark style="background: #04FF00A6;">Considerations - Use of Colour</mark> 

Types of Colour Schemes 

<mark style="background: #04FF00A6;">Sequential Colour Schemes:</mark>
- Used for continuous data (e.g., population density, temperature).Colours transition from light to dark, indicating lower to higher values.  
- Example: A light yellow to dark red gradient for representing temperature increases.  
- Poor contrast between shades can make subtle differences hard to see.  

<mark style="background: #04FF00A6;">Diverging Colour Schemes:</mark>
- Used when a dataset has a meaningful midpoint (e.g., temperature anomaly maps, election maps).  
- Two contrasting colours with a neutral middle colour (e.g., blue → white → red for temperature deviations).  
- Example: A blue-to-red scale for political party dominance in elections.  
- If the midpoint isn’t intuitive, it can mislead viewers.  

<mark style="background: #04FF00A6;">Categorical (Qualitative) Colour Schemes:</mark>
- Used for discrete categories (e.g., land use, political parties, regions).  
- Each category gets a distinct, easily distinguishable colour.  
- Example: Different land-use types in a city zoning map using green for parks, yellow for residential, and grey for industrial areas.  
- Too many categories can lead to a cluttered, confusing map.

<mark style="background: #04FF00A6;">Simple colour palettes:</mark>  
- Only use colour to convey meaning.  
- Use a neutral colour like grey for anything that doesn’t need highlighting.  
- Use colour palettes that work with your dataset and that have few, easy to distinguish colours.  
- Avoid bright background colours.  
- Ensure colours have good contrast and nothing is difficult to read.  

<mark style="background: #04FF00A6;">Pitfalls:</mark>
- Overuse of colours can cause confusion.  
- Using colours that are too similar can make distinctions difficult  
- Perceptually uneven colour transitions can exaggerate or hide differences (humans don’t perceive all colours to be equal).  
- Certain colours carry cultural or psychological biases that might mislead users.  
- Using more than 6–8 distinct colours makes it hard to differentiate categories.  

<mark style="background: #04FF00A6;">Best Practices for Colour Schemes:</mark>
- Avoid using too many colours  
- Humans struggle to differentiate more than 6–8 distinct colours.  
- Ensure sufficient contrast between categories but avoid overly bright or clashing colours.  
- Consider colour blindness—use accessible palettes.  
- Provide a clear legend to explain what each colour represents.

![[Pasted image 20260304184254.png]]

### <mark style="background: #04FF00A6;">Considerations - Use of Scale</mark> 

<mark style="background: #04FF00A6;">Modifiable Areal Unit Problem (MAUP):</mark> 
- Aggregating data at different scales can lead to misinterpretation.  
- Example: Choropleth maps showing unemployment by country vs. count  
- Country-level data might hide local variations.  
- Best Practice: Select a scale that aligns with data granularity and intended audience needs

### <mark style="background: #04FF00A6;">Consideration - Interactivity:</mark>

<mark style="background: #04FF00A6;">Interactivity:</mark> enhances engagement (e.g., toggling layers for temporal analysis).  

But too many interactive elements can overwhelm users.  

<mark style="background: #04FF00A6;">Best Practice:</mark> 
- Keep interactions intuitive  
- Users should easily understand how to manipulate the map.  
- Provide user guidance (e.g., instructions, tooltips) to help users navigate complex maps.  
- Ensure smooth performance  
- Large datasets and complex interactions can slow down web maps.  

<mark style="background: #04FF00A6;">Pitfalls:</mark>
- Users may not know how to interact with the map.  
- Too many controls (zoom, pan, layer toggles, tooltips, etc.) can overwhelm users.  
- Tooltips can obstruct important map details or appear inconsistently.  
- If toggling layers, users may struggle to understand what each layer represents.  
- Heavy data layers, complex visualizations, or too many markers can make the map unresponsive.

### <mark style="background: #04FF00A6;">Simplicity is key</mark> 

Simple colour palettes  

<mark style="background: #04FF00A6;">Simple message:</mark>
- Keep your message as simple as possible.  
- Keep sentences short, concise sentences, and precise.  

<mark style="background: #04FF00A6;">Simple visualisation:</mark>
- Keep it uncluttered.  
- Remove unnecessary components, such as grid lines, labels, borders and shading.  
- Have a clear flow and be easy to follow from top to bottom, left to right (or the default reading style of your audience).

### <mark style="background: #04FF00A6;">The Hidden Stack of a Map</mark> 

<mark style="background: #04FF00A6;">Visible layers:</mark>
- Shapes  
- Colours  
- Labels  

<mark style="background: #04FF00A6;">Invisible layers:</mark>
- CRS  
- Projection  
- Aggregation  
- Classification

### <mark style="background: #04FF00A6;">Summary</mark>

<mark style="background: #04FF00A6;">Building a map requires decisions at multiple levels:</mark> 
- Projection  
- CRS  
- Geometry  
- Aggregation  
- Classification  
- Encoding  
- Annotation  

A map is not just layers.  

It is layered decisions.

### <mark style="background: #04FF00A6;">Building Maps in R</mark>

<mark style="background: #04FF00A6;">sf = simple features:</mark>
- It represents spatial data as:  
- Geometry (points, lines, polygons)  
- Attribute table (data frame)  
- CRS information  
- Each row = one spatial feature  
- Each feature = shape + attributes  

<mark style="background: #04FF00A6;">Key functions:</mark>  
- ``st_read()`` → import shapefiles / GeoJSON  
- ``st_crs()`` → check coordinate reference system  
- ``st_transform()`` → reproject  
- ``st_area()`` / ``st_distance()`` → spatial measurement  
- ``st_union()`` / ``st_join()`` → spatial operations

ggplot2 - ``geom_sf()``  

<mark style="background: #04FF00A6;">Handles:</mark>  
- Projection automatically  
- Layering  
- Colour scales  
- Legends  
- Themes

<mark style="background: #04FF00A6;">Supporting packages:</mark>  
- ``classInt`` → classification (quantile, Jenks, equal)  
- viridis → perceptually uniform colour scales  
- geodata / rnaturalearth → boundary data  
- leaflet → interactive maps  
- patchwork → compare maps side-by-side

<mark style="background: #04FF00A6;">In practice, building a map requires some or all of the following:</mark>
- Import geometry (sf)  
- Check CRS  
- Transform projection  
- Compute measures (area, distance)  
- Classify values  
- Encode with ggplot2  
- Layer annotations