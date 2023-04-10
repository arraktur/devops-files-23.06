from flask import Flask, jsonify
import datetime

app = Flask(__name__)
@app.route('/date')
def index():
  dateNow = datetime.datetime.now().strftime("%Y.%m.%d-%H:%M:%S")
  return jsonify(date=dateNow)

if __name__ == '__main__':
  app.run(debug=False, host='0.0.0.0', port='8080')