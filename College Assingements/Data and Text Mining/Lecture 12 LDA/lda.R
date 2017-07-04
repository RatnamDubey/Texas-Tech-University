library("topicmodels")
library("tidytext")
library("ggplot2")
library("dplyr")


data("AssociatedPress")

apldata = LDA(AssociatedPress , k=3)

aptopics = tidy(apldata , matrix = "beta")

aptopterms = aptopics %>% group_by(topic) %>% top_n(10,beta) %>%  ungroup()  %>% arrange(topic,desc(beta))

aptopterms%>% mutate(terms = reorder(term , beta)) %>% ggplot(aes(term,beta,fill=factor(topic))) + geom_col(show.legend = TRUE) + facet_wrap(~topic , scale = "free") + coord_flip()


