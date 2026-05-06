```R
# Set CRAN mirror
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Function to quietly install and load packages
quiet_library <- function(pkg) {
  suppressMessages(suppressWarnings({
    if (!requireNamespace(pkg, quietly = TRUE)) {
      install.packages(pkg, dependencies = TRUE, quiet = TRUE)
    }
    library(pkg, character.only = TRUE)
  }))
}

quiet_library("tidyverse")
quiet_library("sf")
quiet_library("viridis")
quiet_library("classInt")
quiet_library("ggspatial")
quiet_library("rnaturalearth")
quiet_library("rnaturalearthdata")
quiet_library("rmapshaper")
quiet_library("cartogram")
quiet_library("tmap")
```

```R
# Load world country polygons (sf object)
world <- rnaturalearth::ne_countries(scale = "medium", returnclass = "sf")

# Check CRS (should be EPSG:4326 — geographic lat/long)
sf::st_crs(world)
```

### <mark style="background: #04FF00A6;">Task 1 – Create a Base Map of Australia</mark>

- Import Australia using `rnaturalearth`.
- Check its CRS using `st_crs()`.
- Plot the base map using `geom_sf()`.

**Refer to CMPU4091-L6-Geospatial Visualization.qmd: Section 1**

**Expected Output:**  
A clean base polygon map of Australia.

### <mark style="background: #04FF00A6;">MY WORK - TASK 1</mark>

```R
# Load Ireland  polygons (sf object)
australia <- ne_countries(
  country = "Australia",
  scale = "medium",
  returnclass = "sf"
)

# Check CRS (should be EPSG:4326 — geographic lat/long)
sf::st_crs(australia)

p <- ggplot(australia) +
  geom_sf(fill = "lightgreen", color = "white") +
  ggtitle("Australia Map - Geographic CRS (EPSG:4326)")

print(p)
```

![[Pasted image 20260312131310.png]]

### <mark style="background: #04FF00A6;">Task 2 – Overlay Major Cities (Point Layer)</mark>

1. Create a data frame of major Australian cities:    
    - Name
    - Longitude
    - Latitude
    
| City      | Latitude | Longitude |
| --------- | -------- | --------- |
| Sydney    | -33.8688 | 151.2093  |
| Melbourne | -37.8136 | 144.9631  |
| Brisbane  | -27.4698 | 153.0251  |
| Perth     | -31.9505 | 115.8575  |
| Adelaide  | -34.9285 | 138.6007  |
| Darwin    | -12.4634 | 130.8456  |
| Canberra  | -35.2809 | 149.1300  |
| Hobart    | -42.8821 | 147.3272  |

2. Convert to an `sf` object using CRS 4326.
3. Overlay city points.    
4. Add labels using `geom_sf_text()`.


**Refer to CMPU4091-L6-Geospatial Visualization.qmd: Section 5 and Section 3.2**

**Expected Output:**  
Base map with labelled city points.

### <mark style="background: #04FF00A6;">MY WORK - TASK 2</mark>

```R
# Get co-ordinates of cities we want to plot
cities <- data.frame(
  city = c("Sydney", "Melbourne", "Brisbane", "Perth", "Adelaide", "Darwin", "Canberra", "Hobart"),
  lon = c(151.2093, 144.9631, 153.0251, 115.8575, 138.6007, 130.8456, 149.1300, 147.3272),
  lat = c(-33.8688, -37.8136, -27.4698, -31.9505, -34.9285, -12.4634, -35.2809, -42.8821)
)

city_points <- sf::st_as_sf(
  cities,
  coords = c("lon", "lat"),
  crs = 4326
)

ggplot() +
  geom_sf(data = australia, fill = "white", color = "grey50") +
  geom_sf(data = city_points,
          color = "blue",
          size = 3) +
  geom_sf_text(data = city_points,
               aes(label = city),
               nudge_y = 0.1) +
  ggtitle("Dot Location Map (Geocoded Cities)") +
  theme_void()
```

![[Pasted image 20260312133246.png]]

### <mark style="background: #04FF00A6;">Task 3 – Overlay State Boundaries (Polygon Layer)</mark>

1. Read `gadm41_AUS_1.json` using `st_read()`.
2. Confirm its CRS.
3. Overlay state boundaries.
4. Use subtle styling for clarity.


**Refer to CMPU4091-L6-Geospatial Visualization.qmd: 1.3 Ireland Overlay Counties, 3.4 Dot Point overlay cities**

**Expected Output:**  
Map with base layer, states, cities.

### <mark style="background: #04FF00A6;">MY WORK - TASK 3</mark>

```R
# Read the GeoJSON file of county shapes into an sf object
states <- sf::st_read("gadm41_AUS_1.json", layer = "gadm41_AUS_1")

p3 <- ggplot() +
  geom_sf(data = states, fill = "white", color = "grey50") +
  geom_sf(data = city_points, color = "blue", size = 3) +
  geom_sf_text(data = city_points, aes(label = city), nudge_y = 0.1) +
  ggspatial::annotation_scale(location = "bl", width_hint = 0.1) +
  ggspatial::annotation_north_arrow(
    location = "tl",
    which_north = "true",
    style = ggspatial::north_arrow_fancy_orienteering
  ) +
  ggtitle("Dot Location Map (Geocoded Cities)") +
  theme_void()
print(p3)
```


