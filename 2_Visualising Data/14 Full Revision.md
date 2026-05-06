### <mark style="background: #04FF00A6;">The Big Idea</mark>

The single most important insight

Expressed in one sentence

<mark style="background: #04FF00A6;">Drives:</mark>
- chart selection
- encoding
- narrative

<mark style="background: #04FF00A6;">Why It Matters:</mark>
- Prevents chart dumping
- Ensures focus
- Supports communication


### <mark style="background: #04FF00A6;">From Exploratory to Explanatory</mark>

<mark style="background: #04FF00A6;">Exploration:</mark> find patterns

<mark style="background: #04FF00A6;">Selection:</mark> choose insights

<mark style="background: #04FF00A6;">Explanation:</mark> build visuals to support selection

<mark style="background: #04FF00A6;">Exploratory:</mark>
- discover patterns
- flexible
- interactive

<mark style="background: #04FF00A6;">Explanatory:</mark>
- communicate insight
- structured
- focused

<mark style="background: #04FF00A6;">Key Difference:</mark>
- Exploration = analysis
- Explanation = communication

### <mark style="background: #04FF00A6;">Data Visualisation Pipeline</mark>

<mark style="background: #04FF00A6;">Pipeline:</mark>
- Data collection
- Cleaning
- Transformation
- Analysis / modelling
- Visualisation

### <mark style="background: #04FF00A6;">Narrative Approaches</mark>

<mark style="background: #04FF00A6;">Narrative Approaches:</mark> Approaches to presenting your visualisations.

<mark style="background: #04FF00A6;">Linear Narrative:</mark>
- Step-by-step
- High clarity
- Low interaction

<mark style="background: #04FF00A6;">Scrollytelling:</mark>
- Story unfolds through interaction
- High engagement
- Can increase cognitive load

<mark style="background: #04FF00A6;">Dashboard:</mark>
- Multiple views
- User-driven
- Supports exploration

<mark style="background: #04FF00A6;">Choosing the Approach:</mark>
- Explain → Linear
- Story → Scrollytelling
- Explore → Dashboard

### <mark style="background: #04FF00A6;">Data Types</mark>

Qualitative, Quantitative, Temporal, Spatial.

### <mark style="background: #04FF00A6;">Qualitative (Categorical) Data</mark>

<mark style="background: #04FF00A6;">Represents attributes, groups or categories:</mark>
- Nominal (no order): e.g. region, product type
- Ordinal (ordered): e.g. low, medium, high

<mark style="background: #04FF00A6;">Visualisation:</mark>
- Bar chart → compares categories using length
- Stacked / grouped bar chart → compare sub-categories within groups
- Pie chart → shows part-to-whole proportions (less perceptually accurate)

<mark style="background: #04FF00A6;">Key points:</mark>
- Length (bar charts) is highly perceptually accurate for comparison
- Supports easy ranking and comparison across groups
- Alternative charts use area, less precise but useful for part-to-whole relationships

### <mark style="background: #04FF00A6;">Quantitative Data</mark>

<mark style="background: #04FF00A6;">Represents numeric values:</mark>
- Interval (no true zero): e.g. temperature
- Ratio (true zero): e.g. income, population

<mark style="background: #04FF00A6;">Visualisation:</mark>
- Histogram → shows distribution across bins
- Box plot → shows spread, median, and outliers
- Scatter plot → shows relationship between two variables
- Line chart → shows change over time (if temporal dimension present)

<mark style="background: #04FF00A6;">Key points:</mark>
- Supports analysis of distribution, spread, and patterns
- Different chart types support different analytical goals

### <mark style="background: #04FF00A6;">Temporal Data</mark>

Represents values that change over time

<mark style="background: #04FF00A6;">Examples:</mark> sales per month, temperature over days

<mark style="background: #04FF00A6;">Visualisation:</mark>
- Line chart → shows continuous trends over time
- Bar chart → compares discrete time intervals (e.g. monthly totals)
- Area chart → emphasises magnitude of change over time
- Step chart → shows changes at specific points (e.g. policy changes)

<mark style="background: #04FF00A6;">Key points:</mark>
- Line charts use position along a common axis
- Supports identification of patterns such as seasonality, peaks, and trends

