const express = require("express")
const cors = require("cors")
const app = express()

app.use(express.json())
app.use(cors())

/**
 * Task API - users CRUD tasks
 * endpoint: task.empower.com/task/
 */

/**
 * all tasks
 */
app.get("/", async (req, res) => { 
  try { 
    console.log(req)
    res.status(200).send({"msg": "response"})
  } catch(error) { 
    return {"error": error}
  }
})

/**
 * single task
 */
app.get("/:task_id", async (req, res) => { 
  res.status(200).json({"msg": "found"})
})

/**
 * create task
 */

app.post("/", async (req, res) => { 
  res.status(200).json({"msg": "create"})
})

/**
 * edit task
 */
app.patch("/:task_id", async (req, res) => { 
  res.status(200).json({"msg": "edit"})
})

/**
 * delete task
 */
app.delete("/:task_id", async (req, res) => { 
  res.status(200).json({"msg": "delete"})
})

app.listen(3030, () => { 
  console.log('task application listening')
})