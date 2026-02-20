### <mark style="background: #04FF00A6;">Why Relationships Matter</mark>

Do these variables move together?

Decisions depend on relationships

Prediction, explanation, policy

Structure in data guides action

### <mark style="background: #04FF00A6;">Gapminder - Do GDP and life expectancy move together?</mark>

![[Pasted image 20260218163447.png]]

![[Pasted image 20260218163509.png]]

 <mark style="background: #04FF00A6;">Why This Matters</mark>
- Health funding allocation 
- Development policy 
- Economic forecasting

![[Pasted image 20260218163547.png]]

Rescaling: Y Axis now starts at 60 rather than 40  

Visual structure determines perceptual clarity

### <mark style="background: #04FF00A6;">What relationships look like?</mark>

![[Pasted image 20260218163604.png]]

![[Pasted image 20260218163620.png]]

### <mark style="background: #04FF00A6;">Visual Signals</mark>

<mark style="background: #04FF00A6;">Direction:</mark> Slope of line  

<mark style="background: #04FF00A6;">Strength:</mark> Clustering of points around the line  

<mark style="background: #04FF00A6;">Form:</mark> Linear vs curved  

<mark style="background: #04FF00A6;">Outliers:</mark> Points far away from the line

### <mark style="background: #04FF00A6;">Designing Scatterplots for Perception</mark>

### <mark style="background: #04FF00A6;">Aspect Ratio Changes Strength</mark>

ADDING A LAYER - THEME(ASPECT.RATIO = 0. 25)

![[Pasted image 20260218163801.png]]
![[Pasted image 20260218163817.png]]
![[Pasted image 20260218163827.png]]

### <mark style="background: #04FF00A6;">Adding a Regression Line</mark> 

<mark style="background: #04FF00A6;">What the Line Does:</mark> 
- Summarises trend  
- Reduces cognitive load  
- Imposes linear structure  

<mark style="background: #04FF00A6;">Add a layer:</mark>  
``geom_smooth(method="lm", se=TRUE)``

![[Pasted image 20260218163948.png]]

<mark style="background: #04FF00A6;">What does geom_smooth do?</mark>  
- Adds a fitted model on top of your scatterplot.  
- Add a smoothed trend line summarising the relationship (using linear regression)  
- Adds an uncertainty ban

Grey ribbon = uncertainty in estimated mean  
- Wider where data sparse  
- Wider at extremes

By default (with many data points), geom_smooth uses LOESS.  

<mark style="background: #04FF00A6;">Here we override that:</mark>
- method = "lm"  
- This tells ggplot: Use a linear model.  

<mark style="background: #04FF00A6;">So it fits: </mark>
- ``𝑦𝑦 = 𝛽𝛽0 + 𝛽𝛽1 𝑥𝑥``  
- LifExp = const + gdpPercap

se = TRUE, se = standard error.  

This adds the grey shaded band around the regression line.

<mark style="background: #04FF00A6;">Cognitive Effect</mark>
- Reduces cognitive load  
- Summarises the pattern  
- Imposes linear structure  
- Makes weak patterns look clearer  
- May conceal nonlinear structure

### <mark style="background: #04FF00A6;">Log Scale Matters</mark>

![[Pasted image 20260218164303.png]]

### <mark style="background: #04FF00A6;">Overplotting</mark> 

![[Pasted image 20260219093436.png]]

<mark style="background: #04FF00A6;">Overplotting:</mark>
- Hides density  
- Conceals clusters  
- Masks outliers  
- Distorts perceived strength  
- Makes relationships appear weaker or noisier  
- It may appear that there’s no clear pattern.  
- But the pattern may simply be hidden.

<mark style="background: #04FF00A6;">When all years are plotted together:</mark>
- Countries from different decades overlap  
- Growth trajectories collapse into one cloud  
- Time structure disappears  
- Density increases dramatically  

The relationship looks “messy” - but that’s a visual problem, not necessarily a data/statistical one.  

How do we fix it? You can introduce solutions progressively

<mark style="background: #04FF00A6;">Transparency (alpha) - Why It Helps:</mark>  
- Overlapping points darken 
- Sparse areas remain light  
- Density becomes visible  

<mark style="background: #04FF00A6;">Transparency (alpha) - What It Changes Perceptually:</mark>  
- Converts overlap into density  
- Reduces visual clutter  
- Reveals hidden clusters

![[Pasted image 20260219093931.png]]

<mark style="background: #04FF00A6;">Smaller points - Why It Helps:</mark>  
- Fewer overlaps  
- Less visual occlusion  
- More space between observations  

