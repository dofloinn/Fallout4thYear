### <mark style="background: #04FF00A6;">Text as Data</mark> 

Unlike structured data, text is inherently unstructured and high-dimensional.

Every word is a potential feature, and meaning is context-dependent.

<mark style="background: #04FF00A6;">DOCUMENTS</mark>
- Articles, books and novels
- E-mails, web pages, blogs
- Tags, comments
- Computer programs, logs  

<mark style="background: #04FF00A6;">COLLECTIONS OF DOCUMENTS:</mark>
- Messages (e-mail, blogs, tags, comments)
- Social networks (personal profiles) 
- Academic collaborations (publications)  

### <mark style="background: #04FF00A6;">Why Visualise Text?</mark>

A way to make sense of large, complex, or abstract textual data.  

Text doesn't naturally lend itself to easy summarization or pattern recognition  

<mark style="background: #04FF00A6;">Visual methods help us:</mark>
- extract meaning  
- highlight structure  
- and connect insights across sources.

### <mark style="background: #04FF00A6;">Why Visualise Text?</mark>

<mark style="background: #04FF00A6;">Understanding:</mark> 
- Get the “gist” of a document  Raw text can be overwhelming. 
- Visualization helps surface the main themes, topics, or sentiments without reading every word.  

<mark style="background: #04FF00A6;">Grouping:</mark>
- Cluster for overview, classification or syntax checking
- Text can be grouped based on similarity in content, structure, or usage, revealing patterns not immediately obvious.  

<mark style="background: #04FF00A6;">Comparison:</mark> 
- Compare document collections, or inspect evolution of collection over time 
- Can uncover differences in tone, content, or focus. Over time, it reveals change.

<mark style="background: #04FF00A6;">Correlations:</mark>
- Compare patterns in text to those in other data, e.g., correlate with social network
- Text often complements other types of data—linking them reveals deeper insights.

### <mark style="background: #04FF00A6;">How do we represent text?</mark>  

RAW TEXT → TOKENISE → CLEAN → REDUCE → REPRESENT  

Raw text is messy - it often contains irrelevant information, inconsistent formats, or variations that can distort analysis

Pre-processing helps clean, standardise, and structure text so it becomes usable for further tasks like classification, clustering, or visualisation

### <mark style="background: #04FF00A6;">Tokenization</mark>

<mark style="background: #04FF00A6;">Tokenization:</mark>  
- Breaking text into smaller pieces—usually words, phrases, or sentences—called tokens.  
- Helps transform unstructured strings into structured units.  
- Enables word counts, frequency analysis, and feature extraction. 

<mark style="background: #04FF00A6;">Examples:</mark>  
- Sentence tokenisation:  
- "I love data science. It’s fascinating!" →  
- ["I love data science", "It’s fascinating!"]Word tokenization:"I love data science" →  
- ["I", "love", "data", "science"]

### <mark style="background: #04FF00A6;">Removing Stop Words</mark>

Filtering out common, uninformative words like the, is, in, and, etc. - These words appear frequently but don’t contribute meaningful insights.  

Removing them reduces noise and improves efficiency in models and visualizations.  

<mark style="background: #04FF00A6;">Custom stopwords:</mark> In some contexts, even domain-specific terms (e.g., “patient” in medical texts) might be considered stopwords if they appear in every document.

### <mark style="background: #04FF00A6;">Stop-Word Removal and Document Frequency</mark> 

<mark style="background: #04FF00A6;">Two common feature reduction techniques:</mark>
- <mark style="background: #04FF00A6;">Stop-word removal</mark> to remove the high frequency words  
- Achieved using a list of known stop words or TF-IDF  
- <mark style="background: #04FF00A6;">Document frequency</mark> to remove the low frequency words – remove terms that occur at most n times (1 <= n <= 3)  

These will typically reduce a feature set massively

Any set of words can be chosen as the stop words for a given purpose. For some search engines, these are some of the most common, short function words, such as the, is, at, which, and on.

![[Pasted image 20260330173837.png]]

![[Pasted image 20260330173844.png]]


### <mark style="background: #04FF00A6;">Example: Stop Word Removal</mark>

![[Pasted image 20260330173948.png]]
![[Pasted image 20260330173959.png]]

### <mark style="background: #04FF00A6;">Stemming and Lemmatisation</mark>  

Groups similar words under one root to reduce redundancy and improve model performance.  

