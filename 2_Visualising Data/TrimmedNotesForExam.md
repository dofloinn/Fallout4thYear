### <mark style="background: #04FF00A6;">1. Exploratory vs Explanatory Visualisation</mark>

<mark style="background: #04FF00A6;">Core Distinction:</mark>

|Feature|Exploratory|Explanatory|
|---|---|---|
|Purpose|Discover patterns, find the story|Communicate a known insight|
|Audience|Analyst / researcher (yourself)|Decision-makers, executives, general public|
|Design|Flexible, detailed, rough|Curated, focused, polished, editorial|
|Data shown|All of it - noise and signal together|Selected subset that supports the message|
|Interaction|Often interactive / high|Minimal or none; annotation-driven|
|Axis rescaling|Freely - to reveal structure|Sparingly and transparently only|
|Example|Scatter matrix, interactive dashboard|Single annotated bar chart|

Exam signal words: "stakeholder presentation", "executives", "marketing team", "clear summary" → ALWAYS explanatory. "Explore", "identify patterns", "detect", "assess whether" → ALWAYS exploratory.



<mark style="background: #04FF00A6;">Key Principles of Explanatory Visualisation:</mark>
- Know your audience - design for their expertise level and decision-making needs
- Know the story - identify ONE key message (the "Big Idea") before choosing a chart
- Make editorial decisions - remove everything that does not support that message
- Reduce cognitive load - viewers should not have to work to find the insight
- Use pre-attentive attributes - colour, size, position to guide the eye immediately
- Select focused data - only include what supports the story; everything else is noise

### <mark style="background: #04FF00A6;">The Big Idea</mark>

The single most important insight, expressible in one sentence. It drives chart selection, encoding decisions, and narrative structure.

<mark style="background: #04FF00A6;">Example:</mark> "Countries with higher GDP tend to live longer, but the relationship plateaus at high income levels."
- Prevents chart dumping (showing everything you found rather than what matters)
- Explanatory pipeline: Explore data → Select ONE key message → Build visuals to support it
- Not everything you discover belongs in the final visualisation

### <mark style="background: #04FF00A6;">Univariate / Bivariate / Multivariate</mark>

|Type|Definition|Example|
|---|---|---|
|Univariate|Single variable; understand distribution, central tendency, spread|Histogram of customer ages|
|Bivariate|Two variables; shows relationship|Scatter plot: income vs. average spend|
|Multivariate|Three or more variables simultaneously|Bubble chart: income (x), spend (y), loyalty points (size), category (colour)|

### <mark style="background: #04FF00A6;">Narrative Approaches</mark>

|Approach|Characteristics|Best Used For|
|---|---|---|
|Linear (Report/Slides)|Step-by-step; each chart builds on previous; high clarity, low interaction; passive user|Annual report, presentation, teaching|
|Scrollytelling|Story unfolds as user scrolls; animations; high engagement; can increase cognitive load|Complex stories with progression; news articles|
|Dashboard|Multiple views at once; user-driven exploration; filters/controls; no single narrative|Business monitoring; multiple simultaneous questions|

<mark style="background: #04FF00A6;">Choosing the approach:</mark>
- Explain one insight clearly → Linear
- Tell an engaging story → Scrollytelling
- Support exploration / decisions → Dashboard

### <mark style="background: #04FF00A6;">2. Chart Types & When to Use Them</mark>

Chart Selection by Analytical Task

|Analytical Task|Best Chart Type|
|---|---|
|Comparison across categories|Bar chart (horizontal for many categories; sort by value)|
|Part-to-whole / proportions|Pie chart (≤4 categories only); stacked bar|
|Distribution of one variable|Histogram, density plot, box plot, violin plot|
|Relationship between 2 numeric variables|Scatter plot|
|Change over time (continuous)|Line chart|
|Change over time (discrete intervals)|Bar chart|
|Abrupt change at a specific point in time|Step chart|
|Multiple categories over time|Small multiples (faceted line charts)|
|Two variables + density|Hexbin plot, 2D density plot|
|Geographic / spatial patterns|Choropleth map, point map, bubble map|
|Hierarchical data|Treemap|
|Composition across groups (additive only)|Stacked bar / stacked area|
|Correlation across many variables|Scatter matrix, correlation heatmap|
|Distribution across multiple groups|Box plot (fast comparison) or violin plot (richer shape)|

### <mark style="background: #04FF00A6;">Perceptual Accuracy - Cleveland & McGill Ranking</mark>

Humans judge some visual encodings far more accurately than others. Always use the most accurate encoding for the most important comparison.

|Rank|Encoding|Example Chart|
|---|---|---|
|1st (most accurate)|Position on a common scale|Bar charts, dot plots|
|2nd|Position on identical but non-aligned scales|Small multiples|
|3rd|Length|Bar height|
|4th|Angle / slope|Pie slices, line steepness|
|5th|Area|Bubble charts, treemaps|
|6th|Volume|3D charts (generally avoid)|
|7th (least accurate)|Colour saturation / shading|Heatmaps, choropleths|

<mark style="background: #04FF00A6;">Exam rule:</mark> When justifying a chart choice, always cite perceptual accuracy. Bar charts beat pie charts because length > angle. Scatter plots beat tables because position encodes relationships directly.

### <mark style="background: #04FF00A6;">Key Chart Comparisons</mark>

<mark style="background: #04FF00A6;"> Bar Chart vs Pie Chart:</mark>
- <mark style="background: #04FF00A6;">Bar:</mark> uses length on a common scale - most accurate for comparison and ranking
- <mark style="background: #04FF00A6;">Pie:</mark> uses angle and area - less precise; suitable only for very coarse proportions with ≤4 categories
- <mark style="background: #04FF00A6;">Default rule:</mark> prefer bar over pie for any precise comparison

 Histogram vs Box Plot vs Violin Plot

|Chart|Use / Trade-off|
|---|---|
|Histogram|Shows full distribution shape; reveals skew, peaks, gaps; affected by bin choice|
|Box Plot|Summary: median, Q1, Q3, whiskers, outliers; fast group comparison; hides shape detail; lower cognitive load|
|Violin Plot|Shows full density shape AND quartiles; richer than box plot; harder to read; higher interpretation cost|

Box plot = clarity and speed. Violin plot = richness and detail. The same visualisation choice is not equally good for exploration and explanation.

<mark style="background: #04FF00A6;">Line Chart vs Bar Chart (Time):</mark>
- <mark style="background: #04FF00A6;">Line:</mark> implies continuity between points - use only when intermediate values are meaningful
- <mark style="background: #04FF00A6;">Bar:</mark> implies discrete measurements - use for monthly totals, distinct time periods
- <mark style="background: #04FF00A6;">Step chart:</mark> values stay constant until an abrupt change - use for policy thresholds, interest rates; avoids inventing movement between two known points
- Choosing between them is a modelling decision about how the phenomenon actually behaves, not just a formatting choice

