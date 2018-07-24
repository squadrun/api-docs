# Response Formats

SquadVoice's extensive API response sends each and every data point related to your campaign. That means, if an Email was sent out to the Lead, the API response will contain the information about the Email sent as well.

Some variables used in the `keys` are:

1. <strong>campaign_name</strong>: This is the name you set while creating the Campaign.
2. <strong>block_name</strong>: This is the name of the block you define in your sequence.


Following are the different formats for each outreach type.

## Call Attempt

```json
"call_attempt_{campaign_name}_1": [
    {
        "reference_id": "H8Y4RMP1",
        "outcome_id": 21,
        "outcome_name": "Wrong Number",
        "call_duration": 91,
        "called_at": 1531241588351,
        "report_keys_order": [
            "status", 
            "additional_notes", 
            "question_1", 
            "question_n"
        ],
        "status": "review_completed",
        "question_1": "answer 1",
        "additional_notes": "Ex boyfriend's number.",
        "question_n": "answer n"
    }
]
```

```json
"last_call_attempt_{campaign_name}_1": {
    "reference_id": "H8Y4RMP1",
    "outcome_id": 21,
    "outcome_name": "Wrong Number",
    "call_duration": 91,
    "called_at": 1531241588351,
    "report_keys_order": [
        "status", 
        "additional_notes", 
        "question_1", 
        "question_n"
    ],
    "status": "review_completed",
    "question_1": "answer 1",
    "additional_notes": "Ex boyfriend's number.",
    "question_n": "answer n"
}
```

A Call Attempt is made when you add a script etc. to the Campaign.

It adds the following `keys` to the `json` response:

1. <strong>call_attempt_{campaign_name}_1</strong>: Since for each Lead, we might make multiple attempts, we add each attempt to a list.
2. <strong>last_call_attempt_{campaign_name}_1</strong>: Also, to make it easy to consume without writing code, we send out the answers for the last call attempt that was made for that lead also separately in this key.


### Response Format

| Key   | Description   |
|------------------------ |---------------------------------------------------------------  |
| reference_id   | Unique Identifier of the Call Attempt  |
| outcome_id  | ID of the outcome of the Call Attempt  |
| outcome_name  | Name of the outcome  |
| call_duration  | Duration of the Call   |
| called_at   | Epoch timestamp   |
| report_keys_order   | List of keys in order of which they were asked by the Lead  |
| question_1  | answer 1 (these are based on the script that you created) |


## Gmail

```json
"gmail_{block_name}": {
    "cost": "PENDING OR NOT AVAILABLE",
    "google_email": "owlcity@gmail.com",
    "subject": "Owl City Subject",
    "to": "fireflies@gmail.com",
    "from": "owlcity@gmail.com",
    "sent_at": 1531241588351
}
```

It adds the following `keys` to the `json` response:

1. <strong>gmail_{block_name}</strong>

### Response Format

| Key   | Description   |
|------------------------ |---------------------------------------------------------------  |
| cost   | Cost for the operation  |
| google_email  | Email ID from which the email was sent  |
| subject  | Subject of the Email  |
| to  | Email ID of the recipient   |
| from   | Email ID of the Sender   |
| sent_at | Epoch timestamp of when the operation was performed |


## IVR

```json
"ivr_{block_name}": {
    "status": "PENDING OR NOT AVAILABLE",
    "cost": "PENDING OR NOT AVAILABLE",
    "text_to_speak": "Test Test",
    "multi_text_to_speak": {"owlcity": "fireflies"},
    "dtmf_response": "1",
    "duration": null,
    "sent_at": 1531241588351
}
```

It adds the following `keys` to the `json` response:

1. <strong>ivr_{block_name}</strong>

### Response Format

| Key   | Description   |
|------------------------ |---------------------------------------------------------------  |
| cost   | Cost for the operation  |
| status  | Status of the operation  |
| text_to_speak  | Text that was spoken  |
| multi_text_to_speak  | Multiple text that was spoken  |
| dtmf_response | Response by the Lead, if any |
| duration   | Number of seconds for which the IVR was played   |
| sent_at | Epoch timestamp of when the operation was performed |


## SMS

```json
"sms_{block_name}": {
    "status": "PENDING OR NOT AVAILABLE",
    "cost": "PENDING OR NOT AVAILABLE",
    "body": "Test Test",
    "sent_at": 1531241588351
}
```

It adds the following `keys` to the `json` response:

1. <strong>sms_{block_name}</strong>

### Response Format

| Key   | Description   |
|------------------------ |---------------------------------------------------------------  |
| cost   | Cost for the operation  |
| status  | Status of the operation  |
| body  | Body of the SMS  |
| sent_at | Epoch timestamp of when the operation was performed |
