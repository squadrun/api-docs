# Authentication

## Get Access Token

```python
import requests

url = "https://app.squadrun.co/oauth/token/"
payload = {
  "grant_type": "password", 
  "client_id": "test_client_id", 
  "client_secret": "test_client_secret", 
  "username": "test_api_user", 
  "password": "test_api_user"
}

response = requests.post(url, payload)
response.json()
```

```shell
curl -X POST -d \
"client_id=test_client_id&client_secret=test_client_secret
&grant_type=password&username=test_api_user
&password=test_api_user" \https://app.squadrun.co/oauth/token/
```

> The above command returns JSON structured like this:

```json
{
    "access_token": "OBs8bc5PdrzQNd3FaMRp5CkHFhinD9",
    "token_type": "Bearer",
    "expires_in": 36000,
    "refresh_token": "tEonECLhjMlLf4ZWs56LT43HOrivEt",
    "scope": "read write"
}
```

Use this API to generate an access token that can be used for authentication in subsequent API requests.

### HTTP Request

`POST https://app.squadrun.co/oauth/token/`

### Body Parameters

| Parameter   | Required  | Description   |
|---------------  |---------- |------------------------------------------------------------ |
| client_id   | True  | Client Identifier   |
| client_secret   | True  | Client Secret   |
| grant_type  | True  | "password" is the grant_type that should be sent initially  |
| username  | True  | Username  |
| password  | True  | Password  |

### How to get the credentials
They can be found by signing up on SquadRun's [Client Dashboard](https://app.squadvoice.co/voice/dashboard/campaigns/).

`client_id` and `client_secret` can be found on the [API Integration Page](https://app.squadvoice.co/voice/dashboard/integrations/) on the dashboard.



<aside class="notice">
  <code>/oauth/token/</code> endpoint accepts data as a POST form and not a json dump unlike rest of the APIs below
</aside>