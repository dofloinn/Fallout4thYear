<mark style="background: #04FF00A6;">Module Focus Visualisation can:</mark>  
- Improve understanding, memory and decision making. 
- Engage more diverse audiences in exploration and analysis.  

<mark style="background: #04FF00A6;">We must:</mark> create effective and engaging visualisations that are appropriate to the data.  

Heer, J., Bostock, M., & Ogievetsky, V. (2010). A tour through the visualisation zoo. Communications of the ACM, 53(6), 59-67.

### <mark style="background: #04FF00A6;">Data Visualisation as Storytelling</mark>  

Important stories live within our data.  

Data visualisation is a powerful tool to uncover and communicate these stories  

<mark style="background: #04FF00A6;">Data is abstract:</mark> It represents numbers, trends, and relationships.  

By <mark style="background: #04FF00A6;">translating data into visual elements</mark> (e.g., charts, graphs, and maps), we bring abstract concepts to life.

![[Pasted image 20260204160327.png]]

Effective data storytelling requires an understanding of visual perception and design principles to ensure clarity and impact.  

<mark style="background: #04FF00A6;">The goal:</mark>  
- Turn data into a compelling story.
- Clarity, accuracy, and engagement

### <mark style="background: #04FF00A6;">To make data meaningful, we must give it form through visualisation</mark> 

<mark style="background: #04FF00A6;">Data visualisation uses visual attributes such as:</mark>  
- Position (where a data point is placed)  
- Length (bar charts showing comparisons)  
- Size (bubble charts representing magnitude)  
- Shape (symbols conveying different categories)  
- Colour (highlighting patterns or differences)  

These attributes help audiences process complex data quickly and intuitively.  

These are encoding channels

Following design principles grounded in human perception enhances comprehension.  

Before we think about perception and memory, we need to think about how data itself constrains design.

### <mark style="background: #04FF00A6;">Data Type Shapes Visualisation Choices</mark>

<table>
	<tr>
		<th>Scale</th>
		<th>What it tells us</th>
		<th>Examples</th>
		<th>What we can do visually</th>
	</tr>
	<tr>
		<th>Nominal</th> 
		<td>Categories, no order</td>
		<td>Streaming service, Genre</td>
		<td>Compare categories, count</td>
	</tr>
	<tr>
		<th>Ordinal</th>
		<td>Ordered categories</td>
		<td>Likert scale, ratings (low–high)</td>
		<td>Rank, compare order</td>
	</tr>
	<tr>
		<th>Interval</th>
		<td>Equal spacing, no true zero</td>
		<td>Anxiety score (0–10), temperature</td>
		<td>Compare differences</td>
	</tr>
	<tr> 
		<th>Ratio</th>
		<td>Equal spacing + true zero</td>
		<td>Hours listened, number of songs</td>
		<td>Compare ratios & magnitude</td>
	</tr>
</table>

"Not all data deserves the same visual treatment"

Categorisation is a form of encoding - it reduces cognitive effort before perception even begins.

### <mark style="background: #04FF00A6;">Short Glossary of Terms</mark>  

<mark style="background: #04FF00A6;">Data Dimension:</mark> One channel of data  

<mark style="background: #04FF00A6;">Visual Property:</mark> A characteristic that you can see (e.g. colour, size, location, thickness, and line weight)  

<mark style="background: #04FF00A6;">Encoding:</mark> The visual property applied to a dimension of data that encodes the information into a visual medium for decoding by the reader

“Designing Data visualisations”, N. Iliinsky & J. Steele, O'Reilly Media, 2011

### <mark style="background: #04FF00A6;">Encoding economy</mark>

Use the fewest visual encodings necessary to communicate the message clearly.  

Every visual encoding (colour, size, shape, texture, position) demands attention and memory.  

If an encoding does <mark style="background: #04FF00A6;">not add new information</mark>, it should not be used.

### <mark style="background: #04FF00A6;">Example</mark>

Already have height of the bars  

Why do we need the colours?

![[Pasted image 20260204161635.png]]

Encoding should add meaning, not decoration

![[Pasted image 20260204161835.png]]