<mark style="background: #04FF00A6;">Stacked vs Grouped Bar / Stacked Area:</mark>

| Chart                | When to Use                                                    | Key Problem                                                         |
| -------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------- |
| Stacked bar          | Categories that are genuinely parts of a whole (compositional) | Only bottom category has a common baseline; upper categories float  |
| Grouped (dodged) bar | Comparing categories within each time period                   | Uses more space but far more readable                               |
| Stacked area         | Showing how composition of a total evolves over time           | Same floating baseline problem; upper bands hard to read accurately |
| Small multiples      | Multiple independent categories over time                      | Best solution - each panel has its own baseline                     |

<mark style="background: #04FF00A6;">Critical:</mark> Stacking encodes additive/compositional meaning. If your categories are independent measures (not parts of a meaningful total), stacking misleads by implying a structure that does not exist.

<mark style="background: #04FF00A6;">Example:</mark> Hospital admission types (emergency, elective, geriatric) should use small multiples, not a stacked area chart. They are independent measures, not parts of a whole whose sum is meaningful for comparison.

<mark style="background: #04FF00A6;">Scatter Plot:</mark>
- Each point = one observation; position encodes two numeric variables on common axes
- <mark style="background: #04FF00A6;">Optimised for:</mark> relationships, trends, clusters, outliers
- <mark style="background: #04FF00A6;">Overplotting solutions:</mark> transparency (alpha), jitter, smaller points, hexbin, faceting, aggregation
- Add a regression line (``geom_smooth``) to summarise trend and reduce cognitive load
- <mark style="background: #04FF00A6;">Scatterplots struggle when:</mark> too many points (overplotting), too many groups (colour confusion), too many dimensions (clutter)

<mark style="background: #04FF00A6;">Heatmap:</mark>
- Encodes values as colour intensity in a grid
- <mark style="background: #04FF00A6;">Good for:</mark> large datasets, density, showing multiple variables compactly (rows × columns)
- <mark style="background: #04FF00A6;">Loses:</mark> individual point detail, precise values, outliers
- Use sequential colour scale for quantitative values

### <mark style="background: #04FF00A6;">3. Gestalt Principles</mark>

Gestalt principles are the "laws" governing human visual perception - how the brain groups elements, recognises patterns, and simplifies complex images into a unified whole. In data visualisation, we use them to control grouping, attention, and interpretation.

### <mark style="background: #04FF00A6;">The Seven Principles</mark>

 <mark style="background: #04FF00A6;">1. Proximity</mark>

Elements placed close together are perceived as a group, even without colour or shape similarity.

- <mark style="background: #04FF00A6;">Application:</mark> place related labels near their data points; cluster related chart elements spatially; group bars that belong to the same category
- <mark style="background: #04FF00A6;">Violation:</mark> randomly spacing elements destroys grouping cues and increases cognitive load
- Proximity can override similarity - spatial closeness is a very strong grouping cue

<mark style="background: #04FF00A6;">Example:</mark> 16 sales observations grouped by region vs. by quarter simply by changing their spatial arrangement shifts the chart's entire focus._

 <mark style="background: #04FF00A6;">2. Similarity</mark>

Elements sharing visual characteristics (colour, shape, size, texture) are perceived as belonging to the same category.

- <mark style="background: #04FF00A6;">Application:</mark> use consistent colour for the same data type; different colours only for genuinely different categories
- <mark style="background: #04FF00A6;">Violation:</mark> using different colours for bars that all represent the same variable type implies a categorical distinction that does not exist - the brain searches for meaning in the colour difference even if there is none
- <mark style="background: #04FF00A6;">Key insight:</mark> similarity creates meaning even when unintended - decorative colour use is never neutral

<mark style="background: #04FF00A6;">Example:</mark> A bar chart where all bars are the same blue = correct. Different colours per bar = violation of similarity - implies each bar is a distinct category._

 <mark style="background: #04FF00A6;">3. Closure</mark>

The mind fills in gaps to perceive complete shapes - we see complete figures even when parts are missing or information is incomplete.

- <mark style="background: #04FF00A6;">Application:</mark> remove unnecessary bounding boxes from charts - viewers will still perceive the chart as a complete, bounded object without them
- Reduces visual clutter without losing structural clarity
- The Kanizsa Triangle is the classic example: we perceive a solid triangle that is not actually drawn

 <mark style="background: #04FF00A6;">4. Continuity</mark>

The eye prefers smooth, continuous paths and follows lines naturally. Horizontal scanning is faster than vertical (up to 5×).
- <mark style="background: #04FF00A6;">Application:</mark> sort bar charts so values form a smooth descending (or ascending) slope; use left-to-right flow in layouts; align elements horizontally
- <mark style="background: #04FF00A6;">Violation:</mark> randomly ordered bars create a zig-zag pattern the eye cannot follow, increasing cognitive load significantly
- <mark style="background: #04FF00A6;">Design principle:</mark> always sort categorical charts by value unless there is a specific reason to use another order (alphabetical, temporal)

 <mark style="background: #04FF00A6;">5. Connectedness</mark>

Objects connected by lines or curves are perceived as related - one of the strongest grouping cues, able to override both proximity and similarity.