<mark style="background: #04FF00A6;">Stemming:</mark> Cuts words down to their root form by chopping off endings. - E.g., running, runs, runner → run  

<mark style="background: #04FF00A6;">Lemmatisation:</mark> Smarter version of stemming  
- It reduces words to their base or dictionary form (lemma) while considering grammar and context.  
- E.g., better → good, running → run  
- Lemmatization is more accurate but requires more computational resources.  

<mark style="background: #04FF00A6;">Use Case:</mark> Improves clustering, topic modelling, and search matching by reducing vocabulary size and variance.

![[Pasted image 20260330174149.png]]

![[Pasted image 20260330174158.png]]

### <mark style="background: #04FF00A6;">Removing Special Characters</mark>

Stripping out punctuation, emojis, numbers, symbols, HTML tags, and other non-alphabetic characters.  
- These characters can interfere with tokenization and analysis.
- They rarely add meaning unless you're analyzing specific character use (e.g., emoji use in tweets or sentiment).  

<mark style="background: #04FF00A6;">Examples:</mark>
- "This is amazing!!! #blessed" →  
- "this is amazing blessed“  

Sometimes special characters are important (e.g., hashtags or mentions in social media). You might want to keep or extract them instead of removing.

### <mark style="background: #04FF00A6;">How to in R</mark> 

<mark style="background: #04FF00A6;">Tokenization:</mark> tokenizers, tidytext::unnest_tokens()  

<mark style="background: #04FF00A6;">Removing Stop Words:</mark> stop_words from tidytext, or you can create your own list.  

<mark style="background: #04FF00A6;">Stemming:</mark> SnowballC::wordStem()  

<mark style="background: #04FF00A6;">Lemmatization:</mark> textstem::lemmatize_words() (based on dictionary lookups)  

<mark style="background: #04FF00A6;">Removing Special Characters:</mark> stringr, tm::removePunctuation(), gsub() for custom regex patterns.

### <mark style="background: #04FF00A6;">How do we turn text into numbers?</mark>

SIMPLE → BOW, N-GRAMS  
BETTER → TF - IDF  
ADVANCED → EMBEDDINGS

### <mark style="background: #04FF00A6;">N-grams</mark>

An n-gram is a contiguous sequence of n items from a given sample of text or speech.  

Used to capture patterns, context, and structure in text by grouping consecutive words or characters together.  

A <mark style="background: #04FF00A6;">unigram</mark> is one word  

A <mark style="background: #04FF00A6;">bigram</mark> is a sequence of two words  

A <mark style="background: #04FF00A6;">trigram</mark> is a sequence of three words etc  

It is common to use more than one type of n-gram  

The items inside an n-gram may not have any relation between them apart from the fact that they appear next to each other in a piece of text.

### <mark style="background: #04FF00A6;">Example ngrams</mark>

![[Pasted image 20260330175815.png]]

### <mark style="background: #04FF00A6;">N-grams</mark>

The office building was demolished yesterday.  

<mark style="background: #04FF00A6;">Contains 5 bigrams:</mark>  
1. the office  
2. office building  
3. building was  
4. was demolished  
5. demolished yesterday

### <mark style="background: #04FF00A6;">Example</mark>

Google Books has ngram viewer, covering books from 1800 to 2012.  

When you enter keywords/phrases/authors into the Google Books Ngram Viewer, it displays a graph showing how those have occurred in a corpus of books  

https://books.google.com/ngrams/

![[Pasted image 20260330180251.png]]

### <mark style="background: #04FF00A6;">Bag of Words (BoW)</mark>

Documents in text visualisation are often represented using a feature-vector model - also called a <mark style="background: #04FF00A6;">Bag of Words</mark>

Commonly used way to represent text data for machine learning and natural language processing.  

Instead of trying to make sense of the meaning, BoW focuses only on the words themselves and how often they appear.  

<mark style="background: #04FF00A6;">Does not care about sentence structure, word order, or grammar:</mark> 
- Treats every sentence like a "bag" of words, meaning all words are mixed together.
- Only the frequency of words matters.  

You take all the unique words that appear in your dataset and make a list (a vocabulary).

![[Pasted image 20260330180427.png]]

Each sentence is now converted into a list of numbers based on how often each word appears.  

