from django.db import models
import uuid
from enum import Enum

class Task(models.Model): 
  """Database model for tasks"""
  task_id: models.UUIDField(primary_key=True, default=uuid.uuid4)
  created_by: models.CharField(max_length=100)
  task_description: models.TextField()
  task_name: models.CharField(max_length=100)
  task_status: models.CharField(max_length=100)
  is_complete: models.BooleanField

  def get_task_id(self): 
    return self.task_id
  
  def get_created_by(self): 
    return self.created_by
  
  def __str__(self):
    return self.task_id


