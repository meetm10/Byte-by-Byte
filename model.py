
from nltk import word_tokenize
import nltk
from nltk.util import ngrams
from nltk.corpus import stopwords
from collections import Counter
from nltk import sent_tokenize
import os
import pickle


def getDict(filename):
    filename = filename + '.txt'
    with open(filename, encoding="utf8") as file:
        text = file.read()
    senttokens = sent_tokenize(text)
    stop = set(stopwords.words('english'))
    dct = {}
    dct['TotalCount'] = 0
    for sent in senttokens:
        wordToken = word_tokenize(sent)
        wordToken = [token for token in wordToken if token.isalnum() and not token.isdigit()]
        for i in range(len(wordToken)):
            word = wordToken[i].lower()
            if word not in dct:
                if word not in stop and len(word) > 1:
                    dct['TotalCount'] += 1
                    dct[word] = 1
            else:
                dct['TotalCount'] += 1
                dct[word] += 1
            if wordToken[i] in stop or wordToken[i-1] in stop:
                continue
            if i != 0:
                bigram = wordToken[i-1].lower() + ' ' + wordToken[i].lower()
                if bigram not in dct:
                    dct[bigram] = 1
                else:
                    dct[bigram] += 1
    return dct


def main():
    path = 'C:/Users/Deep/Hackathon'
    text_files = [f[:-4] for f in os.listdir(path) if f.endswith('.txt')]
    FinalDct = {}
    for file in text_files:
        FinalDct[file] = getDict(file)
    output = open('Final.pkl', 'wb')
    pickle.dump(FinalDct, output)
    return FinalDct



