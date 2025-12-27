# event-driven-architecture
Goal: Build systems that react to events (like a file upload) automatically.

Architecture
User Uploads File -> S3 Event -> Lambda Function -> Process File -> Send Notification (SNS)

Steps
Create an S3 Bucket

This will be the trigger source.
Create a Lambda Function

Write a small Python/Node.js script to process the file (e.g., resize an image).
Connect Trigger

Configure S3 to trigger the Lambda function whenever a new file is uploaded.
Add Notifications

Have the Lambda function send a message to an SNS Topic (email/SMS) when done.
Key Concepts
Decoupling: Components don't talk directly; they just emit events. If one part breaks, it doesn't crash the whole system.
Serverless: Lambda runs your code only when needed. You pay per millisecond.
