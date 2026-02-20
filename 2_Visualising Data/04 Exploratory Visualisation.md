### <mark style="background: #04FF00A6;">Focus this week</mark>  

Why and how visualisations are designed  

Distinction between exploratory and explanatory visualisation  

Highlighting analytical intent as a key design consideration, including grouping, scaling, and interaction

### <mark style="background: #04FF00A6;">Overview</mark>

Difference between Exploratory and Explanatory Visualisation  

<mark style="background: #04FF00A6;">Exploratory Visualisation:</mark>
- Data Types  
- Working with Numerical Data  
- Visualisations for Numerical Data  

<mark style="background: #04FF00A6;">Reshaping Data:</mark>
- Wide to Long  
- Long to Wide  
- Scaling Data  

Basic interaction with ``plotly()``

<mark style="background: #04FF00A6;">Data Explanation:</mark> Communicating a message  

<mark style="background: #04FF00A6;">Data Exploration:</mark> Investigation for Insight  

<mark style="background: #04FF00A6;">Data Story Telling:</mark> Data Analysis insights using storytelling and visuals

![[Pasted image 20260211160746.png]]

### <mark style="background: #04FF00A6;">Exploratory Visualisation</mark> 

Created to help understand important things in the data  

<mark style="background: #04FF00A6;">Translating it into a visual medium can help quickly identify its features:</mark>
- Patterns  
- Trends  
- Outliers  

Typically, part of the data analysis phase  

Used to find the story the data has to tell

### <mark style="background: #04FF00A6;">Exploratory Visualisation</mark>

<mark style="background: #04FF00A6;">Analyse:</mark>
- Explore the data  
- Assess a situation  
- Determine how to proceed  
- Decide what to do  

There may be a whole lot of noise in your data,  if you oversimplify (strip out too much) you could end up missing something important.

![[Pasted image 20260211160948.png]]

### <mark style="background: #04FF00A6;">Explanatory Visualisation</mark>  

Meant to show the important things  

<mark style="background: #04FF00A6;">Trying to tell the story found in the data:</mark>
- Know your audience  
- Know the story you are trying to tell (or the answer you are trying to share)  
- Design to specifically accommodate and highlight that story for that audience  
- Make editorial decisions about which information stays in, and which is distracting or irrelevant and should come out.  
- Select focused data that will support the story you are trying to tell.

![[Pasted image 20260211161040.png]]

<mark style="background: #04FF00A6;">Communicate:</mark>
- Present data and ideas
- Explain and inform
- Provide evidence and support
- Influence and persuade

### <mark style="background: #04FF00A6;">Exploratory and Explanatory</mark>

The same data demands different design decisions depending on whether we are exploring or explaining  

Demo - CMPU4091-L3-Exploratory-v-Explanatory.qmd and .html

<mark style="background: #04FF00A6;">EXPLORATORY</mark>
- Goal: help see patterns, not help an audience understand them  
- Prioritises flexibility over polish
- Often sacrifices clarity for completeness
- May include clutter, multiple encodings, or rough scales
- May intentionally rescale axes (log, zoom, limits) to reveal structure, outliers, or variation.

<mark style="background: #04FF00A6;">EXPLANATORY:</mark>
- Goal: reduce working memory load for the viewer
- Prioritises perceptual clarity and cognitive ease
- Reduces data, encodings, and chart types intentionally  
- Uses rescaling sparingly and transparently, only when it supports the intended message and audience understanding.

<mark style="background: #04FF00A6;">Storytelling:</mark>
- Make a decision about how best to tell the story
- Combination of Exploratory and Explanatory

### <mark style="background: #04FF00A6;">Exercise</mark>

<mark style="background: #04FF00A6;">Add tooltips to a chart from Week 2:</mark>
1. (Install) and load the required library  
2. Create the static plot – Faceted Multiple Comparison chart  
3. Add tooltip text to the plot - Added as part of the aesthetics of the bars so use ``aes()`` function in the ``geom_col``  
4. Store the plot in a variable - We need to have the plot in a form to pass to the plotly function  
5. Render the plot using plotly - Use the ``ggplotly()`` function

### <mark style="background: #04FF00A6;">Statistical Data - Data Types</mark>  

<mark style="background: #04FF00A6;">Categorical:</mark>
- Qualitative Data  
- Represents characteristics e.g. hair colour, eye colour, your level of agreement on a Likert style question etc.  
- Can be numerical values (Example: 1 for blue eyes, 2 for green eyes)  
- These numbers don’t have mathematical meaning.  
- Used for differentiating, grouping, subsetting etc

![[Pasted image 20260211161813.png]]


<mark style="background: #04FF00A6;">Nominal:</mark>
- Represent discrete units and are used to label variables that have no quantitative value
- Think of them as “labels.” 
- Nominal data has no order.  

<mark style="background: #04FF00A6;">Visualising:</mark> Because nominal data has no inherent order, visual encodings that imply order (e.g. line charts or gradients) can mislead perception.

![[Pasted image 20260211161911.png]]

<mark style="background: #04FF00A6;">Ordinal:</mark>
- Represent discrete and ordered units  
- Like nominal data, except its ordering matters.  

<mark style="background: #04FF00A6;">Visualising:</mark> Ordinal data benefits from ordered layouts (sorted bars, aligned axes), but spacing between categories does not imply equal distance.

<mark style="background: #04FF00A6;">Numerical:</mark>
- Data that represents the numerical value of the data.  
- Quantitative data  
- Used to represent quantities.  