![[Pasted image 20260312140605.png]]


# <mark style="background: #04FF00A6;">Task 4 – Overlay a Route (Sydney → Perth)</mark>

1. Reproject all layers to **EPSG:28355** (Australia Transverse Mercator).
2. Extract projected coordinates for Sydney and Perth.
3. Create a curved route using `geom_curve()`.
4. Add an arrow to indicate direction.

**Refer to CMPU4091-L6-Geospatial Visualization.qmd: Section 5**

**Expected Output:**
Map with curved route overlay.

### <mark style="background: #04FF00A6;">MY WORK - TASK 4</mark>


```R
australia_merc <- sf::st_transform(australia, 28355)

ggplot(australia_merc) +
  geom_sf(fill = "lightgreen", color = "white") +
   coord_sf(datum = NA)  +
  ggtitle("Australia Transverse Mercator (28355 Display)")
  
# Project cities to match ireland_proj
city_points_proj <- st_transform(city_points, st_crs(australia_merc))

# Extract projected coordinates from city points
# -----------------------------------------------------------
# city_points_proj is already in the same CRS as ireland_proj.
# st_coordinates() extracts numeric X/Y values from the geometry column.

coords <- st_coordinates(city_points_proj)

# Add extracted coordinates back into the sf object as regular columns.
# This allows us to use them inside geom_curve().

city_points_proj$X <- coords[,1]
city_points_proj$Y <- coords[,2]


#  Select Dublin and Galway
# -----------------------------------------------------------
# We filter the data to get one row for each city.
# These will be the start and end points of our route.

sydney <- city_points_proj |> 
  dplyr::filter(city == "Sydney")

perth <- city_points_proj |> 
  dplyr::filter(city == "Perth")


#  Create a small data frame for geom_curve()
# -----------------------------------------------------------
# geom_curve() needs a regular data frame with x, y, xend, yend.
# We create a one-row tibble defining the route.

route_df <- tibble(
  x = sydney$X,
  y = sydney$Y,
  xend = perth$X,
  yend = perth$Y
)


# Build the map using layered grammar of graphics
# -----------------------------------------------------------

ggplot() +

  # Base layer: Ireland polygon (projected CRS)
  geom_sf(data = australia_merc,
          fill = "white",
          color = "grey60") +

  # Flow layer: curved route from Dublin to Galway
  # curvature controls how dramatic the arc is
  # arrow adds directional cue
  geom_curve(
    data = route_df,
    aes(x = x, y = y, xend = xend, yend = yend),
    curvature = 0.4,
    color = "purple",
    linewidth = 1.2,
    arrow = arrow(length = unit(0.25, "inches"))
  ) +

  # Point layer: city locations
  geom_sf(data = city_points_proj,
          color = "red",
          size = 3) +

  # Label layer: city names
  # nudge_y shifts text slightly upward to avoid overlap
  geom_sf_text(data = city_points_proj,
               aes(label = city),
               nudge_y = 10000,
               size = 4) +

  # Map annotation layers
  ggspatial::annotation_scale(
    location = "bl",
    width_hint = 0.4
  ) +

  ggspatial::annotation_north_arrow(
    location = "tl",
    which_north = "true",
    style = ggspatial::north_arrow_fancy_orienteering
  ) +

  # Title
  ggtitle("Line Map: Route from Sydeny to Perth") +

  # Remove axes and background clutter
  theme_void()
```

![[Pasted image 20260312142753.png]]

### <mark style="background: #04FF00A6;">Task 5 – Create a Choropleth of Median Income</mark>

1. Read `medianincomeaustralia.csv`.
2. Clean state names using `trimws()` if needed.
3. Join income data to state geometries.
4. Create a choropleth using:
    - Equal interval classification
    - 5 classes
5. Apply a sequential colour scale (`viridis`).

**Refer to CMPU4091-L6-Geospatial Visualization.qmd: Section 2**
- **Important**
    You may see this warning:
    `var has missing values, omitted in finding classes`
    This means:
    - Some states did not match correctly during the join.
    - You can either ignore or delete these e.g. states_income<- states_income |> filter(!is.na(mdn_income))


**Expected Output:**  
A choropleth map showing:
- Median Income by state
- Equal interval classification
- Clear Title
- Clear legend
- Clean styling

### <mark style="background: #04FF00A6;">MY WORK - TASK 5</mark>

