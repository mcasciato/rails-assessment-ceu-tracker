# CEU Tracker

A Rails app for healthcare professionals to keep a record of their CEUs (Continuing Education Units).

(Use Devise? --YES) (Use Pundit?--MAYBE) (Use Omniauth?--MAYBE)

## Initial Setup

- `rails new rails-assessment-ceu-tracker`
- `git init`
- `git add .`
- `git commit`
- `git remote add origin git@github.com:mcasciato/rails-assessment-ceu-tracker.git`
- `git push -u origin master`

## Database

- #### User (change name?)

  ```ruby
  - name:string
  - occupation:string
  - email:string
  - password_digest:string (bcrypt)
  ```

id | Name   | Occupation             | Email         | Password
-- | ------ | ---------------------- | ------------- | --------
1  | User 1 | Occupational Therapist | user1@med.org | xxxxx
2  | User 2 | Physical Therapist     | user2@med.org | xxxxx
3  | User 3 | Speech Therapist       | user3@med.org | xxxxx

- #### CEU

  ```ruby
  - title:string
  - location:string
  - duration:integer (minutes)
  ```

id | Title   | Location   | Duration (in minutes)
-- | ------- | ---------- | ---------------------
1  | Title 1 | Cincinnati | 60
2  | Title 2 | Columbus   | 75
3  | Title 3 | Chicago    | 180

- #### Certificate

  ```ruby
  - user_id:integer
  - ceu_id:integer
  - type:integer, default: 0 == "state" (1 == "national"?)
  ```

id | user_id | ceu_id | Type
-- | ------- | ------ | ----
1  | 1       | 3      | 1
2  | 2       | 2      | 0
3  | 3       | 2      | 0

## Models

- #### User

  ```ruby
  - has_many :certificates
  - has_many :ceus, through: :certificates
  - validates email and password
  ```

- #### CEU

  ```ruby
  - has_many :certificates
  - has_many :users, through: :certificates
  - validates title, location, & duration
  ```

- #### Certificate

  ```ruby
  - belongs_to :user
  - belongs_to :ceu
  - type: integer -> in the form, this will be a checkbox, values: state or national
  ```

## Controllers & Actions

- #### Welcome

  - home

- #### Users

  - index
  - new (signup)
  - create
  - show
  - edit
  - update
  - destroy

- #### Sessions

  - new (login)
  - create
  - destroy (logout)

- #### Certificates

  - index
  - new
  - create
  - show
  - edit
  - update
  - destroy

- #### Ceus

  - index
  - new
  - create
  - show
  - edit
  - update
  - destroy

## Views

- #### Welcome

  - home

- #### Users

  - new (signup) -> render form partial
  - form (partial)
  - edit -> render form partial
  - show
  - index

- #### CEUs

  - new (signup) -> render form partial
  - form (partial)
  - edit -> render form partial
  - show
  - index
