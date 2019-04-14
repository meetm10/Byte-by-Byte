from tika import parser
import pickle
from nltk import sent_tokenize, word_tokenize
from nltk.corpus import stopwords

def PredictChapter(filename):
    filename = 'uploads/'+filename 
    pkl_file = open('Final.pkl', 'rb')
    corpus = pickle.load(pkl_file)
    if filename.split('.')[1] == 'pdf':
        raw = parser.from_file(filename)
        content = (raw['content'].strip())
        sentences = content.split('\n\n')
    elif filename.split('.')[1] == 'txt':
        with open(filename, encoding="utf8") as file:
            text = file.read()
            sentences = text.split('\n')
    result = []
    stop = set(stopwords.words('english'))
    for sent in sentences:
        chplist = []
        wordToken = word_tokenize(sent)
        wordToken = [token.lower() for token in wordToken if (token.isalnum() and not token.isdigit()) and token.lower() not in stop]
        for chps  in corpus:
            uniscore = 0
            bigscore = 0
            for i in range(len(wordToken)):
                unigram = wordToken[i]
                if unigram in corpus[chps]:
                    uniscore += corpus[chps][unigram]/corpus[chps]['TotalCount']
                if i > 0:
                    bigram = wordToken[i-1] + ' ' + wordToken[i]
                    if bigram in corpus[chps]:
                        bigscore += (corpus[chps][bigram]/corpus[chps][wordToken[i-1]])*(corpus[chps][bigram]/corpus[chps]['TotalCount'])
            chplist.append([chps,uniscore,bigscore])
        x = sorted(chplist, key = lambda a: a[1] + a[2])[-3:]
        result.append([sent, x[-1][0]])
    return result