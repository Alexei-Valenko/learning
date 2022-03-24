<template>
    <div>
        <div v-if="trainerIndex != undefined">        
            <button  v-on:click="logout">Logout</button>
            <h1>Hello {{ trainerName }}</h1>
            <router-link to="/trainees" active-class="active">Show all trainees</router-link>
            <router-link to="/events"  active-class="active">Show all events</router-link>
            <!-- <button v-on:click="trainees = true; events = false;">Show all trainee</button>
            <button v-on:click="trainees = false; events = true;">Show all events</button> -->
            <trainee v-if="trainees" v-bind:trainerId="trainerId"></trainee>
            <events v-if="events" v-bind:trainerId="trainerId"></events> 
        </div>
        <router-link v-else to="/login" active-class="active"  v-on:logged="logged">Login</router-link>    
    </div>
</template>

<script>
 import Trainee from './Trainee.vue';
import Events from './Events.vue';
export default {
    data() {
        return {
            trainerIndex: undefined,
            trainerName: undefined,
           events: false,
           trainees: false
        }
    },
    methods: {
        logout() {
        localStorage.removeItem('trainerId');
        localStorage.removeItem('trainerName');
        this.trainerIndex = undefined;
        },

        logged() {
            this.trainerIndex = localStorage.getItem('trainerId');
            this.trainerName = localStorage.getItem('trainerName');
            console.log(this.trainerName);
        }
    } ,
    mounted() {
        this.trainerIndex = localStorage.getItem('trainerId');
        this.trainerName = localStorage.getItem('trainerName');
        console.log(this.trainerName);
        this.$watch(() => this.$route.params,
             (toParams, previousParams) => {
                console.log(toParams, previousParams);
            })
    },
    components: { Trainee, Events }
}
</script>
