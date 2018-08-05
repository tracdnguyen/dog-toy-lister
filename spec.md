# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Installed sinatra gem and controllers inherit from gem library
- [x] Use ActiveRecord for storing information in a database - Installed activerecord gem and followed naming conventions for models
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) - 2 classes, toy and user
- [x] Include at least one has_many relationship on your User model (x has_many y, e.g. User has_many Posts) - User has many toys
- [x] Include at least one belongs_to relationship on another model (x belongs_to y, e.g. Post belongs_to User) - Toys belong to user
- [x] Include user accounts - User accounts are made by configuring and enabling sessions in controllers
- [x] Ensure that users can't modify content created by other users - In both patch and delete routes for toys controller, it checks for the current user being the one trying to edit/delete
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Create in get toys/new, Reading in get toys/:id and get /toys, Updating in post   toys/:id/edit, Destroying in delete toy/:id/delete
- [x] Include user input validations - Form contains required for username and password
- [ ] Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