<mark style="background: #04FF00A6;">Visualising:</mark> Numerical data supports position and length encodings, which are perceptually more accurate than area or colour.


![[Pasted image 20260211162243.png]]

<mark style="background: #04FF00A6;">Continuous:</mark> Can take on any value and any value between two values (e.g., out to an infinite number of decimal places).

<mark style="background: #04FF00A6;">Discrete:</mark>
- Countable  
- Can have a zero  
- Can only take on a limited number of values (e.g., only whole numbers)

<mark style="background: #04FF00A6;">Interval:</mark>
- Represent ordered units that have a meaningful difference (interval) between values  
- Does not have a meaningful zero.  
- A variable that is interval, contains numeric values that are ordered and where we know the exact interval between the values  

<mark style="background: #04FF00A6;">Visualising:</mark>  
- Benefits from aligned numeric axes and consistent scales, because equal spacing does represent equal differences  
- But the absence of a true zero means ratios and proportional comparisons are not meaningful.  
- Equal spacing is meaningful, but ratios are not.

<mark style="background: #04FF00A6;">Ratio:</mark>
- Quantitative (numbered data) that has a meaningful interval between data points.  
- Unlike Interval data, ratio data has a meaningful zero - known as a true zero.  

<mark style="background: #04FF00A6;">Visualising:</mark>  
- Benefits from aligned numeric axes with a true zero, because equal spacing represents equal differences and proportional comparisons (e.g. “twice as much”) are meaningful.  
- Equal spacing and ratios are both meaningful due to a true zero.

### <mark style="background: #04FF00A6;">Measure of Central Tendency</mark>

A descriptive statistic for quantitative/numerical data.  

A single number to serve as a representative value around which all the numbers in the set tend to cluster.  

<mark style="background: #04FF00A6;">Mode:</mark> the value that occurs most frequently for a variable in a set of data  

<mark style="background: #04FF00A6;">Median:</mark> 
- the value in the middle; half of the values for a variable are larger than the median and half of the values are smaller than the median 
- the middle value of a sequence of all the values in a distribution arranged from lowest to highest.  

<mark style="background: #04FF00A6;">Mean:</mark> the arithmetic average of a group of values; the sum of the values divided by the number of values.

### <mark style="background: #04FF00A6;">Mean, Mode, Median</mark>

![[Pasted image 20260211162702.png]]

Example CMPU4091-L3-Mean-Median.qmd and html

### <mark style="background: #04FF00A6;">Rescaling as an Analytical Decision</mark>

Rescaling does not change the data — it changes what the eye can compare  

Poor scaling can hide spread, skew, and outliers  

Good scaling aligns the visual encoding with the analytical question 

If a pattern only appears after rescaling, it was never ‘created’ - it was revealed.

<mark style="background: #04FF00A6;">Example:</mark>
- CMPU4091-L3-Mean-Median.qmd 
- <mark style="background: #04FF00A6;">Note:</mark>  
- Log scales are not for ‘fixing bad data’. 
- They are for data where differences are multiplicative rather than additive. 
- This is an example of rescaling revealing structure rather than creating it

### <mark style="background: #04FF00A6;">Measures of Dispersion</mark> 

Measures of Dispersion are descriptive statistics that describe how similar a set of values are to each other (or the range of values)  

The more similar the values are to each other, the lower the measure of dispersion will be  

The less similar the values are to each other, the higher the measure of dispersion will be  

In general, the more spread out a distribution is, the larger the measure of dispersion will be  

Measure of Central Tendency needs to be considered in relation to the variability within the dataset.

![[Pasted image 20260211162908.png]]

<mark style="background: #04FF00A6;">There are three main measures of dispersion:</mark>
- Range  
- Interquartile Range (IQR)  
- Variance/Standard Deviation

<mark style="background: #04FF00A6;">Range:</mark> The difference between the largest value for a variable in a dataset and the smallest value  

<mark style="background: #04FF00A6;">Interquartile Range (IQR):</mark>
- Defined as the difference of the third and first quartiles (Q3 – Q1)  
- Order the data from least to greatest,  
- Find the median  
- Calculate the median of both the lower and upper half of the data  
- Gives us quartiles (4 equal divisions)  
- The IQR is the difference between the upper (Q3) and lower (Q1) quartiles  

<mark style="background: #04FF00A6;">Variance/Standard Deviation:</mark>
- Concerned with how different values for a variable are from the mean  
- Standard deviation= square root of variance

![[Pasted image 20260211163030.png]]

<mark style="background: #04FF00A6;">Variance: concerned with deviations from the mean (X-μ)</mark>  
- First subtract the mean from each of the values gives use a deviate or a deviation value - how far a given value is from the typical, or average, value  
- Then square the result  
- If we just added up the differences from the mean the negatives would cancel the positives  
- If we used absolute values we wouldn’t get an accurate measure of spread  
- Squaring is the best option  
- Variance is defined as the average of the deviations from the mean squared:

![[Pasted image 20260211163137.png]]

For sample variance, the denominator is n − 1, which reflects degrees of freedom.  

Degrees of freedom = the number of independent pieces of information on which the estimate is based

<mark style="background: #04FF00A6;">Standard Deviation: the most useful and the most popular measure of dispersion:</mark>
- Concept was first introduced by Karl Pearson in 1893.  
- Standard deviation = the square root of the Variance  
- Use Greek symbol sigma σ  
- The larger the value the more spread out around the mean the data is  
- The smaller the value the less spread out around the mean the data is  
- Allows us to see how spread out on average individual cases are from the mean