### <mark style="background: #04FF00A6;">Spatial Data</mark>

Represents data linked to geographic location or region

Examples: population density, energy consumption, crime rates by area

<mark style="background: #04FF00A6;">Visualisation:</mark>
- Choropleth map → colour encodes values across regions
- Point map → shows exact locations of events or observations
- Bubble map → uses size to represent magnitude at locations

<mark style="background: #04FF00A6;">Key points:</mark>
- Position provides spatial context
- Colour (sequential scale) enables comparison of magnitude across regions
- Supports identification of spatial patterns and clusters

### <mark style="background: #04FF00A6;">What is Encoding?</mark>

Mapping data to visual properties

Determines interpretation

<mark style="background: #04FF00A6;">Types of Encoding:</mark>
- Position
- Length
- Colour
- Size
- Shape
- Motion

<mark style="background: #04FF00A6;">Key point:</mark> Choose encoding based on task (comparison, distribution, relationship)

### <mark style="background: #04FF00A6;">Encoding Effectiveness</mark>

<mark style="background: #04FF00A6;">Most accurate:</mark>
- Position (common scale)
- Length

<mark style="background: #04FF00A6;">Less accurate:</mark>
- Angle
- Area
- Colour

### <mark style="background: #04FF00A6;">Perception</mark>

How do humans perceive visualisations

<mark style="background: #04FF00A6;">Pre-attentive Processing</mark>
- Instant recognition (<500ms)  
- No conscious effort required  
- Helps detect patterns quickly

<mark style="background: #04FF00A6;">Examples of Pre-attentive Features:</mark>
- Colour
- Size
- Position
- Shape

### <mark style="background: #04FF00A6;">Cognitive Load</mark>

Cognitive load = mental effort required to interpret a visualisation

<mark style="background: #04FF00A6;">Types:</mark>
- Intrinsic: complexity of the data itself
- Extraneous: caused by poor design (clutter, bad encoding)
- Germane: useful effort that supports understanding

<mark style="background: #04FF00A6;">Goal:</mark>
- Minimise extraneous load
- Support germane load

<mark style="background: #04FF00A6;">Reducing Cognitive Load:</mark>
- Use clear and simple layouts
- Choose effective encodings (position, length)
- Avoid clutter and unnecessary elements
- Use direct labelling instead of legends
- Highlight key information

<mark style="background: #04FF00A6;">Key idea:</mark> simplify to improve understanding

<mark style="background: #04FF00A6;">Cognitive Load and Design Decisions:</mark>
- Too many colours → overload
- Too many charts → confusion
- Poor layout → difficult scanning

<mark style="background: #04FF00A6;">Good design:</mark>
- groups related elements
- guides attention
- supports quick interpretation

<mark style="background: #04FF00A6;">Key idea:</mark> Design should guide the viewer, not challenge or confuse them


### <mark style="background: #04FF00A6;">Types of Memory in Visualisation</mark>

<mark style="background: #04FF00A6;">Iconic Memory (pre-attentive):</mark>
- very fast (~250–500ms)
- captures visual features instantly
- detects colour, size, position

<mark style="background: #04FF00A6;">Working Memory (short-term):</mark>
- limited capacity
- used for comparison and reasoning
- easily overloaded

<mark style="background: #04FF00A6;">Long-term Memory:</mark>
- stores prior knowledge and experience
- supports recognition and interpretation

<mark style="background: #04FF00A6;">Key idea:</mark>
- Good design uses iconic memory
- Poor design overloads working memory

### <mark style="background: #04FF00A6;">Why Memory Matters</mark>

Users first rely on pre-attentive processing

Then use working memory to interpret meaning

<mark style="background: #04FF00A6;">Implications:</mark>
- important information should be immediately visible
- users should not have to remember values across the chart
- reduce need for mental calculation

<mark style="background: #04FF00A6;">Key idea:</mark> If users have to think too hard, design has failed

### <mark style="background: #04FF00A6;">Chart Comparisons</mark>

Different Types of Chart suit Different Purposes

### <mark style="background: #04FF00A6;">Pie vs Bar</mark>

<mark style="background: #04FF00A6;">Bar chart:</mark>
- uses length
- accurate comparison

<mark style="background: #04FF00A6;">Pie chart:</mark>
- uses angle / area
- less precise