<mark style="background: #04FF00A6;">Example: If you have these two sentences:</mark>  
- "The cat sleeps on the mat.“  
- "The dog sleeps outside.“  
- The unique words (vocabulary) would be:["The", "cat", "sleeps", "on", "mat", "dog", "outside"]  

![[Pasted image 20260330180537.png]]

Each sentence has been converted into a list of numbers.  

These can now be uses for tasks like classifying text (e.g., detecting spam emails) or finding similar documents.

### <mark style="background: #04FF00A6;">Bag of Words – Problem</mark> 

Frequently used terms become dominant in the document and begin to represent the document

![[Pasted image 20260330180621.png]]

### <mark style="background: #04FF00A6;">BoW Problems for Visualisation</mark> 

No order  

No meaning  

Dominated by frequent words

### <mark style="background: #04FF00A6;">TF - IDF</mark>

<mark style="background: #04FF00A6;">Normalised values are used instead showing the relative frequency:</mark>

<mark style="background: #04FF00A6;">TF-IDF (Term Frequency (TF) - Inverse document frequency (IDF)):</mark>  
- Statistical measure used to evaluate how important a word is to a document in a collection or corpus  
- The importance increases proportionally to the number of times a word appears in the document but is offset by the frequency of the word in the corpus  
- Weights words so that rare but important ones (like "spaghetti" in a food review) get more attention.  

<mark style="background: #04FF00A6;">Think of it like this:</mark>
- Some words appear a lot everywhere → not useful (e.g. the, is, and)  
- Some words appear a lot in one document but not others → very useful  
- TF-IDF boosts important words and down weights common ones

<mark style="background: #04FF00A6;">Term Frequency (TF)</mark>
- How often a word appears in a document  
- 𝑇F = count of word in document/total words in document  

<mark style="background: #04FF00A6;">Inverse Document Frequency (IDF):</mark>
- How rare a word is across all documents  
- IDF = log(total number of documents/number of documents containing the word)
- Captures uniqueness across the corpus  

<mark style="background: #04FF00A6;">TF-IDF=TF×IDF</mark>
- A word gets a high score if:  
- It appears <mark style="background: #04FF00A6;">frequently in one document</mark>  
- But <mark style="background: #04FF00A6;">rarely across others</mark>

### <mark style="background: #04FF00A6;">Example</mark>

<mark style="background: #04FF00A6;">Documents:</mark> “data science is fun” ; “data analysis is important”  

<mark style="background: #04FF00A6;">Step 1: TF</mark>  
- “data” appears in both → high TF
- “science” appears once → moderate TF  

<mark style="background: #04FF00A6;">Step 2: IDF</mark>
- “data” appears in all documents → low IDF
- “science” appears in one document → high IDF  

<mark style="background: #04FF00A6;">Result:</mark>
- “data” → low TF-IDF (not informative)
- “science” → high TF-IDF (important)

### <mark style="background: #04FF00A6;">TF - IDF</mark>

<mark style="background: #04FF00A6;">Why This Matters for Visualisation:</mark>
- TF-IDF helps you: Identify meaningful words
- <mark style="background: #04FF00A6;">Instead of:</mark> “the”, “is”, “and”
- <mark style="background: #04FF00A6;">You get:</mark> “inflation”, “climate”, “migration”

### <mark style="background: #04FF00A6;">Semantic Networks</mark>

Type of data representation incorporating linguistic information that describes concepts or objects and the relationship or dependency between them.  

Attempt to illustrate the semantic relationship between words

![[Pasted image 20260330181255.png]]

![[Pasted image 20260330181308.png]]

![[Pasted image 20260330181316.png]]

### <mark style="background: #04FF00A6;">Word Embeddings</mark>

Unsupervised technique  

Maps words or phrases from a text to a corresponding vector of real numbers  

Builds a low dimensional continuous vector space from a high dimensional space (one dimension per word)  

The vector space preserves the contextual similarity of words, therefore words that appear regularly together in text will also appear together in the vector space

![[Pasted image 20260330181349.png]]

### <mark style="background: #04FF00A6;">Word Embeddings</mark>

![[Pasted image 20260330181408.png]]

![[Pasted image 20260330181417.png]]

Each point represents a word from your text corpus  

<mark style="background: #04FF00A6;">Spatial distance between points reflects semantic similarity:</mark>  
- Words that appear in similar contexts (i.e., co-occur with the same neighbours in the text) will be closer together in the plot.
- Words used in different contexts will be farther apart.