### <mark style="background: #04FF00A6;">We need both central tendency and dispersion for meaningful comparison</mark>

<mark style="background: #04FF00A6;">For example:</mark>  
- Programme X and Programme Y have the same mean test value for an assessment in Visualising Data  
- Same number of students in each data set  
- Dataset is well formed and representative (similar for both programmes)  
- If all you saw was the mean, what decision would you make?

![[Pasted image 20260211163340.png]]

<mark style="background: #04FF00A6;">If the mean for Programme X is 60 and the standard deviation is 1.6 then:</mark> 
- 68% of the values in the dataset will lie between 58.4 and 61.6  
- MEAN-1SD (60-1.6=58.4) and MEAN+1SD (60+1.6=61.6)  
- 99.7% of the values will lie between 55.2 and 64.8  
- MEAN-3SD (60-4.8=55.2) and MEAN+3SD (60+4.8=64.8)  

<mark style="background: #04FF00A6;">If the mean for Programme Y is 60 and the standard deviation is 4.3:</mark>
- 68% of the values in the dataset will lie between 55.7 and 64.3  
- MEAN-1SD (60-4.3=55.7) and MEAN+1SD (60+4.3=64.3)  
- 99.7% of the values will lie between 47.1 and 72.9  
- MEAN-3SD (60-12.9=47.1) and MEAN+3SD (60+12.9=72.9)

![[Pasted image 20260211163445.png]]

<mark style="background: #04FF00A6;">So now we can compare programmes in more detail:</mark>  
- Programme X mean is 60  
- 68% of the values in the dataset lie between 58.4 and 61.6  
- 99% of the values in the data set lie between 55.2 and 64.8  
- Programme Y mean is 60  
- 68% of the values in the dataset lie between 55.7 and 64.3  
- 99% of the values in the dataset lie between 47.1 and 72.9  

What can you conclude about the programmes?

Standard deviation controls the scale of the distribution.  

If you don’t rescale appropriately, you may not be able to see it.

<mark style="background: #04FF00A6;">Why this matters for charts:</mark>
- Same mean ≠ same distribution
- Dispersion determines what patterns are visible
- Many charts hide variability unless scale is chosen carefully

### <mark style="background: #04FF00A6;">Dispersion:</mark>

<mark style="background: #04FF00A6;">Dispersion controls the scale of the distribution:</mark> 
- With the same scale, differences in spread may be visually compressed or invisible.
- If you don’t rescale appropriately, differences in spread can be visually invisible.

![[Pasted image 20260211163703.png]]

<mark style="background: #04FF00A6;">Dispersion controls the scale of the distribution:</mark>
- Rescaling can reveal differences in dispersion  
- Changing scale does not alter the data  
- It changes which differences become perceptually resolvable.

### <mark style="background: #04FF00A6;">Data distribution</mark>

<mark style="background: #04FF00A6;">How data values are spread or arranged in a dataset:</mark>
- Provides insights into the shape, centre, and variability of the data  
- Helps in understanding patterns and making statistical inferences.  

<mark style="background: #04FF00A6;">Single variable distribution can be plotted using:</mark>
- A histogram / frequency polygon  
- A density plot  
- A box plot  
- A violin plot  
- Combines density and box plot  

Whether we can see this variability depends on scale used.

### <mark style="background: #04FF00A6;">Histogram</mark>

Invented by Karl Pearson  

A chart that displays numeric data in ranges, where each bar(bin) represents how frequently numbers fall into a particular range  

Provides an In-depth view of a single numeric variable.

![[Pasted image 20260211164123.png]]

A bin in a histogram represents a range of values used to group the data.  

It determines how the continuous numerical data is divided into intervals, allowing us to see the frequency distribution of the dataset.  

<mark style="background: #04FF00A6;">Each bin has:</mark>
- A fixed width (interval size).  
- A height that represents the number of data points falling into that range.

Imagine you have a dataset of exam scores: 45, 50, 55, 60, 65, 70, 72, 74, 75, 78, 80, 85, 90, 92, 95, 100  

If we divide these into bins of width 10, we get:
![[Pasted image 20260211164225.png]]
![[Pasted image 20260211164235.png]]

<mark style="background: #04FF00A6;">Choosing the Number of Bins:</mark>  
- Too few bins?  
- The histogram may oversimplify the data (losing details).
- Too many bins?  
- The histogram may overcomplicate the data (too noisy).  

Bin width is a design choice that directly shapes the story a viewer perceives.  

<mark style="background: #04FF00A6;">The Sturges' rule suggests the number of bins as:</mark>  Bins=1+log 2 (n)where n is the number of observations.

Poor binning increases visual noise  

Over-smoothed histograms can hide multimodality  

Under-smoothed histograms can create false patterns  

<mark style="background: #04FF00A6;">Bin width controls:</mark>  
- Noise vs structure  
- False patterns vs real clusters  
- Cognitive effort for the viewer

![[Pasted image 20260211164437.png]]

<mark style="background: #04FF00A6;">Always:</mark>
- Include the frequency measurement on the y-axis  
- Include ranges on the x-axis.  
- Start the y-axis at zero.  
- Use a single colour for all bars,  
- <mark style="background: #04FF00A6;">Except</mark> when using one additional colour to highlight a single bar.  
- Use at least three intervals/ranges  

<mark style="background: #04FF00A6;">Scale</mark> is a design choice that determines which differences are perceptually resolvable.

