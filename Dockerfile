FROM --platform=linux/amd64 python:3.9-slim


RUN mkdir /src
WORKDIR /src

RUN pip install rasa
RUN pip install rasa[spacy]
RUN pip install spacy

RUN python -m spacy download nb_core_news_lg