export AUTH_TOKEN="INSERT_SML_BEARER_TOKEN"

gcloud storage cp gs://spls/cbl455/cbl455.tar.gz .
tar -xvf cbl455.tar.gz

export ENDPOINT="https://sml-api-vertex-kjyo252taq-uc.a.run.app/vertex/predict/tabular_classification"

export INPUT_DATA_FILE="INPUT-JSON" 

./smlproxy tabular \
  -a $AUTH_TOKEN \
  -e $ENDPOINT \
  -d $INPUT_DATA_FILE
