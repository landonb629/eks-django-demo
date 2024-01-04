from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response

class HelloApiView(APIView): 
  """Test API View"""
  def get(self, request, format=None):
    """Returns a list of APIView features"""
    print(request.body)
    return Response({'message': 'Hello'})
