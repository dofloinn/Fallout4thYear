### <mark style="background: #04FF00A6;">Time Series Visualisation</mark>  

When you look at this line chart what do you see first?

![[Pasted image 20260304150829.png]]

<mark style="background: #04FF00A6;">What Do We Actually Perceive?</mark>  
- Direction  
- Rate of change (slope)  
- Acceleration  
- Seasonality  
- Structural breaks  
- Volatility  

<mark style="background: #04FF00A6;">Perception:</mark> Humans are extremely sensitive to slope and position.

### <mark style="background: #04FF00A6;">Why visualise trends over time?</mark>

<mark style="background: #04FF00A6;">Uncover patterns:</mark> We can see long-term trends (upward, downward, or cyclical).

![[Pasted image 20260304151146.png]]

<mark style="background: #04FF00A6;">Seasonality:</mark>
- Some data follows a repeating pattern over a fixed time period (daily, weekly, monthly, or yearly).  
- https://www.climatestotravel.com/climate/ireland

![[Pasted image 20260304151231.png]]


<mark style="background: #04FF00A6;">Anomalies (Outliers):</mark> 
- Unexpected deviations from trends that may indicate significant events or errors.  
- https://www.nature.com/articles/s41598-025-20641-2

![[Pasted image 20260304151303.png]]

<mark style="background: #04FF00A6;">Time Series Visualisation:</mark>
- Not about drawing lines.  
- About designing perception.  
- Time-series charts encode change.  
- Change is perceived through <mark style="background: #04FF00A6;">slope, direction, volatility</mark>.

### <mark style="background: #04FF00A6;">What Do We Actually Perceive in a Time Series?</mark> 

When we look at a time-series chart, we don’t read numbers.  

<mark style="background: #04FF00A6;">We perceive:</mark>  
- <mark style="background: #04FF00A6;">Long term trend:</mark> Direction (upward, downward, flat)  
- <mark style="background: #04FF00A6;">Slope</mark> (rate of change)  
- <mark style="background: #04FF00A6;">Curvature</mark> (acceleration or deceleration)  
- <mark style="background: #04FF00A6;">Volatility</mark> (noise vs stability)  
- <mark style="background: #04FF00A6;">Seasonality</mark> (repeating cycles)  
- <mark style="background: #04FF00A6;">Anomalies</mark> (breaks from pattern)  

These are <mark style="background: #04FF00A6;">perceptual tasks</mark>.  

Your job is to support them —not distort them

<mark style="background: #04FF00A6;">Every decision you make:</mark>
- how you encode time  
- how you encode magnitude  
- how you smooth or aggregate  
- how you structure multiple categories  

... changes what the viewer sees.

### <mark style="background: #04FF00A6;">Example</mark>

![[Pasted image 20260304151950.png]]


<mark style="background: #04FF00A6;">What Changed?</mark>
- Data?  
- Or perception?  

Slope perception depends on scale.

<mark style="background: #04FF00A6;">In this lecture we focus on:</mark>  
- How time is encoded visually 
- How design choices influence interpretation  
- When time-series charts mislead 
- How to manage complexity in temporal data

### <mark style="background: #04FF00A6;">A time series chart is never neutral</mark>

<mark style="background: #04FF00A6;">Design choices that shape interpretation:</mark>  
- Line vs bar vs step  
- Baseline starting point  
- Axis scaling  
- Aggregation level (daily vs monthly)  
- Smoothing (moving average, LOESS)  
- Stacking vs faceting  
- Colour emphasis  
- Annotation

Two charts of the same data can tell completely different stories.

### <mark style="background: #04FF00A6;">Bars V Lines</mark> 

<mark style="background: #04FF00A6;">A line implies:</mark>  
- Continuity between points
- Interpolation between observations
- Gradual change

<mark style="background: #04FF00A6;">A bar implies:</mark>  
- Discrete measurement
- Separation between time intervals
- No assumed continuity

If I measure unemployment monthly, should I connect with a line?  

<mark style="background: #04FF00A6;">Ask yourself:</mark>  
- Are intermediate values meaningful?  
- Or are you visually fabricating change?  

This is a <mark style="background: #04FF00A6;">truthfulness</mark> decision.

![[Pasted image 20260304152451.png]]

### <mark style="background: #04FF00A6;">Bar V Line Chart</mark>

![[Pasted image 20260304152611.png]]
  
