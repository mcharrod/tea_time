# WELCOME TO TEA TIME!!!!!!! 

## Setup 

make a request to localhost:3000/api/v1/subscribe


To install the Tea Time Database for your own personal usage, please do the following:

Fork this repository.
Clone your forked repository to your local machine.
In the terminal, navigate to the tea_time folder and run bundle install.
While still in the terminal, run rails db:{drop,create,migrate,seed} to populate your database with seed data.


Make any changes to the database as necessary, and deploy to your database-hosting service of choice.

to run localhost:3000 for example, the command 'rails s' will get you started. 

From here, you are ready to make requests to postman! 

## Queries 

Subscribe to a new tea 

sample query 

endpoint: POST (url)/api/v1/subscribe

request: 

```
{
    "user_id": "130", 
    "tea_id": "156", 
    "title": "bi monthly subscription",
    "annual_frequency": "6",
    "price": "10"
}
```

response:

```
{
    "data": {
        "type": "tea subscription",
        "attributes": {
            "subscription_id": 227,
            "tea_id": 156,
            "user_id": 130,
            "title": "British tea subscription",
            "annual_frequency": "6",
            "price": "10",
            "status": "active"
        }
    }
}
```
Cancel a tea subscription 

sample query 

endpoint: POST (url)/api/v1/unsubscribe

request: 

```
{ "subscription_id": 1 } 
```

response: 

```
{
    "data": {
        "type": "tea subscription",
        "attributes": {
            "tea_id": 156,
            "user_id": 130,
            "title": "British tea subscription",
            "status": "cancelled"
        }
    }
}
```

List all active and cancelled subscriptions 

sample query 

endpoint: GET (url)/api/v1/subscriptions

request: 

```
{ "user_id": "130"}
```

response: 

```
{
    "data": {
        "type": "subscriptions list",
        "attributes": {
            "subscriptions": [
                {
                    "subscription_id": 156,
                    "tea_id": 130,
                    "title": "british tea subscription",
                    "price": 10,
                    "status": "cancelled",
                    "frequency": 6
                },
                {
                    "subscription_id": 170,
                    "tea_id": 156,
                    "title": "high caffeine tea subscription",
                    "price": 10,
                    "status": "active",
                    "frequency": 6
                },
                {
                    "subscription_id": 171,
                    "tea_id": 156,
                    "title": "Asian tea subscription mix",
                    "price": 10,
                    "status": "active",
                    "frequency": 6
                },
                {
                    "subscription_id": 172,
                    "tea_id": 156,
                    "title": "surprise tea subscription",
                    "price": 10,
                    "status": "cancelled",
                    "frequency": 6
                }
            ]
        }
    }
}
```