<mark style="background: #04FF00A6;">Never:</mark>
- Add spacing between bins.  
- Bins span the entire range of values for the continuous variable.

### <mark style="background: #04FF00A6;">Which of these would you trust for exploration?</mark>

![[Pasted image 20260211164642.png]]
![[Pasted image 20260211164705.png]]

### <mark style="background: #04FF00A6;">Design Choices – Bin Width</mark>

A design choice that shapes the story a viewer perceives.  

Grouping in data space  

Poor bin width → noise. Small bins exaggerate random variation and can create false patterns  

Appropriate bin width → structure. Underlying shape, clusters, and skew become perceptible  

Over-smoothing (bins too wide) → loss of detail or false simplicity. Multimodality, gaps, or subgroups may disappear entirely  

<mark style="background: #04FF00A6;">Bin width</mark> decides how values are grouped before visualisation

### <mark style="background: #04FF00A6;">Design Choices - Scale</mark>

A design choice that determines which differences are perceptually resolvable.  

<mark style="background: #04FF00A6;">Mapping into perceptual space:</mark>
- Poor scale → compression  
- Appropriate scale → structure  
- Over-rescaling → distortion or misinterpretation  

Scale decides how those grouped values are mapped to the eye

### <mark style="background: #04FF00A6;">Histogram: Uses</mark>

<mark style="background: #04FF00A6;">Analysing the data symmetry:</mark>
- Some of the distributions may be symmetric, Some of the data will have a uniform distribution where every bin has almost the same number of data points.  
- <mark style="background: #04FF00A6;">Right-skewed (positive skew):</mark> More data on the left, tail on the right.  
- <mark style="background: #04FF00A6;">Left-skewed (negative skew):</mark> More data on the right, tail on the left.  
- <mark style="background: #04FF00A6;">Symmetric:</mark> Even distribution around the centre (which means the mean of the distribution is precisely around the mid-value of the data set)  
- E.g. Income distribution is often <mark style="background: #04FF00A6;">right-skewed</mark> since a few people earn extremely high salaries

<mark style="background: #04FF00A6;">Analysing frequency distribution:</mark> Frequency distribution is the number of observations that belong to a particular category (or “bin” in histogram terminology).

<mark style="background: #04FF00A6;">Evaluating Data Clusters and Mode:</mark>
- Peaks in a histogram show modes (most frequent values).  
- Unimodal: One peak  
- Bimodal: Two peaks  
- Multimodal: Multiple peaks  

E.g. A histogram of ages at a theme park might show two peaks: one for children and one for adults.

![[Pasted image 20260211165520.png]]

<mark style="background: #04FF00A6;">Detecting Outliers:</mark>
- Unusually high or low bars indicate outliers.  
- Helps decide whether to remove or investigate extreme values  
- E.g.: In a sales data histogram, an unexpected spike might indicate data entry errors or fraud.

![[Pasted image 20260211165552.png]]

<mark style="background: #04FF00A6;">Comparing Multiple Datasets:</mark>  
- Comparing histograms helps understand differences in distributions. 
- E.g: Comparing before-and-after training scores to see improvement.

![[Pasted image 20260211165652.png]]

### <mark style="background: #04FF00A6;">Relative Frequency Histogram</mark>

The height of each bar represents the proportion (or relative frequency) of observations within a bin.  

<mark style="background: #04FF00A6;">A frequency histogram:</mark>
- Shows raw counts  
- The height of each bar represents the count (or frequency) of observations within a bin (or class interval).  
- The sum of all bar heights equals the total number of observations  

<mark style="background: #04FF00A6;">A relative frequency histogram:</mark> 
- Shows proportions or percentages.  
- The height of each bar represents the proportion (or relative frequency) of observations within a bin.  
- The sum of all bar heights equals 1 (or 100% if using percentages).  

The shape of both histograms remains the same, but the scaling on the y-axis differs.  

Relative Frequency=Frequency of a bin/Total number of observations

### <mark style="background: #04FF00A6;">Estimating Probability –From Relative Frequency Histogram</mark>

<mark style="background: #04FF00A6;">Can estimate of the probability of a continuous variable (quantitative variable)</mark>
- Identify the Bin of Interest  
- Find the bar (bin) that corresponds to the event or range of values you’re interested in.  
- Sum the Relative Frequencies (if necessary)

![[Pasted image 20260211170036.png]]

If the event covers multiple bins, add up the relative frequencies of all the bins within that range.  

E.g. If a relative frequency histogram shows that 30% of observations fall between 50 and 60 in a dataset, then the probability of randomly selecting a value in this range is 0.30 (or 30%).

### <mark style="background: #04FF00A6;">Estimating Probability Distribution</mark> 

Can estimate of the probability distribution of a continuous variable (quantitative variable)  

If scaled so that the total area sums to 1, the histogram approximates a probability density function (PDF) for continuous data.

![[Pasted image 20260211170148.png]]

### <mark style="background: #04FF00A6;">Density plot</mark>

A density plot approximates a PDF from real-world data.  

A PDF is a theoretical function, while a density  
plot is data-driven.  

A density plot can help check how well real data fits a given probability distribution.  

<mark style="background: #04FF00A6;">In this illustration:</mark>  
- Blue shaded curve → Empirical density plot estimated from data. Red curve → Theoretical PDF (normal distribution 𝑁𝑁(50,10)N(50,10)).  
- If the data is normally distributed, the density plot should closely match the PDF.  

![[Pasted image 20260211170315.png]]