Bars encode discrete comparison.  

Lines encode continuous change.  

Choosing between them is a <mark style="background: #04FF00A6;">modelling decision about how the phenomenon behaves  </mark>

It is not just a formatting choice.

### <mark style="background: #04FF00A6;">Line v Step Chart – A Design Integrity Decision</mark> 

<mark style="background: #04FF00A6;">A standard line chart:</mark>  
- Connects points with straight segments  
- Implies gradual change  
- Suggests smooth transitions  

<mark style="background: #04FF00A6;">A step chart:</mark>
- Holds values constant
- Shows abrupt change clearly
- Preserves data resolution

Use a step chart when values remain stable before jumping (e.g., interest rates, policy thresholds).  

Otherwise, you are visually inventing movement.  

What happens if we draw a line between two policy changes?

![[Pasted image 20260304152901.png]]

![[Pasted image 20260304153124.png]]

Use a step chart when values remain stable before jumping - (e.g., interest rates, policy thresholds).  

Otherwise, you are visually inventing movement.  

What happens if we draw a line between two policy changes?

<mark style="background: #04FF00A6;">Interpolation Implies Causality:</mark> 
- Gradual slope implies gradual process 
- Step implies intervention

### <mark style="background: #04FF00A6;">The Spaghetti Problem</mark> 

COLOUR IS WEAKER THAN POSITION ON A SHARED SCALE.

![[Pasted image 20260304153237.png]]

<mark style="background: #04FF00A6;">Too Many Lines:</mark> With too many data series, individual lines are impossible to distinguish.  

<mark style="background: #04FF00A6;">Low Readability:</mark> The dense, tangled lines make it difficult to focus on specific trends or to see patterns, fine structure, or mere noise.  

<mark style="background: #04FF00A6;">Cognitive Load:</mark> The viewer's brain is overloaded trying to trace individual paths.

### <mark style="background: #04FF00A6;">Spaghetti Problem - Solutions</mark>  

<mark style="background: #04FF00A6;">Separating Panels:</mark> Split the data into smaller, separate charts with a consistent scale (Small Multiples).

<mark style="background: #04FF00A6;">Highlighting/Focusing:</mark> Highlight one or two lines in a strong colour while turning the others into faint, light-grey lines.  

<mark style="background: #04FF00A6;">Direct Labelling:</mark> Instead of using a legend (which forces the eye to move back and forth), place labels directly at the end of each line to identify them immediately.

### <mark style="background: #04FF00A6;">Highlighting One Country Series</mark>

![[Pasted image 20260304164330.png]]

### <mark style="background: #04FF00A6;">Stacked Bar Charts: Why They Fail</mark>

<mark style="background: #04FF00A6;">In stacked charts:</mark> 
- Only the bottom category shares a common baseline.  
- Upper categories require mental subtraction.  
- Thickness must be estimated visually.  
- Reordering categories changes perception.  
- This increases cognitive load.  
- Stacked bars imply parts of a whole.  
- Life expectancy is not a part of a whole — so stacking is structurally misleading

![[Pasted image 20260304164428.png]]

<mark style="background: #04FF00A6;">This stacked area chart implies:</mark>  
- Ireland and France are parts of a whole  
- Their life expectancies combine to form a meaningful total  
- The total height (around 150–160) represents something real  

<mark style="background: #04FF00A6;">But there is no such total:</mark>
- Ireland’s life expectancy does not contribute to France’s.  
- France is not a component of Ireland.  
- There is no “combined life expectancy.”

![[Pasted image 20260304164514.png]]

### <mark style="background: #04FF00A6;">Encoding carries structural meaning</mark>

<mark style="background: #04FF00A6;">STACKING Encodes:</mark>
- Composition  
- Contribution  
- Share  
- Part–whole relationship  
- Additivity + Composition.  
- Stacking is not neutral.  
- If the data do not have that structure, the encoding misleads  

<mark style="background: #04FF00A6;">LIFE EXPECTANCY:</mark>  
- An independent statistic per country
- Not compositional 
- Not a share 
- Not a contribution 
- Therefore, the structure implied by stacking is false.

Structure → Encoding → Perception

### <mark style="background: #04FF00A6;">Stream Graph</mark>  

An attempt to overcome the difficulties associated with stacked bar charts and stacked area charts.  

Instead of plotting values against a fixed, straight axis, values are displaced around a varying central baseline  