<mark style="background: #04FF00A6;">Smaller points - Perceptual Effect:</mark>  
- Preserves individual observations  
- Maintains clarity in moderately dense plots

![[Pasted image 20260219093941.png]]

<mark style="background: #04FF00A6;">Faceting - Why It Helps:</mark>  
- Reduces density per panel  
- Removes unnecessary overlap  
- Reduces memory load  

<mark style="background: #04FF00A6;">Faceting - Perceptual Effect:</mark>  
- Makes comparison easier  
- Supports structured reasoning  
- Reveals evolving relationships

![[Pasted image 20260219093952.png]]

<mark style="background: #04FF00A6;">Filtering (before the plot) - Why It Helps:</mark>  
- Removes irrelevant data  
- Focuses the visual task  
- Reduces clutter  

<mark style="background: #04FF00A6;">Filtering (before the plot) - Perceptual Effect:</mark>  
- Clarifies pattern within group 
- Makes relationships easier to see

![[Pasted image 20260219094327.png]]

<mark style="background: #04FF00A6;">Aggregation (grouping before the plot) - Why It Helps:</mark>  
- Reduces number of points  
- Highlights broader structure  
- Smooths noise  

<mark style="background: #04FF00A6;">Aggregation (grouping before the plot) - Perceptual Effect:</mark>  
- Emphasises trends 
- Reduces micro-variation

![[Pasted image 20260219094418.png]]

<mark style="background: #04FF00A6;">Jitter (Adds small random displacement) - Why It Helps:</mark>  
- Separates overlapping points  
- Reveals frequency in discrete values  

<mark style="background: #04FF00A6;">Jitter (Adds small random displacement) - Perceptual Effect:</mark>
- Shows density where values stack  
- Prevents identical values from hiding each other

![[Pasted image 20260219094605.png]]

<mark style="background: #04FF00A6;">Hexbin Plots:</mark>  
- Divides plot into hexagonal cells
- Counts observations per cell  
- Colours cells by frequency  
- Preserves spatial structure  

<mark style="background: #04FF00A6;">Hexbin Plots - Why It Helps:</mark>
- Summarises density spatially  
- Scales well to large datasets  
- Reduces noise  

<mark style="background: #04FF00A6;">Hexbin Plots - Perceptual Effect:</mark>  
- Shows structure in very large datasets  
- Emphasises patterns over individuals

![[Pasted image 20260219100047.png]]

<mark style="background: #04FF00A6;">Density Plots:</mark>
- A 2D density plot estimates the probability distribution of the data across the 2D space.  
- Instead of counting bins, it smooths density.

![[Pasted image 20260219100133.png]]

<mark style="background: #04FF00A6;">Density Plots:</mark>
- Add contours to the scatterplot  
- This overlays structure without removing points.

![[Pasted image 20260219100218.png]]

<mark style="background: #04FF00A6;">Density Plots:</mark> can look at single variables

![[Pasted image 20260219100249.png]]

### <mark style="background: #04FF00A6;">The Question Determines the Structure</mark>  

The <mark style="background: #04FF00A6;">structure</mark> determines what is easy to see.  

The <mark style="background: #04FF00A6;">encoding</mark> determines how it is perceived.  

Different questions require different structures  

Different encodings change cognitive effort  

Good visualisation aligns structure with task

### <mark style="background: #04FF00A6;">Scatterplot Matrix</mark>  

A scatterplot shows one relationship.  

But real datasets rarely contain just two variables.  

<mark style="background: #04FF00A6;">A scatterplot matrix allows us to:</mark>
- See all pairwise relationships simultaneously 
- Detect clusters  
- Identify nonlinear relationships  
- Spot redundant variables

![[Pasted image 20260219100416.png]]

### <mark style="background: #04FF00A6;">Correlation Heatmap:</mark> 

Heatmaps compress structure — but sacrifice precision.  

Summarise relationships numerically.  

Instead of plotting points, we encode correlation strength as colour.  

<mark style="background: #04FF00A6;">This reduces cognitive load for:</mark>  
- Ranking strength  
- Identifying strongest associations  

<mark style="background: #04FF00A6;">But we lose:</mark>
- Shape  
- Outliers  
- Nonlinearity  
- Subgroups  

A heatmap encodes summary — not structure.

![[Pasted image 20260219105117.png]]

### <mark style="background: #04FF00A6;">Bubble Plot – Be Careful</mark>  

Adding dimensions increases complexity.  

We are encoding a third variable using size.  

This seems efficient.  

