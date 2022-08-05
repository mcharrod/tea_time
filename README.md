# It's Tea Time, darling!

Project specs for this take - home challenge can be found [here](https://mod4.turing.edu/projects/take_home/)

## Getting Started

You will need to clone this repository down to your own local machine and run a local server, such as localhost:3000, to use this app. You will also need to use an API platform such as postman.

All of the gems necessary to run this app are included in the Gemfile. In your terminal, navigate to the tea_time folder from your terminal and run `bundle install`. While still in the terminal, run `rails db:{drop,create,migrate,seed}` to populate your database with seed data.

Make any changes to the database as necessary, and deploy to your database-hosting service of choice.

To run  this app on localhost:3000, simply type into your terminal `rails s` to start your server. You will replace (url) in each of the endpoints with localhost:3000.

From here, you are ready to make requests to your API platform of choice!

## Queries

Subscribe to a new tea

sample query

endpoint: POST (url)/api/v1/subscribe

request body:

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

request body:

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

request body:

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
