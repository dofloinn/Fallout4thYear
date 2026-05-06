### <mark style="background: #04FF00A6;">Why do we need to manage uncertainty?</mark>

Data is never perfect.  

<mark style="background: #04FF00A6;">Sources of uncertainty include:</mark>  
- Sampling  
- Measurement error  
- Missing data  
- Outliers  
- Model assumptions

### <mark style="background: #04FF00A6;">Uncertainty in Data Visualisation</mark> 

<mark style="background: #04FF00A6;">Uncertainty in data for visualisation:</mark>
- Uncertainty in the data itself that influences visualisation.
- The inherent variability, errors, or limitations in the data being visualised.  

<mark style="background: #04FF00A6;">Sources of uncertainty:</mark>  
- Measurement error, sampling variability, model assumptions and simplifications, missing or incomplete data, data processing and transformation choices.  

<mark style="background: #04FF00A6;">Goal:</mark> Understanding and addressing uncertainty before creating visualisations.

### <mark style="background: #04FF00A6;">Visualising Uncertainty in Data Visualisation</mark>

How to depict uncertainty clearly using visual elements.  

The techniques used to represent and communicate uncertainty in a visualisation.  

Techniques: hovering, filtering, shading, error bars, interactive steering, confidence intervals.  

<mark style="background: #04FF00A6;">Goal:</mark> Helping users interpret the reliability of the presented data.

### <mark style="background: #04FF00A6;">Why is it important to address uncertainty in data visualisation?</mark> 

Acknowledging uncertainty in data visualisation leads to more reliable, ethical, and effective communication of insights.  

<mark style="background: #04FF00A6;">Ensures Trust and Credibility:</mark> Visualisations that acknowledge uncertainty prevent misleading interpretations and build confidence in data-driven decisions.  

<mark style="background: #04FF00A6;">Avoids False Conclusions:</mark> Ignoring uncertainty can lead to overconfidence in trends, relationships, or predictions that may not hold true.  

<mark style="background: #04FF00A6;">Improves Decision-Making:</mark> Decision-makers need to understand the reliability of insights before acting on them.  

<mark style="background: #04FF00A6;">Reflects Real-World Complexity:</mark> Data is never perfect—measurement errors, sampling variability, missing values, and assumptions all contribute to uncertainty.  

<mark style="background: #04FF00A6;">Enhances Transparency:</mark> Clearly communicating uncertainty helps audiences interpret findings accurately.

### <mark style="background: #04FF00A6;">Data Pipeline</mark>

![[Pasted image 20260320180820.png]]

### <mark style="background: #04FF00A6;">Data Visualisation Pipeline</mark> 

<mark style="background: #04FF00A6;">Data Collection:</mark>
- Gather raw data from various sources (surveys, sensors, databases, etc.). 
- <mark style="background: #04FF00A6;">Example:</mark> Collecting sales data from a company's database.  

<mark style="background: #04FF00A6;">Data Cleaning:</mark>
- Handle missing values, correct errors, and remove outliers to ensure data quality.
- <mark style="background: #04FF00A6;">Example:</mark> Removing duplicate entries or correcting date formats in the dataset.  

<mark style="background: #04FF00A6;">Data Transformation:</mark>  
- Reshape, aggregate, or pivot data to create meaningful structures for analysis.
- <mark style="background: #04FF00A6;">Example:</mark> Converting categorical data into numerical form for analysis, or pivoting data from wide to long format.  

<mark style="background: #04FF00A6;">Exploratory Data Analysis (EDA):</mark>  
- Analyse the data using summary statistics, trends, and patterns to inform decisions on which visualisations to create.
- <mark style="background: #04FF00A6;">Example:</mark> Visualising distribution of sales by region to identify trends

<mark style="background: #04FF00A6;">Choosing the Right Visualisation</mark> 
- Select an appropriate chart or graph type based on the data and the story you want to tell.  
- Example: Using a line graph to show trends over time or a bar chart for comparing categories.  

<mark style="background: #04FF00A6;">Design and Styling:</mark>  
- Customise visual elements such as colours, labels, and titles to improve clarity and aesthetics. 
- Example: Adding a title, axis labels, and a legend to a bar chart for clarity.  