<mark style="background: #04FF00A6;">Histogram:</mark> Groups data into bins and counts occurrences.  

<mark style="background: #04FF00A6;">Density Plot:</mark>
- Uses a smooth curve to show data distribution without bins.  
- A density plot is a graphical representation of a probability distribution function (PDF) estimated from data.  
- It helps visualise how data points are distributed across values, especially for continuous variables.

![[Pasted image 20260211170403.png]]

### <mark style="background: #04FF00A6;">Kernel Density Estimation</mark> 

The blue histogram shows how data is grouped into bins.  

The red density curve provides a smooth estimate of the distribution  

The area under the density curve equals 1, just like a probability distribution.

![[Pasted image 20260211170446.png]]

### <mark style="background: #04FF00A6;">Estimating Probability Distribution</mark> 

Can estimate of the probability distribution of a continuous variable (quantitative variable)  

<mark style="background: #04FF00A6;">Can use a Kernel Density Function (KDF):</mark>
- More smoothed approach than histograms  
- Uses a kernel function (like Gaussian) to estimate the density at each point.  
- Provides a continuous approximation of the probability density.

![[Pasted image 20260211170537.png]]

Can estimate of the probability distribution of a continuous variable (quantitative variable)  

Use other distribution functions e.g. exponential, gamma

![[Pasted image 20260211170611.png]]

### <mark style="background: #04FF00A6;">Histogram and Density Plots</mark>

It is a good idea to plot the data using several different bin widths to learn more about it. The histogram is quite possibly your most important visual data exploration tool for many datasets  

Density plots trade exact values for shape perception.  

They are unsuitable when precise frequencies or counts are important.

<mark style="background: #04FF00A6;">Example:</mark> CMPU4091-L3-Histogram and Density Plots.qmd and html

### <mark style="background: #04FF00A6;">Box Plot</mark>

A box plot (alias whisker plot) uses boxes and lines to depict the distributions of one or more groups of numeric data.  

Compress large datasets into perceptually efficient summaries, reducing cognitive load.  

<mark style="background: #04FF00A6;">Box limits</mark> indicate the range of the central 50% of the data, with a central line marking the <mark style="background: #04FF00A6;">median</mark> value.  

<mark style="background: #04FF00A6;">Lines</mark> extend from each box to capture the <mark style="background: #04FF00A6;">range</mark> of the remaining data  

Dots placed past the line edges to indicate <mark style="background: #04FF00A6;">outliers</mark>.

![[Pasted image 20260211170750.png]]

### <mark style="background: #04FF00A6;">Definitions:</mark>

<mark style="background: #04FF00A6;">Median:</mark> the middle number in your ordered list  

<mark style="background: #04FF00A6;">Q=Quartile:</mark> way of dividing data into 4 equal parts. Q1, Q3, IQR – the inter quartile range  

<mark style="background: #04FF00A6;">Minimum:</mark> lowest number in normal range  

<mark style="background: #04FF00A6;">Maximum:</mark> highest number in normal range  

<mark style="background: #04FF00A6;">Outlier:</mark> number above maximum or below minimum.

![[Pasted image 20260211170856.png]]

### <mark style="background: #04FF00A6;">So how do I get the IQR?</mark>

List your numbers in order  

Find the number at the mid point in your list (median)  

Find the number at the mid point between the top of your list and your median (Q1)  

Find the number at the mid point between the median and the bottom of your list (Q3)  

IQR = Q3 – Q1  

Lower bound = Q1 − 1.5 × IQR  

Upper bound = Q3 + 1.5 × IQR  

Whiskers extend to the most extreme points within those bounds

### <mark style="background: #04FF00A6;">Box Plot</mark>

<mark style="background: #04FF00A6;">The components of a box plot are:</mark>
- A thick dark line at the median
- A horizontal lines at the 1st quartile
- A horizontal lines at the 3rd quartile 
- A whisker down to the low value  
- Multiply the IQR by 1.5 to calculate the step  
- The low value is the lowest value above the 1st quartile minus the step 
- A whisker up to the high value  
- The high value is the highest value above the 3rd quartile plus the step 
- Any values outside low and high are marked as outliers

![[Pasted image 20260211171005.png]]

<mark style="background: #04FF00A6;">Some important points about a box plot:</mark>
- 50% of the data occurs between the lower and upper edges of the box  
- The lower 50% of the data occurs below the median  
- The upper 50% of the data occurs above the median line in the box.  
- The lower 25% of the data occurs between the bottom edge of the box and the bottom edge of the lower whisker  
- The upper 25% of the data occurs above the top edge of the box and the top edge of the upper whisker

### <mark style="background: #04FF00A6;">Box Plots and Density Functions</mark>

![[Pasted image 20260211171104.png]]

![[Pasted image 20260211171126.png]]

![[Pasted image 20260211171140.png]]

### <mark style="background: #04FF00A6;">Violin Plots</mark> 

Violin plots are used when you want to observe the distribution of numeric data  

Reveal distribution shape but increase visual complexity and interpretation effort.  

Useful when you want to make a comparison of distributions between multiple groups using density plots

![[Pasted image 20260211171213.png]]

The width of each curve corresponds with the approximate frequency of data points in each region.  

The peaks, valleys, and tails of each group’s density curve can be compared to see where groups are similar or different.  

Additional elements, like box plot quartiles, are often added to a violin plot to provide additional ways of comparing groups.

In a violin plot, individual density curves are built around centre lines, rather than stacked on baselines as with histograms.  

