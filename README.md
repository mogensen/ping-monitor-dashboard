uptest
======

Build on the uptime script from https://github.com/NickSto/uptest

For a quick and simple internet connectivity monitor, run `$ bash uptest.sh`. This will ping google.com every 5 seconds and show your latency and whether the ping was dropped.

## Docker Compose setup

Start the ping-containers and the Humio container.

    docker-compsose up -d

Visit `http://localhost:8081/sandbox` for ping data. 

To see the latency as a timechart in humio goto:

    http://localhost:8081/sandbox/search?widgetType=time-chart&query=timechart(span%3D5s%2C%20series%3Dhost%2C%20function%3Dmax(ping))&live=true&start=15m&fullscreen=true

To se Piechart over package status:

    http://localhost:8081/sandbox/search?widgetType=pie-chart&query=groupBy(status)&live=true&start=15m&fullscreen=true

To create a real dashboard in Humio run the following scritp.

    ./add-dashboard.sh
