@app.get("/")
def root():
    return {"message": "SwiftCart Backend Running 🚀"}

@app.get("/health")
def health():
    return {"status": "ok"}