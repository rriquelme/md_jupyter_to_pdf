# Markdown/Jupyter NB to pdf with a custom template

## Purpose:
Being able to generate a good pdf starting from Jupyter Notebook and from markdown made on GitHub \

## Objective:

Create a Dockerfile that is able to generate the output desired just using a custom template for the latex.

## Difficulties:

### While making the project:

The trigger for this must be quite easy and hopefully not have to program too much with it. \
There are some choices to be made for example if this will be just for converting or also for development. \
The program will have to have 2 modes of use, one to rerun the jupyter using custom environment and the other one just to print whatever is stored in the notebook on the last run, this could be maybe simplified only using the second approach.

### Once the project is working:
The custom docker image could not be as lightweight as one may expect and may take several minutes to run \
There are 2 ideas right now, integrate all in a single dockerfile and try to figure it out later how to make it weight less, the other option would be to orchestrate multiple alpine docker images and make them work together to minimize the download time, etc.