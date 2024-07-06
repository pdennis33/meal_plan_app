import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers";
import "@hotwired/turbo-rails";
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap";
import Rails from "@rails/ujs";
import * as ActiveStorage from "@rails/activestorage";
import 'fullcalendar';
import $ from 'jquery';
import moment from 'moment';

import "../stylesheets/application.css";

// Initialize Stimulus application
const application = Application.start();
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

// Start Rails UJS and ActiveStorage
Rails.start();
ActiveStorage.start();

window.AppRails = Rails;

document.addEventListener("turbo:load", () => {
    if ($('#calendar').length) {
        $('#calendar').fullCalendar({
            themeSystem: 'bootstrap4',
            events: '/meal_plans.json',
            editable: true,
            droppable: true,
            eventDrop: (event, delta, revertFunc) => {
                $.ajax({
                    url: `/meal_plans/${event.id}`,
                    type: 'PATCH',
                    data: { meal_plan: { date: event.start.format() } },
                    error: () => {
                        revertFunc();
                    }
                });
            }
        });
    }
});