### <mark style="background: #04FF00A6;">Memory, Attention and  Cognitive Limits</mark>

![[Pasted image 20260204161903.png]]

### <mark style="background: #04FF00A6;">Memory</mark>

![[Pasted image 20260204161940.png]]

Memory can be compared to a computer-based information system  

Set of processes used to encode, store, and retrieve  
information over different periods of time.  

<mark style="background: #04FF00A6;">Encoding:</mark>
- Input of information into the memory system.  
- We receive sensory information from the environment  
- Our brains label or code it.  
- We organise the information with other similar information and connect new concepts to existing concepts.  
- <mark style="background: #04FF00A6;">automatic processing:</mark> usually done without any conscious awareness  
- <mark style="background: #04FF00A6;">effortful processing:</mark> requires work and effort on your part

### <mark style="background: #04FF00A6;">Types of encoding</mark>

Encoding of words and their meaning  

We tend to organise and categorise to assist  

Dog, cat, horse → “animals”  

Instead of remembering three separate words, we store them as members of a single semantic category.  

Apple, banana, orange → “fruit”  

The shared meaning helps with faster recall and recognition.  

Chair, table, sofa → “furniture”  

Meaning-based grouping is much easier to remember than a random list of objects.

### <mark style="background: #04FF00A6;">Types of encoding - Visual</mark>

Encoding as images  

<mark style="background: #04FF00A6;">Consider the list:</mark>  
- Car  
- Level  
- Dog  
- Truth  
- Book  
- Value.  

Which do you think you would find easiest to remember?  

Why?

### <mark style="background: #04FF00A6;">Types of encoding - Acoustic</mark>

Encoding of sounds (words in particular)  

Remembering someone’s name by how it sounds  - “Kate rhymes with late.”  

Phone numbers repeated out loud  

Saying “zero eight seven...” helps retention more than just seeing the digits.  

Mishearing similar-sounding words  

Confusing “there” and “their” shows sound-based processing.  

Can you remember some rhymes you were taught as children to learn things? - E.g. days in each month?  

<mark style="background: #04FF00A6;">Rhymes and songs:</mark> Alphabet song, nursery rhymes, or learning rules through jingles.  

<mark style="background: #04FF00A6;">Poetry and rap lyrics:</mark> Rhyme, rhythm, and meter strengthen memory through sound patterns.  

<mark style="background: #04FF00A6;">Reading new words aloud:</mark> Sounding out unfamiliar words supports recall.

### <mark style="background: #04FF00A6;">Memory</mark>

<mark style="background: #04FF00A6;">Storage:</mark>
- Creation of a permanent record of information  
- Atkinson and Shiffrin (1968) (A-S model)  

<mark style="background: #04FF00A6;">Information has to pass through distinct stages:</mark>
- <mark style="background: #04FF00A6;">Sensory</mark> Memory,  
- <mark style="background: #04FF00A6;">Working</mark> Memory  
- <mark style="background: #04FF00A6;">Short-Term</mark> Memory,  
- and finally <mark style="background: #04FF00A6;">Long-Term</mark> Memory.

<mark style="background: #04FF00A6;">Retrieval:</mark> Act of getting information out of memory storage and back into conscious awareness  

<mark style="background: #04FF00A6;">Recall:</mark> What we most often think about when we talk about memory retrieval:  
- You can access information without cues.

<mark style="background: #04FF00A6;">Recognition:</mark>
- Happens when you identify information that you have previously learned after encountering it again.  
- Involves a process of comparison  

<mark style="background: #04FF00A6;">Relearning:</mark> Learning information that you previously learned (but it will be quicker and easier second time around)

### <mark style="background: #04FF00A6;">Where are your eyes drawn?</mark>

![[Pasted image 20260204162751.png]]

![[Pasted image 20260204162803.png]]

![[Pasted image 20260204162818.png]]

### <mark style="background: #04FF00A6;">What is Human Visual Perception?</mark>  

<mark style="background: #04FF00A6;">Perceptions vary depending on the stimulus:</mark>  
- They are <mark style="background: #04FF00A6;">interpreted</mark>, allowing the brain to extract knowledge
- The act of thinking, processing and making comparisons is known as <mark style="background: #04FF00A6;">cognition</mark> and is much <mark style="background: #04FF00A6;">slower and less efficient</mark>  

