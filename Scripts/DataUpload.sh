
az storage blob upload --account-name ejt3zbd5b6szsblob \
    --container-name data --file Data/car_insurance_claim.csv \
    --name car_insurance_claim.csv

az storage blob upload-batch -d adfjobs \
    --account-name adlsclusterstore992020 -s jobdata/

az storage fs directory create -n jars \
 -f adfjobs --account-name adlsclusterstore992020 

az storage fs directory create -n logs \
 -f adfjobs --account-name adlsclusterstore992020 

az storage fs directory create -n files \
 -f adfjobs --account-name adlsclusterstore992020 

az storage fs directory create -n pyFiles \
 -f adfjobs --account-name adlsclusterstore992020 

az storage fs directory create -n archives \
 -f adfjobs --account-name adlsclusterstore992020 

az storage blob upload --account-name adlsclusterstore992020 \
    --container-name dependency --file Scripts/spark-mssql-connector_2.11-1.1.0.jar \
    --name spark-mssql-connector_2.11-1.1.0.jar