<mark style="background: #04FF00A6;">Interactive Elements (Optional):</mark>  
- Add interactive features like tooltips, zooming, and filters to enhance user engagement.
- Example: Adding a hover effect on a map to display additional information about each region.

<mark style="background: #04FF00A6;">Review and Refinement:</mark>
- Ensure the visualisation accurately represents the data and effectively communicates insights.
- Example: Reviewing a dashboard to check for clarity and coherence of the message.  

<mark style="background: #04FF00A6;">Publication and Sharing:</mark>  
- Share the final visualisation through reports, websites, or interactive platforms.
- <mark style="background: #04FF00A6;">Example:</mark> Publishing the interactive chart on a website for public access.

### <mark style="background: #04FF00A6;">Samples and Populations</mark>

A sample is a subset of individuals or observations from a larger population to analyse and draw conclusions about the whole.  

<mark style="background: #04FF00A6;">If the sample is representative:</mark> conclusions generalise to the population.  

<mark style="background: #04FF00A6;">If not:</mark> results may be biased.  

A sample is representative if it accurately reflects the characteristics of the overall population. A well-chosen sample ensures that conclusions drawn from it generalise to the broader group.  

<mark style="background: #04FF00A6;">Factors Affecting Representativeness:</mark>
- <mark style="background: #04FF00A6;">Sample Size:</mark> Larger samples generally reduce variability and increase representativeness.  
- <mark style="background: #04FF00A6;">Sampling Method:</mark> Probability sampling improves fairness and reduces bias.  
- <mark style="background: #04FF00A6;">Response Bias:</mark> Convenience sample, self-selection etc. distort the sample.

### <mark style="background: #04FF00A6;">Sampling and Errors</mark>

<mark style="background: #04FF00A6;">Hypothesis testing:</mark>
- Conducted against samples  
- Extrapolated to the population  

Null hypothesis v Alternative Hypothesis  

<mark style="background: #04FF00A6;">Type I Error (False Positive):</mark>
- Rejecting the null hypothesis when it actually holds in the population.  
- E.g. A medical test incorrectly detects a disease in a healthy person.  

<mark style="background: #04FF00A6;">Type II Error (False Negative):</mark>
- Failing to reject the null hypothesis when it does not hold in the population.  
- A medical test fails to detect a disease in a sick person.

### <mark style="background: #04FF00A6;">Uncertainty in Data for Visualisation</mark>

<mark style="background: #04FF00A6;">Measurement error:</mark>
- Occurs when collected data contains inaccuracies due to imprecise instruments, human errors, or environmental factors. This can introduce bias or random noise into analyses.  
- <mark style="background: #04FF00A6;">Example:</mark> A faulty temperature sensor records readings 2°C higher than the actual value, affecting climate trend analysis.  

<mark style="background: #04FF00A6;">Sampling variability:</mark>
- Refers to the natural differences between a sample and the entire population due to random chance. Even well-designed samples can show variations.
- Example: A political poll based on 1,000 respondents may give different results than another sample of 1,000 from the same population.  

<mark style="background: #04FF00A6;">Model assumptions and simplifications:</mark>
- Statistical and machine learning models make assumptions (e.g., linearity, independence) that may not fully reflect reality, leading to potential misinterpretation.
- <mark style="background: #04FF00A6;">Example:</mark> A linear regression model assumes a straight-line relationship between income and spending, but real-world behaviour may be more complex.  

<mark style="background: #04FF00A6;">Data processing and transformation choices:</mark>
- Decisions made during data cleaning, aggregation, or normalisation can impact results, sometimes introducing unintended biases. 
- <mark style="background: #04FF00A6;">Example:</mark> Converting income levels into broad categories (low, medium, high) may obscure important financial differences within each group.

<mark style="background: #04FF00A6;">Missing or incomplete data:</mark>
- When some values in a dataset are absent, leading to biased conclusions if not handled properly (e.g., imputation, exclusion).  
- <mark style="background: #04FF00A6;">Missing data may arise due to:</mark>  
	- non-response  
	- measurement problems  
	- data collection issues  