This continuous flow of sensations generates what it is known as perception

### <mark style="background: #04FF00A6;">Human Memory and Visualisation</mark>

<mark style="background: #04FF00A6;">Types of memories that process information in our brain:</mark>  
1. Sensory memory or Iconic Memory  
2. Working Memory - Which includes Short Term Memory  
3. Long Term memory

![[Pasted image 20260204162956.png]]

Visual information does not automatically go to long-term memory  

It requires attention, processing, and encoding.  

First goes to <mark style="background: #04FF00A6;">Sensory (Iconic) memory</mark>  
- Holds images for a fraction of a second (around 250–500 milliseconds).  
- Most of this information is discarded unless it receives attention.

### <mark style="background: #04FF00A6;">Mental Health and Music</mark>

![[Pasted image 20260204163319.png]]![[Pasted image 20260204163332.png]]

### <mark style="background: #04FF00A6;">Human Memory and Visualisation</mark>

<mark style="background: #04FF00A6;">Short term memory</mark> has a limited capacity (about 7±2 items) 

And a short duration (around 15–30 seconds).

<mark style="background: #04FF00A6;">Rehearsal</mark> is essential to keep information active in Short term memory and to transfer it to Long term memory.  

<mark style="background: #04FF00A6;">Maintenance Rehearsal (Shallow Processing):</mark> 
- Involves simple repetition of information (e.g., repeating a phone number over and over).  
- Keeps information in short term memory but does not necessarily lead to long-term retention.

<mark style="background: #04FF00A6;">Elaborative Rehearsal (Deep Processing)</mark>
- Involves linking new information to existing knowledge or giving it meaning (e.g., associating a new name with a known person).  
- Enhances encoding into long-term memory

<mark style="background: #04FF00A6;">To transfer visual information into long-term memory, it must undergo encoding, which involves processes like:</mark> 
- Repetition (rehearsing the information)  
- Elaboration (connecting it to existing knowledge)  
- Emotional Impact (strong emotions enhance memory storage)  
- Visual Imagery (creating mental images or associating with known images)  
- Occurs mainly in the hippocampus and other brain regions.

![[Pasted image 20260204163758.png]]

![[Pasted image 20260204163813.png]]

![[Pasted image 20260204163833.png]]

### <mark style="background: #04FF00A6;">Cognitive Load</mark>

![[Pasted image 20260204164355.png]]

The amount of mental effort required to process and understand information.  

<mark style="background: #04FF00A6;">It comes from Cognitive Load Theory (CLT) and is divided into three types:</mark>
- <mark style="background: #04FF00A6;">Intrinsic Load:</mark> The inherent difficulty of the task or information  
- <mark style="background: #04FF00A6;">Extraneous Load:</mark> Unnecessary complexity that distracts from learning.  
- <mark style="background: #04FF00A6;">Germane Load:</mark> The effort used to integrate new information into existing knowledge.

Data visualisation shifts the balance between perception and cognition to take fuller advantage of the brain's abilities.  

<mark style="background: #04FF00A6;">Well-designed visualisations:</mark>  
- Simplify complex data  
- Making it easier to process and understand patterns  
- Reducing intrinsic cognitive load

Data visualisation shifts the balance between perception and cognition to take fuller advantage of the brain's abilities.  

<mark style="background: #04FF00A6;">Well-designed visualisations:</mark>  
- Simplify complex data  
- Making it easier to process and understand patterns (reducing intrinsic cognitive load)  

<mark style="background: #04FF00A6;">Effective visualisations:</mark>
- Help viewers focus on meaningful insights  
- Enhancing germane load  
- e.g., clear labels, appropriate chart types, minimal distractions

<mark style="background: #04FF00A6;">Poorly designed visuals:</mark> 
- can overwhelm users, making data harder to interpret  
- e.g., cluttered charts, excessive colours, misleading scales  
- Increasing extraneous cognitive load

### <mark style="background: #04FF00A6;">Visual Perception and Data Visualisation</mark> 

Visual perception is selective  