<mark style="background: #04FF00A6;">Key idea:</mark> Length > angle > area

### <mark style="background: #04FF00A6;">Bar vs Scatter</mark>

<mark style="background: #04FF00A6;">Bar chart:</mark>
- compares aggregated values
- clear baseline
- easy category comparison

<mark style="background: #04FF00A6;">Scatter plot:</mark>
- shows relationship between variables
- reveals patterns, clusters, correlation

<mark style="background: #04FF00A6;">Key idea:</mark>
- Bar = comparison
- Scatter = relationship

### <mark style="background: #04FF00A6;">Histogram vs Box Plot</mark>

<mark style="background: #04FF00A6;">Histogram:</mark>
- shows full distribution
- reveals shape (skew, peaks)
- depends on bin choice

<mark style="background: #04FF00A6;">Box plot:</mark>
- summarises distribution
- shows median, quartiles, outliers
- hides detailed shape

<mark style="background: #04FF00A6;">Key idea:</mark>
- Histogram = Detail
- Box plot = Summary

### <mark style="background: #04FF00A6;">Box Plot vs Violin Plot</mark>

<mark style="background: #04FF00A6;">Box plot:</mark>
- simple summary
- easy to compare across groups
- limited detail

<mark style="background: #04FF00A6;">Violin plot:</mark>
- shows full distribution shape
- reveals density patterns
- harder to interpret

<mark style="background: #04FF00A6;">Key idea:</mark>
- Box = clarity
- Violin = richness

### <mark style="background: #04FF00A6;">Line vs Bar (Temporal)</mark>

<mark style="background: #04FF00A6;">Line chart:</mark>
- shows continuous trends
- emphasises change over time
- preserves order

<mark style="background: #04FF00A6;">Bar chart:</mark>
- compares discrete time periods
- emphasises individual values
- less effective for trends

<mark style="background: #04FF00A6;">Key idea:</mark>
- Line = trend
- Bar = comparison

### <mark style="background: #04FF00A6;">Stacked Bar vs Grouped Bar</mark>

<mark style="background: #04FF00A6;">Stacked bar:</mark>
- shows part-to-whole  
- compact representation  
- hard to compare segments

<mark style="background: #04FF00A6;">Grouped bar:</mark>
- allows direct comparison between categories  
- clearer for differences 
- uses more space

<mark style="background: #04FF00A6;">Key idea:</mark>
- Stacked = composition  
- Grouped = comparison

### <mark style="background: #04FF00A6;">Scatter vs Line</mark>

<mark style="background: #04FF00A6;">Scatter plot:</mark>
- shows individual observations
- reveals variability and outliers

<mark style="background: #04FF00A6;">Line chart:</mark>
- shows overall trend
- implies continuity

<mark style="background: #04FF00A6;">Key idea:</mark>
- Scatter = Raw data
- Line = Trend summary

### <mark style="background: #04FF00A6;">Heatmap vs Scatter</mark>

<mark style="background: #04FF00A6;">Heatmap:</mark>
- shows density or intensity
- good for large datasets
- loses individual points

<mark style="background: #04FF00A6;">Scatter plot:</mark>
- shows individual observations
- clearer for small datasets

<mark style="background: #04FF00A6;">Key idea:</mark>
- Heatmap = Density
- Scatter = Detail

### <mark style="background: #04FF00A6;">Analytical Tasks</mark>

Comparison → bar chart (uses length on common scale)
Distribution → histogram / box plot / violin plot
Relationship → scatter plot
Composition → stacked bar / pie
Spatial → maps

<mark style="background: #04FF00A6;">Key idea:</mark> Chart choice depends on the question being asked


### <mark style="background: #04FF00A6;">Geospatial Visualisation</mark>

Working with Spatial Data

<mark style="background: #04FF00A6;">Geospatial Data:</mark>
- Data linked to location
- Regions or coordinates

<mark style="background: #04FF00A6;">Types of Maps:</mark>
- Choropleth
- Point maps
- Cartogram

### <mark style="background: #04FF00A6;">Choropleth</mark>

<mark style="background: #04FF00A6;">Normalise data:</mark> (e.g. per capita) prevents misleading comparisons between large and small regions

Join data to spatial boundaries

Classify into ranges