- Missing values can introduce bias.  
- <mark style="background: #04FF00A6;">Example:</mark> In a medical study, missing patient follow-up data may lead to incorrect survival rate estimates.

<mark style="background: #04FF00A6;">Outliers:</mark> Outliers are observations that differ greatly from others.  

<mark style="background: #04FF00A6;">Possible causes:</mark>  
- measurement errors  
- unusual but valid cases  
- data entry mistakes

### <mark style="background: #04FF00A6;">Preparing for Uncertainty in Data Visualisation</mark>  

<mark style="background: #04FF00A6;">Collecting and cleaning data carefully:</mark> Understanding implications of representativeness and bias  

Using robust data transformation techniques  

<mark style="background: #04FF00A6;">Documenting sources of uncertainty:</mark>
- Provide metadata about data collection and pre-processing.  
- Clearly document and communicate data limitations.  

<mark style="background: #04FF00A6;">Choosing appropriate statistical methods:</mark>
- Choose robust methods
- Use techniques that minimise errors and bias

### <mark style="background: #04FF00A6;">Preparing your data</mark>

Weighting your data to correct for bias, address design effects, make sample more representative of the population  

<mark style="background: #04FF00A6;">Secondary data:</mark> Check if there is a weighting factor and what it is for, apply it as needed  

Deciding what to do about missing data  

Deciding what to do about outliers  

<mark style="background: #04FF00A6;">Recoding your variables:</mark>
- E.g. to reduce the number of categories  
- Doing so will not be objective but working with categorisation at all is highly contested and highly political

<mark style="background: #04FF00A6;">Selecting cases:</mark> To work only with particular sub-groups of data  

<mark style="background: #04FF00A6;">Splitting your file:</mark> Allows you to organise your output by category of variable you are interested in

### <mark style="background: #04FF00A6;">Why do we need to care about missing data and outliers?</mark>  

Source of bias - Introduces the possibility of making inferences on the basis of sample data that are inadvertently biased in unknown directions  

Choice of treatment (e.g. deletion) can lead to loss of information and loss of truthfulness in any visualisation  

Makes some common tests and visualisations inappropriate or difficult to use

### <mark style="background: #04FF00A6;">Evaluating Missing Data</mark>  

<mark style="background: #04FF00A6;">Consider the amount of missing data:</mark> 
- Percent of cases with missing data  
- Percent of variables having missing data  
- Percent of data values that are missing  

<mark style="background: #04FF00A6;">Consider the pattern of missing data:</mark>
- Missing by design  
- Missing data patterns  
- Missing completely at random (MCAR)—Ignorable  
- Missing at random (MAR)—Conditionally ignorable (need to identify the reason and decide)  
- Missing not at random (MNAR)—Not ignorable

### <mark style="background: #04FF00A6;">Why is it a problem?</mark>  

<mark style="background: #04FF00A6;">If our sample is large (> 80):</mark> we may be able to allow cases to be excluded.  

<mark style="background: #04FF00A6;">If our sample is small (less than 80): </mark> we will have to try to use a substitution method so that we can retain enough cases to have sufficient power to detect effects.  

<mark style="background: #04FF00A6;">In either case:</mark>
- we need to make certain that we understand the potential impact that missing data may have on our analysis.  
- If missing data represent less than 5% of the total and is missing in a random pattern from a large data set, almost any procedure for handling missing values yields similar results  
- Tabachnik and Fidell, Using Multivariate Statistics, 6 th Edition, Pearson

### <mark style="background: #04FF00A6;">General Steps for Dealing with Missing Data</mark>

Identify patterns/reasons for missing and recode correctly 

<mark style="background: #04FF00A6;">Understand distribution of missing data:</mark> 
- Consider the probability of missingness (MCAR, MAR, MNAR)  
- Are certain groups more likely to have missing values?
- Example: Respondents in service occupations less likely to report income  
- Are certain responses more likely to be missing?  
- Example: Respondents with high income less likely to report income
 
<mark style="background: #04FF00A6;">Decide on best method of analysis:</mark>
- Use what you know about  
- Why data is missing  
- Distribution of missing data  