Our eyes are drawn to familiar patterns  

Our working memory is very limited  

We want more visual perception and less cognition

![[Pasted image 20260204164825.png]]

### <mark style="background: #04FF00A6;">Artificial Intelligence: NLP</mark>

![[Pasted image 20260204164847.png]]

![[Pasted image 20260204164859.png]]

(6 Fs, three "of"s in pic)

![[Pasted image 20260204164907.png]]

(no letter E)

![[Pasted image 20260204164952.png]]

![[Pasted image 20260204165001.png]]

![[Pasted image 20260204165019.png]]

### <mark style="background: #04FF00A6;">Categorisation: Why we visualise</mark>

<mark style="background: #04FF00A6;">Categorisation Example:</mark> 
- What does this table do well?  
- What does it not do?

![[Pasted image 20260204165104.png]]

<mark style="background: #04FF00A6;">What does this table do well:</mark>
- Expresses these sales values precisely  
- Provides an efficient means to look up values for a particular region and month  

<mark style="background: #04FF00A6;">What does it not do:</mark>  
- Easily identify patterns, trends, or exceptions  
- Get a sense of the story contained in these numbers  
- Compare whole sets of numbers rather than two at a time



What does this allow us to do more easily?

What does it not do?

![[Pasted image 20260204165218.png]]

### <mark style="background: #04FF00A6;">What does this allow us to do more easily</mark>

<mark style="background: #04FF00A6;">Identify patterns and trends + compare whole sets of numbers:</mark>
- Domestic sales were considerably and consistently higher than international.  
- Domestic sales trended upward over the year as a whole.  
- International sales, in contrast, remained relatively flat, with one glaring exception: they decreased sharply in August.  

<mark style="background: #04FF00A6;">Get a sense of the story:</mark>
- Domestic sales exhibited a cyclical pattern (up, down, up, down, up, down...)  
- Pattern repeated itself on a quarterly basis, always reaching the peak in the last month of the quarter  
- Sales decline in the first month of the next quarter  

<mark style="background: #04FF00A6;">What does it not do?</mark>

### <mark style="background: #04FF00A6;">Categorisation – Why visualise?</mark>  

Help identify patterns, trends, and outliers across categories.  

Simplify complex data for better understanding and  
decision-making.  

Crucial for comparisons and highlighting differences between groups.

### <mark style="background: #04FF00A6;">Types</mark>

<mark style="background: #04FF00A6;">Bar Charts:</mark>  
- Best for comparing quantities across categories.  
- Example: Comparing sales by product type.  

<mark style="background: #04FF00A6;">Pie Charts:</mark>
- Useful for showing proportions.  
- Example: Market share by company.  

<mark style="background: #04FF00A6;">Stacked Bar Charts:</mark>
- Great for showing parts of a whole over categories.  
- Example: Demographic breakdown of survey respondents.  

<mark style="background: #04FF00A6;">Treemaps:</mark>
- Good for visualising hierarchical data.  
- Example: Budget allocation by department.  

<mark style="background: #04FF00A6;">Heatmaps:</mark>
- Ideal for showing intensity or density.  
- Example: Customer satisfaction ratings by region and product.  

<mark style="background: #04FF00A6;">BoxPlots:</mark>
- Used to compare the distribution of numerical data across categories (statistical)  
- Helps in understanding spread, variability, and outliers in data grouped by categories.  
- <mark style="background: #04FF00A6;">Example:</mark> Monthly product sales by region.

### <mark style="background: #04FF00A6;">Data variability</mark>

Refers to the degree of difference or spread in the data values along that dimension.

Informs how to best represent the data visually, ensuring that the patterns and insights are clearly conveyed to the audience.

<mark style="background: #04FF00A6;">Dimensions with high variability:</mark> Benefit from representations that emphasize detail and range (e.g., scatter plots, box plots).  

<mark style="background: #04FF00A6;">Dimensions with low variability:</mark> May require aggregation or simplification for clarity (e.g., bar charts or pie charts).  

### <mark style="background: #04FF00A6;">Summarising Data</mark>