<table>
	<tr>
		<td>Method</td>
		<td>What it captures</td>
	  </tr>
	  <tr>
		<td>BoW</td>
		<td>Frequency</td>
	  </tr>
	  <tr>
		<td>TF-IDF</td>
		<td>Importance</td>
	  </tr>
	  <tr>
		<td>Embeddings</td>
		<td>Meaning</td>
	</tr>
</table>


### <mark style="background: #04FF00A6;">Single Document Visualisations</mark> 

<mark style="background: #04FF00A6;">Purpose:</mark> Quickly give readers a sense of the contents of a document without reading it.  

There is lots of debate about whether or not this is a sensible thing to do!

### <mark style="background: #04FF00A6;">Word Clouds</mark>

Word clouds are probably the most common single document visualisation tool  

<mark style="background: #04FF00A6;">The important things to consider in developing word clouds:</mark>
- What words will be displayed?  
- How will words be scaled?  
- How will the sizes be normalised?  
- What ordering of words is used?  
- How do we measure overlaps/collisions?

<mark style="background: #04FF00A6;">Word Cloud Challenges</mark>  
1. Semantics – syntactic  
2. Context  
3. Comparison  
4. What is the relationship between the words?

### <mark style="background: #04FF00A6;">Word Clouds</mark>

Word cloud of Tea Party feelings about Obama  

Largest words are  

![[Pasted image 20260330182248.png]]

Stop word removal effect  

I really don’t like Obama’s policy on gun control  

I like nothing about ...  

He is not like ...

<mark style="background: #04FF00A6;">Three speeches – what are they about?</mark>
![[Pasted image 20260330182349.png]]

<mark style="background: #04FF00A6;">When are they OK?</mark>
- Quick overview  
- Engagement  

<mark style="background: #04FF00A6;">When are they NOT OK?</mark>  
- Comparison  
- Precision  
- Insight

### <mark style="background: #04FF00A6;">Semantic Networks</mark>

Semantic Networks address some of the challenges of a wordle  

Semantic Networks attempt to illustrate the semantics – or meaning – of text based on the relationship of words in a traditional thesaurus (Wordnet)

### <mark style="background: #04FF00A6;">Word Trees</mark>

A word tree places a tree structure onto the words that follow a particular search term, and uses that structure to arrange those words spatially  

Interactions are key in allowing the viewer to explore relationships

Words are scaled according to frequency - similarly to word clouds  

The data structure used is a suffix tree, which has been common in computer science string-processing for decades

### <mark style="background: #04FF00A6;">Sample word tree from a set of</mark>

![[Pasted image 20260330182556.png]]

### <mark style="background: #04FF00A6;">Multiple Document Visualisations</mark>

Visualising document collections is not particularly well standardised  

<mark style="background: #04FF00A6;">We can split approaches into two groups:</mark>
- Visualising connections/differences between documents 
- Visualising change in a document

### <mark style="background: #04FF00A6;">Visualising Connections Between Documents</mark>

Collections of documents can be seen as a network  

All network visualization approaches can also be applied to collections of documents  

The real challenge is finding the most appropriate document representation for the task  

This, however, is a NLP challenge not a visualisation one

### <mark style="background: #04FF00A6;">Connections - Dendrograms</mark>

![[Pasted image 20260330182701.png]]

### <mark style="background: #04FF00A6;">Connections - Plagiarism Detection</mark>

Visualising distances between documents

![[Pasted image 20260330182730.png]]

### <mark style="background: #04FF00A6;">Visualising Conversations</mark>

<mark style="background: #04FF00A6;">Many dimensions to consider:</mark>  
- Who (senders, receivers)  
- What (the content of communication)  
- When (temporal patterns)  

<mark style="background: #04FF00A6;">Interesting cross-products:</mark>  
- What x When -> Topic “Zeitgeist”  
- Who x Who -> Social network  
- Who x Who x What x When -> Information flow

### <mark style="background: #04FF00A6;">Conclusions</mark>

Visualizing text seems like a sensible idea, but can be quite tricky.  
- Text must be transformed before visualising  
- Representation determines insight  
- Simple visuals can mislead  
- Design decisions matter  

The main problem working with texts is document representation and feature extraction.

### <mark style="background: #04FF00A6;">Useful tools</mark>

https://voyant-tools.org/
https://www.rawgraphs.io/