<mark style="background: #04FF00A6;">Decide on the best analysis strategy to yield the least biased estimates:</mark>
- <mark style="background: #04FF00A6;">Deletion Methods:</mark> Listwise deletion (e.g. na.omit()), pairwise deletion (complete cases parameter of r function)  
- <mark style="background: #04FF00A6;">Single Imputation Methods:</mark> Mean/mode substitution, dummy variable method, single regression  
- <mark style="background: #04FF00A6;">Model-Based Methods:</mark> Maximum Likelihood, Multiple imputation

### <mark style="background: #04FF00A6;">Outliers</mark>

![[Pasted image 20260320185558.png]]

### <mark style="background: #04FF00A6;">Univariate and Multivariate Outliers</mark>

<mark style="background: #04FF00A6;">Univariate outliers:</mark> Cases that have an unusual value for a single variable  

<mark style="background: #04FF00A6;">Multivariate outliers:</mark>
- Cases that have an unusual combination of values for several of the variables.  
- The value for any of the individual variables may not be a univariate outlier, but, in combination with other variables, is a case that occurs very rarely.

### <mark style="background: #04FF00A6;">Outliers</mark>

<mark style="background: #04FF00A6;">Reasons for outliers:</mark>
- Data entry error  
- Failure to specify a particular value for missing data  
- Outlier not a true member of population of interest  
- Outlier is a true member of population of interest with an extreme score  

<mark style="background: #04FF00A6;">What to do?</mark>  
- Transform to standardised variables  
- Look at histogram  
- Sometimes transforming data can “pull in” the outlier  
- <mark style="background: #04FF00A6;">Censoring outliers:</mark> May need to delete case/s and run with and without outlier

### <mark style="background: #04FF00A6;">Visualisation Pipeline</mark>

![[Pasted image 20260320185749.png]]

### <mark style="background: #04FF00A6;">Data Acquisition</mark>

Gather raw data from various sources (surveys, sensors, databases, etc.).  

<mark style="background: #04FF00A6;">Uncertainty Source:</mark> Measurement errors, sensor limitations, and data quality issues.  

<mark style="background: #04FF00A6;">Action:</mark> Acknowledge the potential sources of uncertainty early and document them. This can include recording the precision of measurement instruments or potential biases in sampling

![[Pasted image 20260320185840.png]]

### <mark style="background: #04FF00A6;">Data Cleaning</mark>

Handle missing values, correct errors, and remove outliers to ensure data quality.  

Uncertainty Source: Errors in data entry, missing values, or incorrect data types.  

Action: Handle missing data (e.g., through imputation or removal), correct errors, and deal with outliers that may skew results.  

Decisions made in this step should account for their impact on uncertainty.

![[Pasted image 20260320185935.png]]

### <mark style="background: #04FF00A6;">Data Transformation</mark>

Reshape, aggregate, or pivot data to create meaningful structures for analysis  

<mark style="background: #04FF00A6;">Uncertainty Source:</mark> Assumptions made during data aggregation or transformation (e.g., choosing aggregation methods).  

<mark style="background: #04FF00A6;">Action:</mark> Ensure that transformations do not inadvertently increase uncertainty, and apply methods to quantify uncertainty when reshaping or aggregating data.

![[Pasted image 20260320190035.png]]

### <mark style="background: #04FF00A6;">Exploratory Data Analysis (EDA)</mark>  

Analyse the data using summary statistics, trends, and patterns to inform decisions on which visualisations to create.  

<mark style="background: #04FF00A6;">Uncertainty Source:</mark> Sampling variability and limitations in the data that might affect analysis.  

<mark style="background: #04FF00A6;">Action:</mark> Use visual techniques like error bars, confidence intervals, or bootstrapping to explore and represent uncertainty while interpreting the data.

![[Pasted image 20260320190138.png]]

### <mark style="background: #04FF00A6;">Choosing the Right Visualisation</mark>

Select an appropriate chart or graph type based on the data and the story you want to tell.  

<mark style="background: #04FF00A6;">Uncertainty Source:</mark> Misleading or inappropriate visual representation of uncertain data.  

<mark style="background: #04FF00A6;">Action:</mark> Select visualisation methods that explicitly convey uncertainty, such as using shaded regions, error bars, or transparency effects to show the range of possible values.

![[Pasted image 20260320190306.png]]

