data('singer_locations')

View(singer_locations)

# artist_hotttnesss, artist_familiarity, duration

library(tidyverse)

hfd_y <- singer_locations %>%
  select(year, duration:artist_familiarity) %>%
  gather(key='Measures', value='My_value',
         duration:artist_familiarity)

View(hfd_y)

## Doomed challenge I

# Bring hfd_y in the wide format
hfd_y %>%
  spread(Measures, My_value)

### Hopeful challenge 2
# Fix hfd_y (hold it better, gather and spread)

hfd_y_id <- singer_locations %>%
  select(song_id, year, duration:artist_familiarity) %>%
  gather(key='Measures', value='My_value',
         duration:artist_familiarity)

hfd_y_wide <- hfd_y_id %>%
  spread(Measures, My_value)

View(hfd_y_wide)

library(reshape2)

# mean of each entry
hfd_y_mean <- hfd_y %>%
  dcast(year ~ Measures,
        value.var = "My_value",
        fun.aggregate = mean, na.rm = TRUE)

View(hfd_y_mean)

## there will the same number of rows as there are for years 

# variance of each entry, NA means there is only one entry for that row so there is no variance
hfd_y_var <- hfd_y %>%
  dcast(year ~ Measures,
        value.var = "My_value",
        fun.aggregate = var, na.rm = TRUE)

View(hfd_y_var)

## Objects seen in R

#functions
mean
lm

str(hfd_y_mean)
typeof(hfd_y_mean)
class(hfd_y_mean)
# class more high level, type is more low level nitty gritty kind of question

typeof('pizza')
class('pizza')
# low level objects, class and type will be the same

typeof(4)
# double is a special type of number
class(4)
# all numbers are numeric
typeof(5L)
# adding an L makes it an integer

### challenge 3
# what kind of stuff is myplot?

library(gapminder)
myplot <- gapminder %>% 
  ggplot(aes(x=year, y=population)) + geom_point()

typeof(myplot)
class(myplot)

### challenge 4
# what kind of stuff is %>% ?
typeof(`%>%`)
class(`%>%`)
# add `` for R to analyse pipe function
class(`<-`)

'<-'(y, 13)
y
`+`(1,1)
`==`(13,6)