Other than this difference in display pattern, curves in a violin plot follow the exact same construction and interpretation.

![[Pasted image 20260211171636.png]]

<mark style="background: #04FF00A6;">Consider the order of the groups:</mark>
- When the groups in a violin plot do not have an inherent ordering  
- You can change the order in which the groups are plotted to make it easier to gain insights from the data.  
- For example, sorting groups by median value makes it so that the ranking of groups is immediately evident..

![[Pasted image 20260211171721.png]]

### <mark style="background: #04FF00A6;">Box Plot v Violin Plot - Which one answers the question faster?</mark>

<mark style="background: #04FF00A6;">Which programme has the highest median?</mark>
![[Pasted image 20260211171804.png]]

<mark style="background: #04FF00A6;">Which programme has the most extreme outliers?</mark>
![[Pasted image 20260211171842.png]]
![[Pasted image 20260212110152.png]]

<mark style="background: #04FF00A6;">Box plot:</mark> Faster answers, lower cognitive load  

<mark style="background: #04FF00A6;">Violin plot:</mark> Richer shape, higher interpretation cost  

<mark style="background: #04FF00A6;">Exploratory ≠ Explanatory trade-off:</mark>
- The same visualisation choice is not equally good for exploration and explanation 
- You are always trading something off depending on your goal

### <mark style="background: #04FF00A6;">Scatterplots: Exploring Relationships Between Variables</mark> 

Each point represents one observation  

Position encodes values on two numeric axes  

<mark style="background: #04FF00A6;">Optimised for detecting:</mark>  
- Relationships  
- Trends  
- Clusters  
- Outliers

![[Pasted image 20260212110326.png]]

<mark style="background: #04FF00A6;">Which relationship are you more confident about?</mark>  
![[Pasted image 20260212110409.png]]
Why?

### <mark style="background: #04FF00A6;">Scale</mark> 

The relationship didn't change - the scale changed what we could see.

![[Pasted image 20260212110431.png]]![[Pasted image 20260212110440.png]]

### <mark style="background: #04FF00A6;">Exploring Relationships</mark>

When relationships are hard to see, we often add models — like trend lines — to support interpretation.  

We will talk about this next week

### <mark style="background: #04FF00A6;">Why we reshape data</mark>

<mark style="background: #04FF00A6;">To enable visual encodings:</mark> 
- Visualisation tools don’t “see” meaning — they <mark style="background: #04FF00A6;">map columns to aesthetics</mark>.  
- Reshaping makes it possible to:  
- map a variable to colour  
- split a chart into facets (small multiples)  
- group observations for comparisons  
- If a variable is spread across multiple columns, it cannot be mapped to an aesthetic in ``ggplot()``.

<mark style="background: #04FF00A6;">NOT for convenience:</mark>
- Pivoting is not about:  
	- making data “look nicer”  
	- matching an example solution  
	- copying a tidyverse pattern
- We reshape data <mark style="background: #04FF00A6;">only when the current structure prevents a question from being asked</mark>.  
- If you didn’t need a new comparison, you wouldn’t reshape.  

Data structure controls what comparisons are possible  

<mark style="background: #04FF00A6;">The structure of a dataset determines:</mark>  
- what can be compared  
- what must be remembered  
- what must be calculated mentally by the viewer  

Structure comes <mark style="background: #04FF00A6;">before</mark> chart type.  

<mark style="background: #04FF00A6;">If the structure is wrong:</mark>  
- the chart becomes cluttered  
- comparisons become stacked instead of aligned  
- the viewer has to hold values in memory

### <mark style="background: #04FF00A6;">Why we reshape data - Wide vs long:</mark>

what each structure makes easy  

<mark style="background: #04FF00A6;">WIDE FORMAT is Good for:</mark>
- tables  
- summary reports  
- one-off totals  

<mark style="background: #04FF00A6;">WIDE FORMAT is Bad for:</mark>
- colour encoding  
- faceting  
- multi-group comparison  

Each <mark style="background: #04FF00A6;">column</mark> is treated as a <mark style="background: #04FF00A6;">separate variable</mark>.  

<mark style="background: #04FF00A6;">LONG FORMAT is Good for:</mark>
- faceting  
- colour / fill grouping  
- consistent scales across groups  

<mark style="background: #04FF00A6;">LONG FORMAT enables:</mark>
- aligned comparisons  
- reduced working memory load  

Each <mark style="background: #04FF00A6;">row</mark> represents <mark style="background: #04FF00A6;">one observation + one category value</mark>.

### <mark style="background: #04FF00A6;">Data Reshaping - Pivoting:</mark>  

Data is reshaped not for convenience, but to enable specific visual encodings and comparisons.  

<mark style="background: #04FF00A6;">Long format:</mark> colour, faceting, grouping  

<mark style="background: #04FF00A6;">Wide format:</mark> tables, summary views, aligned comparisons  

Example CMPU4091-L3-Pivot.R

![[Pasted image 20260212111354.png]]

### <mark style="background: #04FF00A6;">Wide Format</mark>

Data are often entered and stored in a “wide” format  

An object’s details or subject’s characteristics or responses are stored in a single row.  

Not ideal for some types of analysis.

![[Pasted image 20260212111411.png]]

### <mark style="background: #04FF00A6;">Malaria Count Data:</mark>

Each row represents a “facility-day” - Each observation in this dataset refers to the malaria counts at one of 65 facilities on a given date, ranging from 2020-05-16 to 2020-08-12 