Humans are very good at detecting patterns when visual information is structured, but very poor at doing so when faced with:  
- too many individual data points  
- overlapping marks  
- competing colours  

Grouping data transforms the data from many individual responses into meaningful summaries that the visual system can process efficiently.  

<mark style="background: #04FF00A6;">This directly supports:</mark> 
- <mark style="background: #04FF00A6;">Selective attention:</mark> fewer competing marks 
- <mark style="background: #04FF00A6;">Working memory limits:</mark> fewer items to track
- <mark style="background: #04FF00A6;">Pattern recognition:</mark> noise is reduced, signal remains

### <mark style="background: #04FF00A6;">Encoding and Categorisation:</mark>  

<mark style="background: #04FF00A6;">Semantic encoding explains why categorical visuals are so effective:</mark>
- Grouped bars, colours, or sections align with how memory works  
- Legends that reflect meaningful categories are easier to interpret  
- Poorly chosen categories increase cognitive load and confusion

### <mark style="background: #04FF00A6;">Visual Encoding</mark>

<mark style="background: #04FF00A6;">Visual encoding is powerful:</mark>
- Facilitates parallel processing → fast interpretation  
- Reduces working memory load  
- Supports pattern recognition (trends, clusters, outliers) 

<mark style="background: #04FF00A6;">But also:</mark>  
- Some visual encodings are <mark style="background: #04FF00A6;">stronger than others</mark>  
- Position > length > area > colour (for accuracy)  
- Too many encodings at once → overload

### <mark style="background: #04FF00A6;">Encoding</mark>

Good visuals match encoding strength to the task  

Bad visuals force users to decode weak or ambiguous signals  

Effective categorisation relies on clear visual grouping  

Effective visualisations work because they align visual encoding with semantic encoding — and minimise reliance on acoustic encoding.

### <mark style="background: #04FF00A6;">Creating Visualisations for Categorisation</mark>  

<mark style="background: #04FF00A6;">Colour Choices:</mark>
- Use contrasting colours to differentiate categories.  
- Avoid using too many colours (limit to a colour palette).  

<mark style="background: #04FF00A6;">Labels:</mark>
- Always label axes and data points where appropriate.  
- Use legends effectively to explain colours or patterns.  

<mark style="background: #04FF00A6;">Order:</mark> Arrange categories logically (e.g., alphabetically, by size, or chronologically).

### <mark style="background: #04FF00A6;">Pitfalls to Avoid</mark>

<mark style="background: #04FF00A6;">Overloading with Data:</mark> Avoid too many categories or data points.  

<mark style="background: #04FF00A6;">Using the Wrong Chart Type:</mark> Don’t use pie charts for data that isn’t proportional.  

<mark style="background: #04FF00A6;">Distorting the Scale:</mark> Use consistent and meaningful scales.  

<mark style="background: #04FF00A6;">Overusing Colours:</mark> Stick to a palette and avoid unnecessary complexity.  

<mark style="background: #04FF00A6;">Missing Context:</mark> Always include legends, titles, and data sources

### <mark style="background: #04FF00A6;">Chunking</mark>

![[Pasted image 20260204170313.png]]

![[Pasted image 20260204170321.png]]

### <mark style="background: #04FF00A6;">Chunking in Visualisation</mark>

When we look at a visual, we can process much more information than when looking at the data in a table.  

<mark style="background: #04FF00A6;">Concept of Small Multiples:</mark>
- Involves displaying a series of similar graphs or charts using the same scale and axes, allowing for easy comparison across different partitions of a dataset.  
- By presenting data in this segmented manner, viewers can more readily identify patterns and differences without being overwhelmed by a single, complex visualisation.  
- The term was popularized by Edward Tufte, who emphasised its effectiveness in handling multivariate data

![[Pasted image 20260204170431.png]]

<mark style="background: #04FF00A6;">Concept of Small Multiples:</mark> By showing sales for each country side-by-side using the same scale and axes it allows for quick visual comparison between regions, facilitating the detection of trends and anomalies.

![[Pasted image 20260204170509.png]]

### <mark style="background: #04FF00A6;">Stacked Bar Chart</mark>

![[Pasted image 20260204170601.png]]

