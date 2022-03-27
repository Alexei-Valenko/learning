import Vue from 'vue';
import App from './App.vue';
import VueRouter from 'vue-router';
import axios from 'axios';
import VueAxios from 'vue-axios';
import 'bootstrap/dist/css/bootstrap.css';

import Login from './Login.vue';
import Trainer from './Trainer.vue';
import Events from './Events.vue';
import EventProperties from './EventProperties.vue';
import Trainee from './Trainee.vue';

Vue.use(VueRouter);
Vue.use(VueAxios, axios);


const router = new VueRouter({
  routes: [
    { path: '/', component:Trainer , children: [ {path: 'eventsInline', component: Events}]},
    { path: '/login', component:Login },
    { path: '/events', component: Events },
    { path: '/eventProperties', component: EventProperties },
    { path: '/trainees', component: Trainee }
  ],
  mode: 'history', 
});

new Vue({
  el: '#app',
  render: h => h(App),
  router: router
})
