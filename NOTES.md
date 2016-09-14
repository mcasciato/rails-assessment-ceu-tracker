# CEU Tracker

A Rails app for healthcare professionals to keep a record of their CEUs (Continuing Education Units).

(Use Devise? --YES) (Use Pundit?--MAYBE in the future) (Use Omniauth?--YES)

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
  - (other fields from devise)
  ```

- #### CEU

  ```ruby
  - title:string
  - location:string
  - date:date
  - duration:integer (minutes)
  ```
- #### Note

  ```ruby
  - content:text
  - user_id:integer
  - ceu_id:integer
  ```

- #### Certificate

  ```ruby
  - ceu_id:integer
  - classification:string
  ```

## Models

- #### User

  ```ruby
  - has_many :notes
  - has_many :ceus, through: :notes
  - validates email and password
  ```

- #### CEU

  ```ruby
  - has_many :notes
  - has_many :users, through: :notes
  - validates title, location, date, & duration
  ```
- #### Note

  ```ruby
  - belongs_to :user
  - belongs_to :ceu
  ```

- #### Certificate

  ```ruby
  - belongs_to :ceu
  ```
  --------
# JS Notes
- can I delete the certificate table, and just add it to CEU?