### <mark style="background: #04FF00A6;">Design and Styling</mark>

Customise visual elements such as colours, labels, and titles to improve clarity and aesthetics.  

<mark style="background: #04FF00A6;">Uncertainty Source:</mark> Visual clutter or misleading choices in chart design that obscure uncertainty.  

<mark style="background: #04FF00A6;">Action:</mark> Use design elements (e.g., colour gradients, interactive features) to highlight uncertainty while maintaining clarity. Properly label and scale uncertainty in visualisations to prevent misinterpretation.

![[Pasted image 20260320190352.png]]

### <mark style="background: #04FF00A6;">Interactive Elements</mark>

Add interactive features like tooltips, zooming, and filters to enhance user engagement.  

<mark style="background: #04FF00A6;">Uncertainty Source:</mark> Lack of dynamic interaction with uncertainty visualisation.  

<mark style="background: #04FF00A6;">Action:</mark> Enable interactive elements that allow users to explore uncertainty in real-time, such as hovering to reveal confidence intervals or adjusting parameters to see changes in uncertainty.

![[Pasted image 20260320190456.png]]

### <mark style="background: #04FF00A6;">Review and Refinement</mark>

Ensure the visualisation accurately represents the data and effectively communicates insights.  

<mark style="background: #04FF00A6;">Uncertainty Source:</mark> Overlooking the impact of uncertainty in the final interpretation of the data.  

<mark style="background: #04FF00A6;">Action:</mark> Continuously assess how well uncertainty is communicated and ensure that it is reflected in the visualisation's final version

### <mark style="background: #04FF00A6;">Publication and Sharing</mark>

Share the final visualisation through reports, websites, or interactive platforms.  

<mark style="background: #04FF00A6;">Uncertainty Source:</mark> Misinterpretation by the audience if uncertainty is not properly conveyed.  

<mark style="background: #04FF00A6;">Action:</mark> Ensure the visualisation, along with explanatory text or annotations, communicates uncertainty clearly to the audience, allowing them to make informed decisions based on the data.

### <mark style="background: #04FF00A6;">Visual Techniques for Representing Uncertainty</mark> 

<mark style="background: #04FF00A6;">Error bars:</mark> (for standard deviations, confidence intervals) Indicate data reliability using error bars, shaded confidence regions, or fan charts  

<mark style="background: #04FF00A6;">Shaded regions</mark> (for confidence bands in trend lines)  

<mark style="background: #04FF00A6;">Density plots</mark> (for distributions) Show data distribution using colour gradients, opacity, or jittering  

Transparency and jittering (to reveal variability in data points)  

Multiple scenario plots (for model uncertainty) - Display different possible outcomes (e.g., in forecasting) to show the range of uncertainty.  

<mark style="background: #04FF00A6;">Annotations and Legends:</mark> Clearly explain what the uncertainty markers mean to avoid misinterpretation.

Error bars represent uncertainty around a summary statistic, such as a mean.  

<mark style="background: #04FF00A6;">They commonly represent:</mark>  
- standard deviation  
- standard error  
- confidence intervals  

<mark style="background: #04FF00A6;">Use error bars when you want to show:</mark>  
- uncertainty around an average or estimate  
- comparisons between groups or categories  
- reliability of experimental measurements  

<mark style="background: #04FF00A6;">Example uses:</mark>
- average life expectancy by continent  
- average income by country  
- experimental results in scientific studies  

<mark style="background: #04FF00A6;">Key advantage:</mark> They make it clear that the estimate is not exact.

![[Pasted image 20260320190903.png]]

### <mark style="background: #04FF00A6;">Confidence Bands</mark>

Confidence bands represent uncertainty around a trend line or model.  

They are typically shown as a shaded region around a line.  

<mark style="background: #04FF00A6;">Use confidence bands when:</mark>  
- displaying regression models  
- showing time series trends  
- communicating prediction uncertainty  

<mark style="background: #04FF00A6;">Example uses:</mark>
- GDP vs life expectancy regression  
- economic growth over time  
- climate projections  

<mark style="background: #04FF00A6;">Key advantage:</mark> They show that the relationship between variables is uncertain.

![[Pasted image 20260320191002.png]]

