library(dplyr)
library(ggplot2)
library(stringr)
library(readr)
library(forcats) 

# Define the stronger Indian Red gradient palette
custom_colors <- c("#b43c3c", "#b84646", "#bc5151", "#c05a5a", "#c46363", "#c76c6c", 
                   "#cb7575", "#ce7d7d", "#d18484", "#d48c8c", "#d79393", "#d99999", 
                   "#dca0a0", "#dea6a6", "#e0abab", "#e3b1b1", "#e5b6b6", "#e7baba", 
                   "#e8bfbf", "#eac3c3", "#ebc7c7", "#edcaca", "#eecece", "#f0d1d1", 
                   "#f1d4d4", "#f2d6d6", "#f3d9d9", "#f4dbdb", "#f4dddd", "#f5dfdf", 
                   "#f6e1e1", "#f7e2e2", "#f7e4e4", "#f8e5e5", "#f8e6e6", "#f8e7e7", 
                   "#f9e8e8", "#f9e8e8", "#f9e9e9", "#f9eaea", "#faeaea", "#faeaea", 
                   "#faeaea", "#faebeb", "#faebeb", "#faebeb", "#faebeb", "#faebeb", 
                   "#faebeb", "#faebeb")

# Load dataset
plot_df <- read_csv("top50_banned_2024.csv")
plot_df <- plot_df %>%
  mutate(
    id = row_number(),
    angle = 90 - 360 * (id - 0.5) / max(id),
    hjust = ifelse(angle < -90 | angle > 90, 1, 0),  # Right-align left-side labels
    angle = ifelse(angle < -90 | angle > 90, angle + 180, angle)  # Flip left-side labels
  )

ggplot() +
  geom_bar(
    data=plot_df,
    aes(x=id, y=Title, fill=factor(id)),  # Map fill to id to use different colors
    stat="identity", 
    width = 0.7) + 
  scale_fill_manual(values = custom_colors) +  # Use our custom color palette
  ylim(-300, 560) +
  geom_text(
    data = plot_df,
    aes(x = id, y = Title + 25, label = Author, angle = angle, hjust= hjust),
    size = 3
  ) +
  theme_minimal() +
  theme(
    legend.position = "none",
    axis.text = element_blank(),
    axis.title = element_blank(),
    panel.grid.major = element_blank(),  # Remove major gridlines
    panel.grid.minor = element_blank(),   # Remove minor gridlines
    plot.margin = margin(t = 5, r = 5, b = -50, l = 5, unit = "pt"),
  ) +
  coord_polar(start=0)