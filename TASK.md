Tasks
1. Develop a basic data retrieval layer (repository) in the architecture you are most
familiar with. Ensure the layer supports automatic retries:
The API is very unstable. Once in a while, the API will return HTTP 500. At that
moment, the download needs to retry. Ensure the data is complete, so that all
records are downloaded successfully.
2. Bring the data into a Flutter App and display the “xAcc”, “yAcc”,
“zAcc” parameters in a combined line chart.