<mark style="background: #04FF00A6;">Colour Encoding:</mark>
- Sequential colour scale
- Light → low values
- Dark → high values

<mark style="background: #04FF00A6;">Design Considerations:</mark>	
- clear legend
- limited number of classes
- avoid clutter
- use colour carefully

### <mark style="background: #04FF00A6;">Choropleth vs Point Map</mark>

<mark style="background: #04FF00A6;">Choropleth:</mark>
- shows aggregated values by region
- highlights regional differences
- influenced by area size

<mark style="background: #04FF00A6;">Point map:</mark>	
- shows exact locations
- reveals spatial distribution
- can suffer from overplotting

<mark style="background: #04FF00A6;">Key idea:</mark>
- Choropleth = Regions
- Point = Locations

### <mark style="background: #04FF00A6;">Choropleth vs Proportional Symbol (Bubble Map)</mark>

<mark style="background: #04FF00A6;">Choropleth:</mark>
- colour represents value by region
- works with aggregated data
- influenced by area size

<mark style="background: #04FF00A6;">Bubble map:</mark>
- size represents magnitude at locations
- shows variation within regions
- less affected by area size

<mark style="background: #04FF00A6;">Key idea:</mark>
- Choropleth = Area-based Comparison
- Bubble = Magnitude at Location

### <mark style="background: #04FF00A6;">Choropleth vs Cartogram</mark>

<mark style="background: #04FF00A6;">Choropleth:</mark>
- preserves geographic shape
- colour encodes value
- area may mislead perception

<mark style="background: #04FF00A6;">Cartogram:</mark>
- resizes regions based on value
- emphasises magnitude
- distorts geography

<mark style="background: #04FF00A6;">Key idea:</mark>
- Choropleth = Familiar Geography
- Cartogram = Data Emphasis

### <mark style="background: #04FF00A6;">Equal Interval vs Quantile Classification</mark>

<mark style="background: #04FF00A6;">Equal interval:</mark>
- divides data into equal ranges  	
- easy to interpret  
- can hide variation in skewed data

<mark style="background: #04FF00A6;">Quantile:</mark>
- equal number of regions per class  	
- balanced visual distribution  
- may exaggerate differences

<mark style="background: #04FF00A6;">Key idea:</mark>
- Equal interval = Numeric fairness  
- Quantile = Visual balance

### <mark style="background: #04FF00A6;">Quantile vs Natural Breaks (Jenks)</mark>

<mark style="background: #04FF00A6;">Quantile:</mark>
- evenly distributes regions
- strong visual contrast
- may group dissimilar values

<mark style="background: #04FF00A6;">Natural breaks:</mark>
- groups similar values
- reflects real data structure
- uneven class sizes

<mark style="background: #04FF00A6;">Key idea:</mark>
- Quantile = Visual contrast
- Natural breaks = Data-driven grouping

### <mark style="background: #04FF00A6;">Geographic CRS vs Projected CRS</mark>

<mark style="background: #04FF00A6;">Geographic CRS:</mark>
- uses latitude/longitude
- accurate for location
- poor for distance/area

<mark style="background: #04FF00A6;">Projected CRS:</mark>
- converts to flat coordinates
- accurate for measurement
- introduces distortion

<mark style="background: #04FF00A6;">Key idea:</mark>
- Geographic = Location
- Projected = Measurement

### <mark style="background: #04FF00A6;">Aggregated Data vs Point Data</mark>

<mark style="background: #04FF00A6;">Aggregated data:</mark>
- summarised by region
- easier to interpret
- hides local variation

<mark style="background: #04FF00A6;">Point data:</mark>
- shows individual observations
- reveals detail and clusters
- harder to interpret at scale

<mark style="background: #04FF00A6;">Key idea:</mark>
- Aggregated = Simplicity
- Point = Detail

### <mark style="background: #04FF00A6;">Map vs Non-Spatial Chart</mark>

<mark style="background: #04FF00A6;">Map:</mark>
- shows geographic patterns
- intuitive for location-based data
- can mislead if geography is not relevant

<mark style="background: #04FF00A6;">Bar/line chart:</mark>
- clearer comparisons
- more perceptually accurate
- ignores spatial relationships

<mark style="background: #04FF00A6;">Key idea:</mark> Use maps only when location matters


