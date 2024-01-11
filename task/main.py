from flask import Flask
from flask_restful import Api, Resource,reqparse, abort
import uuid
# 41:36 in video
app = Flask(__name__)
api = Api(app)

"""
Tasks should have the following fields:
- task_id
- created_by (maps to user_id)
- task_name
- task_description
- task_status
- task_due_date
"""


task_post_args = reqparse.RequestParser()
task_post_args.add_argument("task_name", type=str, help="task must have a name")
task_post_args.add_argument("task_description", type=str, help="task must have a description")
""" Class that is a resource, this resource will handle some methods"""

all_task_get_args = reqparse.RequestParser()
#alltask_get_args.add_argument("task_id", type=str, help="must provide a task_id")
all_task_get_args.add_argument("user_id", type=str, help="must provide a created_by field")

tasks = {"task_id": "1"}
def abort_if_task_id_doesnt_exist(task_id):
  if task_id not in tasks:
    abort(404, message="Task id not valid")

def abort_if_task_exists(task_id):
  if task_id in tasks:
    abort(409, message="task with this ID already exists")

class Tasks(Resource):
  def get(self, task_id):
    abort_if_task_id_doesnt_exist(task_id)
    return tasks['task_id']
  
  def post(self, task_id):
    abort_if_task_exists(task_id)
    args = task_post_args.parse_args()
    task_id = uuid.uuid4().hex
    args["task_id"] = task_id
    args["task_status"] = "NOT_STARTED"
    print(args)
    return {"task_id": task_id}
  
  def delete(self, task_id):
    abort_if_task_id_doesnt_exist(task_id)
    return {"message": "deleted successfully"}, 200


api.add_resource(Tasks, "/task/<string:task_id>")

if __name__ == "__main__":
  app.run(debug=True)