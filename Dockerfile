FROM python:3.6
RUN mkdir /socmonitor
COPY requirements.txt /socmonitor
WORKDIR /socmonitor
RUN pip install --no-cache-dir -r requirements.txt
COPY . /socmonitor
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
apt-get install tzdata && \
dpkg-reconfigure --frontend noninteractive tzdata
RUN pip install -r requirements.txt && pybabel compile -d babel/translations
