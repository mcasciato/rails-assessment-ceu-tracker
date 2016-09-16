# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show page rendered using jQuery and an Active Model Serialization JSON backend.
- [x] Include an index page rendered using jQuery and an Active Model Serialization JSON backend.
 - (ceu index)
- [ ] Include at least one has_many relationship in information rendered via JSON
- [x] Include at least one link that loads or updates a resource without reloading the page
  - (new ceu creation)
- [x] Translate JSON responses into js model objects
  - (new ceu creation -> after posting, is converted to JSON object; calls on createHTML function to render ceu info on page)
- [x] At least one of the js model objects must have at least one method added by your code to the prototype
  - (new ceu creation -> response is converted to JSON object after posting; calls on createHTML function to render ceu info on page; createHTML is a prototype method)

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
