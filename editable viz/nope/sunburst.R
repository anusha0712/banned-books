library(sunburstR)
library(dplyr)
library(readr)
library(RColorBrewer)

# Read and prepare the data
df <- read_csv("sunburst.csv")

# Create inner ring colors (for Ban Status)
inner_colors <- c(
  "#8B4513",  # saddle brown
  "#CD853F",  # peru
  "#DEB887",  # burlywood
  "#D2691E"   # chocolate
)

# Create outer ring colors (for States)
# Using a gradient of earthy, complementary colors
outer_colors <- c(
  # Terracotta shades
  "#E6B89C", "#E6A087", "#E68A72", "#E67357", "#E65D42",
  # Dusty rose shades
  "#E6B8B3", "#E6A6A1", "#E6958F", "#E6837D", "#E6726B",
  # Warm brown shades
  "#B87E5C", "#B87357", "#B86952", "#B85E4D", "#B85348",
  # Muted purple shades
  "#9C8B94", "#8F7E87", "#82717A", "#75646D", "#685760",
  # Clay shades
  "#C17767", "#BC6F5E", "#B76756", "#B25F4E", "#AD5746",
  # Sand shades
  "#D4B599", "#D4AB8A", "#D4A17B", "#D4976C", "#D48D5D",
  # Rust shades
  "#A65D57", "#9E534D", "#964943", "#8E3F39", "#86352F",
  # Mauve shades
  "#B98B8B", "#B27F7F", "#AA7373", "#A36767", "#9B5B5B",
  # Deep rose shades
  "#C17E7E", "#B87474", "#AE6A6A", "#A56060", "#9B5656",
  # Warm gray shades
  "#998888", "#8E7D7D", "#837272", "#786767", "#6D5C5C",
  # Additional complementary shades to reach 55
  "#B5948B", "#AA8980", "#9F7E75", "#94736A", "#89685F"
)

# Combine colors
all_colors <- c(inner_colors, outer_colors)

# Create the path format
sunburst_data <- df %>%
  mutate(path = paste(`Ban Status`, State, sep = "-")) %>%
  select(path, Title) %>%
  rename(value = Title)

# Create sunburst chart with custom colors
sunburst(sunburst_data, 
         count = FALSE,
         width = 800,
         height = 800,
         colors = all_colors,
         legend = TRUE)