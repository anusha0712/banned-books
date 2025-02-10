# Visualizing School Book Bans in America

## Introduction

Hello! My name is Anusha Subramanian and I'm a Data Journalist at Columbia Journalism School. I'm primarily interested in anything that provides critical commentary on the human condition and specifically interested in public health, culture with a South Asian focus, books, poetry and lots and lots of food. You can find my work [here](https://anusha0712.github.io) and this project's completed story [here](https://anusha0712.github.io/banned_books/).

For this project, I was interested in the phenomenon of schools banning books that educators have already selected as educational offerings, at the behest of outside influences such as parents, lawmakers, community members etc. 

I grew up in Mumbai, India, and while there were plenty of books that my parents were opposed to me reading (Wattpad, anyone?), they had no authority at all to tell my school what they could or could not stock in their libraries. PEN America, the nonprofit organization aimed at protecting freedom of expression, releases an annual Index of School Book Bans in USA that catalogues every time in the academic year that a book is "challenged" because of it's contents and is investigated, leading to restricted access or bans. You can read the 2023-2024 report [here](https://pen.org/book-banspen-america-index-of-school-book-bans-2023-2024/). This Index is the dataset that I will be using for this project. 

## Goals

My goal is to analyze and visualize the growing trend of book bannings in schools across the country. 

Some questions that guided my exploratory data analysis were:

1. What is the scale of books being banned? 
    - How many are unique titles?
    - Are some books or authors facing consistent bans?

2. Are there geographical patterns of censorship? 
    - Are some states consistently banning books more than others?

3. Who are the most banned authors in the 2023-2024 academic year?
    - Do I know them? From my understanding of their works, does something stand out?

4. What are the most banned books generally overall but also specifically last year?

I've used PEN America's [2021-2022](https://docs.google.com/spreadsheets/d/1hTs_PB7KuTMBtNMESFEGuK-0abzhNxVv4tgpI5-iKe8/editgid=1171606318#gid=1171606318), [2022-2023](https://docs.google.com/spreadsheets/d1a6v7R7pidO7TIwRZTIh9T6c0--QNNVufcUUrDcz2GJM/edit?gid=982757372#gid=982757372) and [2023-2024](https://docs.google.com/spreadsheets/d/1slCpqLprPXHM-Wyt-WYJR30-NvbGLialVNR8qTsZFG8/edit?gid=0#gid=0) Indices to track the bans over three academic years. My hope is that a pattern of banning will emerge through the authors and books being censored. 

Personally, this will be a very useful dataset to exercise my visualization muscles. I want to gain a better understanding of data viz tools like Rawgraph, use Illustrator for the first time and grapple with the wide flexibility of `ggplot2` in R. I'm also excited to complete a self-guided project from the ground up.


## Frameworks Used

**Code**
- Python (pandas)
- R (plotting)
- HTML 
- Excel

**Data Visualization**
- [Rawgraphs.io](https://www.rawgraphs.io)
- [Datawrapper](https://www.datawrapper.de)
- Adobe Illustrator
- `ggplot2` in R


## Quick Guide To The Files

1. `banned_books.ipynb` : Jupyter Notebook (Python) with all the cleaning and analysis code for the project.

2. `data` directory:
    - Raw CSVs downloaded from PEN America's Index. `bb_2021-2022.csv` is the file for book bans in the 2021-2022 academic year, for example.
    - `all_banned_books.csv` : Cleaned, concatenated and standardised CSV of all banned books
    - `top50_banned_2024.csv` : 50 most banned authors in the academic year 2023-2024
    - `top_banned_authors_perAY.xlsx`: Excel sheet with more information on 50 most banned authors for each academic year. Not shown in final project, but I manually tabulated their gender pronouns. They were gathered from their instagram profiles, personal websites and interviews with reputable outlets or organizations like the American Library Association (ALA).


3. `data_viz` directory:
    - `radial_final.svg` : final radial chart for the project
        - `radial_chart.R`: code to create the bones of the radial chart 
    - `treemap_final-01.svg`: final treemap graphic for the project


## Methodology 

Here is the framework that I followed for my analysis. The code notebook contains more detailed commentary for the individual steps.

1. Download PEN America's Index as CSVs for each academic year 

2. Combine all of them together to get one big file of all the banned books
    - I dropped the "Series" column since it was not well-populated and only present in 2/3 academic years

3. Clean and Standardise Data. Few of the steps include:
    - Changed author names from (last name, first name) to (first name, last name) for readability
    - Standardised "Ban Status" - many of the columns meant the same thing but had case differences or were not an exact match so it would make accurate counting and grouping difficult
    - Dropped one row from the analysis that did not have the Title or Author. With my resources, it was not possible to find out which book that was. 

4. Grouping, Counting and Transforming data for analysis and visualization

5. Visualization:
    - Radial Bar: Used `ggplot2` to plot a circular bar graph and then used Illustrator to accurately annotate the different works of the authors
    - Treemap: Rawgraphs gave me the skeletal framework for the Treemap but it had to be manually annotated in Illustrator using numbers from the analysis notebook.
    - Datawrapper graphs were embedded directly into the HTML

6. Used a basic story template (HTML framework) to bring the visualizations together into a story.


## Limitations - "Wants" vs "Needs"

I was able to accomplish everything I "needed", which includes a contextual analysis and visualizations on how book bans are growing, what are the top books and authors banned and states that are leading the banning charge. 

What I also "wanted" to do was to run my own analysis on the genres and themes of books banned. While observation and the PEN America report do reveal certain trends of books exploring LGBTQ+ relations, race narratives, difficult topics like school shootings, and abuse serve as a majority of the banned books, I would have liked to arrive at that conclusion in a data-forward manner. 

I had three ideas for that methodology:

1. Use Goodreads' genre categorization of each book (or top 100-500) - Manual approach since that Public API is now shutdown. 

2. Use LLMs like ChatGPT or Claude AI to categorize the novels. I was working on a good prompt
    - I explored this this aspect for a while but eventually I was unsatisfied with the outcome. The categorizations were very unidimensional and did not accurately categorize the thematic genres I wanted. 

3. Use a classifier from HuggingFace.co that is trained on book genre. 

Due to the short-turn around time of the project, I was able to explore this tangent briefly.  

### Limitation

A limitation of the dataset is that it does not track metrics such as:

1. Books that were initially banned but now returned to the shelf
2. Books pending investigation that were put back on the shelf after the investigation

However, the dataset makes it very clear that they track incidents where access to individual books is restricted or diminished i.e. all book challenges and the ones that ultimately result in some form of a ban.

## Note on AI use

ChatGPT and Claude AI were used in this project, primarily as a useful and quick debugging source since I'm very new to R. 

Claude AI was also used in two secondary ways:
1. Help in cases where I wasn't sure if something was possible with R (aesthetics of the radial chart) or had to be done in Illustrator, manually. 
2. To use verbal cues to translate the color palette I envisioned in my head to actual hex codes that can be used in my graphs. I would then tweak them on a palette editor like [coolors.co](https://coolors.co) until I got the aesthetic I wanted. 

    Example: "I want you to generate 50 distinct shades inspired by 'indianred' color, based on values in the "Title" column" or "Give me a 5 color palette that complements a muted viva magenta as the main color". 

**No tasks or data cleaning were performed using ChatGPT or Claude AI.**


## Questions

I would love to chat more about my work, including this project! If you have any questions, please [email me!](mailto:as7500@columbia.edu)


    



