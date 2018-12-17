# Leads

## Create Leads

```python
import requests
import json

url = "https://app.squadrun.co/api/v4/leads/create/{campaign_id}/"
payload = [
    {
    "lead_id": "uniqueleadid1",
    "phone_number": "{valid phone number}",
    "contact_name": "John Doe"
    "{custom_field_1}": "{custom_value}",
    "{custom_field_2}": "{custom_value}"
    },
    {
    "lead_id": "uniqueleadid2",
    "phone_number": "{valid phone number}",
    "contact_name": "John Smith"
    "{custom_field_1}": "{custom_value}",
    "{custom_field_2}": "{custom_value}"
    }
]
headers = {
    "Authorization": "Bearer test_token", 
    "Content-Type": "application/json"
}

response = requests.post(url, json.dumps(payload), headers=headers)
response.json()
```

```shell
curl 'https://app.squadrun.co/api/v4/leads/create/{campaign_id}/' \
-H 'Authorization: Bearer test_token' \
-H 'Content-Type: application/json' \
--data-binary $'[{"lead_id": 1, "phone_number": "{valid phone number}", \
"contact_name": "John Doe", "{custom_field_1}": "{custom_value}", "{custom_field_2}": "{custom_value}"}]'
```

Use this API to create new Leads in your SquadVoice Campaign.

### HTTP Request

`POST https://app.squadrun.co/api/v4/leads/create/{campaign_id}/`


### Request Content-Type

`application/json`


### Request Headers

| Parameter 	| Value 	|
|---------------	|-------------------------	|
| Content-Type 	| `application/json` 	|
| Authorization 	| `Bearer {access_token}` 	|

You will have to replace `{access_token}` with access token you get from [SquadVoice Dashboard](https://app.squadvoice.co/voice/dashboard/integrations/)


### Path Parameters

| Parameter   | Required  | Description   |
|-------------  |---------- |------------------------ |
| `{campaign_id}`   | True  | Unique Identifier of the Campaign (You can get your campaign_id by contacting `voicesales@squadrun.co`)|


### Request Body Parameters

| Parameter   | Required  | Description   |
|-------------- |---------- |------------------------------------ |
| `lead_id`   | True  | Unique Identifier of the Lead for the campaign.|
| `phone_number`  | True  | A valid indian phone number of the Lead.|
| `contact_name`  | True  | Name of the Lead being contacted  |
| `custom_field` | True  | Any data in key value pair about the lead required for the campaign|
| `custom_field`  | True  | Any data in key value pair about the lead required for the campaign  |

<aside class="success">
  <b>Data Security</b>
  <p>
    Goes without saying, your data is secure with us. :)<br>
    We protect your Lead’s phone number by masking them. This way the <code>phone_number</code> you share with us is never shared with our reps.
  </p>
</aside>


### Response

`201 Created` if the leads were successfully created.

`403 Forbidden` if the request authentication was not successful.

`400 Bad Request` if the request payload had some error. Specific error is provided in the response.


## Get Leads

```python
import requests

url = "https://app.squadrun.co/api/v4/leads/responses/{campaign_id}/?page_size=1"

headers = {"Authorization": "Bearer test_token"}

params = {
    "lead_id": "test_lead_id"
}

response = requests.get(url, params=params, headers=headers)
response.json()
```

```shell
curl 
-H "Authorization: Bearer test_token" 
-H 'Content-Type: application/json' \
-X GET "https://app.squadrun.co/api/v4/leads/responses/{campaign_id}/?lead_id=test_lead_id&page_size=1"
```

> The above script returns JSON structured like this:

```json
{
	"count": 1,
	"next": null,
	"previous": null,
	"results": [
		{
			"phone_number": "+91xxxxxxxxxx",
			"lead_id": "test_lead_id",
			"latest_recording_url": "https://www.squadvoice.in/",
			"campaign_id": "{campaign_id}",
			"latest_called_at": "2018-12-03T14:36:38+00:00",
			"lead_outcome": "Connected : Objective Met",
			"processed_at": "2018-12-03T14:37:54+00:00",
			"contact_name": "John Doe",
			"created_at": "2018-12-03T14:36:01+00:00",
			"lead_responses": {
				"response_key_1": "response_value_1",
				"response_key_2": "response_value_2",
				"response_key_3": "response_value_3",
			}
		}
	]
}
```