### <mark style="background: #04FF00A6;">Design for Perception and Comparison</mark>

<mark style="background: #04FF00A6;">Use effective encodings:</mark> position and length (most accurate)

<mark style="background: #04FF00A6;">Support easy comparison:</mark>
- aligned axes
- consistent scales

<mark style="background: #04FF00A6;">Use colour carefully:</mark>
- highlight important information
- avoid overuse

<mark style="background: #04FF00A6;">Key idea:</mark> Design should make patterns easy to see

### <mark style="background: #04FF00A6;">ACCENT Framework</mark>

A framework for designing effective data visualizations

<mark style="background: #04FF00A6;">Ensures visuals are:</mark>
- clear
- accurate
- easy to interpret

<mark style="background: #04FF00A6;">Focuses on improving:</mark>
- communication
- readability
- usability

### <mark style="background: #04FF00A6;">ACCENT Principles</mark>

A – Appropriate chart type
C – Clear purpose
C – Clean design
E – Emphasise important information
N – Necessary context
T – Thoughtful use of colour

<mark style="background: #04FF00A6;">Applying ACCENT:</mark>
- Remove clutter
- Improve clarity
- Highlight insights
- Ensure correct interpretation


### <mark style="background: #04FF00A6;">Stephen Few – Key Principles</mark>

<mark style="background: #04FF00A6;">FEW:</mark>
- Focus on clear communication of data
- Remove unnecessary elements (avoid clutter)
- Maximise data-ink ratio (show data, not decoration)
- Avoid chartjunk (e.g. 3D effects, decorative visuals)

<mark style="background: #04FF00A6;">Key idea:</mark> Simplify design to improve understanding

### <mark style="background: #04FF00A6;">Gestalt Principles</mark>

<mark style="background: #04FF00A6;">Principles:</mark>
- Proximity
- Similarity
- Continuity
- Closure
- Connectedness
- Figure-ground

<mark style="background: #04FF00A6;">Why Gestalt Matters:</mark>
- Control grouping
- Guide attention
- Reduce cognitive load

### <mark style="background: #04FF00A6;">Uncertainty</mark>

Uncertainty in data and visualisation

<mark style="background: #04FF00A6;">What is Uncertainty</mark>
- Data is not exact
- Includes variation and error

<mark style="background: #04FF00A6;">Sources:</mark>
- Measurement error
- Sampling
- Model uncertainty

<mark style="background: #04FF00A6;">Where It Occurs:</mark>
- Data collection
- Analysis / modelling

### <mark style="background: #04FF00A6;">Why Uncertainty Matters</mark>

Prevents misleading conclusions

Improves trust

<mark style="background: #04FF00A6;">How to Show It:</mark>
- Error bars
- Confidence intervals
- Shaded regions
- Fan charts

### <mark style="background: #04FF00A6;">Interaction and Annotation</mark>

<mark style="background: #04FF00A6;">Interaction and Annotation:</mark> What, Why, How, and Trade-offs

<mark style="background: #04FF00A6;">Interaction allows users to:</mark>
- explore  
- filter  
- access detail  
 
Makes visualisations dynamic

<mark style="background: #04FF00A6;">Types of Interaction:</mark>
- Filtering
- Tooltips
- Zoom / pan
- Highlighting
- Linked views

<mark style="background: #04FF00A6;">Interaction and Purpose:</mark>
- Exploratory → high interaction
- Explanatory → minimal interaction
- Dashboard → essential

### <mark style="background: #04FF00A6;">Interaction and Cognitive Load</mark>

<mark style="background: #04FF00A6;">Good:</mark>
- reduces clutter
- reveals detail on demand

<mark style="background: #04FF00A6;">Poor:</mark>
- too many controls
- hides insight

<mark style="background: #04FF00A6;">Interaction must be justified:</mark>
- what it enables
- how it supports insight

### <mark style="background: #04FF00A6;">Annotation</mark>

Adds explanation

Highlights insight

<mark style="background: #04FF00A6;">Annotation Types:</mark>
- Titles
- Labels
- Highlights
- Notes

<mark style="background: #04FF00A6;">Annotation Good Practice:</mark>
- Focus on key insight
- Avoid clutter

