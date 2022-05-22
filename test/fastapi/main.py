from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI()


@app.get("/api/user")
async def root():
    with open('user.json') as f:
        user = f.read()
    return HTMLResponse(content=user, status_code=200)
