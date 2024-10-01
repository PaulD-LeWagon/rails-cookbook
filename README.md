# README

 <%= link_to "Delete Recipe", bookmark_path(recipe.bookmark), data: {turbo_method: :delete, turbo_confirm: "Are you sure?"} %>

 .jumbotron {
  background-color: #d4d4d4;
  box-shadow: inset 0 0 15px rgba(0, 0, 0, 0.2);
 }
 .jumbotron .container {
  text-align: center;
 }
 .jumbotron .container .banner {
  margin: 150px 0 200px;
 }
 .jumbotron .container .banner h1 {
  font-size: 3.5em;
  font-weight: bolder;
  text-shadow:  0 5px 10px rgba(0, 0, 0, 0.3);
 }
 .jumbotron .container .banner .btn {
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
 }

 .container {
  padding: 20px 16px;
  display: flex;
  gap: 16px;
}

 .grid-container {
  margin: 50px 0;
  flex-grow: 1;
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-gap: 16px;
 }

 .card {
    min-height: 200px;
    min-width: 300px;

    background-position: center;
    box-shadow: 0 7px 15px rgba(0, 0, 0, 0.2);
  }

 .card .cover-link {
    display: flex;
    justify-content: center;
    align-items: flex-start;

    padding-top: 0.75em;
    text-decoration: none;
    color: #777;
    font-size: 2em;

    width: 100%;
    height: 100%;
  }

@media (max-width: 1200px) { }
@media (max-width: 992px) {
  .grid-container {
    grid-template-columns: 1fr 1fr;
   }
}
@media (max-width: 768px) {
  .card {
    min-height: 200px;
    min-width: 300px;
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
  }
}
@media (max-width: 576px) {
  .grid-container {
    grid-template-columns: 1fr;
   }
}

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