Use this API to get information about a Lead/Leads that has been processed by SquadVoice.

### HTTP Request

`GET https://app.squadrun.co/api/v4/leads/responses/{campaign_id}/`

### Request Content-Type
`application/json`


### Request Headers

| Parameter 	| Value 	|
|---------------	|-------------------------	|
| `Content-Type` 	| `application/json` 	|
| `Authorization` 	| `Bearer {access_token}` 	|

You will have to replace `{access_token}` with access token you get from [SquadVoice Dashboard](https://app.squadvoice.co/voice/dashboard/integrations/)


### Request Path Parameters

| Parameter   | Required  | Description   |
|-------------  |---------- |------------------------ |
| `{campaign_id}`   | True  | Unique Identifier of the Campaign (You can get your campaign_id by contacting `voicesales@squadrun.co`)|

### Request Query Parameters

| Parameter   | Required  | Default   | Description   |
|---------------  |---------- |---------  |------------------------------------------------ |
| `lead_id`   | False   | -   | Unique Identifier of the Lead for the campaign.   |
| `processed_after`   | False   | -   | Epoch timestamp |
| `processed_before`   | False   | -   | Epoch timestamp  |
| `page`  | False   | -   | Page number to return   |
| `page_size`   | False   | 100   | Number of leads to return per page  |


### Response Structure


| Key   | Description   |
|------------------------ |---------------------------------------------------------------  |
| `lead_id`   | Unique Identifier of the Lead for the campaign. |
| `phone_number`  | Phone number of the Lead  |
| `contact_name`  | Name of the Lead  |
| `created_at`  | Epoch timestamp   |
| `campaign_id`   | Campaign ID which you sent in the URL too   |
| `latest_recording_url` | Latest call recording of the conversation with the lead. |
| `latest_called_at` | Date and time at which latest call was made to the lead. ISOFORMAT(`%Y-%m-%dT%H:%M:%S`)|
| `lead_outcome` | Outcome for the lead. |
| `processed_at` | Date and time at which the lead was processed. ISOFORMAT(`%Y-%m-%dT%H:%M:%S`) |
| `lead_responses` | JSON object containing responses captured for the lead as key-value pairs. |


### Response Content-Type
`application/json`


### Response Status Code

`200 OK` for a successful request.

`403 Forbidden` if the request authentication was not successful.

`400 Bad Request` if the request payload had some error. Specific error is provided in the response.


## Disable one or more leads.

```python
import requests
import json

url = "https://app.squadrun.co/api/v4/leads/disable/{campaign_id}/"
payload = [
    {"lead_id": "uniqueleadid1"},
    {"lead_id": "uniqueleadid2"}
]

headers = {
    "Authorization": "Bearer test_token", 
    "Content-Type": "application/json"
}

response = requests.post(url, json.dumps(payload), headers=headers)
response.json()
```

```shell
curl 'https://app.squadrun.co/api/v4/leads/disable/{campaign_id}/' \
-H 'Authorization: Bearer test_token' \
-H 'Content-Type: application/json' \
--data-binary $'{"lead_id": 1}'
```

Use this API to disable a Lead in your SquadVoice Campaign.
Disabling the lead will stop all reach-outs on it.

### HTTP Request

`POST https://app.squadrun.co/api/v4/leads/disable/{campaign_id}/`

### Request Content-Type
`application/json`


### Request Headers

| Parameter 	| Value 	|
|---------------	|-------------------------	|
| `Content-Type` 	| `application/json` 	|
| `Authorization` 	| `Bearer {access_token}` 	|

You will have to replace `{access_token}` with access token you get from [SquadVoice Dashboard](https://app.squadvoice.co/voice/dashboard/integrations/)


### Request Path Parameters

| Parameter   | Required  | Description   |
|-------------  |---------- |------------------------ |
| `{campaign_id}`   | True  | Unique Identifier of the Campaign (You can get your campaign_id by contacting `voicesales@squadrun.co`)|

### Request Body Parameters

| Parameter   | Required  | Description   |
|-------------- |---------- |------------------------------------ |
| `lead_id`   | True  | Unique Identifier of the Lead  |

### Response Status Code

`201 OK` for a successful request.

`403 Forbidden` if the request authentication was not successful.

`400 Bad Request` if the request payload had some error. Specific error is provided in the response.