### <mark style="background: #04FF00A6;">Facted Bar Chart</mark>

![[Pasted image 20260204170621.png]]

### <mark style="background: #04FF00A6;">Variability of a data dimension</mark>

Quantitative variability  

Integers vary discretely (precise measurement)  

Categorical Variability  

Categories are finite

![[Pasted image 20260204170738.png]]

### <mark style="background: #04FF00A6;">Example - High Variability in Quantitative Data</mark>

Dataset:  

<mark style="background: #04FF00A6;">Monthly sales for five regions:</mark>  
- Region A: [120, 230, 450, 300, 500]  
- Region B: [100, 90, 110, 120, 115]  
- Region C: [600, 700, 750, 800, 950]  

<mark style="background: #04FF00A6;">Visualisation:</mark>  
- Box Plot  
- Highlights the range of sales values for each region, showing variability through quartiles and outliers.  
- This is effective when values differ significantly across groups.

![[Pasted image 20260204170832.png]]

### <mark style="background: #04FF00A6;">Example - Low Variability in Quantitative Data</mark>  

<mark style="background: #04FF00A6;">Dataset:</mark>  
- Average satisfaction scores (out of 10) for five regions:
- Region A: [8.3, 8.5, 8.4, 8.6, 8.5]  
- Region B: [8.7, 8.6, 8.5, 8.8, 8.6]  
- Region C: [8.4, 8.5, 8.5, 8.5, 8.6]  

<mark style="background: #04FF00A6;">Visualisation:</mark>  
- Bar Chart  
- With such minimal variability, a bar chart displaying the average score for each region is more suitable, as it simplifies the data and emphasizes the slight differences.

![[Pasted image 20260204170928.png]]

### <mark style="background: #04FF00A6;">Example - High Variability in Categorical Data</mark> 

Dataset:  

![[Pasted image 20260204171157.png]]

<mark style="background: #04FF00A6;">Number of product sales per category:</mark>
- Electronics: 1000  
- Furniture: 150  
- Clothing: 1200  
- Food: 800  

<mark style="background: #04FF00A6;">Visualisation:</mark>  
- Treemap  
- A treemap is effective for high variability in categorical data, allowing the viewer to compare the relative sizes of categories intuitively.  
- Categories with larger sales stand out visually

### <mark style="background: #04FF00A6;">Example - Low Variability in Categorical Data</mark>

Dataset:  

<mark style="background: #04FF00A6;">Customer satisfaction levels (percentages):</mark>
- Very Satisfied: 30%  
- Satisfied: 32%  
- Neutral: 28%  
- Dissatisfied: 5%  
- Very Dissatisfied: 5%  

<mark style="background: #04FF00A6;">Visualisation:</mark>
- Stacked Bar Chart or Pie Chart  
- With low variability, a pie chart or a stacked bar chart effectively shows proportions without overwhelming the viewer.  
- Categories are easier to interpret when grouped.

![[Pasted image 20260204171232.png]]

### <mark style="background: #04FF00A6;">Guidelines for charts</mark>

Do not provide more data than the brain can process  

Display the visual on a single location, so we can see it without having to scroll or bounce back and forth between multiple locations

<mark style="background: #04FF00A6;">Aim for easy interpretation:</mark> 
- Follow design principles
- Derived from an understanding of human perception  

In order to create effective visualisations we must understand perception

### <mark style="background: #04FF00A6;">Complexity</mark>  

How many different data dimensions are represented?  

How many discrete types of information are visually encoded?  
  
Here, we have price of company stock on different days.... for 2 companies... adding trading volume per day.

![[Pasted image 20260204171356.png]]

![[Pasted image 20260204171408.png]]

For example, a simple line graph may show the number of muffins sold on different days of the week - 2 data dimensions

![[Pasted image 20260204171439.png]]

Cycle Plot – Days of the Week mapped over 10 weeks:

![[Pasted image 20260204171503.png]]

<mark style="background: #04FF00A6;">As visualisations become more complex:</mark>  
- They are more challenging to design well  
- Can be more difficult to learn from  

For that reason, visualisations with no more than 3 or 4 dimensions of data are the most common  

