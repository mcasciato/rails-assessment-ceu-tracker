# MyCEUs

A Rails app for healthcare professionals to log their CEUs (Continuing Education Units). Created for my Rails Assessment with [Learn.co](https://learn.co/with/mcasciato).

---

## Initial Setup

(Follow these instructions if you want to run this locally)

- `rails new rails-assessment-ceu-tracker`
- `git init`
- `git add .`
- `git commit`
- `git remote add origin git@github.com:mcasciato/rails-assessment-ceu-tracker.git`
- `git push -u origin master`

## Features

- Users can signup/login manually or via Facebook (omniauth).
  - Currently, Facebook key and secret are in a Git-ignored file. To get this working, you can either contact me for that information, or set up your own app via the [Facebook Developer page](https://developers.facebook.com/).

  - Users can edit their accounts: password not needed for updates if logged in via Facebook.

- Users can create/edit/delete a CEU, viewable only to them.
- Users can create a note on a CEU for their reference.
- Able to have an Admin role (setup only through console currently).

  - Admins can view all users and their CEUs.
  - Admins can change a user's role to admin.

## Walkthrough

Check out a brief walkthrough of the features [here](https://www.youtube.com/watch?v=Fujf9OKtXD0) on YouTube.

## Blog

For more info on my development process, check out my blog post [here](https://medium.com/@mcasciato/myceus-c39ecba55489#.76pau7gav) on Medium.

---

## Contributing
Read instructions for how to contribute to this repo [here](CONTRIBUTING.md).

## Copyright & License

(c) 2016 Michael Casciato under the [MIT License](LICENSE.md)
