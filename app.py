from flask import Flask, request, jsonify
from transformers import pipeline

app = Flask(__name__)

@app.route('/')
def index():
    return 'Text annotation service is up and running :D'

@app.route('/classifySentence/', methods=['PUT'])
def hello_world():
    classifier = pipeline("zero-shot-classification", model='valhalla/distilbart-mnli-12-3')

    sentence = request.json["sentence"]
    labels = request.json["labels"]

    result = classifier(sentence, labels)

    return jsonify(result)
