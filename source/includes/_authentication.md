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

> The above script command returns JSON structured like this:

```json
{
    "access_token": "OBs8bc5PdrzQNd3FaMRp5CkHFhinD9",
    "token_type": "Bearer",
    "expires_in": 36000,
    "refresh_token": "tEonECLhjMlLf4ZWs56LT43HOrivEt",
    "scope": "read write"
}
```
All the API requests to SQUAD are authenticated via `Bearer` auth.

Use this API to generate an access token that can be used for authentication in subsequent API requests.

### HTTP Request

`POST https://app.squadrun.co/oauth/token/`


### Request Content-Type

`application/x-www-form-urlencoded`

### Body Parameters

| Parameter   | Required  | Description   |
|---------------  |---------- |------------------------------------------------------------ |
| `client_id`   | True  | Client Identifier   |
| `client_secret`   | True  | Client Secret   |
| `grant_type`  | True  | "password" is the grant_type that should be sent initially  |
| `username`  | True  | Username related to the client_id|
| `password`  | True  | Password for the above username|


### Response Content-Type

`application/json`


### Response Format

| Parameter    |Description   |
|-------------|------------------------------------------------------------ |
| `access_token`    |Access token to be used to authenticate every request.|
| `refresh_token`    |Refresh token to be used to get a refreshed access token.|
| `token_type`   | Bearer |
| `expires_in`  | Seconds after which the access token will expire. Once the access token has expired, you'll need the `refresh_token` to get a new access token.   |
| `scope`| Scopes granted for the access token|


### How to get the credentials
They can be found by signing up on SquadVoice's [Client Dashboard](https://app.squadvoice.co/voice/dashboard/).

`client_id` and `client_secret` can be found on the [API Integration Page](https://app.squadvoice.co/voice/dashboard/) on the dashboard.



<aside class="notice">
  <code>/oauth/token/</code> endpoint accepts data as a POST form and not a json dump unlike rest of the APIs below
</aside>


## Refresh Access Token

```python
import requests

url = "https://app.squadrun.co/oauth/token/"
payload = {
  "grant_type": "refresh_token", 
  "client_id": "test_client_id", 
  "client_secret": "test_client_secret", 
  "refresh_token": "refresh_token_value", 
}

response = requests.post(url, payload)
response.json()
```

```shell
curl -X POST -d \
"client_id=test_client_id&client_secret=test_client_secret
&grant_type=refresh_token&refresh_token=rfresh_token_value" \https://app.squadrun.co/oauth/token/
```

> The above script command returns JSON structured like this:

```json
{
    "access_token": "OBs8bc5PdrzQNd3FaMRp5CkHFhinD9",
    "token_type": "Bearer",
    "expires_in": 36000,
    "refresh_token": "tEonECLhjMlLf4ZWs56LT43HOrivEt",
    "scope": "read write"
}
```
Use this API to refresh the access token.

### HTTP Request

`POST https://app.squadrun.co/oauth/token/`


### Request Content-Type

`application/x-www-form-urlencoded`

### Request Body Parameters

| Parameter   | Required  | Description   |
|---------------  |---------- |------------------------------------------------------------ |
| `client_id`   | True  | Client Identifier   |
| `client_secret`   | True  | Client Secret   |
| `grant_type`  | True  | `refresh_token` is the grant_type at this stage.|
| `refresh_token`  | True  | Refresh token that we got in the response for the get access token.|



### Response Content-Type

`application/json`


### Response Format

| Parameter    |Description   |
|-------------|------------------------------------------------------------ |
| `access_token`    |New access token to be used to authenticate every request.|
| `refresh_token`    |New refresh token to be used to get a refreshed access token.|
| `token_type`   | Bearer |
| `expires_in`  | Seconds after which the access token will expire. Once the access token has expired, you'll need the `refresh_token` to get a new access token.   |
| `scope`| Scopes granted for the access token|


## Revoke the Access Token

```python
import requests

url = "https://app.squadrun.co/oauth/revoke_token/"
payload = {
  "client_id": "test_client_id", 
  "client_secret": "test_client_secret", 
  "token": "your_access_token", 
}

response = requests.post(url, payload)
response.json()
```

```shell
curl -X POST -d \
"client_id=test_client_id&client_secret=test_client_secret
&token=your_access_token" \https://app.squadrun.co/oauth/revoke_token/
```

Use this API to revoke the access token.

### HTTP Request

`POST https://app.squadrun.co/oauth/revoke_token/`


### Request Content-Type

`application/x-www-form-urlencoded`

### Request Body Parameters

| Parameter   | Required  | Description   |
|---------------  |---------- |------------------------------------------------------------ |
| `client_id`   | True  | Client Identifier   |
| `client_secret`   | True  | Client Secret   |
| `token`  | True  | Token that we want to refresh|



### Response Content-Type

`text/html; charset=utf-8`