### <mark style="background: #04FF00A6;">Accessibility</mark>

How to address in visualisation

<mark style="background: #04FF00A6;">Why It Matters:</mark>
- Improves usability
- Supports all users

<mark style="background: #04FF00A6;">Best Practices:</mark>
- Colour-blind friendly palettes
- High contrast
- Clear labels
- Simple design

### <mark style="background: #04FF00A6;">What is Overplotting?</mark>

<mark style="background: #04FF00A6;">Overplotting:</mark>    
- Too many overlapping points
- Patterns become hidden
- Affects how patterns are perceived (clusters vs noise vs trends)

<mark style="background: #04FF00A6;">Techniques to Reduce Overplotting:</mark>
- Sampling
- Transparency
- Jittering
- Aggregation
- Hexbin plots
- Faceting

### <mark style="background: #04FF00A6;">Trade-offs</mark>

<mark style="background: #04FF00A6;">Transparency:</mark>
- reveals density through darker overlapping areas
- preserves approximate distribution
- can become saturated in dense regions
- individual points become indistinguishable

<mark style="background: #04FF00A6;">Jittering:</mark>
- separates overlapping points to show individuals
- useful for discrete or categorical axes
- introduces artificial variation
- reduces positional accuracy

<mark style="background: #04FF00A6;">Aggregation:</mark>
- summarises data into groups (e.g. averages, counts)
- highlights overall patterns clearly
- reduces noise and clutter
- hides individual observations and outliers

<mark style="background: #04FF00A6;">Sampling:</mark>
- reduces number of points displayed
- improves readability and performance
- may miss rare events or subtle patterns

<mark style="background: #04FF00A6;">Binning / Hexbin:</mark>
- groups points into spatial bins
- shows density and structure effectively
- removes overplotting entirely

### <mark style="background: #04FF00A6;">Benefits and Trade-offs of Small Multiples & Faceting</mark>

Split data into panels
Same axes and scale

<mark style="background: #04FF00A6;">Analytical task:</mark>
- supports comparison across categories
- reveals patterns that would be hidden in overplotted views

<mark style="background: #04FF00A6;">Benefits:</mark>
- Reduces clutter
- Improves clarity
- Enables comparison

<mark style="background: #04FF00A6;">Trade-offs:</mark>
- Uses more space
- Harder to see overall pattern at a glance
- Requires consistent scales (or can mislead)
- Small panels may reduce readability of detail

<mark style="background: #04FF00A6;">Key idea:</mark> Clarity through separation vs Loss of immediate overview


### <mark style="background: #04FF00A6;">Small Multiples - Design Principles</mark>

<mark style="background: #04FF00A6;">ACCENT:</mark>
- appropriate chart type
- clean design (reduces clutter)
- necessary context (consistent scales)

<mark style="background: #04FF00A6;">Stephen Few:</mark>
- reduces clutter and visual noise
- improves clarity of comparison
- focuses attention on data rather than decoration

<mark style="background: #04FF00A6;">Gestalt principles:</mark>
- similarity → consistent scales and layouts support comparison
- proximity → grouping by panels clarifies relationships
- continuity → enables smooth scanning across panels

<mark style="background: #04FF00A6;">Cognitive load:</mark> reduces extraneous load by separating overlapping data makes patterns easier to interpret

<mark style="background: #04FF00A6;">Perceptual accuracy:</mark> consistent axes support accurate comparison using position

<mark style="background: #04FF00A6;">Key idea:</mark> Small multiples improve clarity and comparison by aligning with how users perceive structure and patterns

### <mark style="background: #04FF00A6;">Key Advice - Be Able To</mark>

<mark style="background: #04FF00A6;">Explain why a visualization works / does not work:</mark>
- <mark style="background: #04FF00A6;">Link to perceptual theory:</mark> position and length are more accurate than angle/area, pre-attentive features enable rapid understanding
- <mark style="background: #04FF00A6;">Identify issues:</mark> poor chart choice, poor encoding, clutter / high cognitive load, misleading scales or aggregation

Explain the difference between exploratory and explanatory

<mark style="background: #04FF00A6;">Choose / assess appropriate design choices:</mark>
- <mark style="background: #04FF00A6;">Chart types:</mark>
    - bar → comparison  
    - line → trend  
    - scatter → relationship  
    - map → spatial patterns  
