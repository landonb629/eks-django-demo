from fastapi import FastAPI, Path
from database import get_db

app = FastAPI()

inventory = { 
  1: { 
    "name": "web server",
    "OS": "linux",
    "Price": 50
  },
  2: { 
    "name": "Lambda function",
    "Runtime": "Node",
    "Price": 23
  }
}

@app.get("/")
def home():
  return {"Data": "Test"}

@app.get("/items/{item_id}")
def single_item(item_id: int):
  if item_id not in inventory:
    return {"msg": "Item not in inventory"}
  return inventory[item_id]