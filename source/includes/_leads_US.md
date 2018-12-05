# Leads

## Create a Lead

```python
import requests
import json

url = "https://app.squadrun.co/api/v1/leads/create/{campaign_id}/"
payload = [
    {
    "lead_id": 1,
    "phone_number": "{valid phone number}",
    "contact_name": "John Doe"
    "{custom_field_1}": "{custom_value}",
    "{custom_field_2}": "{custom_value}"
    },
    {
    "lead_id": 2,
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
curl 'https://app.squadrun.co/api/v1/leads/create/{campaign_id}/' \
-H 'Authorization: Bearer test_token' \
-H 'Content-Type: application/json' \
--data-binary $'{"lead_id": 1, "phone_number": "{valid phone number}", \
"contact_name": "John Doe", "{custom_field_1}": "{custom_value}", "{custom_field_2}": "{custom_value}"}'
```

Use this API to create a new Lead in your Squadvoice Campaign.

### HTTP Request

`POST https://app.squadrun.co/api/v1/leads/create/{campaign_id}/`

### Headers

| Parameter 	| Value 	|
|---------------	|-------------------------	|
| Content-Type 	| "application/json" 	|
| Authorization 	| "Bearer {access_token}" 	|

### Path Parameters

| Parameter   | Required  | Description   |
|-------------  |---------- |------------------------ |
| campaign_id   | True  | The ID of the Campaign  |

### Body Parameters

| Parameter   | Required  | Description   |
|-------------- |---------- |------------------------------------ |
| lead_id   | True  | Unique Identifier of the Lead  |
| phone_number  | True  | Valid phone number of the Lead  |
| contact_name  | True  | Name of the Lead being contacted  |
| state_code    | True  | Two letter State Code          |
| ebr_datetime  | False | EBR Datetime for the Lead      |
| custom_field  | True  | Any key value pair other than this  |

<aside class="success">
  <b>Data Security</b>
  <p>
    Goes without saying your data is secure with us. :)<br>
    We protect your Lead’s phone number by masking them. This way the <code>phone_number</code> you share with us is never shared with our reps.
  </p>
</aside>


## Get Leads

```python
import requests

url = "https://app.squadrun.co/api/v1/leads/responses/{campaign_id}/?page_size=1"

headers = {"Authorization": "Bearer test_token"}

params = {
    "min_called_at": 1479973282000, 
    "lead_id": 8
}

response = requests.get(url, params=params, headers=headers)
response.json()
```

```shell
curl 
-H "Authorization: Bearer test_token" 
-X GET "https://app.squadrun.co/api/v1/leads/responses/{campaign_id}/?page_size=1"
```

> The above command returns JSON structured like this:

```json
{
    "count": 1,
    "next": "http://app.squadrun.co/api/v1/leads/responses/{campaign_id}/?page=2&page_size=1",
    "previous": null,
    "results": [
        {
            "lead_id": 10,
            "phone_number": "919899550412",
            "contact_number": "919899550412",
            "created_at": 1531409739413,
            "campaign_id": "0PT711",
            "country_code": "IN",
            "campaign_name": "{Name of the Campaign}",
            "contact_name": "John Doe",
            "call_attempt_keys": [],
            "last_call_attempt_keys": []
        }
    ]
}
```

Use this API to get information about a Lead/Leads.

### HTTP Request

`GET https://app.squadrun.co/api/v1/leads/responses/{campaign_id}/`

### Headers

| Parameter 	| Value 	|
|---------------	|-------------------------	|
| Content-Type 	| "application/json" 	|
| Authorization 	| "Bearer {access_token}" 	|

### Path Parameters

| Parameter   | Required  | Description   |
|-------------  |---------- |------------------------ |
| campaign_id   | True  | The ID of the Campaign  |

### Query Parameters

| Parameter   | Required  | Default   | Description   |
|---------------  |---------- |---------  |------------------------------------------------ |
| lead_id   | False   | -   | Unique Identifier of the Lead   |
| processed_after   | False   | -   | Epoch timestamp  |
| processed_before   | False   | -   | Epoch timestamp  |
| page  | False   | -   | Page number to return   |
| page_size   | False   | 100   | Number of leads to return per page  |

### Response Structure

The response you will get is a combination of some fixed keys and some dynamic keys based on the custom fields that you sent while creating the Lead, the stage at which the Lead is and how you have set up your campaign.

<strong>Fixed Keys</strong>

| Key   | Description   |
|------------------------ |---------------------------------------------------------------  |
| lead_id   | Unique Identifier of the Lead  |
| phone_number  | Phone number of the Lead  |
| contact_name  | Name of the Lead  |
| created_at  | Epoch timestamp   |
| campaign_id   | Campaign ID which you sent in the URL too   |
| campaign_name   | Name of the Campaign  |
| country_code  | Country Code   |
| state_code  | Two letter State Code  |
| call_attempt_keys   | List of keys that contain the answers of Call Attempts  |
| last_call_attempt_keys  | List of keys that contain the answer of the last call attempt   |
| total_cost | Cost of processing the Lead |

<strong>Extra keys if the Lead is Processed</strong>

| Key   | Description   |
|-------------- |-------------------------------- |
| processed_at   | Epoch timestamp for when the Lead was processed |
| outcome_name  | Phone number of the Lead  |
| outcome_id  | Name of the Lead  |

<aside class='notice'>
  <b>Response format</b>
  <p>
    Response format differs by the type of outreach you choose in your Campaign.<br>
    Please find an extensive documentation here: <a href="#response-formats">Response formats</a>
  </p>
</aside>

## Disable a Lead

```python
import requests
import json

url = "https://app.squadrun.co/api/v1/leads/disable/{campaign_id}/"
payload = [
    {"lead_id": 1},
    {"lead_id": 2}
]
headers = {
    "Authorization": "Bearer test_token", 
    "Content-Type": "application/json"
}

response = requests.post(url, json.dumps(payload), headers=headers)
response.json()
```

```shell
curl 'https://app.squadrun.co/api/v1/leads/disable/{campaign_id}/' \
-H 'Authorization: Bearer test_token' \
-H 'Content-Type: application/json' \
--data-binary $'{"lead_id": 1}'
```

Use this API to disable a Lead in your Squadvoice Campaign.

### HTTP Request

`POST https://app.squadrun.co/api/v1/leads/disable/{campaign_id}/`

### Headers

| Parameter 	| Value 	|
|---------------	|-------------------------	|
| Content-Type 	| "application/json" 	|
| Authorization 	| "Bearer {access_token}" 	|

### Path Parameters

| Parameter   | Required  | Description   |
|-------------  |---------- |------------------------ |
| campaign_id   | True  | The ID of the Campaign  |

### Body Parameters

| Parameter     | Required  | Description   |
|-------------- |---------- |------------------------------------ |
| lead_id       | True  | Unique Identifier of the Lead  |