### <mark style="background: #04FF00A6;">Visual Techniques for Representing Uncertainty</mark>  

<mark style="background: #04FF00A6;">Density/Histograms(for distributions):</mark> Show data distribution using colour gradients, opacity, or jittering

![[Pasted image 20260320191049.png]]

### <mark style="background: #04FF00A6;">Boxplots and Violin Plots</mark>

Summarise distributions and variability in data.  

<mark style="background: #04FF00A6;">Use these plots when:</mark>  
- comparing variation across groups  
- showing spread of the data  
- identifying outliers  

<mark style="background: #04FF00A6;">These plots summarise the distribution of data:</mark>
- A boxplot shows:  
- median  
- quartiles  
- potential outliers  
- A violin plot also shows the shape of the distribution.  

<mark style="background: #04FF00A6;">Example uses:</mark>
- life expectancy by continent  
- income distribution across countries  
- test scores by class  

<mark style="background: #04FF00A6;">Key advantage:</mark> They show variability rather than just averages.

![[Pasted image 20260320191144.png]]

### <mark style="background: #04FF00A6;">Jitter and Transparency</mark>

Jitter and transparency help reveal overlapping data points.  

They make dense scatterplots easier to interpret.  

<mark style="background: #04FF00A6;">Use jitter when:</mark>
- many points share similar values  
- scatterplots contain overplotting  
- discrete categories create overlapping points  

<mark style="background: #04FF00A6;">Example uses:</mark>
- life expectancy by continent  
- survey responses with integer values  
- categorical scatterplots  

<mark style="background: #04FF00A6;">Key advantage:</mark> They reveal hidden patterns in dense data.

### <mark style="background: #04FF00A6;">Transparency</mark>

Transparency allows overlapping points to accumulate visually.  

Darker areas indicate <mark style="background: #04FF00A6;">higher data density</mark>.  

<mark style="background: #04FF00A6;">Use transparency when:</mark>  
- datasets contain many points  
- overplotting occurs in scatterplots  
- you want to show density without aggregation  

<mark style="background: #04FF00A6;">Example uses:</mark>
- GDP vs life expectancy  
- large survey datasets  
- geographic point data

![[Pasted image 20260320191310.png]]

### <mark style="background: #04FF00A6;">Fan Charts</mark>

Fan charts show multiple possible future outcomes.  

<mark style="background: #04FF00A6;">Use fan charts when:</mark>
- visualising forecasts or predictions  
- communicating model uncertainty  
- presenting risk scenarios  

<mark style="background: #04FF00A6;">Example uses:</mark>
- economic forecasts  
- election predictions

![[Pasted image 20260320191347.png]]

<table>
	<tr>
		<td>Goal</td>
		<td>Recommended Technique</td>
	 </tr>
	 <tr>
		 <td>Show numeric uncertainty e.g. mean</td>
		<td>Error bars</td>
	 </tr>
	 <tr>
		<td>Show uncertainty around a trend</td>
		<td> Confidence bands</td>
	 </tr>
	 <tr>
		<td>Show variation in data</td>
		<td>Boxplots / violin plots</td>
	 </tr>
	 <tr>
		<td>Reveal overlapping observations</td>
		<td>Jitter / transparency</td>
	 </tr>
	 <tr>
		<td>Show forecast uncertainty</td>
		<td>Fan charts</td>
	 </tr>
</table>

### <mark style="background: #04FF00A6;">Spatial Uncertainty - Techniques</mark>  

<mark style="background: #04FF00A6;">Transparency / Opacity:</mark>
- Lower opacity can indicate less reliable estimates.  
- Example:  
- darker regions = higher confidence  
- lighter regions = more uncertainty.  

<mark style="background: #04FF00A6;">Pattern / Texture:</mark>
- Patterns such as hatching or dots can indicate uncertain regions.  
- <mark style="background: #04FF00A6;">Example:</mark>
	- striped areas = estimated data  
	- solid areas = measured data.  
	- This technique is often used in climate maps.

<mark style="background: #04FF00A6;">Blur / Fuzzy Boundaries:</mark>
- Blurred edges can indicate uncertain geographic boundaries.  
- <mark style="background: #04FF00A6;">Example:</mark>
	- environmental zones  
	- climate projections  
	- ecological ranges.  

