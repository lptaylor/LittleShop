# Little Shop

![Image description](https://i.imgur.com/ymlOBo6.png)

Welcome to our Little Shop of Dog Costumes!  We hope you enjoy our app!

Little Shop is a fictional e-commerce application made by a group of four backend students at [Turing School of Software & Design](https://turing.io/) who have a whopping 10 weeks of experience in software development.

In Little Shop, you can access the site as a visitor or registered user who shops for items, a merchant that sells items on the site, or an admin who manages the site.

As a shopper on the site, you will see a list of only the best and the funniest dog costumes that you can choose from to purchase.  You will place your items in your shopping cart that you have chosen, and if logged in,  you will be able to checkout and place your order.

##### *** If you place an order, don't expect it to arrive at your house.  We are just students here ya know!!! *** #####


### Active Little Shop - app in Production:

https://afternoon-chamber-43655.herokuapp.com/

### Little Shop - Github Repository:
https://github.com/lptaylor/LittleShop


### Little Shop - Project Management Waffle Board:

We used waffle.io to manage the development of this app.  Checkout our waffle board [here](https://waffle.io/lptaylor/LittleShop).

### Little Shop - User Stories:
These are the user stories we used to create the app from: https://github.com/turingschool-projects/little_shop_v2/blob/master/stories.md
### Little Shop - Database Schema:

![Image description](https://i.imgur.com/uFMsE5k.png)


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

#### Prerequisites:

* Install Ruby (Version 2.4.5)
* Install Rails (Version 5.1)
* Heroku Account - (Create free account [here](https://signup.heroku.com/) if you don't have on already.)


#### Installing:

To run this application locally, clone this [repo](https://github.com/lptaylor/LittleShop) and follow the steps below:

1) Install gems:
```
$ bundle
```


2) Create, migrate, & seed database:
```
$ rake db:{create,migrate,seed}
```


3) Start your rails server:
```
$ rails s
```


4) Open browser and navigate to:

```
localhost:3000
```


## Running the RSpec Test Suite

Little Shop has a full RSpec suite of feature and model tests for every piece of functionality in the app.

#### Running the Full Test Suite:

From the root of the LittleShop directory, type the below command to run the full test suite:

```
$ rspec
```

#### Running only Feature Tests:

Type this command from the root of the LittleShop directory.

```
$ rspec ./spec/features
```
#### Running only Model Tests:

Type this command from the root of the LittleShop directory.

```
$ rspec ./spec/models
```

#### Running a Single Test File:

Type this command from the root of the LittleShop directory.

*Just change the line number in the command to run only a single test in that file.*

```
$ rspec ./spec/features/registered_user_can_checkout_spec.rb:40
```


## Deployment

To deploy this app through Heroku as we have, you can follow these [instructions](https://devcenter.heroku.com/articles/git) on Heroku's website.

## Built With

* [Ruby - Version 2.4.5](https://ruby-doc.org/core-2.4.5/) - Base code language
* [Rails - Version 5.1](https://guides.rubyonrails.org/v5.1/) - Web framework used
* [RSpec](http://rspec.info/documentation/) - Testing Suite
* [Heroku](https://www.heroku.com/) - Used to deploy to production
* [Waffle.io](https://waffle.io/) - Used for project management tracking


## Contributing

When contributing to this repository, please submit a pull request [here](https://github.com/lptaylor/LittleShop/pulls) and one of the 4 authors will review the request and merge it into master if it looks good.

##### *** Please note, that we only believe in Test Driven Development, so if your code you push does not have the corresponding tests to go with it, it will be rejected!! *** #####

## Authors

* **Ali Benetka** - *Team member* - [Ali's Github](https://github.com/abenetka)
* **J Aaron Brooks Roberts** - *Team member* - [J Aaron's Github](https://github.com/abroberts5)
* **Justin Mauldin** - *Team member* - [Justin's Github](https://github.com/justinmauldin7)
* **Lance Taylor** - *Team member* - [Lance's Github](https://github.com/lptaylor)

## Acknowledgments

* Huge thanks to our Mod2 instructors [Ian Douglas](https://iandouglas.com/) & [Dione Wilson](https://github.com/dionew1) for all their help and insight on this project.

* Thanks to all our other fellow [Turing School of Software & Design](https://turing.io/) - Mod2 - Backend classmates that helped us on this project as well.
