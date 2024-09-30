// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import * as ActiveStorage from "@rails/activestorage";
import "packs/bootstrap";
import "popper"
import "bootstrap.js"
ActiveStorage.start();

console.log("Hello World");