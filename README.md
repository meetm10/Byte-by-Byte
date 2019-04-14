# Byte-by-Byte
A Natural Language assistant for all your homeworks!

## Inspiration
We have all been there. The stress of assignments, midterms, final exam and deadlines. We all need that scheduler and a task tracker, along with some motivation to get us through these hectic times. We wanted to help all the fellow students out there with the same experiences as us and wanted to bring a solution- an ultimate stress busting Assistant!

## What it does
It is a Natural Language parser that parses students' assignments and tags the questions with the corresponding chapters from their reading materials. It displays the top chapters from these questions the students have to be thorough with and keeps track of their progress. Along with these features, it gives a little bit of motivation through some of its inspirational quotes. Students can also keep track of what other students are up to through an interactive visualization. Coming soon is a forum to be in touch with other students, professors, medical centers and a medium for emergency needs.

## How we built it
We parsed the assignments and tokenized them using the N-gram language modelling. We, then, did Part of Speech tagging on the tokens to extract the topics using Google Cloud Natural Language API. We trained the corpus using reading materials like textbooks using N-Gram language model and generated Term-Document Matrix. Using tf-idf to weigh the frequencies in the term-document matrix, we generated the top N chapters related to the topics generated from the assignment document. We deployed this API on Google Cloud Platform running on Flask server. For the front end and visualization, we used JQuery, Javascript, CSS and HTML5 to provide a platform to upload the assignments. Via AJAX, we hit the API deployed on GCP to retrieve the top N chapters and used it for tracking students' progress. We used plugins in JQuery to achieve this. For visualizing the students' data, we used Plotly.

## Challenges we ran into
We came up with the design, the flow and the precise algorithms to use in this problem from scratch. We had to try out a few other solutions before deciding to use this approach. Also, integrating Javascript front end and Python back end was a little edgy at times.

Accomplishments that we're proud of
The way all the three of us worked together as a team and managed to achieve everything we had planned was incredible and something we are definitely proud of.

## What we learned
We learnt a lot of new technologies like Flask, NLTK and deployment of APIs on GCP.

## What's next for Byte-by-Byte
Create a completely unsupervised learning algorithm to find similarities between the assignments and the reading materials that gives a more refined result. Along with this, we also want to create a forum for students to interact with other students, professors and other resources in the University.
