![[Pasted image 20251023120255.png]]

![[Pasted image 20251023120306.png]]

### <mark style="background: #04FF00A6;">CUSTOMER DIMENSION</mark>
![[Pasted image 20251023120325.png]]

<mark style="background: #04FF00A6;">1. Consolidation / Entity Matching:</mark>  
- <mark style="background: #04FF00A6;">Rule defined:</mark> Assume same name = same customer.  
- Assign same surrogate key

![[Pasted image 20251023120410.png]]

<mark style="background: #04FF00A6;">2. .Assign Surrogate Keys:</mark>  
- This information is used for future load of new data, it is not temporary!

![[Pasted image 20251023120506.png]]

![[Pasted image 20251023120525.png]]

### <mark style="background: #04FF00A6;">DIMENSION ITEM</mark>

![[Pasted image 20251023120545.png]]

<mark style="background: #04FF00A6;">1. Consolidation / Entity Matching</mark>  
<mark style="background: #04FF00A6;">2. Assign surrogate keys</mark>

![[Pasted image 20251023120554.png]]
![[Pasted image 20251023120659.png]]

### <mark style="background: #04FF00A6;">DATE DIMENSION</mark>

  It can be pre-populated (the same for time dimension).

### <mark style="background: #04FF00A6;">FACT TABLE</mark>

![[Pasted image 20251023120746.png]]

<mark style="background: #04FF00A6;">Assign Surrogate Key:</mark>
1. Join the stage Fact Table with the Customer Stage Table to get the right Customer SK. <mark style="background: #04FF00A6;">Join on the CustID and the SourceDB</mark>.  
2. Join the stage Fact Table with the Item Stage Table to get the right Item SK. <mark style="background: #04FF00A6;">Join on the ItemID and the SourceDB</mark>. 
3. Join the stage Fact Table with the Date dimension to get the right DateSK. <mark style="background: #04FF00A6;">Join on the field Date of the stage Fact Table</mark>.  
4. <mark style="background: #04FF00A6;">Price</mark> is a derived field (Qty X Price). In the fact table it is called TotalPrice.

![[Pasted image 20251023120920.png]]

### <mark style="background: #04FF00A6;">WHAT HAPPENS WHEN THERE IS NEW DATA?</mark> 

HOW DOES IT GET LOADED INTO THE STAR SCHEMA?

![[Pasted image 20251023120948.png]]
![[Pasted image 20251023120958.png]]
![[Pasted image 20251023121009.png]]

### <mark style="background: #04FF00A6;">Changes in the Fact Table and Dimensions</mark>  

New facts are 99% appended in the fact table (very few exceptions)  

Dimensions change slower than the fact table.  

When a dimension is modified by an update, multiple strategies are possible (as discussed)