<mark style="background: #04FF00A6;">Bivariate Maps:</mark>
- Two variables are mapped simultaneously:  
- colour = value  
- saturation / pattern = uncertainty  
- <mark style="background: #04FF00A6;">Example:</mark>  
	- unemployment rate (colour)  
	- margin of error (lightness).

### <mark style="background: #04FF00A6;">Key Design Principle</mark>

<mark style="background: #04FF00A6;">When mapping uncertain data:</mark>  
- avoid suggesting false precision  
- make uncertainty visible  
- clearly explain what the uncertainty represents.  

Communicating uncertainty helps users make <mark style="background: #04FF00A6;">better informed decisions</mark>.

### <mark style="background: #04FF00A6;">Interactive Steering</mark>

Refers to the ability of users to dynamically explore and adjust visualisations by interacting with parameters, filters, or models in real-time.  

It allows users to guide the exploration of data and gain deeper insights beyond static representations.  

Transforms data visualisation from a <mark style="background: #04FF00A6;">static presentation</mark> into an <mark style="background: #04FF00A6;">exploratory tool</mark>, offering flexibility  

Requires careful design to balance usability and accuracy.

### <mark style="background: #04FF00A6;">Interactive Steering for Uncertainty</mark>

<mark style="background: #04FF00A6;">Zooming and Panning:</mark> Allow users to zoom into specific regions and pan across the plot to explore different areas in detail.  

<mark style="background: #04FF00A6;">Hover tooltips:</mark>
- Display additional information about data points when the user hovers over them
- E.g. Displaying confidence levels  

<mark style="background: #04FF00A6;">Filters to adjust visual:</mark> Allow users to filter the data dynamically by selecting categories or values within the plot, such as using sliders or dropdowns.  

Animated simulations to show variability  

<mark style="background: #04FF00A6;">Changing Plot Types Dynamically:</mark> Users can switch between different types of plots (e.g., from a scatter plot to a bar chart).

![[Pasted image 20260320192114.png]]

### <mark style="background: #04FF00A6;">Interactive Steering for Uncertainty</mark> 

<mark style="background: #04FF00A6;">Brush and Select Regions:</mark> Allow users to select regions of the plot by dragging a rectangle or selecting individual points, which can update other elements of the interface.  

<mark style="background: #04FF00A6;">Linked Views:</mark> Synchronise multiple plots so that interaction with one plot (e.g., selecting a region or data point) automatically updates the others.  

<mark style="background: #04FF00A6;">Real-Time Data Updates:</mark> Show how the plot changes as the underlying data is updated in real-time. This can be useful for showing live data or simulations.  

<mark style="background: #04FF00A6;">Creating Interactive Dashboards:</mark> Build dashboards where multiple interactive visualisations are displayed, and users can filter or interact with the data in various ways.

### <mark style="background: #04FF00A6;">Interactive Steering</mark> 

<mark style="background: #04FF00A6;">Benefits:</mark>  
- <mark style="background: #04FF00A6;">Enhanced Exploration and Discovery:</mark> Users can adjust parameters (e.g., time ranges, variable selections) to discover patterns that may not be obvious in static visuals.  
- <mark style="background: #04FF00A6;">Personalised Insights:</mark> Different users may have different analytical goals. Interactive steering allows them to focus on aspects most relevant to them.  
- <mark style="background: #04FF00A6;">Improved Understanding of Uncertainty and Sensitivity:</mark> By adjusting inputs, users can observe how sensitive results are to changes in assumptions or data, improving their grasp of uncertainty.  
- <mark style="background: #04FF00A6;">Supports Decision-Making:</mark> Interactive models let users simulate different scenarios, aiding strategic planning and forecasting

<mark style="background: #04FF00A6;">Drawbacks:</mark>
- <mark style="background: #04FF00A6;">Complexity and Cognitive Load:</mark> Too many interactive options can overwhelm users, making it harder to interpret results correctly.  
- <mark style="background: #04FF00A6;">Performance Issues:</mark> Real-time updates require efficient computation, which can be challenging with large datasets or complex models.  
- <mark style="background: #04FF00A6;">Risk of Misinterpretation:</mark> Users may unintentionally manipulate data in ways that lead to misleading conclusions if they don’t fully understand the interactions

