from rest_framework import serializers 

class HelloSerializer(serializers.Serializer):
  """ Serializers a name field for testing out API view """
  task_name = serializers.CharField(max_length = 100)
  