Case counts (the right-most columns) are stored in a “wide” - information for every age group on a given facility-day in a single row. 

The dataset provides the overall counts of malaria, as well as age-specific counts in each of three age groups - <4 years, 5-14 years, and 15 years and older. 

Facilities are located in one Province (North) and four Districts (Spring, Bolo, Dingo, and Barnard).

This “Wide” data is not adhering to “tidy data” standards
- The column headers do not actually represent “variables”
- They represent values of a hypothetical “age group” variable. 

Can be useful for presenting the information in a table, or for entering data (e.g. in Excel) from case report forms. 

Typically, should be transformed to a “longer” format more aligned with “tidy data” standards

### <mark style="background: #04FF00A6;">Wide Format</mark>

Visualising the total malaria counts over time poses no difficulty with the data in Wide format  

However, suppose we wanted to display the relative contributions of each age group to this total count?  

We would need to ensure that the variable of interest (age group), appears in the dataset in a single column that can be passed to {ggplot2}’s “mapping aesthetics” ``aes()`` argument.

![[Pasted image 20260212111812.png]]

### <mark style="background: #04FF00A6;">Wide to Long</mark>

![[Pasted image 20260212111844.png]]

### <mark style="background: #04FF00A6;">pivot_longer</mark>

The tidyr function ``pivot_longer()`` makes data “longer”: tidyr is part of the tidyverse of R packages.  

It can operate on only a part of a dataset  

It accepts a range of columns to transform (specified to cols =).  

<mark style="background: #04FF00A6;">We will end up with two “new” columns:</mark>
- one with the categories (the former column names)  
- and one with the corresponding values (e.g. case counts).  
- You can accept the default names for these new columns, or you can specify your own to ``names_to = and values_to =`` respectively.

![[Pasted image 20260212111946.png]]

```R
df_long <- count_data %>% pivot_longer(cols = c(malaria_rdt_0-4, malaria_rdt_5-14, malaria_rdt_15, malaria_tot))
```

This dataframe will have more rows now that the original (but less columns in this case)

![[Pasted image 20260212113404.png]]

Notice the two new columns are just called name and value  

We can override these defaults to provide more meaningful names, which can help remember what is stored within, using the names_to and values_to arguments.  

```R
df_long <- count_data %>% pivot_longer(cols = starts_with("malaria_"), names_to = "age_group", values_to = "counts" )
```

![[Pasted image 20260212113456.png]]

Now we can create small multiples chart by age group plus the overall total.  

```R
ggplot(data = df_long) + geom_col( aes(x = data_date, y = counts), width = 1, fill = "steelblue" ) + facet_wrap(~ age_group, ncol = 1) + labs( x = "Date", y = "Malaria Count" ) + theme_minimal()
```

![[Pasted image 20260212113550.png]]

To remove the total malaria counts – we can filter it out:  
```R
df_long <- df_long %>% filter(age_group != "malaria_tot")
```  

And create the plot again to get just the age group comparison  

\*we would obviously tidy up the naming..

### <mark style="background: #04FF00A6;">Long to Wide</mark>

In some instances, we may wish to convert a dataset to a wider format.  

A typical use-case is when we want to transform the results of an analysis into a format which is more digestible for the reader  

Usually, this involves transforming a dataset in which information for one subject is are spread over multiple rows into a format in which that information is stored in a single row.

![[Pasted image 20260212113748.png]]

![[Pasted image 20260212113807.png]]

### <mark style="background: #04FF00A6;">pivot_wider</mark> 

Use ``pivot_wider`` to get the counts of individuals in the different age groups, by hospital  

```R
df_wide <- linelist %>% count(age_cat, hospital)
```

![[Pasted image 20260212113939.png]]

```R
ggplot(df_wide) + geom_col( aes(x = age_cat, y = n), fill =  "steelblue" ) + facet_wrap(~ hospital) + labs(title = "Total Malaria Count By Age Category from 2020-05-16 to 2020-08-12", x = "Age Category", y = "Total Malaria Count" ) + theme (axis.text.x = element_text(angle=90))
```

![[Pasted image 20260212114035.png]]

![[Pasted image 20260212114048.png]]

<mark style="background: #04FF00A6;">We can create a table with a total for each age group for each hospital:</mark>
- ``table_wide <- df_wide %>% pivot_wider( id_cols = age_cat, names_from = hospital, values_from = n )`` 
- <mark style="background: #04FF00A6;">names_from:</mark> specifies the column from which to generate the new column names  
- <mark style="background: #04FF00A6;">values_from:</mark> specifies the column from which to take the values to populate the cells.  
- ``id_cols`` is optional but can be provided a vector of column names that should not be pivoted, and will thus identify each row

### <mark style="background: #04FF00A6;">Heatmap</mark>

```R
ggplot(df_wide, aes(x = hospital, y = age_cat, fill = n)) + geom_tile(color = "white") + scale_fill_viridis_c(option = "C") + labs( title = "Malaria Case Counts by Age Category and Hospital", x = "Hospital", y = "Age Category", fill = "Count" ) + theme_minimal() + theme( axis.text.x = element_text(angle = 45, hjust = 1) )
```

![[Pasted image 20260212114254.png]]

### <mark style="background: #04FF00A6;">Pivoting is an Analytical Decision</mark>

<mark style="background: #04FF00A6;">Before pivoting, you should be able to answer:</mark>
- What is the variable I want to compare?  
- Do I want the viewer to compare groups side-by-side or stacked?  
- Do I want the viewer to remember values, or see them aligned?  
- If your answer involves facets, colour, or grouping, your data almost certainly needs to be long.

