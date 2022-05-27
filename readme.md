# Rasa via docker-compose

This is a minimal example of training Rasa models, and deploying them via a custom action server 
using docker-compose.


1. Build action server image via 

```
docker build . -t rasa_action:latest -f Dockerfile_action
``` 

2. Build custom rasa image via 

```
docker build . -t rasa_custom -f Dockerfile
``` 

3. Train a model using the custom image via

```
docker run --mount type=bind,source="${PWD}",target=/src rasa_custom rasa train
```

4. Deploy trained model via custom image and action server via custom action server image using docker-compose

```
docker-compose up -d
```

5. Test the bot
```
curl -XPOST http://localhost:5005/webhooks/rest/webhook   -H "Content-type: application/json"   -d '{"sender": "test", "message": "hello"}'
curl -XPOST http://localhost:5005/webhooks/rest/webhook   -H "Content-type: application/json"   -d '{"sender": "test", "message": "bye"}'
```