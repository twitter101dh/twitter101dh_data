# Variable
# Einen Wert einer Variable zuweisen, Zuweisungsoperator: "<-"
i <- 1993
i <- Adenauer
i <- "Adenauer"

# Vektor zuweisen
kanzler_innen <- c("Konrad Adenauer","Ludwig Erhard","Kurt Georg Kiesinger","Willy Brandt","Helmut Schmidt","Helmut Kohl","Gerhard Schröder","Angela Merkel")

# Ein Objekt abrufen
kanzler_innen[1]

# Ein data.frame erstellen
kanzler_innen <- data.frame("Name" = c("Konrad Adenauer","Ludwig Erhard","Kurt Georg Kiesinger","Willy Brandt","Helmut Schmidt","Helmut Kohl","Gerhard Schröder","Angela Merkel"), "Partei" = c("CDU","CDU","CDU","SPD","SPD","CDU","SPD","CDU"), "Amtsantritt" = c("1949", "1963", "1966", "1969", "1974", "1982", "1998", "2005"), "Amtsende" = c("1963", "1966", "1969", "1974", "1982", "1998", "2005", "2021"))

# Variabletyp umwandeln
# Zuerst Differenz bilden um Fehler bei Erstellung hinweisen
kanzler_innen$Amtsantritt <- as.numeric(as.character(kanzler_innen$Amtsantritt))
kanzler_innen[, 4] <- as.numeric(as.character(kanzler_innen[, 4]))

# Eine neue Variable generieren: Differenz aus Amtsantritt - Amtsende
kanzler_innen$Amtsdauer <- kanzler_innen$Amtsende - kanzler_innen[, 3]

# Amtsdauer einer spezifischen Person erhalten
kanzler_innen$Amtsdauer[kanzler_innen$Name == "Konrad Adenauer"]

# Alle Informationen einer spezifischen Person erhalten
# Hier erst ohne Komma um Wichtigkeit der Dimension zu verdeutlichen
kanzler_innen[kanzler_innen$Name == "Konrad Adenauer",]

# Summe einer Variable bilden
sum(kanzler_innen$Amtsdauer[kanzler_innen$Partei == "SPD"])
sum(kanzler_innen$Amtsdauer[kanzler_innen$Partei == "CDU"])

# Einfacher Plot
plot(kanzler_innen$Name, kanzler_innen$Amtsdauer)

# Abruf mit API 1.1 & RTweet

# Packages installieren
# install rtweet von CRAN
install.packages("rtweet")
install.packages("tidyverse")
install.packages("tidytext")

# load rtweet package
library(rtweet)
library(tidyverse)
library(tidytext)


# Suche nach Tweets per Hashtag, ohne Retweets, letzte 7 Tage
# Hierbei Möglichkeit (anders als im Video) im ersten Schritt ohne den Token zu arbeiten und den rtweet-APP-Zugang zu nutzen
tweets_7days <- search_tweets(
  "#bibathome", n = 500, include_rts = FALSE
)

# Token generieren
api_key <- "euer API_key"
api_secret_key <- "euer api_secret_key"
access_token <- "euer access_token"
access_token_secret <- "euer access_token_secret"

token <- create_token(
  app = "euer Appname",
  consumer_key = api_key,
  consumer_secret = api_secret_key,
  access_token = access_token,
  access_secret = access_token_secret)

# Falls der Token als Variable generiert wurden, kann nur als weiteres Parameter euer token eingegben werden
tweets_search1 <- search_tweets(
  "#bibathome", n = 500, include_rts = FALSE, token = token
)

tweets_search2 <- search_tweets(
  "#bibathome OR #closedbutopen OR #bibathome OR #bibliothekensindda OR #LibraryTwitter OR #crisilibrarianship -filter:retweets", 
  n = 500
)

# Suche im vollen Archiv
# In größerem Umfang nur mit Premium Zugang möglich (so begrenzt auf maximal 5.000 Tweets)
tweets <- search_fullarchive("#bibathome", n = 500, env_name="Archive", token = token, fromDate="202002010000" toDate = "202102010000")


# Neben relevanten Tweets, auch vieles, was nicht relevant ist
# Stattdessen: Explizit Suche von Institutionen
## Bibliotheken: https://twitter.com/i/lists/1353008408086142977
## Bibliothekarinnen: https://twitter.com/i/lists/1353032789600460801
bibliotheken <- lists_members("1353008408086142977")
bibliothar_innen <- lists_members("1353032789600460801")

saveRDS(bibliotheken, file = "bibliotheken.rds")
bibliothar_innen <- readRDS(file = "bibliothar_innen.rds")

# Jetzt können wir auch deren Tweets abrufen
# Leider nicht weiter filterbar
bib_tweets_raw <- get_timelines(
  bibliotheken$user_id,
  n = 3200,
  home = FALSE,
  parse = TRUE,
  token = token 
)

saveRDS(bib_tweets_raw, file = "bib_tweets_raw.rds")
bib_tweets_raw <- readRDS(file = "bib_tweets_raw.rds")

# Korpus beschneiden auf entsprechenden Zeitraum
table(bib_tweets_raw$screen_name)
table(bib_tweets_raw$screen_name[bib_tweets_raw$is_retweet == FALSE])

library(tidyverse)
bib_tweets <- filter(bib_tweets_raw, "2020-02-01 00:00:00" < created_at &  created_at < "2021-02-01 00:00:00" )

# Tweets im Zeitverlauf
ts_plot(bib_tweets, "weeks") +
  labs(x = NULL, y = NULL,
       title = "Frequenz von Tweets der untersuchten Bibliotheken und Hashtags",
       subtitle = paste0(format(min(bib_tweets$created_at), "%d %B %Y"), " to ", format(max(bib_tweets$created_at),"%d %B %Y")),
       caption = "Daten abgerufen mit Twitters API via rtweet") +
  theme_minimal()

bib_tweets %>% dplyr::group_by(is_retweet) %>%  ts_plot("weeks")

# Meistgenutzte Links
bib_tweets %>% 
  filter(!is.na(urls_expanded_url)) %>% 
  count(urls_expanded_url, sort = TRUE) %>% 
  top_n(5)

# Wichtigste Hashtags
library("tidytext")
bib_tweets %>% unnest_tokens(hashtag, text, "tweets", to_lower = FALSE) %>% filter(str_detect(hashtag, "^#")) %>% count(hashtag, sort = TRUE) 

# Using Regex to filter
bib_tweets_corona <- bib_tweets[with(bib_tweets, grep("corona|bibathome|#closedbutopen|#bibathome|#bibliothekensindda|#LibraryTwitter|#crisilibrarianship", bib_tweets$text, ignore.case = TRUE)), ]

# Akteur mit den meisten Tweets
bib_tweets %>% 
  count(screen_name, sort = TRUE) %>%
  top_n(10) %>%
  mutate(screen_name = paste0("@", screen_name))

# Tweets exportieren
# Wichtig dabei: FileEncoding
write_as_csv(bib_tweets, "210305_bib_tweets.csv", prepend_ids = TRUE, na = "", fileEncoding = "UTF-8")
saveRDS(bib_tweets, file = "210305_bib_tweets.rds")