### <mark style="background: #04FF00A6;">Categorical Data</mark>

What are we interested in?

Set of all possible values  

<mark style="background: #04FF00A6;">Frequency:</mark>
- The number of occurrences of each possible value  
- Maybe a graph or a table  
- The most commonly occurring value  

<mark style="background: #04FF00A6;">Unusual Occurrences:</mark>
- Gaps  
- Clusters

### <mark style="background: #04FF00A6;">Nominal or Ordinal</mark>

<mark style="background: #04FF00A6;">BAR CHARTS Optimise for:</mark>  
- Comparing magnitudes across categories  
- Ranking categories clearly  
- Accurate value comparison (common baseline)  

<mark style="background: #04FF00A6;">BAR CHARTS Hide:</mark>  
- Distribution within categories  
- Variability within groups  
- Outliers and individual observations  

<mark style="background: #04FF00A6;">PIE CHARTS Optimise for:</mark>  
- Showing part-to-whole relationships  
- Very coarse proportion comparison (few categories only)  

<mark style="background: #04FF00A6;">PIE CHARTS Hide:</mark>
- Precise magnitude differences  
- Ordering and ranking  
- Small but important differences between categories  
- Distribution and variability

<mark style="background: #04FF00A6;">FREQUENCY TABLES Optimise for:</mark>  
- Exact values and lookup  
- Reporting totals and counts  
- Transparency and auditability  

<mark style="background: #04FF00A6;">FREQUENCY TABLES Hide:</mark>
- Patterns and trends  
- Relative differences at a glance  
- Distribution shape  
- Outliers (unless explicitly shown)  

<mark style="background: #04FF00A6;">MODE AND/OR SIMPLE FREQUENCIES Optimise for:</mark>  
- Identifying the most common category  
- Quick summary of dominant outcomes  

<mark style="background: #04FF00A6;">MODE AND/OR SIMPLE FREQUENCIES Hide:</mark>  
- Spread of the data  
- Relative differences beyond the most frequent category  
- Rare but important categories  
- Any notion of variability

<mark style="background: #04FF00A6;">Choose the chart that matches the question you are asking:</mark>
- No chart shows everything.  
- Comparison → Bar chart 
- Proportion → Pie chart (sparingly) 
- Exact values → Table 
- Dominance → Mode

### <mark style="background: #04FF00A6;">Numerical Data</mark>  

<mark style="background: #04FF00A6;">What are we interested in?:</mark>
- Where the data is centred?
- How dispersed is the data?
- What is the shape of the data? (what is its distribution?)
- Are there extreme values (outliers)? 
- Are there gaps and clusters?
- Histograms (frequency or relative frequency)
- Histograms plus density plots
- Box Plots
- Violin Plots  

<mark style="background: #04FF00A6;">Appropriate descriptives:</mark> mean and standard deviation, median and IQR

http://extremepresentation.typepad.com/blog/files/choosing_a_good_chart.pdf

![[Pasted image 20260212115153.png]]

### <mark style="background: #04FF00A6;">Cleveland and McGill Perceptual Accuracy</mark>  

Some visual encodings let humans judge numbers much more accurately than others.  

When we look at a chart, we’re not “reading numbers” — we’re making perceptual judgments.  

Cleveland & McGill tested which visual tasks the human visual system performs best, and ranked them by accuracy.  

Humans are exceptionally good at comparing positions along the same axis  

<mark style="background: #04FF00A6;">But much worse at judging:</mark>
- how big an area is,  
- how steep an angle is,  
- or how intense a colour looks.

### <mark style="background: #04FF00A6;">Cleveland and McGill Perceptual Accuracy</mark> 

<mark style="background: #04FF00A6;">From most accurate to least accurate:</mark>  
- Position on a common scale (e.g., dot plots, bar charts with a shared baseline)  
- Position on identical but non-aligned scales (e.g., small multiples)  
- Length (e.g., bar height)  
- Angle / slope (e.g., pie slices, line steepness)  
- Area (e.g., bubble charts)  
- Volume  
- Colour saturation / shading

Match the visual encoding to the precision your audience needs.  

<mark style="background: #04FF00A6;">Need exact comparison:</mark> position on a shared axis  

<mark style="background: #04FF00A6;">Need rough pattern / vibe:</mark> area or colour can be fine  

<mark style="background: #04FF00A6;">Need speed over precision:</mark> simpler encodings win

### <mark style="background: #04FF00A6;">Exploratory Data Analysis – Workflow</mark>  

Build and Clean the Dataframe  
- Ensure each row represents an object and each column represents a property.
- Convert columns to numeric where possible and remove unnecessary columns.
- If data is in long format (one row per observation), you may need pivot (pivot_wider) to reshape it into a more useful structure.  

<mark style="background: #04FF00A6;">Explore global properties:</mark>
- Histograms: To visualize the distribution of numerical columns.
- Density plots: To examine the overall shape of a distribution.
- Box and violin plots: To compare distributions across groups, reveal centre, spread, and outliers. 
- Scatter plots: To explore relationships between variables. 
- Use aggregation functions (summarize): To compute mean, median, and standard deviation.  

<mark style="background: #04FF00A6;">Explore group properties:</mark> 
- Use grouping (group_by()) to compare different categories.
- Use pivot (pivot_longer()) to restructure wide data into long format for group analysis.
- Use small multiples to compare subsets of the data. 
- Use aggregation functions (summarise) to extract insights
