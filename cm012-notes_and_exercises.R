### Warmup challenge: find a lot of different types and classes

typeof()
class()

# function - closure
typeof(str)
class(str)

typeof(data.frame)
class(data.frame)

# numeric
typeof(6)
class(6)

# character
typeof('rain')
class('rain')

# logical (boolean)
typeof(TRUE)
class(TRUE)

# function - builtin
typeof(c)
class(c) # classes are more general 

# list
library(gapminder)
typeof(gapminder)
class(gapminder) # an object doesn't need a unique class

library(tidyverse)
my_plot <- ggplot(gapminder, aes(x=year, y=lifeExp)) +
  geom_point()
typeof(my_plot)
class(my_plot)

x <- list(number_of_cats = 1, cat_colour = "red", plot = my_plot)
typeof(x)
class(x)

str(x)

# matrix
my_mat <- matrix(c(1,2,3,4), nrow = 2, byrow = TRUE)
my_mat
# can't mix types in matrices
my_mat2 <- matrix(c(1,2,"a","b"), nrow = 2, byrow = TRUE)
my_mat2 # get all characters back, will bring everything to the same type
# matrices are just one type

# dataframes can contain different kinds of objects
# can not have different types along a column

## change one entry of singer_locations from one type to another and see what happens

copy_sl <- singer_locations
View(copy_sl)

copy_sl$track_id[1] <- 123
str(copy_sl$track_id)

copy_sl[1,8] <- "long"
str(copy_sl$duration)

mean(singer_locations$duration, na.rm = TRUE)
mean(copy_sl$duration, na.rm = TRUE)
mean(copy_sl[-1,]$duration, na.rm = TRUE)

# types and objects are important
# certain functions will only work depending on the type 

# Reading and writing to file
read_csv() # better than read.csv, tries very hard to guess the type of the columns
readxl::read_excel() # read excel file into R
write_csv() # writing into your file

# FACTORS

glimpse(gapminder)
str(gapminder$country)
# factors are another way of looking at strings
# levels are the countries

library(forcats)
library(singer)
data("singer_locations")

glimpse(singer_locations)

sl <- singer_locations %>%
  mutate(artist_name_factor = as_factor(artist_name))
#as_factor() lets you transform objects into factors

glimpse(sl)

sl <- sl %>% 
  mutate(artist_name_factor_base = factor(artist_name))

glimpse(sl)

x <- c("a", "c", "b")
as_factor(x)
factor(x)

# base R factor() changes the order of the levels without telling us
# gives specific order of levels
# as_factor() is safer, doesn't change stuff around, doesn't modify

sl %>%
  # lump artists name, take least common factors and lump them together in the same level
  mutate(top_an = fct_lump(artist_name_factor, n = 7)) %>% 
  count(top_an) %>% 
  arrange(-n) # arrange in decreasing order

### homework: plot mean duration by artist with and without lumping

 ... %>% 
   summarize(mean_duration = mean(duration)) %>% 
   ggplot(aes(x=artist_name, ...)) +
   ......

##
 
sl <- sl %>%
  mutate(city_factor = as_factor(city))
# error, there are observations it can't easily categorize because city has a lot of NA
# for NA it doesn't know what to do

# give specific values for NA
sl <- sl %>%
  mutate(city_factor = ifelse(is.na(city), "Missing_information", city),
                              city_factor = as_factor(city_factor))
glimpse(sl)

sl %>% 
  mutate(top_cities = fct_lump(city_factor, n=7)) %>% 
  count(top_cities)
# some strings were written poorly, two NY and LA rows

### use forcats to clean up the city data



