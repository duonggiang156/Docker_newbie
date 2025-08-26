from fastapi import FastAPI

app = FastAPI()

@app.get('/')
def hello():
    return "Hello, Docker!"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000) 