- <mark style="background: #04FF00A6;">Encodings:</mark> choose based on accuracy (position > length > area)  
- <mark style="background: #04FF00A6;">Narrative approaches:</mark>
    - linear → explanation  
    - scrollytelling → guided story  
    - dashboard → exploration

<mark style="background: #04FF00A6;">Justify design decisions:</mark>
- <mark style="background: #04FF00A6;">Explain why choices improve:</mark>
	- clarity
	- comparability
	- interpretation
- <mark style="background: #04FF00A6;">Reference frameworks:</mark>
	- ACCENT (clear purpose, clean design, etc.)
	- Stephen Few (avoid clutter, maximise data-ink)
	- Gestalt → group, guide, and structure perception
- <mark style="background: #04FF00A6;">Link to user goals and task:</mark> what question is being answered?

<mark style="background: #04FF00A6;">Key idea:</mark> Design should match how people see and process information

<mark style="background: #04FF00A6;">Evaluate strengths and weaknesses:</mark>
- <mark style="background: #04FF00A6;">Strengths:</mark>
	- clear comparisons
	- effective encoding
	- good use of colour and layout
- <mark style="background: #04FF00A6;">Weaknesses:</mark>
	- misleading encoding
	- misleading scales
	- overplotting or clutter
	- lack of context or annotation

<mark style="background: #04FF00A6;">Suggest improvements / alternatives:</mark>
- <mark style="background: #04FF00A6;">Replace poor chart types:</mark>
	- pie → bar (better comparison)
	- cluttered line → small multiples
- <mark style="background: #04FF00A6;">Improve encoding:</mark> use position instead of colour/area
- <mark style="background: #04FF00A6;">Reduce cognitive load:</mark>
	- simplify layout
	- highlight key insight
- <mark style="background: #04FF00A6;">Consider interaction:</mark> filtering, tooltips, zoom


<mark style="background: #04FF00A6;">Explain perceptual accuracy:</mark>
- position and length → most accurate
- angle and area → less accurate
- colour → least precise for comparison

<mark style="background: #04FF00A6;">Apply perceptual accuracy in evaluation:</mark>
- explain why some charts are easier to interpret
- justify replacing charts based on accuracy

<mark style="background: #04FF00A6;">Key idea:</mark> Better perception = better comparison


<mark style="background: #04FF00A6;">Distinguish between annotation and tooltips:</mark>
- annotation → always visible, supports explanation
- tooltips → on-demand, supports exploration

<mark style="background: #04FF00A6;">Evaluate when to use each:</mark>
	explanatory → annotation
	exploratory → tooltips

<mark style="background: #04FF00A6;">Key idea:</mark> Visibility vs Interaction trade-off


<mark style="background: #04FF00A6;">Discuss data types</mark>
- identify type (categorical, quantitative, temporal, spatial)
- <mark style="background: #04FF00A6;">select appropriate visualisation:</mark>
	- categorical → bar chart
	- quantitative → histogram / box plot / scatter
	- temporal → line chart
	- spatial → choropleth / map
- justify choice based on purpose and perceptual effectiveness

<mark style="background: #04FF00A6;">Discuss preparation of data for visualisation:</mark>
- normalise data (e.g. per capita) to enable fair comparison
- aggregate data where appropriate (e.g. totals, averages)
- join datasets (e.g. data + spatial boundaries for maps)
- classify values (e.g. quantile, equal interval, natural breaks)

<mark style="background: #04FF00A6;">Key idea:</mark> Correct data type selection and preparation are essential for accurate and meaningful comparison

<mark style="background: #04FF00A6;">Be able to:</mark>
- Explain uncertainty in data and data visualization
- Identify where uncertainty occurs in the pipeline
- Evaluate impact on interpretation
- Explain how to communicate uncertainty effectively
- Justify design choices
- Evaluate trade-offs

<mark style="background: #04FF00A6;">Key idea:</mark> Data is always uncertain, showing uncertainty improves honesty, but must remain interpretable


<mark style="background: #04FF00A6;">ALWAYS:</mark> Be able to link design decisions to how they affect perception and interpretation - including perceptual accuracy, clarity, cognitive load, and potential for misinterpretation
