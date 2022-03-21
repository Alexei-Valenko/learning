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