Display the changes in data over time of different categories through flowing, organic shapes that somewhat resemble a river-like stream.  

Makes Stream Graphs aesthetically pleasing and more engaging.

![[Pasted image 20260304164717.png]]

<mark style="background: #04FF00A6;">PROS:</mark>  
- Better for giving a more general view of the data
- Work better as an interactive piece rather than a static or printed graphics  

<mark style="background: #04FF00A6;">CONS:</mark>
- <mark style="background: #04FF00A6;">Legibility:</mark> often very cluttered with large datasets  
- Categories with smaller values are drowned out to make way for categories with much larger values. 
- Also, it's impossible to read the exact values visualised in a Stream Graph, as there is no axis to use as a reference

### <mark style="background: #04FF00A6;">Multiple Line Chart – highlighting both countries</mark>

Matches the structure of the data  

<mark style="background: #04FF00A6;">Ireland and France are:</mark> 
- Separate countries  
- Separate measurements  
- Not parts of a shared total  

<mark style="background: #04FF00A6;">It preserves the question:</mark> How has life expectancy changed in each country over time?  

<mark style="background: #04FF00A6;">It maintains a common baseline:</mark>
- Direct magnitude comparison  
- Accurate gap reading  
- Preserves perceptual accuracy

![[Pasted image 20260304164933.png]]

### <mark style="background: #04FF00A6;">Side by Side Bar</mark> 

If your goal is to compare trends across categories, stacking is usually the wrong choice.  

Design should support comparison not obstruct it.  

<mark style="background: #04FF00A6;">This side-by-side (dodged) bar chart:</mark>  
- Keeps Ireland and France independent  
- Preserves a shared baseline  
- Enables direct comparison within each year  

There is no implied total.  

There is no additive meaning.  

<mark style="background: #04FF00A6;">It answers the question:</mark> In a given year, which country had higher life expectancy?  

Is this good for comparing trend?

![[Pasted image 20260304165015.png]]

### <mark style="background: #04FF00A6;">Small Multiples</mark>  

Why is this better?  

<mark style="background: #04FF00A6;">Faceting:</mark>  
- Separates structure  
- Reduces clutter  
- Preserves comparability (same y-axis scale)  
- This supports comparison rather than obstructing it.  

<mark style="background: #04FF00A6;">Life expectancy:</mark>
- Is continuous  
- Is independent across countries  
- Can be averaged meaningfully within continents  
- A continental mean is meaningful.  

Line + grouping + faceting = structurally aligned.

![[Pasted image 20260304165104.png]]

### <mark style="background: #04FF00A6;">Small Multiples</mark>  

<mark style="background: #04FF00A6;">Shared axes:</mark> 
- Parallel comparison  
- Reduced occlusion

### <mark style="background: #04FF00A6;">Noise in Data</mark>  

Refers to random variations or irrelevant fluctuations that obscure the underlying pattern or trend in a dataset.  

Noise can distort interpretations, making it harder to identify meaningful insights.  

<mark style="background: #04FF00A6;">Noise Obscures Pattern:</mark>
- Random variation  
- Measurement error  
- Natural fluctuation  
- External shocks  

Noise makes trend harder to perceive.

### <mark style="background: #04FF00A6;">Handling Noise in Data</mark>

Different visualisation techniques help smooth or reduce noise to reveal clearer trends:  

<mark style="background: #04FF00A6;">Smoothing Techniques:</mark>  
- <mark style="background: #04FF00A6;">LOESS (Locally Weighted Scatterplot Smoothing):</mark> Fits local regressions to smooth fluctuations.  
- <mark style="background: #04FF00A6;">Moving Averages:</mark> Averages neighbouring values to reduce short-term noise.  

<mark style="background: #04FF00A6;">Aggregation:</mark> 
- <mark style="background: #04FF00A6;">Bin Data into Intervals:</mark> Instead of plotting every data point, group them into meaningful time intervals (e.g., weekly or monthly averages).  
- A moving average smooths a time series by replacing each value with the average of the last N observations.

<mark style="background: #04FF00A6;">Filtering:</mark> Exclude Outliers - Remove extreme values that might distort trends.

Noise Management Techniques Change the Story

### <mark style="background: #04FF00A6;">LOESS</mark>

Fits local regressions  

<mark style="background: #04FF00A6;">Span controls smoothness:</mark> 
- Smaller span → more reactive  
- Larger span → more stable  

