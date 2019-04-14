from flask import Flask, request, jsonify
import sys
import os
from helper import PredictChapter  

app = Flask(__name__)
app.config['SECRET_KEY'] = 'super secret key'

@app.route('/')
def index():
    return 'Hello World!'

@app.route('/FileUpload',methods=['GET', 'POST'])
def parseFile():
    print('received',request.files['file'].filename,file=sys.stdout)
    file = request.files['file']
    file.save(os.path.join('uploads/', request.files['file'].filename))
    result = PredictChapter(request.files['file'].filename)
    global_result_file = open('global_results.txt','a')
    global_result_file.write(str([x[1] for x in result]))
    print('parsed',request.files['file'].filename,file=sys.stdout)
    return jsonify(result=result)

@app.route('/NotesUpload',methods=['GET', 'POST'])
def saveFile():
    print('received',request.files['file'].filename,file=sys.stdout)
    file = request.files['file']
    file.save(os.path.join('notes/', request.files['file'].filename))
    print('saved',request.files['file'].filename,file=sys.stdout)
    return jsonify(result='Saved successfully.')

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=8000)