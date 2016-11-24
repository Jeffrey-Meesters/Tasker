# Tasker
You need to have Rails 5.0 installed if so then:

- download the repository
- go in your terminal to the file
- in terminal type: rm -rf .git
- run bundle install
- run rails server
- go to localhost3000 in you browser
- sign up

##Work in progress
This app should be a look a like of Trello.
After you log in you can acces and create your projects.
When you click on your created project you can make cards.
The cards should contain your tasks which will be dragable to other cards within the project.

###so far

- devise works
- Boards can  be created
- Cards can be created
- A created card gets an input field for tasks appended with Jquery

###To be done

- biggest issue: tasks cant't be send with AJAX because the card-id is not defined
- input field in the cards for tasks is not persistent
- Make tasks and maybe even cards draggable to other positions
- some lay-out
