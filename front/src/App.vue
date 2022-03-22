
<template>
   <div class="container">
    <div class="row">
      <div class="col-xs-12">
        <login v-if="trainerIndex === undefined"></login>
        <button v-else v-on:click="logout">Logout</button>
        <trainer trainerName="trainerName"></trainer>
      </div>
    </div>
        <!-- <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <router-link to="/" exact class="navbar-brand"><strong>E-commerce Inc.</strong></router-link>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <router-link to="/" tag="li" exact active-class="active">
                            <a>Products</a>
                        </router-link>

                        <router-link to="/cart" tag="li" active-class="active">
                            <a>Cart</a>
                        </router-link>
                    </ul>
                    <div class="nav navbar-nav navbar-right">
                        <div class="stats">{{ cart.items.length }} <template v-if="cart.items.length == 1">item</template><template v-else>items</template> in cart, totalling {{ cartTotal | currency }}</div>

                        <div style="margin-top: 8px;">
                            <router-link :to="{ name: 'viewProfile' }">My Profile</router-link>
                            &nbsp;
                            <button v-if="auth.isLoggedIn" class="btn btn-primary" @click="auth.isLoggedIn = false">Log out</button>
                            <button v-else class="btn btn-primary" @click="auth.isLoggedIn = true">Log in</button>
                        </div>
                    </div>
                </div>
            </div>
        </nav> -->

    </div>
</template>

<script>
import Login from './Login.vue'
import Trainer from './Trainer.vue';
import Trainee from './Trainee.vue';
import Events from './Events.vue';
export default {
  components: { Login, Trainer, Trainee,Events },
  name: 'app',
  data () {
    return {
      msg: '',
      trainerIndex: undefined,
      trainerName: tmp
    }
  },
  methods: {
    logout() {
      localStorage.removeItem('trainerIndex');
      this.trainerIndex = undefined;
    }

  },
  beforeCreate() {
    this.trainerIndex = localStorage.getItem('trainerIndex');
  }
}
</script>


<!-- <template>
  <div id="app">
    <img src="./assets/logo.png">
    <h1>{{ msg }}</h1>
    <h2>Essential Links</h2>
    <ul>
      <li><a href="https://vuejs.org" target="_blank">Core Docs</a></li>
      <li><a href="https://forum.vuejs.org" target="_blank">Forum</a></li>
      <li><a href="https://chat.vuejs.org" target="_blank">Community Chat</a></li>
      <li><a href="https://twitter.com/vuejs" target="_blank">Twitter</a></li>
    </ul>
    <h2>Ecosystem</h2>
    <ul>
      <li><a href="http://router.vuejs.org/" target="_blank">vue-router</a></li>
      <li><a href="http://vuex.vuejs.org/" target="_blank">vuex</a></li>
      <li><a href="http://vue-loader.vuejs.org/" target="_blank">vue-loader</a></li>
      <li><a href="https://github.com/vuejs/awesome-vue" target="_blank">awesome-vue</a></li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
      msg: 'Welcome to Your Vue.js App'
    }
  }
}
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style> -->
