import boto3

def lambda_hander(event, context):
    return {
        "status_code": 200,
        "body": "hello world"
    }