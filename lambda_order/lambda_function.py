import boto3


def lambda_handler(event, context):
    return {
        "status_code": 200,
        "body": "hello world"
    }
