
gcloud auth login




cat << EOF > request.json
{
    "contents": [
        {
            "role": "user",
            "parts": [
            ]
        }
    ]
    , "generationConfig": {
        "responseModalities": ["TEXT"]
        ,"temperature": 1
        ,"maxOutputTokens": 8192
        ,"topP": 0.95
    },
    "safetySettings": [
        {
            "category": "HARM_CATEGORY_HATE_SPEECH",
            "threshold": "OFF"
        },
        {
            "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
            "threshold": "OFF"
        },
        {
            "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
            "threshold": "OFF"
        },
        {
            "category": "HARM_CATEGORY_HARASSMENT",
            "threshold": "OFF"
        }
    ]
}
EOF

PROJECT_ID="qwiklabs-gcp-04-1a1c69b31e55"
LOCATION_ID="us-central1"
API_ENDPOINT="us-central1-aiplatform.googleapis.com"
MODEL_ID="gemini-2.0-flash-exp"
GENERATE_CONTENT_API="streamGenerateContent"

curl \
-X POST \
-H "Content-Type: application/json" \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
"https://${API_ENDPOINT}/v1/projects/${PROJECT_ID}/locations/${LOCATION_ID}/publishers/google/models/${MODEL_ID}:${GENERATE_CONTENT_API}" -d '@request.json'
