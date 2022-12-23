# dynamic-questionnaire-form
This repo containts the ruby backend code for storing and retrieving the form
## System Dependencies
- Ruby 2.6.x ( Pref Latest 2.6.8)
- Postgres (Database)

## Installing System Dependencies

### For Ruby:
 - Follow this [link](https://rvm.io/rvm/install)
 - Once rvm is installed
 - Run ```rvm install ruby-2.6.8```

### For Postgresql

- Run ```brew install postgresql``` (Ensure that brew package manager is pre installed, installation guide [here](https://brew.sh/)

### Database creation
```rails db:create```
then followed up
```rails db:migrate```

### Running the Server

```bundle exec rails s```

### How to run the test suite
- Run `bundle exec rspec`

# Documentation on REST Endpoints

## Post Form Request Body
Path = {{BaseUrl}}/forms
```
{
    "name": "Test Form New",
    "description": "Test Description",
    "form_data": {
        "name": "Test QN 1",
        "answer_type": 0,
        "answers": [
            {
            "value": "test Child",
            "name": "Test Qn 0 Value",
            "answer_type": 1,
            "answers": [
            {
            "value": "Test Sub Child",
            "name": "Test Qn Sub Child Value",
            "answer_type": 1
            "answers" : ....
            }
            ]
        }
        ]
    }
}
```

## Index Forms

Path: {{BaseUrl}}/forms/
```
{
    "items": [
        {
            "id": 14,
            "name": "Test Form New",
            "description": "Test Description",
            "answers": [
                {
                    "id": 15,
                    "question_id": 25,
                    "value": "test Child",
                    "next_question_id": 26
                },
                {
                    "id": 16,
                    "question_id": 26,
                    "value": "Test Sub Child",
                    "next_question_id": null
                }
            ],
            "questions": [
                {
                    "id": 25,
                    "name": "Test QN 1",
                    "answer_type": "numerical"
                },
                {
                    "id": 26,
                    "name": "Test Qn 0 Value",
                    "answer_type": "text"
                }
            ],
            "created_at": "2022-12-22T18:13:09.527Z",
            "updated_at": "2022-12-22T18:13:09.527Z"
        },
        {
            "id": 15,
            "name": "Test Form New",
            "description": "Test Description",
            "answers": [
                {
                    "id": 17,
                    "question_id": 27,
                    "value": "test Child",
                    "next_question_id": 28
                },
                {
                    "id": 18,
                    "question_id": 28,
                    "value": "Test Sub Child",
                    "next_question_id": null
                }
            ],
            "questions": [
                {
                    "id": 27,
                    "name": "Test QN 1",
                    "answer_type": "numerical"
                },
                {
                    "id": 28,
                    "name": "Test Qn 0 Value",
                    "answer_type": "text"
                }
            ],
            "created_at": "2022-12-22T18:13:23.288Z",
            "updated_at": "2022-12-22T18:13:23.288Z"
        },
        {
            "id": 16,
            "name": "Test Form New",
            "description": "Test Description",
            "answers": [
                {
                    "id": 19,
                    "question_id": 29,
                    "value": "test Child",
                    "next_question_id": 30
                },
                {
                    "id": 20,
                    "question_id": 30,
                    "value": "Test Sub Child",
                    "next_question_id": null
                }
            ],
            "questions": [
                {
                    "id": 29,
                    "name": "Test QN 1",
                    "answer_type": "numerical"
                },
                {
                    "id": 30,
                    "name": "Test Qn 0 Value",
                    "answer_type": "text"
                }
            ],
            "created_at": "2022-12-22T18:13:52.498Z",
            "updated_at": "2022-12-22T18:13:52.498Z"
        }
    ],
    "count": 2
}
```


## Show Form
Path: {{BaseUrl}}/forms/:id 
`id` here represents the id of the form
```
{
    "id": 16,
    "name": "Test Form New",
    "description": "Test Description",
    "answers": [
        {
            "id": 19,
            "question_id": 29,
            "value": "test Child",
            "next_question_id": 30
        },
        {
            "id": 20,
            "question_id": 30,
            "value": "Test Sub Child",
            "next_question_id": null
        }
    ],
    "questions": [
        {
            "id": 29,
            "name": "Test QN 1",
            "answer_type": "numerical"
        },
        {
            "id": 30,
            "name": "Test Qn 0 Value",
            "answer_type": "text"
        }
    ],
    "created_at": "2022-12-22T18:13:52.498Z",
    "updated_at": "2022-12-22T18:13:52.498Z"
}
```

## Delete Form

Path: {{BaseUrl}}/forms/:id
Returns head 204 if deletion is a success else returns the approriate error.