### <mark style="background: #04FF00A6;">Interactive Maps</mark>

Interactive maps allow users to <mark style="background: #04FF00A6;">explore spatial data dynamically</mark> rather than viewing a static image.  

<mark style="background: #04FF00A6;">Users can:</mark> 
- <mark style="background: #04FF00A6;">Zoom</mark> into specific regions  
- <mark style="background: #04FF00A6;">Pan</mark> across geographic areas  
- <mark style="background: #04FF00A6;">Hover or click</mark> to reveal additional information  
- <mark style="background: #04FF00A6;">Filter or highlight</mark> particular locations  

This makes them particularly useful for large or complex spatial datasets.

### <mark style="background: #04FF00A6;">Interactive Maps</mark>

Interactive maps improve data exploration and communication.  

<mark style="background: #04FF00A6;">Key advantages:</mark>  
- <mark style="background: #04FF00A6;">Detail on demand:</mark> Users can inspect specific locations without overcrowding the visualisation.  
- <mark style="background: #04FF00A6;">Better engagement:</mark> Interaction encourages users to explore the data themselves.  
- <mark style="background: #04FF00A6;">Multiple variables:</mark> Tooltips or pop-ups can show additional variables beyond the main visual encoding.  
- <mark style="background: #04FF00A6;">Improved interpretation of uncertainty:</mark> Users can examine uncertainty measures (e.g., variability, confidence intervals) at specific locations.  

Interactive maps should <mark style="background: #04FF00A6;">enhance understanding</mark>, not simply add interaction.  

Effective designs allow users to <mark style="background: #04FF00A6;">explore spatial patterns while maintaining clarity</mark>.

### <mark style="background: #04FF00A6;">Design Guidelines</mark>

<mark style="background: #04FF00A6;">Use interaction for exploration:</mark>
- Interactive maps work best when users need to investigate patterns at multiple spatial scales.  
- Examples include:  
- exploring regional differences  
- identifying country-level details  
- examining outliers or unusual patterns  

<mark style="background: #04FF00A6;">Avoid overloading the map:</mark>
- Maps should still be clear and interpretable at first glance.  
- Good practice includes:  
- limiting the number of visual variables  
- using intuitive colour scales  
- providing clear legends and labels  

<mark style="background: #04FF00A6;">Provide meaningful tooltips:</mark>
- Hover or click interactions should reveal useful additional information, such as:  
- country name  
- underlying values (e.g., life expectancy, GDP)  
- uncertainty measures  
- This allows users to access detail on demand without cluttering the visualisation.  
- Represent uncertainty carefully  

<mark style="background: #04FF00A6;">Interactive maps can help communicate uncertainty by  
showing:</mark>
- confidence intervals  
- variability over time  
- data quality indicators  
- For example:  
- colour may represent the main value  
- transparency or additional indicators may represent uncertainty.

### <mark style="background: #04FF00A6;">Summary</mark>

<mark style="background: #04FF00A6;">Guidelines for Communicating Uncertainty:</mark>  
- Be transparent about data limitations
- Use intuitive and accessible visual encodings
- Avoid overloading the viewer with excessive uncertainty markers
- Tailor communication to the audience’s expertise level
- Reinforce uncertainty with contextual explanations

<mark style="background: #04FF00A6;">Common Pitfalls to Avoid:</mark>  
- Hiding or ignoring uncertainty
- Misleading precision in visualisations
- Overcomplicating graphics
- Inconsistent representation of uncertainty across visuals

### <mark style="background: #04FF00A6;">Key Takeaway</mark>

<mark style="background: #04FF00A6;">Uncertainty in data visualisation:</mark> deals with handling imperfections in the dataset.  

<mark style="background: #04FF00A6;">Visualising uncertainty:</mark> is about making that uncertainty visible and understandable for the audience.  

Different visual techniques communicate different types of uncertainty.  

<mark style="background: #04FF00A6;">Good visualisations should:</mark>  
- make uncertainty visible  
- avoid false precision  
- match the technique to the type of data.