Visualisations with six, seven, or more dimensions can be found but may be more difficult to read.

<mark style="background: #04FF00A6;">Challenges in designing complex visualisations:</mark>  
- More dimensions => more encoding, => more individual visual properties  
- Few well-known conventions, metaphors, defaults, and best practices to rely on  
- There is more of a burden on the designer to make good choices that can be easily understood by the reader  

However, there are smart ways to think about and represent the data

### <mark style="background: #04FF00A6;">As you design visualisations, consider</mark>

You are aiming to <mark style="background: #04FF00A6;">communicate a specific insight or story</mark> to an audience.  

<mark style="background: #04FF00A6;">Design mindset:</mark> “What do I want the viewer to notice first?”

### <mark style="background: #04FF00A6;">The Designer-Reader-Data Trinity</mark>

![[Pasted image 20260204171733.png]]

![[Pasted image 20260204171742.png]]

Three-legged stool - designer, the reader, and the data  

Each leg contributes a separate perspective, that must be taken into consideration for a visualisation to be stable and successful  

Each leg has a unique relationship to the other two  

While we need to consider each perspective, the dominant relationship should determine which category of visualisation is needed

![[Pasted image 20260205102153.png]]

### <mark style="background: #04FF00A6;">Informative</mark>

An informative visualisation primarily serves the relationship between the reader and the data.  

It aims for a neutral presentation of the facts in such a way that will educate the reader (though not necessarily persuade him).  

Informative visualisations are often associated with broad data sets, and seek to distil the content into a manageably consumable form.

### <mark style="background: #04FF00A6;">Google’s Share Price</mark>

![[Pasted image 20260205102351.png]]

### <mark style="background: #04FF00A6;">Persuasive</mark>  

Persuasive visualisations serve the relationship between the designer and the reader.  

It is useful when the designer wishes to change the reader’s mind about something.  

The data represented is specifically chosen to support the designer’s point of view, and is presented carefully so as to convince the reader of same.

![[Pasted image 20260205102431.png]]

### <mark style="background: #04FF00A6;">Fox News Warning!!</mark>  

Fox news published this chart to show what would happen to the top tax rates if George Bush’s tax cuts were to expire..

![[Pasted image 20260205102504.png]]

![[Pasted image 20260205102517.png]]

### <mark style="background: #04FF00A6;">Visual Art</mark>

This category primarily serves the relationship between the designer and the data.  

Visual art is unlike the previous two categories in that it often entails unidirectional encoding of information, meaning that the reader may not be able to decode the visual presentation to understand the underlying information.  

The designer may intend only to condense it, translate it into a new medium, or make it beautiful; she may not intend for the reader to be able to extract anything from it other than enjoyment.

### <mark style="background: #04FF00A6;">Flight Patterns, Aaron Koblin</mark>

![[Pasted image 20260205102613.png]]

### <mark style="background: #04FF00A6;">Facebook Visualised</mark>

![[Pasted image 20260205102632.png]]

### <mark style="background: #04FF00A6;">Why Visualisation Design Matters</mark>

Visualisation succeeds only if it aligns with human perception and memory.  

Poor design increases cognitive load and hides insight.  

Good design supports perception, memory, and comparison.

<mark style="background: #04FF00A6;">Visual attributes:</mark> how we encode data  

<mark style="background: #04FF00A6;">Measurement scales:</mark> what the data allows  

<mark style="background: #04FF00A6;">Encoding economy:</mark> how much encoding we should use  

<mark style="background: #04FF00A6;">Memory & attention:</mark> what happens when we ignore this

### <mark style="background: #04FF00A6;">In the labs this week</mark> 

Work with data to select, filter and reshape  

Design suitable categorisation visuals  

Working with both the Mental Health and Music dataset and a new Spotify dataset

### <mark style="background: #04FF00A6;">1st Continuous Assessment</mark>  

Assessment (Must be complete by 5pm Week 3 – February 13th )  

Short quiz based on this lecture plus lab – using Lockdown Browser  

<mark style="background: #04FF00A6;">Demo to a TA:</mark>
- Lab work set in Week 2  
- February 6 th  
- Will require you to make adjustments on the fly to selected charts