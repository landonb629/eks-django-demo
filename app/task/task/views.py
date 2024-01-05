from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from task import serializers


class HelloApiView(APIView): 
  serializer_class = serializers.HelloSerializer
  
  def get(self, request, format=None):
    print(request)
    return Response({'message': 'Hello'})
  
  def post(self, request):
    serializer = self.serializer_class(data=request.data)
    if serializer.is_valid():
      task_name = serializer.validated_data.get('task_name')
      return Response({'task': task_name}, status=200)
    else:
      return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
