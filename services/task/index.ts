import express, {Express, Request, Response} from "express" 
import { PrismaClient } from "@prisma/client"
import cors from 'cors'
import "reflect-metadata"
const app = express()

app.use(express.json())
app.use(cors())

let prisma = new PrismaClient()
/**
 * Task API - users CRUD tasks
 * endpoint: task.empower.com/task/
 */

const connectionTest = async () => { 
  try { 
    await prisma.$queryRaw`SELECT 1`
    console.log("Successful connection to database")
  } catch(error) { 
    console.log(error)
  }
}

/**
 * all tasks
 */
app.get("/", async (req: Request, res: Response) => { 
  try { 
    let tasks = await prisma.task.findMany()
    if (tasks.length > 0) { 
      return res.status(200).json(tasks)
    } else { 
      return res.status(200).json({"msg": "no tasks created yet"})
    }
  } catch(error) { 
    return res.status(500).json({"error": error})
  }
})

/**
 * single task
 */
app.get("/:task_id", async (req: Request, res: Response) => { 
  res.status(200).json({"msg": "found"})
})

/**
 * create task
 */

app.post("/", async (req, res) => { 
  try { 
    if (req.body.task_name && req.body.task_description && req.body.created_by && req.body.task_status) { 
      let task = await prisma.task.create({
        data: { 
          task_name: req.body.task_name, 
          task_description: req.body.task_description,
          task_status: req.body.task_status,
          created_by: req.body.created_by
        }
      })
      console.log(task)
      return res.status(200).json({"msg": "task created"})
    } else { 
      return res.status(500).json({"msg": "please make sure all fields are provided"})
    }
  } catch(error) { 
    return res.status(500).json({"error": error})
  }
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

app.listen(3030, async () => { 
  await connectionTest()
  console.log('task application listening')
})