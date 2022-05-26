// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller.js"
application.register("hello", HelloController)

import LoginAnimationFormController from "./login_animation_form_controller.js"
application.register("login-animation-form", LoginAnimationFormController)

import SearchBarController from "./search_bar_controller.js"
application.register("search-bar", SearchBarController)
