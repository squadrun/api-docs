# Leads

## Create a Lead

```python
import requests
import json

url = "https://app.squadrun.co/api/v1/leads/create/{campaign_id}/"
payload = {
    "phone_number": "{valid phone number}",
    "lead_id": "{same as phone_number}",
    "contact_name": "John Doe",
    "affiliate_id": "C457F"
    "{custom_field_1}": "{custom_value}",
    "{custom_field_2}": "{custom_value}"
}
headers = {
    "Authorization": "Bearer {access_token}",
    "Content-Type": "application/json"
}

response = requests.post(url, json.dumps(payload), headers=headers)
response.json()
```

```shell
curl 'https://app.squadrun.co/api/v1/leads/create/{campaign_id}/' \
-H 'Authorization: Bearer {access_token}' \
-H 'Content-Type: application/json' \
--data-binary $'{"phone_number": "{valid phone number}", "lead_id": "{same as phone_number}", \
"contact_name": "John Doe", "affiliate_id": "C457F", "{custom_field_1}": "{custom_value}", "{custom_field_2}": "{custom_value}"}'
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
| lead_id   | True  | Same as phone_number  |
| phone_number  | True  | Valid phone number of the Lead  |
| contact_name  | True  | Name of the Lead being contacted  |
| affiliate_id  | True  | Unique ID for each Affiliate  |
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
