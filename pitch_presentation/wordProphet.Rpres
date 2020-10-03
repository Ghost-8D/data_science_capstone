wordProphet
========================================================
author: Panayiotis L.
date: 03 Oct 2020
autosize: true
transition: rotate
class: smaller
css: style.css

Coursera Data Science Specialization<br/>
Capstone Project<br/>
Johns Hopkins University<br/>

========================================================

# **Objective**

<small>
This presentation features the wordProphet app
including an introduction to the application, user
interface and details about the text prediction
algorithm.

The wordProphet app is located at:

<ul>
    <li><a target="_blank" href="https://ghost-8d.shinyapps.io/wordProphet_v1/">https://ghost-8d.shinyapps.io/wordProphet_v1/</a></li>
</ul>

The source code can be found on GitHub:

<ul>
    <li><a target="_blank" href="https://github.com/Ghost-8D/data_science_capstone/tree/master/wordProphet">https://github.com/Ghost-8D/data_science_capstone/tree/master/wordProphet</a></li>
</ul>
</small>

========================================================

# **Shiny App**

<small>
WordProphet is a Shiny app that takes as input text from a 
user and attempts to predict the next word(s) using a text 
prediction algorithm.

The application uses an n-gram algorithm to suggest the next 
word in a sentence. An **n-gram** is a contiguous sequence
of *n* words from a given sequence of text.

To build the predictive text model, a large corpus of blogs,
news and twitter data was used. N-grams were extracted from 
the corpus and then used to build the predictive text model.

Various methods were used in order to improve the speed and
accuracy of the predictor, using natural language processing 
and text mining techniques.
</small>

========================================================

# **The Predictive Text Model**

<small>
The predictive text model was built from a sample of
800,000 lines extracted from the large corpus of blogs,
news and twitter data.

The sample data was then tokenized and cleaned using 
the **tm** package and a number of regular expressions 
using the **gsub** function. As part of the cleaning 
process the data was converted to lowercase, removed all 
non-ascii characters, URLs, email addresses, Twitter 
handles, hash tags, ordinal numbers, profane words, 
punctuation and whitespace. The data was then split into 
tokens (n-grams).

As text is entered by the user, the algorithm iterates
from longest n-gram (4-gram) to shortest (2-gram) to
detect a match. The predicted next word is considered using
the longest, most frequent matching n-gram. The algorithm
makes use of a simple back-off strategy.
</small>

========================================================

# **Application User Interface**

<small>
The predicted next word will be displayed when the app
detects that the user has finished typing one or more words.
When entering text, please allow a few seconds for the
output to appear. Use the slider tool to select up to
three next word predictions. The top prediction will be
shown first followed by the second and third likely
next words. Click the image below for a larger view
of the user interface.
</small>

<a target="_blank" href="https://github.com/Ghost-8D/data_science_capstone/blob/master/pitch_presentation/img/wordProphet_UI.jpg"><img src="img/wordProphet_UI.jpg"></a>
