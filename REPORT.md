Dataset : Neural Summarization by Extracting Sentences and Words --> Jianpeng Cheng, Mirella Lapata

### **Modifications to the original data by <a href='https://aclweb.org/anthology/P16-1046'>Cheng et. al. 2016</a>.**
* NERed Data. All the named entities are replaced with unique tags.
* Truth labels for sentences to be extracted are generated using paralled corpora.

**Features Considered for each line:**
* Number of Verbs (POS)
* Number of Stop words (nltk stop word list)
* Number of Named Entities
* Number of Pronouns (POS)
* Position in document 
* Sentence Length

**May include in Future:**
* Discourse Cues
* Sentiment
* Salience
* Uniqueness

-----------------------------------------------------------------------------------------------------------------------------------------------

# Logistic Regression:

## Features and their weights:
| Features | Learned Weights| Comment |
| ----------- | ---------- | --------------------------- |
| No. of pronouns |  -0.014409942 |  Pronouns indicate dependency on other sentences |
| No. of verbs |  -0.0043992093 | A lot of verbs are auxillary |
| No. of Named entities |  0.22817455 | Most important feature. Signifies both importance and Independence |
| length of sentence |  0.074055605 |  Longer sentences are better |
| Position of sentence in document | -0.029169073 |  Sentences occuring early in the document are better |
| No. of stop words |  -0.07974424 |  More stop words, less importance |

## Results on Cheng data: 
<b>(scores mentioned are based on truth labels and not ROUGE)</b>

| Measure | Percentage|
| --------------- | ----------------- | 
| Precision | 37.4% |
| Recall | 82.4% |
| F1 score | 51.48% |


## Sample Output

### Sample Text Document: 

* @entity1 's agent expects to go ' around the world ' discussing his client as interest in the @entity6 midfielder increases ahead of the summer transfer window
* @entity8 , who has confirmed that he held talks with @entity10 earlier this season , admits that he could receive 20 phone calls a day about the @entity13 international as clubs prepare to strengthen their squads before the start of next season
* city are keen to sign the @entity21 midfielder as they look to reshape their squad but @entity23 insists no decision has been made and that the 23 - year - old could even remain at the @entity26
* @entity6 midfielder has attracted interest from @entity10 , @entity29 and @entity30 @entity31 tussles with @entity33 's @entity32 during @entity6 's 1 - 1 draw at the @entity26 speaking to @entity35 , @entity23 said : ' for the moment , there are no formal discussions
* of course in the next few weeks i will be going around the world to talk about the situation with @entity1 but this is just informal information
* ' i will talk to everybody but @entity1 is very , very happy with @entity6 and the way they have treated him since he arrived from @entity46 last year
* ' there are still five games to play and hopefully they can make sure of a place in the @entity51 next season so it is a little bit too early to be making any decisions
* he has a four - year contract at @entity6 so we will have to see what they want to do
* ' i have met the people from @entity10 and we know each other
* i 've never spoken to anyone from @entity62 but a lot of other clubs have been in touch to find out some general information
* ' @entity68 champions @entity29 and @entity69 giants @entity30 are both interested in @entity31 , who is expected to cost around £ 40million after joining @entity6 from @entity46 for £ 18m in january last year
* @entity31 has scored 10 league goals and registered 17 assists so far this season , helping @entity74 's side to second place in the @entity68 table
* @entity77 celebrates with @entity31 after the @entity79 's equaliser against @entity33 on sunday @entity31 has been in superb form this season , scoring 10 goals and providing 17 assists in the @entity68

### Predicted Summary: (Top 3 Sentences with the highest scores)

* @entity1 's agent expects to go ' around the world ' discussing his client as interest in the @entity6 midfielder increases ahead of the summer transfer window
* @entity6 midfielder has attracted interest from @entity10 , @entity29 and @entity30 @entity31 tussles with @entity33 's @entity32 during @entity6 's 1 - 1 draw at the @entity26 speaking to @entity35 , @entity23 said : ' for the moment , there are no formal discussions
* @entity77 celebrates with @entity31 after the @entity79 's equaliser against @entity33 on sunday @entity31 has been in superb form this season , scoring 10 goals and providing 17 assists in the @entity68

### Actual Summary: (Highlight of the article)