- <mark style="background: #04FF00A6;">Application:</mark> connecting data points with a line implies they belong to a series (e.g., a country's GDP over time)
- <mark style="background: #04FF00A6;">Effect:</mark> leaving some points unconnected implies they are anomalies or outliers; the viewer's brain perceives connected points as a continuous object, separate from unlinked elements
- <mark style="background: #04FF00A6;">Warning:</mark> the same data shown connected vs. unconnected looks completely different - connectedness changes interpretation even when values are identical

 <mark style="background: #04FF00A6;">6. Figure-Ground</mark>

Viewers automatically distinguish foreground objects (figures) from background elements (ground). Objects in the foreground are promoted in importance.

- <mark style="background: #04FF00A6;">Application:</mark> ensure chart elements (bars, lines, points) have strong contrast against a neutral, muted background
- <mark style="background: #04FF00A6;">Violation:</mark> gridlines or background elements with too much visual weight compete with data for attention
- <mark style="background: #04FF00A6;">Consequence:</mark> poor contrast = increased cognitive load; strong contrast = pre-attentive focus on data

<mark style="background: #04FF00A6;">7. Common Fate</mark>

Elements moving in the same direction are perceived as a group. Critical for animation and interaction.

- <mark style="background: #04FF00A6;">Application:</mark> in animated charts, data points moving upward together imply a common trend or group membership
- Even without colour coding, synchronous movement creates stronger grouping than similarity alone
- The law of common fate can override similarity (colour) when movement is involved

### <mark style="background: #04FF00A6;">Law of Prägnanz (Simplicity)</mark>

<mark style="background: #04FF00A6;">Overarching principle:</mark> people perceive complex images in the simplest, most organised form possible. The brain prefers order, symmetry, and simplicity over chaos. Organise charts simply and logically. Less is more.

### <mark style="background: #04FF00A6;">Focal Point Principle</mark>

A few distinctive-looking objects create focal points that direct the reader's eye. Use sparingly - too many focal points means none. 

<mark style="background: #04FF00A6;">Methods:</mark> colour contrast, enclosures (boxes around a region of interest), or size difference.

### <mark style="background: #04FF00A6;">Cognitive Overload & Gestalt</mark>

Cognitive overload occurs when extraneous cognitive load - complexity caused by poor design - exhausts working memory (capacity ~7±2 items).

<mark style="background: #04FF00A6;">Gestalt violations increase extraneous load:</mark>
- <mark style="background: #04FF00A6;">Similarity violation:</mark> brain automatically tries to extract meaning from colour differences that carry none → wastes working memory on decoding non-existent meaning
- <mark style="background: #04FF00A6;">Continuity violation:</mark> viewer must search for items instead of scanning a logical sequence → holds multiple values in memory simultaneously
- <mark style="background: #04FF00A6;">Too many principles combined:</mark> proximity + similarity + enclosure + connectedness simultaneously → impossible to determine which grouping is primary

<mark style="background: #04FF00A6;">Exam structure for Gestalt questions:</mark>
1. Name the principle and define it
2. Explain how the design violates it specifically
3. State the cognitive/interpretive consequence for the viewer
4. Propose a concrete design fix

### <mark style="background: #04FF00A6;">Common Exam Scenarios - Gestalt</mark>

|Design Problem|Gestalt Principle Violated|
|---|---|
|Bar chart with different colours for bars showing the same variable|Similarity - implies false categorical distinction|
|Categories in random order|Continuity / Prägnanz - no smooth visual flow|
|Scattered symbols of different shapes and colours on a map|Similarity + Proximity - no grouping cues for geographic patterns|
|Heavy gridlines competing with chart data|Figure-Ground - background competes with foreground figures|
|Line chart with non-equidistant time intervals on x-axis|Continuity - slope perception is distorted|
|No legend, unrelated symbols used per line|Similarity - viewer cannot group series; cannot interpret the chart|
|Multiple different grouping cues used simultaneously|Prägnanz - too complex; viewer cannot determine primary grouping|


### <mark style="background: #04FF00A6;">4. Human Perception, Memory & Cognitive Load</mark>

<mark style="background: #04FF00A6;">Types of Memory in Visualisation:</mark>

|Memory Type|Key Facts|
|---|---|
|Iconic / Sensory Memory|~250–500ms duration; captures raw visual features (colour, shape, size, position) before conscious attention; most information discarded unless it receives attention|
|Working / Short-Term Memory|Limited to ~7±2 items; ~15–30 seconds duration; used for comparison and reasoning; easily overloaded - this is what poor design attacks|
|Long-Term Memory|Stores prior knowledge and experience; supports recognition and interpretation; requires encoding (repetition, elaboration, emotional impact, visual imagery)|

Good design uses iconic memory (pre-attentive features) to deliver the key insight. Poor design overloads working memory by forcing viewers to hold and compare many values mentally.

### <mark style="background: #04FF00A6;">Pre-Attentive Processing</mark>

The ability to instantly detect visual differences before conscious effort - happens in under 500ms. No deliberate attention required.

<mark style="background: #04FF00A6;">Key pre-attentive features:</mark>
- Colour (hue, saturation, value/brightness)
- Size
- Position
- Shape / orientation
- Motion

<mark style="background: #04FF00A6;">Implication:</mark> if an insight depends on a pre-attentive feature, viewers will perceive it instantly with no effort. If it requires mentally comparing numbers or searching for labels, it is not pre-attentive and increases cognitive load.

"If they have to search for it, you've already lost them."

### <mark style="background: #04FF00A6;">Cognitive Load Theory</mark>

|Type|Definition|Designer's Role|
|---|---|---|
|Intrinsic Load|Inherent complexity of the data or task itself|Cannot be eliminated, but good visualisation reduces it|
|Extraneous Load|Unnecessary complexity caused by poor design (clutter, bad encoding, random ordering)|Minimise this - it is entirely the designer's responsibility|
|Germane Load|Useful mental effort that builds understanding and transfers to long-term memory|Support this - good design enables productive thinking|


<mark style="background: #04FF00A6;">Reducing Cognitive Load - Design Techniques:</mark>
- Use position and length (most accurate encodings) rather than area or colour for key comparisons
- Sort categories logically - by value, alphabet, or time - never randomly
- Use direct labelling instead of legends where possible - eliminates the memory cost of legend lookup
- Apply consistent colour, font, and scale across related charts
- Remove non-data ink: excessive gridlines, borders, 3D effects, decorative elements (chartjunk)
- Use small multiples instead of one dense, overloaded chart
- Annotate key insights directly on the chart - don't make the viewer infer the message
- Limit encodings: humans struggle to interpret more than 3–4 visual dimensions simultaneously
- Use chunking: group related information together so the visual system can process it as a unit

### <mark style="background: #04FF00A6;">Visual Perception Hierarchy</mark>

<mark style="background: #04FF00A6;">How information flows through the brain:</mark>
1. <mark style="background: #04FF00A6;">Pre-attentive (iconic memory):</mark> colour, size, position, shape detected instantly (<500ms)
2. <mark style="background: #04FF00A6;">Attentive (working memory):</mark> directed focus; brain filters and processes what is important; slow and deliberate
3. <mark style="background: #04FF00A6;">Long-term memory:</mark> prior knowledge supports recognition; familiar chart types are interpreted faster

Well-designed visualisations exploit the pre-attentive stage to deliver the key insight before the viewer consciously tries to read the chart.

### <mark style="background: #04FF00A6;">5. Time-Series Visualisation</mark>

<mark style="background: #04FF00A6;">What We Perceive in Time-Series Data:</mark>

| Pattern                       | Description                                                                                                           |
| ----------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| Trend                         | Long-term directional movement (upward, downward, flat); perceived through overall slope                              |
| Seasonality                   | Regular, repeating cycles at fixed intervals (daily, weekly, annual); predictable in timing and approximate magnitude |
| Anomalies / Structural breaks | Unexpected deviations from trend or permanent shifts following a major event; not predictable in advance              |
| Volatility                    | Degree of variation / noise in the series; perceived as jaggedness of the line                                        |
| Rate of change                | How fast values are changing - perceived through line steepness (slope)                                               |

### <mark style="background: #04FF00A6;">Chart Type Decisions for Time-Series</mark>

|Chart Type|When to Use|
|---|---|
|Line chart|Continuous data where intermediate values are meaningful; shows trend, seasonality, anomalies|
|Bar chart|Discrete time periods (monthly totals); comparing individual values; no implied continuity|
|Step chart|Values held constant until an abrupt change; use for policy thresholds, interest rates; avoids visually inventing movement|
|Cycle plot|Reveals seasonality - each time unit (e.g. month) has its own panel with multiple years overlaid|
|Small multiples|Multiple categories over time without the spaghetti problem|
|Annotated line chart|Anomalies and structural breaks - add vertical reference line + annotation to explain the cause|

### <mark style="background: #04FF00A6;">Common Time-Series Design Mistakes</mark>

- <mark style="background: #04FF00A6;">Truncated y-axis:</mark> exaggerates small changes by not starting at zero - always question whether the baseline distorts the story
- <mark style="background: #04FF00A6;">Dual y-axes:</mark> misleads viewers into seeing a relationship between two series that may not actually exist
- <mark style="background: #04FF00A6;">The Spaghetti Problem:</mark> too many lines → impossible to distinguish individual series; solutions:
    - <mark style="background: #04FF00A6;">Small multiples:</mark> split into separate panels with consistent scale
    - <mark style="background: #04FF00A6;">Highlighting:</mark> one line in strong colour, all others in light grey
    - <mark style="background: #04FF00A6;">Direct labelling:</mark> place labels at the end of each line instead of using a legend
- <mark style="background: #04FF00A6;">Over-smoothing:</mark> hides important variation, turning points, and anomalies
- <mark style="background: #04FF00A6;">Unequal time intervals on x-axis:</mark> distorts perceived rate of change - slope no longer accurately represents speed of change
- <mark style="background: #04FF00A6;">Stacking non-compositional data:</mark> implies a meaningful total that does not exist

### <mark style="background: #04FF00A6;">Stacked Area Charts - Benefits and Problems</mark>

<mark style="background: #04FF00A6;">Benefits:</mark>
- Shows the overall total at a glance (the top boundary = cumulative total)
- Communicates broad compositional change - how the mix has shifted over time
- Useful high-level overview when the precise trend of individual components is not the primary concern

<mark style="background: #04FF00A6;">Problems (frequently examined):</mark>
- Only the bottom category has a common baseline - all others float, making accurate reading of individual bands impossible without mental subtraction
- Mental subtraction required for upper bands - violates the principle that position on a common scale is the most accurate encoding
- Volatility and fine fluctuations within upper categories are obscured
- Implies additive/compositional meaning - misleads if categories are independent measures
- Reordering categories changes the apparent shape of every band above it
- Encoding carries structural meaning: stacking = composition, contribution, share, part-whole - if data does not have that structure, the encoding misleads

<mark style="background: #04FF00A6;">Alternative:</mark> Small multiples (faceted line charts) - one panel per category, shared y-axis scale, each with its own common baseline. Directly addresses all stacked area problems.



### <mark style="background: #04FF00A6;">Noise Management Techniques</mark>

|Technique|How It Works|Trade-off|
|---|---|---|
|LOESS smoothing|Fits local regressions; span controls reactivity - smaller span = more reactive to data; larger span = more stable|Changing span changes the narrative; over-smoothing hides turning points|
|Moving average|Averages last N observations; window size controls stability vs. responsiveness|Introduces lag - delays perception of turning points; can misrepresent when a trend changed|
|Aggregation|Groups raw data into broader intervals (daily → weekly); reduces noise, reveals trend|Loses individual variation and precision; hides short-term events|
|Outlier filtering|Removes extreme values, compressing the scale|Can hide rare but important events - a narrative decision, not just a technical one|

Noise management techniques do not just clarify data - they shape how change is perceived. Every smoothing choice is an analytical and editorial responsibility.

### <mark style="background: #04FF00A6;">Line vs Bar vs Step - A Design Integrity Decision</mark>

- <mark style="background: #04FF00A6;">Line:</mark> implies gradual, continuous change between points - use when intermediate values exist and are meaningful
- <mark style="background: #04FF00A6;">Bar:</mark> implies discrete, separate measurements use when comparing distinct time periods
- <mark style="background: #04FF00A6;">Step:</mark> implies values are held constant until a sudden change use for interest rates, policy thresholds, system states
- Choosing incorrectly means visually inventing movement (line where step is correct) or hiding continuity (bar where line is correct)

### <mark style="background: #04FF00A6;">6. Geospatial Visualisation</mark>

<mark style="background: #04FF00A6;">Types of Map Visualisation:</mark>

|Map Type|Best Use|Key Notes|
|---|---|---|
|Choropleth|Aggregated regional statistics (e.g. unemployment rate by county)|Most common thematic map; must normalise data (per capita) to prevent large areas dominating|
|Isarithmic / Isopleth|Continuous data crossing political boundaries; e.g. weather, elevation, rainfall|No boundary dependence; interpolated between measurement points|
|Dot density / Point map|Geographic distribution and clustering of individual events or observations|Can suffer overplotting in dense areas|
|Bubble / Proportional symbol|Magnitude of a value at geographic locations|Uses area encoding (less accurate); large bubbles can obscure the underlying map|
|Flow / Line map|Movement or connections; migration, trade, transport|Arrow direction shows flow direction; line thickness shows magnitude|
|Cartogram|Distorting geography to represent data values (area-based)|Types: contiguous (maintains borders), non-contiguous (preserves shape), Dorling (circles), tile/mosaic|

### <mark style="background: #04FF00A6;">Choropleth Design Principles</mark>

<mark style="background: #04FF00A6;">Always normalise data:</mark> use per capita or per area rates, not raw counts; large/populous regions appear artificially large without normalisation

<mark style="background: #04FF00A6;">Choose classification method thoughtfully:</mark> it changes the story the map tells

|Classification|How It Works|Story It Tells|Problem|
|---|---|---|---|
|Equal intervals|Divides full range into equal-width bins|"Only a few regions are extreme"|Most data falls into the lowest class with skewed data|
|Quantiles|Forces equal number of regions into each class|"Variation is everywhere"|May group regions with very different values together|
|Natural breaks (Jenks)|Groups regions with similar values; breaks where natural clusters exist|"There are real clusters in the data"|Irregular class widths; harder to explain|

<mark style="background: #04FF00A6;">Classification is not formatting:</mark> it is narrative framing. The data does not change; only the class boundaries do. Yet the political and policy interpretation can change completely.
- <mark style="background: #04FF00A6;">Use sequential colour scale</mark> (light → dark) for ordered quantitative data
- <mark style="background: #04FF00A6;">Use diverging scale</mark> (two hues + neutral midpoint) for data with a meaningful centre (e.g. above/below zero)
- Use categorical/qualitative scale (distinct hues) for nominal categories
- <mark style="background: #04FF00A6;">Border colour:</mark> distinguishable but not so prominent it competes with the fill colour

### <mark style="background: #04FF00A6;">Modifiable Areal Unit Problem (MAUP)</mark>

Occurs when the same underlying data, aggregated into different spatial units, produces different visual and statistical results. Arises because spatial boundaries are human constructs, not natural divisions.
- <mark style="background: #04FF00A6;">Scale effect:</mark> changing the size of spatial units (county → province → national) smooths out patterns; larger units = smoother patterns, less visible local variation
- <mark style="background: #04FF00A6;">Zone effect:</mark> even at the same scale, changing how boundaries are drawn changes the statistical results and apparent patterns
- <mark style="background: #04FF00A6;">Implication:</mark> always ask "relative to what boundary?" when interpreting a choropleth. Maps don't just reveal patterns - they help create them.

### <mark style="background: #04FF00A6;">Map Projections & CRS</mark>

| Type                                     | Characteristics                                                                                           |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------- |
| Conformal (e.g. Mercator)                | Preserves local shapes; distorts area - makes high-latitude regions appear larger than they are           |
| Equal-area (e.g. Gall-Peters, Mollweide) | Preserves area proportions; distorts shapes - used for population and distribution maps                   |
| Equidistant                              | Preserves distances from specific points; distorts shape and area elsewhere                               |
| Geographic CRS                           | Uses latitude/longitude; accurate for location; poor for distance/area calculations                       |
| Projected CRS                            | Converts to flat X, Y coordinates; accurate for distance and area; introduces distortion over large areas |

You cannot simultaneously preserve area, shape, distance, and direction on a flat map - every projection is a trade-off.

<mark style="background: #04FF00A6;">CRS ≠ Projection:</mark> Projection is part of CRS. CRS provides the full spatial reference framework (datum + projection + units + coordinate system).

### <mark style="background: #04FF00A6;">Map Design - Colour, Scale, Interactivity</mark>

<mark style="background: #04FF00A6;">Colour Schemes:</mark>
- <mark style="background: #04FF00A6;">Sequential:</mark> light → dark for low → high values (population density, temperature, admission rates)
- <mark style="background: #04FF00A6;">Diverging:</mark> two contrasting hues + neutral midpoint for data with a meaningful centre (political maps, temperature anomalies above/below average)
- <mark style="background: #04FF00A6;">Categorical:</mark> distinct, easily-distinguishable hues for discrete classes (land use, party affiliation, region type)
- Limit to ≤6–8 distinct colours; check colour-blind accessibility (avoid red-green); use viridis or ColorBrewer palettes

<mark style="background: #04FF00A6;">Interactivity:</mark>
- <mark style="background: #04FF00A6;">Hover tooltips:</mark> provide detail on demand without cluttering the main map
- <mark style="background: #04FF00A6;">Zoom and pan:</mark> allow users to examine specific regions
- <mark style="background: #04FF00A6;">Layer toggles:</mark> show/hide variables - risk of overwhelming users with too many controls
- <mark style="background: #04FF00A6;">Best practice:</mark> keep interactions intuitive; provide guidance; ensure smooth performance with large datasets

### <mark style="background: #04FF00A6;">Tailoring Maps to Different Audiences</mark>

|Audience|Design Needs|
|---|---|
|Executives / Strategic|High-level overview; aggregated choropleth with few classes; KPIs visible at a glance; minimal detail; clear legend|
|Operational managers|Real-time or near-real-time data; interactive; drill-down capability; delivery times, bottlenecks, resource allocation|
|Marketing teams|Customer density heatmaps; regional behaviour patterns; filterable by segment; comparable across regions|
|General public / customers|Simple and intuitive; minimal jargon; clear legend; accessible colour palette; interactive tracking features|

# <mark style="background: #04FF00A6;">7. Uncertainty in Data Visualisation</mark>

### <mark style="background: #04FF00A6;">What Is Uncertainty & Why It Matters</mark>

<mark style="background: #04FF00A6;">Uncertainty</mark> refers to the inherent variability, errors, or limitations in data and the models used to analyse it.

<mark style="background: #04FF00A6;">Failing to communicate uncertainty leads to:</mark>
- <mark style="background: #04FF00A6;">False precision:</mark> viewers treat estimates as facts
- <mark style="background: #04FF00A6;">Misleading comparisons:</mark> differences that appear significant may fall within overlapping confidence intervals
- <mark style="background: #04FF00A6;">Overconfidence in decisions:</mark> policy or business choices made without understanding the reliability of the underlying data
- <mark style="background: #04FF00A6;">Loss of trust:</mark> when predictions prove wrong, undisclosed uncertainty damages credibility

"Acknowledging uncertainty leads to more reliable, ethical, and effective communication of insights."

### <mark style="background: #04FF00A6;">Sources of Uncertainty</mark>

|Source|Description|Pipeline Stage|
|---|---|---|
|Measurement error|Inaccurate instruments, human error, environmental factors; e.g. faulty temperature sensor recording 2°C too high|Data Collection|
|Sampling variability|Natural differences between a sample and the full population; two polls of 1,000 people produce different results|Data Collection|
|Model assumptions|Statistical models assume linearity, independence etc.; real behaviour may be more complex|Analysis / Modelling|
|Data transformation choices|Aggregation, normalisation, categorisation decisions; e.g. grouping income into broad bands hides within-band variation|Transformation|
|Missing / incomplete data|Absent values introduce bias if not handled properly; non-response, measurement failure|Cleaning|
|Outliers|Values that differ greatly from others; may be measurement errors or valid extreme cases|Cleaning / EDA|

### <mark style="background: #04FF00A6;">The Visualisation Pipeline & Where Uncertainty Enters</mark>

| Pipeline Stage       | Uncertainty Source                                      | Mitigation                                                                                           |
| -------------------- | ------------------------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| Data Collection      | Measurement errors, sensor limits, sampling bias        | Document instrument precision; acknowledge potential bias in annotations                             |
| Data Cleaning        | Decisions about outliers and missing values             | Document choices; consider imputation vs removal; assess impact on conclusions                       |
| Data Transformation  | Aggregation and normalisation assumptions               | Ensure transformations do not increase uncertainty; accompany aggregated values with spread measures |
| EDA                  | Sampling variability affects observed patterns          | Use error bars, confidence intervals, bootstrapping to explore and represent uncertainty             |
| Visualisation Design | Inappropriate chart types misrepresent uncertainty      | Choose charts that make uncertainty visible (shaded regions, error bars, fan charts)                 |
| Design & Styling     | Visual clutter obscures uncertainty indicators          | Use colour gradients, interactive features; properly label and scale uncertainty markers             |
| Publication          | Audience misinterpretation if uncertainty not explained | Accompany visualisations with clear annotations; explain what uncertainty markers mean               |

### <mark style="background: #04FF00A6;">Visual Techniques for Representing Uncertainty</mark>

| Technique                         | How to Use It                                                                                                                                                                                  |
| --------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Error bars                        | Show standard deviation, standard error, or confidence interval around a mean or estimate; added to bar charts and dot plots; makes clear the estimate is not exact                            |
| Confidence bands (shaded regions) | Shaded area around a trend or regression line showing the range of plausible values; wider where data is sparse or the forecast horizon is distant                                             |
| Fan charts                        | Show multiple possible future scenarios as progressively wider bands; uncertainty grows over time; use for economic and climate forecasts                                                      |
| Box plots / Violin plots          | Show spread, median, quartiles, and outliers across groups; makes variability visible rather than reporting only averages                                                                      |
| Jitter + Transparency             | Separate overlapping points; darker areas indicate higher density; reveal hidden patterns in dense data                                                                                        |
| Spatial uncertainty               | Opacity (lower = less reliable); hatching/patterns (estimated vs measured areas); blurred boundaries (uncertain zones); bivariate maps (colour = value, saturation/transparency = uncertainty) |

### <mark style="background: #04FF00A6;">Choosing the Right Uncertainty Technique</mark>

|Goal|Recommended Technique|
|---|---|
|Show numeric uncertainty around a mean or estimate|Error bars|
|Show uncertainty around a trend or regression line|Confidence bands (shaded region)|
|Show variation in data across groups|Box plots or violin plots|
|Reveal overlapping observations and density|Jitter + transparency|
|Show forecast uncertainty growing over time|Fan charts|
|Show uncertainty in a geographic context|Opacity, hatching, blurred boundaries, bivariate maps|

### <mark style="background: #04FF00A6;">Key Design Principle for Uncertainty</mark>

- <mark style="background: #04FF00A6;">Avoid suggesting false precision:</mark> a single line or bar implies certainty
- <mark style="background: #04FF00A6;">Make uncertainty visible:</mark> add error bars, bands, or ranges
- <mark style="background: #04FF00A6;">Clearly explain what the uncertainty represents:</mark> label your confidence intervals or ranges
- <mark style="background: #04FF00A6;">Tailor to audience expertise:</mark> technical audiences can interpret confidence intervals; general audiences may need simpler language and visual metaphors

# <mark style="background: #04FF00A6;">8. Design Frameworks: ACCENT & Stephen Few</mark>


### <mark style="background: #04FF00A6;">The ACCENT Framework</mark>

The ACCENT principles emphasise six aspects that determine the effectiveness of a visual display. Used both to design new visualisations and to evaluate existing ones.

<mark style="background: #04FF00A6;">Always ask:</mark> "Does this visualisation communicate the message clearly, efficiently, and truthfully?"

|Principle|Full Definition|Application|
|---|---|---|
|A - Apprehension|Ability to correctly perceive relations among variables. Does the graph maximise apprehension of the relations?|Use appropriate chart types; ensure data relationships are visually clear; prioritise simplicity over complexity|
|C - Clarity|Ability to visually distinguish all elements. Are the most important elements visually most prominent?|Remove clutter; use readable labels and logical axis scaling; limit variables per chart; eliminate 3D effects|
|C - Consistency|Ability to interpret a graph based on similarity to previous graphs. Are elements consistent with their use elsewhere?|Same colour schemes, fonts, axis scales across related charts; reduce the re-learning burden on the viewer|
|E - Efficiency|Ability to portray a complex relation as simply as possible. Are elements economically used?|Use intuitive chart types; avoid overloading with excessive detail; use pre-attentive attributes for key highlights|
|N - Necessity|The need for the graph and each graphical element. Is every element necessary?|Remove non-essential decorations, redundant labels, unnecessary legends; if data can be shown as a table or text more clearly, consider alternatives|
|T - Truthfulness|Ability to determine true values from graphical elements. Are elements accurately positioned and scaled?|Avoid truncated axes, misleading proportions, 3D distortions; clearly indicate estimated or incomplete data|

### <mark style="background: #04FF00A6;">Applying ACCENT to Evaluate a Bad Chart</mark>

<mark style="background: #04FF00A6;">Standard exam approach:</mark>
1. Name the ACCENT principle being violated
2. Describe what the violation looks like in the specific chart
3. Explain the impact on the viewer (what do they misinterpret or fail to see?)
4. Propose a fix aligned with that principle

### <mark style="background: #04FF00A6;">Stephen Few's Principles</mark>

- <mark style="background: #04FF00A6;">Simplify:</mark> remove all clutter; every element must serve a purpose; avoid chartjunk (3D effects, decorative visuals, excessive gridlines); maximise the data-ink ratio
- <mark style="background: #04FF00A6;">Emphasise what matters:</mark> use pre-attentive attributes (colour, size, position, contrast) to highlight the key message; if everything is highlighted, nothing is
- <mark style="background: #04FF00A6;">Ensure accuracy:</mark> avoid distorted axes, improper scaling, or cherry-picked ranges that exaggerate or minimise trends
- <mark style="background: #04FF00A6;">Facilitate comparisons:</mark> use side-by-side charts or small multiples; consistent scales; aligned baselines; don't force viewers to flip between pages or screens
- <mark style="background: #04FF00A6;">Design for meaningful interactivity:</mark> filters, tooltips, drill-downs that reveal more without adding confusion; interaction should enhance, not substitute for good structure

<mark style="background: #04FF00A6;">Three key questions (Few):</mark>
1. Does the visualisation tell the right story?
2. Can the audience interpret it correctly in seconds?
3. Does it avoid unnecessary complexity?

### <mark style="background: #04FF00A6;">ACCENT vs Few - Comparison</mark>

| Few's Principle          | ACCENT Equivalent      | Key Difference                                                                                               |
| ------------------------ | ---------------------- | ------------------------------------------------------------------------------------------------------------ |
| Simplify                 | Clarity                | Few emphasises minimalism; ACCENT focuses on readability and visual distinction                              |
| Emphasise key data       | Apprehension           | Both focus on making insights clear; Few prioritises guiding attention through pre-attentive features        |
| Ensure accuracy          | Truthfulness           | Both stress avoiding distortion; Few explicitly calls out axis scaling and proportional misrepresentation    |
| Facilitate comparisons   | Consistency            | Few gives practical tips for layout and arrangement; ACCENT focuses on uniform design language               |
| Interactivity and design | Efficiency + Necessity | ACCENT includes necessity (avoid unnecessary elements); Few focuses on dashboard interactivity and usability |

### <mark style="background: #04FF00A6;">When to Apply Each Framework</mark>

<mark style="background: #04FF00A6;">Use ACCENT when:</mark> evaluating an existing visualisation for clarity and accuracy; structured review checklist needed; examining whether a chart violates a specific design principle

<mark style="background: #04FF00A6;">Use Few when:</mark> designing a visualisation from scratch; creating public-facing infographics; building dashboards; simplicity and communication are the primary goals

# <mark style="background: #04FF00A6;">9. Dashboards & Data Storytelling</mark>

### <mark style="background: #04FF00A6;">Types of Dashboard</mark>

|Type|Focus|Primary Users|Data Update|
|---|---|---|---|
|Strategic|Long-term goals and high-level performance|Executives, senior managers|Monthly, quarterly, yearly|
|Operational|Day-to-day processes and real-time monitoring|Department heads, frontline staff|Real-time, daily, weekly|
|Analytic|Patterns, trends, root causes; drill-down capability|Data analysts, BI teams|Historical + predictive|
|Geographic|Spatial data linked to location; may animate over time|Logistics, sales, public health|Varies|
|Catalog|Organises data assets with filtering and search|Product managers, content managers|Varies|

<mark style="background: #04FF00A6;">Dashboard Design Principles</mark>
- Each visualisation should answer one clear question
- Establish visual hierarchy: most important KPI → largest, most prominent, top-left position
- Use consistent colour, typography, and layout across all panels
- Apply progressive disclosure: show summary level by default; reveal detail on interaction
- Avoid redundant charts - if two charts show the same data, one must go
- Dense text competes with visual data - replace explanatory paragraphs with direct annotation on the chart
- Too many interactive controls overwhelm users - keep interaction intuitive and minimal
- Key performance indicators (KPIs) should be visible at a glance; don't bury them

### <mark style="background: #04FF00A6;">Annotation</mark>

Annotations transform exploratory charts into explanatory ones by guiding the viewer directly to the important insight.

Types: titles, captions, data point labels, highlighted regions, explanatory notes, reference lines, arrows

<mark style="background: #04FF00A6;">Good annotation:</mark>
- Minimal and purposeful
- Supports the Big Idea
- Placed directly on the chart, near the element it explains

<mark style="background: #04FF00A6;">Bad annotation:</mark>
- Too many labels; overlapping text; competes with the data
- Generic titles that describe the chart type rather than the insight (e.g. "Bar Chart of Sales" vs. "Q4 Sales Exceeded Target by 23%")

<mark style="background: #04FF00A6;">Interaction vs. Annotation:</mark>

|---|Annotation|Tooltip / Interaction|
|---|---|---|
|Visibility|Always visible|On demand only|
|Who controls it|Author-driven|User-driven|
|Best for|Explanatory visualisation|Exploratory visualisation|
|Cognitive effect|Guides attention; reduces working memory load|Hides detail; reduces clutter but requires user action|

# <mark style="background: #04FF00A6;">10. Accessibility & Responsible Visualisation</mark>

### <mark style="background: #04FF00A6;">Why Accessibility Matters</mark>

Approximately 8% of males have some form of colour vision deficiency (most commonly red-green colour blindness: deuteranopia/protanopia). Visualisations relying solely on colour for encoding exclude a significant audience segment. 

<mark style="background: #04FF00A6;">Accessibility improves:</mark>
- Usability for all users
- Ethical communication
- Compliance with standards (WCAG - Web Content Accessibility Guidelines; ADA - Americans with Disabilities Act)

<mark style="background: #04FF00A6;">Common Accessibility Problems</mark>
- Over-reliance on colour - red-green combinations; too many distinct hues (>6–8)
- Low contrast between text/elements and background (WCAG requires ≥4.5:1 ratio for normal text; 3:1 for large text ≥18pt)
- Small fonts (<14pt) and dense, overlapping labels that are hard to read
- No alternative text descriptions for screen readers
- Cluttered design that is cognitively demanding for users with attention or cognitive disabilities

<mark style="background: #04FF00A6;">Best Practices for Accessible Design</mark>
- <mark style="background: #04FF00A6;">Use colour-blind-friendly palettes:</mark> viridis (and its variants: magma, plasma, cividis), ColorBrewer
- Avoid red-green combinations for distinguishing categories - the most common form of colour blindness makes these appear identical
- <mark style="background: #04FF00A6;">Double-encode:</mark> use both colour AND shape/pattern to distinguish categories - accessible to colour-blind users regardless of palette choice
- Ensure sufficient contrast (≥4.5:1); use tools: WebAIM Contrast Checker, Color Oracle (desktop simulator), Coblis
- Use sans-serif fonts ≥14pt; direct labelling instead of legends where possible
- Keep design simple and uncluttered; minimise simultaneous visual variables

<mark style="background: #04FF00A6;">Example:</mark> Instead of red vs. green for "above target" vs. "below target", use blue vs. orange AND solid vs. hatched fill - accessible to colour-blind users regardless of the colour palette.

### <mark style="background: #04FF00A6;">Three Responsibilities of Responsible Visualisation</mark>

<mark style="background: #04FF00A6;">1. Represent the data correctly:</mark> no distortion, no truncated axes, no cherry-picked ranges; ACCENT Truthfulness principle

<mark style="background: #04FF00A6;">2. Make visualisations accessible:</mark> interpretable by all users regardless of visual ability or disability

<mark style="background: #04FF00A6;">3. Communicate uncertainty:</mark> acknowledge the limits and reliability of the data; never imply false precision

# <mark style="background: #04FF00A6;">11. Data Types, Scales & Encoding</mark>

### <mark style="background: #04FF00A6;">Measurement Scales</mark>

|Scale|Definition|Examples|Visualisation Guidance|
|---|---|---|---|
|Nominal|Categories, no order|Country, product type, streaming service, genre|Bar charts; distinct hues for colour; no gradients or ordered scales|
|Ordinal|Ordered categories; spacing is not equal|Low/medium/high; Likert scale ratings (1–5)|Sorted bar charts; ordered colour scale; spacing does not imply equal distance|
|Interval|Equal spacing but no true zero|Temperature (°C), anxiety score (0–10)|Line charts, histograms; avoid proportional comparisons (e.g. "twice as warm" is not meaningful)|
|Ratio|Equal spacing + true zero|Income, population, count, hours|All chart types; proportional comparisons meaningful ("twice as many")|

### <mark style="background: #04FF00A6;">Encoding - Mapping Data to Visual Properties</mark>

Encoding = mapping data values to visual properties. The choice of encoding determines how easily and accurately viewers can interpret the data.

|Encoding Type|Accuracy|Use|
|---|---|---|
|Position (common scale)|Most accurate|Bar charts, scatter plots, line charts - the default for comparison|
|Length|Second most accurate|Bar height|
|Angle / Slope|Less accurate|Pie slices, line steepness - avoid for precise comparison|
|Area|Less accurate|Bubble charts, treemaps - use for rough magnitude only|
|Volume|Even less accurate|3D charts - generally avoid entirely|
|Colour saturation/intensity|Least accurate for comparison|Sequential choropleths, heatmaps - use for pattern not precision|
|Hue (colour type)|Not for quantitative comparison|Categorical distinction only - separates groups, does NOT encode magnitude|

### <mark style="background: #04FF00A6;">Colour Theory in Visualisation</mark>

|Component|What It Is|Best Use|
|---|---|---|
|Hue|Type of colour; position on colour wheel|Categorical data - separates groups; does NOT encode magnitude or order|
|Saturation|Intensity / purity of colour|Emphasis - high saturation for focus elements; low saturation for background|
|Value (Brightness)|How light or dark a colour is|Ordered / quantitative data - light = low value, dark = high value|

<mark style="background: #04FF00A6;">Types of colour scale:</mark>

|Type|Use|
|---|---|
|Categorical|Distinct groups (nominal data) - different hues|
|Sequential|Low to high values - single hue + varying value/lightness|
|Diverging|Above and below a meaningful midpoint - two hues + value, neutral centre|


### <mark style="background: #04FF00A6;">Encoding Economy</mark>

Use the fewest visual encodings necessary to communicate the message clearly. Every encoding (colour, size, shape, texture, position) demands attention and memory. If an encoding does not add new information, do not use it.

<mark style="background: #04FF00A6;">Example:</mark> A bar chart where bars are both different heights AND different colours - the colour adds nothing if all bars represent the same variable. The colour variation should be removed.



# <mark style="background: #04FF00A6;">12. Quick Reference & Exam Strategy</mark>

### <mark style="background: #04FF00A6;">Universal Justification Toolkit</mark>

<mark style="background: #04FF00A6;">For any question asking you to justify a visualisation choice or critique a design, draw from these sources:</mark>
- <mark style="background: #04FF00A6;">Perceptual accuracy:</mark> position > length > angle > area > colour (Cleveland & McGill)
- <mark style="background: #04FF00A6;">Cognitive load:</mark> does the design minimise extraneous load? Does it support germane load?
- <mark style="background: #04FF00A6;">Gestalt principles:</mark> does the design support correct grouping and interpretation?
- <mark style="background: #04FF00A6;">ACCENT framework:</mark> apprehension, clarity, consistency, efficiency, necessity, truthfulness
- <mark style="background: #04FF00A6;">Few's principles:</mark> simplify, emphasise, ensure accuracy, facilitate comparisons
- <mark style="background: #04FF00A6;">Audience needs:</mark> what does this specific audience need? What is their expertise level? What decision will they make?
- <mark style="background: #04FF00A6;">Exploratory vs. Explanatory:</mark> what is the purpose - discovery or communication?

### <mark style="background: #04FF00A6;">How to Structure Answers by Mark Allocation</mark>

|Marks|Structure|
|---|---|
|2–3 marks|Define the concept + explain how it applies to the specific example given|
|4–6 marks|Define + explain the mechanism + state the consequence for the viewer/audience + give a brief example|
|8–10 marks|Define + apply to the specific scenario in depth + discuss consequences for audience + propose alternative + justify alternative using named principles|
|5 marks (scenario)|Specify type (exploratory/explanatory) + name the chart + justify using perceptual accuracy OR cognitive load OR Gestalt + link to audience needs|

<mark style="background: #04FF00A6;">Examiners reward:</mark> named principles, specific consequences, and justified alternatives. Generic answers ("the chart is confusing") score low. Specific answers ("this violates the Gestalt principle of similarity because different-coloured bars imply categorical distinctions that don't exist, increasing extraneous cognitive load as viewers search for meaning in the colour") score high.

### <mark style="background: #04FF00A6;">Exam Pattern Recognition - Signal Phrases</mark>

|Signal Phrase|Key Point to Make|
|---|---|
|"Stakeholder presentation / executives / marketing team"|→ Explanatory visualisation required|
|"Explore / identify / detect / assess whether"|→ Exploratory visualisation required|
|"Scatter plot with raw transaction data for a presentation"|→ Wrong for explanatory: too much detail, no story, overplotting, audience mismatch, violates necessity|
|"Different colours for bars representing the same variable"|→ Similarity violation; implies false categorical meaning; increases extraneous cognitive load|
|"Random ordering of categories"|→ Continuity / Prägnanz violation; no visual flow; harder to find and compare values|
|"Stacked area chart for independent categories"|→ Encoding carries false compositional meaning; only bottom category has a baseline; alternative: small multiples|
|"Chart lacks uncertainty indication"|→ False precision; add error bars or confidence bands; cite Truthfulness (ACCENT)|
|"Pie chart for change over time"|→ ACCENT violations: Apprehension (angle is inaccurate), Efficiency (needs multiple pies for time), Truthfulness (angular distortion); alternative: line chart|
|"Map with raw counts per region"|→ Normalise to per capita; large regions mislead without normalisation; consider MAUP|
|"Colour blind accessibility"|→ Double encode with shape + colour; use viridis/ColorBrewer; avoid red-green|
|"Cognitive overload in a dashboard"|→ Necessity (redundant charts), Clarity (dense text competes with visuals); fix with hierarchy and direct labelling|
|"Non-equidistant time intervals on x-axis"|→ Continuity violation; distorts perceived rate of change; slope no longer represents speed accurately|


### <mark style="background: #04FF00A6;">Answer Template for "Evaluate This Visualisation" Questions</mark>

```
1. IDENTIFY THE PROBLEM
   "The [chart type] violates the [principle] because [specific description of 
   the design flaw]."

2. EXPLAIN THE MECHANISM
   "This means that [what the viewer cannot accurately perceive or is forced 
   to do mentally]."

3. STATE THE CONSEQUENCE
   "As a result, [the specific audience] may [misinterpret X / fail to see Y / 
   make an incorrect decision about Z]."

4. PROPOSE AN ALTERNATIVE
   "A more appropriate visualisation would be [chart type] because [how it 
   directly addresses the problem - link to perceptual accuracy, cognitive load, 
   or a named principle]."
```

### <mark style="background: #04FF00A6;">Key Quotes from the Notes (Useful for Context)</mark>

- Vision is the most powerful sense we have; visualisation exploits this to amplify cognition. - Card, Mackinlay, Shneiderman
- The purpose of visualisation is insight, not pictures. - Ben Shneiderman
- The greatest value of a picture is when it forces us to notice what we never expected to see. - John Tukey
- Never leave a number all by itself. - Hans Rosling
- Graphical excellence is the well-designed presentation of interesting data - a matter of substance, of statistics, and of design. - Edward Tufte
- If you're going underground, why do you need to bother about geography? Connections are the thing. - Harry Beck (London Underground map)