Changing span changes the narrative.

SPAN = NARRATIVE EMPHASIS

![[Pasted image 20260304165406.png]]

![[Pasted image 20260304165435.png]]

### <mark style="background: #04FF00A6;">Moving Averages</mark>

<mark style="background: #04FF00A6;">Mechanical Smoothing:</mark>
- Averages last N observations  
- Introduces lag  
- Reduces volatility  
- Can delay turning points  

Window size controls stability vs responsiveness.

![[Pasted image 20260304165512.png]]

Moving averages do not just smooth.  

They delay perception of turning points.

### <mark style="background: #04FF00A6;">Filtering Outliers</mark>

<mark style="background: #04FF00A6;">Clarification or Distortion?</mark>
- Compresses scale  
- Reduces extreme influence  
- May hide rare events  

Outlier removal is a narrative decision.

![[Pasted image 20260304165613.png]]

<mark style="background: #04FF00A6;">The S&P 500 daily returns data:</mark>  
- We observe persistent volatility over time.  
- There are periods of heightened turbulence.  
- There are some extremely large positive and negative shocks.  

<mark style="background: #04FF00A6;">When we remove the most extreme 1% of daily returns:</mark>  
- The vertical scale compresses.  
- The largest market shocks disappear.  
- The series looks calmer and more stable.

### <mark style="background: #04FF00A6;">Aggregation</mark>

Resolution control not just noise management  

Groups raw data into broader time intervals (e.g., daily → weekly, hourly → daily) to reduce noise and emphasise trends.  

By summarising data at a higher level, aggregation helps create smoother and more interpretable visualisations.  

How Aggregation Works in Smoothing  

<mark style="background: #04FF00A6;">When you aggregate:</mark>  
- Daily → weekly  
- Hourly → daily  
- Monthly → yearly  

<mark style="background: #04FF00A6;">You:</mark>  
- Reduce short-term fluctuation  
- Smooth volatility  
- Make trends easier to see

Noise management techniques do not just clarify data.  

They shape how change is perceived.

### <mark style="background: #04FF00A6;">What We Learned About Time</mark>

<mark style="background: #04FF00A6;">Time-series charts encode assumptions about change:</mark> 
- Lines imply continuity. 
- Steps imply intervention.
- Stacking implies composition.

Align the encoding with the structure of the phenomenon.

<mark style="background: #04FF00A6;">Design choices are modelling decisions:</mark>
- Scale affects perceived volatility.
- Smoothing alters narrative emphasis.
- Filtering can erase history.

Structure → Encoding → Perception.

### <mark style="background: #04FF00A6;">Every Design Choice Answers a Question</mark>

<mark style="background: #04FF00A6;">Before you publish a time-series chart, ask:</mark>  
- What comparison should be easy?  
- What structure does the data actually have?  
- Am I inventing continuity?
- Am I suppressing events?
- Am I exaggerating volatility?

Design choices answer these questions.  

Design is an analytical responsibility.

### <mark style="background: #04FF00A6;">Before you publish a time-series chart, ask</mark> 

<mark style="background: #04FF00A6;">A well-presented visualisation drives action:</mark>
- Whether it’s a policymaker addressing environmental concerns  
- or a business leader adjusting strategy based on sales trends.

### <mark style="background: #04FF00A6;">Exploratory vs Explanatory Time Series</mark>  

<mark style="background: #04FF00A6;">Exploratory – uncover patterns</mark>  
- Raw 
- Multiple lines 
- Interactive  
- Minimal smoothing  

<mark style="background: #04FF00A6;">Explanatory – frame interpretation:</mark> 
- Selective emphasis  
- Controlled scale  
- Smoothing aligned with purpose 
- Clear narrative focus

### <mark style="background: #04FF00A6;">The Responsibility of Design</mark>  

A time-series chart is not just a record of change.  

Its a decision about how change is perceived.  

<mark style="background: #04FF00A6;">You can:</mark>  
- Exaggerate volatility.  
- Hide intervention.  
- Invent continuity.  
- Suppress shocks.  
- Imply structure that does not exist.  

Or you can align encoding with reality.  

Design is an analytical responsibility.  

<mark style="background: #04FF00A6;">Common Time-Series Mistakes:</mark>  
- Truncated y-axis exaggeration
- Dual y-axes
- Too many lines (spaghetti) 
- Over-smoothing 
- Unequal time intervals