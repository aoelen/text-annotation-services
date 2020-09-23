FROM pytorch/pytorch

WORKDIR /app

# Update requirements. If this file changes, everything else must be re-built.
COPY requirements.txt /app

# Install pip and java (needed for tabula), install git (needed for installing a python package from a git repo)
#RUN apt-get -qqy update && \
#    apt-get -qqy install python3-pip wget default-jre git

# Install dependencies
RUN pip install --no-cache -r requirements.txt
#RUN python -m spacy download en_core_web_md

# Copy the rest. Prevent redundant copying of models.
COPY *.py /app/

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]