```R
income_data <- read_csv("medianincomeaustralia.csv")
income_data$State <- trimws(income_data$State)

states$NAME_1_clean <- gsub(" ", "", states$NAME_1)

states_income <- states %>%
  left_join(income_data, by = c("NAME_1_clean" = "State")) %>%
  filter(!is.na(mdn_income))  

breaks_ei <- classInt::classIntervals(states_income$mdn_income, n = 5, style = "equal")

# Choropleth map
p4 <- ggplot(states_income) +
  geom_sf(aes(fill = mdn_income), color = "white") +
  scale_fill_viridis_c(
    name = "Median Income",
    breaks = breaks_ei$brks,
    labels = scales::comma
  ) +
  ggtitle("Median Income by Australian State") +
  theme_void()

print(p4)
```

![[Pasted image 20260312190208.png]]

### <mark style="background: #04FF00A6;">Task 6 – Add Scale Bar and North Arrow</mark>

1. Ensure your map is projected to **EPSG:28355**.
2. Add:
	- `annotation_scale()`
	- `annotation_north_arrow()`


**Refer to CMPU4091-L6-Geospatial Visualization.qmd: Section 5**

**Expected Output:**  
Fully annotated choropleth map.

### <mark style="background: #04FF00A6;">MY WORK - TASK 6</mark>

```R
# TASK 6 - ADD SCALE BAR AND NORTH ARROW
states_income_projected <- sf::st_transform(states_income, 28355)

p5 <- ggplot(states_income_projected) +
  geom_sf(aes(fill = mdn_income), color = "white") +
  scale_fill_viridis_c(
    name = "Median Income",
    breaks = breaks_ei$brks,
    labels = scales::comma
  ) +
  ggtitle("Median Income by Australian State") +
  ggspatial::annotation_scale(location = "bl", width_hint = 0.1) +
  ggspatial::annotation_north_arrow(
    location = "tl",
    which_north = "true",
    style = ggspatial::north_arrow_fancy_orienteering
  ) +
  theme_void()

print(p5)
```

![[Pasted image 20260312203331.png]]

### <mark style="background: #04FF00A6;">Task 7 - Create a Chloropeth Map of Australia Population</mark>

- Read in `populationaustralia.csv`    
- Clean state names if necessary using `trimws()`.
- Join the population data to the state spatial object.
- Create an **Equal Interval classification** with 5 classes.
- Apply a sequential colour scale (`viridis`).

Produce a choropleth map showing population by state.

**Important**

You may see this warning:
`var has missing values, omitted in finding classes`

This means:
- Some states did not match correctly during the join.
- You can either ignore or delete these - states_income<- states_income |> filter(!is.na(mdn_income))

**Refer to CMPU4091-L6-Geospatial Visualization.qmd: Section 2**

**Expected Output**
- A choropleth map showing:
    - Population by state
    - Equal interval classification
    - Clear Title
    - Clear legend
    - Clean styling
    - Compass and scale bar

### <mark style="background: #04FF00A6;">MY WORK - TASK 7</mark>

```R
pop_data <- read_csv("populationaustralia.csv")
pop_data$State <- trimws(income_data$State)

# Join to STATES
states_pop <- states %>%
  left_join(pop_data, by = c("NAME_1_clean" = "State")) %>%
  filter(!is.na(Population))

# Equal interval breaks
breaks_ei_pop <- classInt::classIntervals(states_pop$Population, n = 5, style = "equal")

p6 <- ggplot(states_pop) +
  geom_sf(aes(fill = Population), color = "white") +
  scale_fill_viridis_c(
    name = "Population",
    breaks = breaks_ei_pop$brks,
    labels = scales::comma
  ) +
  ggtitle("Population by Australian State") +
  ggspatial::annotation_scale(location = "bl", width_hint = 0.1) +
  ggspatial::annotation_north_arrow(
    location = "tl",
    which_north = "true",
    style = ggspatial::north_arrow_fancy_orienteering
  ) +
  theme_void()

print(p6)
```

### <mark style="background: #04FF00A6;">Task 8 - Create a Contiguous Cartogram of (Area = Population)</mark>

- Reproject your population spatial object to **EPSG:28355**.    
- Ensure geometry validity using `st_make_valid()`.
- Simplify geometries using `rmapshaper::ms_simplify()` (keep ≈ 5%).
- Create a **contiguous cartogram** using `cartogram_cont()`:
- Weight = `"Population"`
- Iterations = 5
- Plot using `tmap` in plot mode.

Apply:
-   Jenks classification
-    Brewer colour palette
-    Scale bar
-   Compass
-   Title

You may see this warning:
> `NA not allowed in weight vector. Features will be removed`

This means:
-    Some states have missing population values.
-    Check your join.
-    Remove NA rows before generating the cartogram if required:

```         
states_pop_proj <- states_pop_proj |>    filter(!is.na(Population))
```


**Refer to CMPU4091-L6-Geospatial Visualization.qmd: Section 6**

**Expected Output**
A contiguous cartogram:
- States resized by population 
- Jenks classification
- Clear legend
- Scale bar
- Compass
- Clean layout


### <mark style="background: #04FF00A6;">MY WORK - TASK 8</mark>

```R

```