But human perception struggles with area comparison. 
- People compare radius unconsciously.  
- Large bubbles dominate attention.  
- Smaller countries become invisible.  

More encoding ≠ more clarity.

![[Pasted image 20260219112016.png]]

### <mark style="background: #04FF00A6;">When Scatterplots Fail</mark>

<mark style="background: #04FF00A6;">Scatterplots struggle when:</mark>
- Too many points - Overplotting  
- Too many groups - Colour confusion
- Too many dimensions - Clutter  
- High density - Visual saturation  

<mark style="background: #04FF00A6;">So we change structure:</mark>  
- <mark style="background: #04FF00A6;">Faceting:</mark> Reduces memory load 
- <mark style="background: #04FF00A6;">Aggregation:</mark> Reveals trend  
- <mark style="background: #04FF00A6;">Heatmaps:</mark> Summarise strength  
- <mark style="background: #04FF00A6;">Small multiples:</mark> Isolate comparison  

<mark style="background: #04FF00A6;">Key message:</mark>  
- Don’t fix clutter with interactivity.  
- Fix it with structure.

### <mark style="background: #04FF00A6;">Why add interaction?</mark>

<mark style="background: #04FF00A6;">When Static Structure Isn’t Enough:</mark>  
- Too many points  
- Too many categories  
- Too many years  
- Too much detail for one view  

<mark style="background: #04FF00A6;">Interaction allows us to:</mark>
- Reduce clutter  
- Reveal detail on demand  
- Filter complexity  
- Explore structure dynamically  

<mark style="background: #04FF00A6;">But:</mark> Interaction changes the cognitive task.

### <mark style="background: #04FF00A6;">Tooltips (Detail on Demand)</mark>  

Hide detail until needed  

Reduce clutter  

Support exploration  

<mark style="background: #04FF00A6;">But:</mark>
- They prevent simultaneous comparison
- They increase memory load  
- They require user action  

Tooltips trade visibility for cleanliness.  

Tooltips shift information from spatial comparison to sequential inspection.

![[Pasted image 20260219112631.png]]

<mark style="background: #04FF00A6;">We add an additional aesthetic to the plot: e.g.</mark>  
```R
ggplot(aes(gdpPercap, lifeExp, text = paste("Country:", country)))  
# Or  

ggplot(aes(gdpPercap, lifeExp)) +  
	geom_point(aes(text = paste("Country:", country)))
```

### <mark style="background: #04FF00A6;">Highlighting Specific Content</mark>  

Reduces visual emphasis  

Preserves global structure  

Shows trade-off clearly  

Highlighting focuses attention without fragmenting the story

![[Pasted image 20260219112800.png]]

![[Pasted image 20260219112915.png]]

![[Pasted image 20260219112924.png]]

### <mark style="background: #04FF00A6;">Animation</mark>  

<mark style="background: #04FF00A6;">Supports:</mark>
- Narrative  
- Movement  
- Temporal Intuition  

<mark style="background: #04FF00A6;">But:</mark>  
- It prevents side-by-side comparison  
- It increases memory demands  

<mark style="background: #04FF00A6;">You control animation speed in gganimate using:</mark>  
- nframes (total frames)  
- fps (frames per second)  
- duration (total seconds)  
- transition_length / state_length (if using transition_states())  

Animation supports exploration.  

Faceting supports comparison.  

See example in CMPU4091-L4-Animation-Relationships.qmd + html

### <mark style="background: #04FF00A6;">Good v Bad Annotation</mark>  

<mark style="background: #04FF00A6;">Bad annotation:</mark>
- Too many labels  
- Overlapping text  
- Competes with data  

<mark style="background: #04FF00A6;">Good annotation:</mark>  
- Minimal  
- Purposeful  
- Supports the message

### <mark style="background: #04FF00A6;">Interaction v Annotation</mark> 

Both are tools.  

<mark style="background: #04FF00A6;">The decision on when to use each depends on:</mark>  
- Audience  
- Purpose  
- Task  
- Medium

<table>
	<tr>
		<th>Interaction</th>
		<th>Annotation</th>
	</tr>
	<tr>
		<td>User-driven</td>
		<td>Author-driven</td>
	</tr>
	<tr>
		<td>Exploratory </td>
		<td>Explanatory</td>
	</tr>
	<tr>
		<td>Dynamic</td>
		<td>Static</td>
	</tr>
	<tr>
		<td>Detail on demand</td>
		<td>Attention guidance</td>
	</tr>
</table>

Interaction does not fix poor structure.  

Annotation does not fix poor encoding.  

Structure comes first.