* @entity8 will go ' around the world ' to talk about @entity1
* the @entity6 midfielder is wanted by @entity10 and @entity29
* @entity23 has admitted having talks with @entity10 chiefs this season
* but he has not spoken to @entity62 about a move for his client
* @entity31 remains happy at @entity6 and could yet remain at the club

-----------------------------------------------------------------------------------------------------------------------------------------------


# Naive Bayes:

## Features and their weights:
| Features | Learned Weights|
| ----------- | ---------- | 
| Class Priors |  [ 0.41469828,  0.38525965,  0.20004207] |  

Theta = [
			[  1.34263311,   2.75037769,   0.97571239,  19.31056766, 21.84443449,   8.55280738],
       		[  1.65492704,   4.10690546,   2.67279624,  32.70667046, 14.32934332,  12.63740534],
       		[  1.42011271,   3.22876426,   1.57733797,  23.98790809, 17.80195719,   9.9989353 ]
       	]
Sigma = [
			[   1.83475972,    3.51395267,    2.26251264,  116.55232012, 207.37672246,   23.5682712 ],
       		[   2.98482622,    8.51124486,    9.36077274,  438.24841698, 178.52283444,   63.66841889],
       		[   2.08999781,    4.46458595,    3.52514001,  166.35604399, 178.19108311,   30.16031335]
       	]

## Results on Cheng data: 
<b>(scores mentioned are based on truth labels and not ROUGE)</b>

| Measure | Percentage|
| --------------- | ----------------- | 
| Accuracy | 51.56% |

## Sample Output

### Sample Text Document: 

* -- think your @entity2 status updates are pretty dramatic ? if you act soon , you may entice a troupe of improv artists to stage them for the world
* " @entity11 , " happening live until 9 a.m. thursday , is taking the magical , mundane and sometimes mystifying world of @entity2 posts to the stage in a 24 - hour performance
* sponsored by online security company @entity13 , the experimental project lets @entity2 users volunteer their profiles
* if selected , a post from their page will be acted out during the event , which began wednesday morning at a @entity21 theater and is streaming live on @entity13 's facebook page
* so , for example , this post -- " just bought a tent
* " -- ends up featuring a @entity27 look - alike dancing as a gospel choir belts out those words , with feeling
* a dance troupe interprets a photo of chicken wings on a grill
* and an opera singer renders " is it just me , or does @entity21 smell like grape soda tonight ? " like @entity36
* " we believe it 's truly an experimental way to capture people 's attention in a relevant way , " said @entity40 , @entity13 's vice president of worldwide consumer marketing
* the name of the project is a play on the name of a @entity13 advertising campaign , " stuff
* " actors ( from improv to @entity54 ) , singers , musicians , poets , sculptors , puppeteers and balloon artists all have been among those taking the stage so far
* as of 3 p.m. et , 150 live skits had been performed at @entity21 's @entity62
* tapping into the city 's rich improv - comedy tradition , performers draw a post and have only a few moments to decide what they 'll do onstage
* " the performers are doing it on the fly , " @entity40 said
* they were hoping to work in 1,000 skits by thursday morning
* the folks watching and commenting on @entity75 's page seemed amused
* " this is strangely , strangely addicting , " one user wrote
* ridiculous , silly , and just awesome , " said another
* the page had more than 170,000 likes as of late wednesday afternoon .

### Predicted Summary: (Top 3 Sentences with the highest scores)

* if selected , a post from their page will be acted out during the event , which began wednesday morning at a @entity21 theater and is streaming live on @entity13 's facebook page
* " @entity11 , " happening live until 9 a.m. thursday , is taking the magical , mundane and sometimes mystifying world of @entity2 posts to the stage in a 24 - hour performance
* " actors ( from improv to @entity54 ) , singers , musicians , poets , sculptors , puppeteers and balloon artists all have been among those taking the stage so far

### Actual Summary: (Highlight of the article)

* -- think your @entity2 status updates are pretty dramatic ? if you act soon , you may entice a troupe of improv artists to stage them for the world
* " @entity11 , " happening live until 9 a.m. thursday , is taking the magical , mundane and sometimes mystifying world of @entity2 posts to the stage in a 24 - hour performance
* sponsored by online security company @entity13 , the experimental project lets @entity2 users volunteer their profiles
* if selected , a post from their page will be acted out during the event , which began wednesday morning at a @entity21 theater and is streaming live on @entity13 's facebook page