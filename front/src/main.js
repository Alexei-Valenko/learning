import Vue from 'vue';
import App from './App.vue';
import VueRouter from 'vue-router';
import axios from 'axios';
import VueAxios from 'vue-axios';
import 'bootstrap/dist/css/bootstrap.css';

import Login from './Login.vue';
import Trainer from './Trainer.vue';
import Trainee from './Trainee.vue';
import Events from './Events.vue';

Vue.use(VueRouter);
Vue.use(VueAxios, axios);

const router = new VueRouter({
  routes: [
    { path: '', name: 'login', component:Login },
    { path: '/trainers/:trainerId', name:'trainer', component: Trainer },
    { path: '/:trainerId/trainee', name:'trainee', component: Trainer },
    { path: '/:trainerId/events', name:'events', component: Events },
  ],
  mode: 'history', 
});

// Vue.http.options.root = 'http://localhost:3000';
// Vue.http.headers.common['X-Requested-With'] = 'XMLHttpRequest';

new Vue({
  el: '#app',
  render: h => h(App),
 router: router
})
