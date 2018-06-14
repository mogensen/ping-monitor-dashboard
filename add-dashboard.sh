#!/bin/bash

TOKEN=none
DATASPACE=sandbox
HOST=http://localhost:8081

curl -0 -v "$HOST/api/v1/dataspaces/$DATASPACE/dashboards/" \
-H 'Content-Type: application/json; charset=utf-8' \
-H "Authorization: Bearer $TOKEN" \
-d @- << EOF
{
    "name": "Ping stats",
    "widgets": [
        {
            "id": "6bd03b1f-dd38-46fd-936a-3c4b4d0f798f",
            "title": "Dropped packets",
            "options": {
                "x": 0,
                "y": 6,
                "height": 4,
                "visualisation": {
                    "s": "",
                    "plY": "",
                    "stp": "y",
                    "sc": "lin",
                    "mx": "",
                    "widgetType": "time-chart",
                    "legend": "y",
                    "connect-points": "",
                    "lx": "",
                    "p": "a",
                    "ly": "",
                    "mn": "",
                    "pl": "",
                    "op": "0.4"
                },
                "width": 9
            },
            "query": {
                "queryString": "DROPPED| timechart(series=host, function=count())",
                "end": "now",
                "showQueryEventDistribution": false,
                "isLive": true,
                "start": "30m"
            }
        },
        {
            "id": "4ccb68f1-c834-4eed-a415-02f591890c7e",
            "title": "Ping ms",
            "options": {
                "x": 0,
                "y": 0,
                "height": 6,
                "visualisation": {
                    "s": "",
                    "plY": "",
                    "stp": "y",
                    "sc": "lin",
                    "mx": "",
                    "widgetType": "time-chart",
                    "legend": "y",
                    "connect-points": "",
                    "lx": "",
                    "p": "a",
                    "ly": "",
                    "mn": "",
                    "pl": "",
                    "op": "0.4"
                },
                "width": 9
            },
            "query": {
                "queryString": "timechart(series=host, function=max(ping))",
                "end": "now",
                "showQueryEventDistribution": false,
                "isLive": true,
                "start": "30m"
            }
        },
        {
            "id": "6d2eb0bf-4d7d-4764-a2f3-64fe6f42dbee",
            "title": "Status overview",
            "options": {
                "x": 9,
                "y": 0,
                "height": 4,
                "visualisation": {
                    "widgetType": "pie-chart"
                },
                "width": 3
            },
            "query": {
                "queryString": "groupBy(status)",
                "end": "now",
                "showQueryEventDistribution": false,
                "isLive": true,
                "start": "30m"
            }
        }
    ],
    "readOnlyTokens": []
}
EOF
