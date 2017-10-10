data('singer_locations')

View(singer_locations)

# artist_hotttnesss, artist_familiarity, duration

library(tidyverse)

hfd_y <- singer_locations %>%
  select(year, duration:artist_familiarity) %>%
  gather(key='Measures', value='My_value',
         duration:arist_familiarity)
  
